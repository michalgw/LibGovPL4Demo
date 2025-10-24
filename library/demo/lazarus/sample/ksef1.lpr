{ LibGovPL 4

  KSeF - inicjowanie sesji interaktywnej za pomocą certyfikatu kwalifikowanego }

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$APPTYPE CONSOLE}

program ksef1;

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

  FileStream: TFileStream;
  I: Integer;

  // Odpowiedz inicjacji secji
  InitSessionResponse: TKSeFInitSessionResponse;
  // Odpowiedz zakonczenia sesji
  TerminateSessionResponse: TKSeFTerminateSessionResponse;

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
  KSeF.NIP := '1111111111';
  // Nawiazanie sesji podpisujac pierwszym certyfikatem z listy certyfikatow
  KSeF.Certificate := Certyfikaty[I];
  // Ustaw klucz szyfrujacy RSA dla bramki testowej
  KSeF.RSAKey[kgtTest] := RSAKey;
  // Wlacz dodatkowe szyfrowanie AES wysylanych i pobieranych dokumentow
  KSeF.Encryption := True;

  WriteLn('Nawiazanie sesji');
  try
    // Nawiazanie seji
    InitSessionResponse := KSeF.SessionInitSigned;

    // Sesja zostal nawiazana - wyswietl nr referencyjny sesji
    WriteLn('Nr referencyjny sesji: ', InitSessionResponse.ReferenceNumber);
    WriteLn('JSON: ', InitSessionResponse.RawResponse);
    // Zwolnij obiekt odpowiedzi
    InitSessionResponse.Free;
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

  // Zakoncz sesje jesli sesja jest aktywn
  if KSeF.SessionActive then
  begin
    WriteLn('Zamykanie sesji');
    TerminateSessionResponse := KSeF.SessionTerminate;
    // Zwolnij jesli zwrocono obiekt odpowiedzi
    if TerminateSessionResponse <> nil then
    begin
      WriteLn('JSON: ', TerminateSessionResponse.RawResponse);
      TerminateSessionResponse.Free;
    end;
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

