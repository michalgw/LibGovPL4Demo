{ LibGovPL 4

  KSeF - wysylka wsadowa - przygotowanie paczki i podpisanie paczki,
  wyslanie paczki }

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$APPTYPE CONSOLE}

program ksef5;

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Backend, LibGovPl4XAdES,
  LibGovPl4KSeF, LibGovPl4KSeFObj;

var
  // Obiekt obslugi podpisu elektronicznego certyfikatem kwalifikowanym
  CertSigner: TlgoCertificateSigner = nil;
  // Lista certyfikatów
  Certyfikaty: TlgoCertificates = nil;
  // Ssygnatura XAdES
  XAdES: TlgoXAdES = nil;
  // Klient HTTPS
  HTTPClient: TlgoHTTPClient = nil;
  // Klucz RSA dla bramki testowj KSeF
  RSAKey: TlgoRSAKey = nil;
  // Klient KSeF
  KSeF: TlgoKSeF = nil;

  // Plik wejsciowy z paczka ZIP
  InZIPFileStream: TFileStream = nil;
  // Zaszyfrowany plik
  OutEncZIPFileStream: TMemoryStream = nil;
  FileStream: TFileStream = nil;
  // Struktura InitUpload
  InitUpload: UTF8String;
  // Nr referencyjny wyslanej paczki
  RefNum: UTF8String;
  I: Integer;
  Ch: Char;

  // Odpowiedz sprawdzenia statusu przeslanego dokumentu
  StatusResponse: TKSeFStatusResponse = nil;

begin
  // Inicjuj biblioteke LibGovPL
  lgplInit;
  // Wyswietl wersje
  WriteLn('Wersja biblioteki: ', IntToHex(lgplVersion));

  // Utworz obiekt podpisu certyfikatem z domyslna klasa sterownika
  CertSigner := TlgoCertificateSigner.Create('');
  WriteLn('Klasa podpisu certyfikatem: ', CertSigner.ObjClassName);

  // Pobierz liste certyfikatow
  Certyfikaty := CertSigner.List;
  // Wyswietl liste certyfikatow
  WriteLn('Certyfikaty:');
  for I := 0 to Certyfikaty.Count - 1 do
    WriteLn(I, ' - ', Certyfikaty[I].DisplayName, ', ',
      DateToStr(Certyfikaty[I].ValidFrom), ' - ',
      DateToStr(Certyfikaty[I].ValidTo), ', ', Certyfikaty[I].SerialNoDec);

  WriteLn('Wybierz certyfikat (0 - ', Certyfikaty.Count - 1, ')');
  ReadLn(I);
  if (I < 0) or (I >= Certyfikaty.Count) then
    I := 0;
  WriteLn('Wybrano certyfikat: ', Certyfikaty[I].DisplayName);

  // Utworz obiekt sygnatury XAdES
  XAdES := TlgoXAdES.Create;
  // Uzyj obiektu podpisu
  XAdES.Signer := CertSigner;

  // Utworz obiekt klienta HTTPS z domyslna klasa sterownika
  HTTPClient := TlgoHTTPClient.Create('');
  WriteLn('Klasa klienta HTTP: ', HTTPClient.ObjClassName);

  WriteLn('Klasa sterownika szyfrowania RSA: ', TlgoBackend.RSAEncryptClasses[0]);
  // Otworz strumien pliku z kluczem publicznym RSA bramki testowej KSeF
  FileStream := TFileStream.Create('..\pem\kseftest.pem', fmOpenRead);
  // Utworz klucz publiczny RSA z podanego strumienia i domyślnej klasy sterownika
  RSAKey := TlgoRSAEncrypt.CreateKey('', FileStream);
  FileStream.Free;

  // Utworz obiekt klienta KSeF
  KSeF := TlgoKSeF.Create;
  // Uzyj obiektu sygnatury XAdES dla zainicjowania sesji podpisem kwalifikowanym
  KSeF.XAdES := XAdES;
  // Uzyj obiektu klienta HTTPS
  KSeF.HTTPClient := HTTPClient;
  // Operuj na bramce testowej
  KSeF.GateType := kgtTest;
  // Wysylane dokumenty sa zgodne z wersja FA(2)
  KSeF.FormCode := kfcFA2;
  // Nr NIP podmiotu
  //KSeF.NIP := '1111111111';
  KSeF.NIP := '8821850488';
  // Nawiazanie sesji podpisujac wybranym certyfikatem z listy certyfikatow
  KSeF.Certificate := Certyfikaty[I];
  // Ustaw klucz szyfrujacy RSA dla bramki testowej
  KSeF.RSAKey[kgtTest] := RSAKey;
  // Wlacz dodatkowe szyfrowanie AES wysylanych i pobieranych dokumentow
  KSeF.Encryption := True;

  try
    try
      // Przygotowanie paczki i podpis
      WriteLn('Przygotowanie i podpisywanie');
      // Otwarcie pliku z paczka ZIP
      InZIPFileStream := TFileStream.Create('in.zip', fmOpenRead);
      // Utworzenie strumienia wyjsciowego z zaszyrowana paczka ZIP
      OutEncZIPFileStream := TMemoryStream.Create;
      // Przygotuj - zaszyfruj paczke. utworz strukture InitUpload z podanymi nazwami plikow
      KSeF.BatchSign(InZIPFileStream, False, OutEncZIPFileStream, InitUpload, 'in.zip', 'out.enc');
      // Zwolnij plik wejsciowy ZIP
      FreeAndNil(InZIPFileStream);

      // Wyslanie przygotowanych danych na serwer KSeF i pobranie nr referencyjnego
      WriteLn('Wysylanie paczki');
      OutEncZIPFileStream.Position := 0;
      RefNum := KSeF.BatchSend(OutEncZIPFileStream, InitUpload);
      WriteLn('Wyslano, nr ref: ', RefNum);

      // Zwolnij zaszyfrowane dane
      FreeAndNil(OutEncZIPFileStream);

      repeat
        // Jesli zwolnij poprzedni obiekt odpowiedzi
        if Assigned(StatusResponse) then
          StatusResponse.Free;

        WriteLn('Sprawdzam status przetwarzania');
        // Srpawdz status przetwarzania wyslanej paczki
        StatusResponse := KSeF.CommonStatus(RefNum, kgtTest);

        WriteLn('Kod przetwarzania: ', StatusResponse.ProcessingCode);
        WriteLn('Opis: ', StatusResponse.ProcessingDescription);

        WriteLn('Czy sprawdzic ponownie? (T/N)');
        ReadLn(Ch);
      until Ch in ['N', 'n'];

      if (StatusResponse.ProcessingCode = 200) and (Length(StatusResponse.Upo) > 0) then
      begin
        // UPO dostepne, zapisz do pliku
        WriteLn('UPO dostepne. Zapisuje do pliku upo.xml');
        FileStream := TFileStream.Create('upo.xml', fmCreate);
        FileStream.Write(StatusResponse.Upo[1], Length(StatusResponse.Upo));
        FreeAndNil(FileStream);
        WriteLn('UPO zapisano');
      end;

      FreeAndNil(StatusResponse);

    except
      // W przypadku anulowania wprowadzania nr PIN zglaszany jest wyjatek EAbort
      on E: EAbort do
      begin
        WriteLn('Anulowano');
      end;
      // W przypadku odpowiedzi serwera komunikatem bledu zglaszany jest wyjatek
      // EKSeFExceptionResponse zawierajacy szczegolowe informacje o bledzie
      on E: EKSeFExceptionResponse do
      begin
        WriteLn('Blad: ', E.Message);
        WriteLn('JSON: ', E.RawData);
      end;
      // W innych przypadkach (np bledy I/O, brak dostepu do serwerow KSeF, itp)
      on E: Exception do
        WriteLn('Blad: ', E.Message);
    end;
  finally

  end;

  // Zwolnij utworzone obiekty
  KSeF.Free;
  RSAKey.Free;
  HTTPClient.Free;
  XAdES.Free;
  Certyfikaty.Free;
  CertSigner.Free;

  // Zwolnij zasoby biblioteki przed zakonczeniem programu
  lgplExit;
end.

