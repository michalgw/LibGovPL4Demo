{ LibGovPL 4

  KSeF - inicjowanie sesji interaktywnej za pomocą tokena, wyszukiwanie synchroniczne,
  pobranie faktury }

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$APPTYPE CONSOLE}

program ksef3;

uses
  Classes, SysUtils, DateUtils, LibGovPl4Intf, LibGovPl4Backend, LibGovPl4XAdES,
  LibGovPl4KSeF, LibGovPl4KSeFObj;

var
  // Klient HTTPS
  HTTPClient: TlgoHTTPClient = nil;
  // Klucz RSA dla bramki testowj KSeF
  RSAKey: TlgoRSAKey = nil;
  // Klient KSeF
  KSeF: TlgoKSeF = nil;

  FileStream: TFileStream;
  I: Integer;

  // Odpowiedz inicjacji secji
  InitSessionResponse: TKSeFInitSessionResponse = nil;
  // Odpowiedz zakonczenia sesji
  TerminateSessionResponse: TKSeFTerminateSessionResponse = nil;
  // Zadanie wyszukiwania
  QueryRequest: TKSeFQueryInvoiceRequest = nil;
  // Kryteria wyszukiwania zakresu daty wystawienia faktury
  QueryCriteria: TKSeFQueryCriteriaInvoiceRange;
  // Odpowiedz wyszukiwania z lista naglowkow faktur
  QueryResponse: TKSeFQueryInvoiceSyncResponse = nil;

begin
  // Inicjuj biblioteke LibGovPL
  lgplInit;
  // Wyswietl wersje
  WriteLn('Wersja biblioteki: ', IntToHex(lgplVersion));

  // Utworz obiekt klienta HTTPS z domyslna klasa sterownika
  HTTPClient := TlgoHTTPClient.Create('');
  WriteLn('Klasa klienta HTTP: ', HTTPClient.ObjClassName);

  WriteLn('Klasa sterownika szyfrowania RSA: ', TlgoBackend.RSAEncryptClasses[0]);
  // Otworz strumien pliku z kluczem publicznym RSA bramki testowej KSeF
  FileStream := TFileStream.Create('..\pem\kseftest.pem', fmOpenRead);
  // Utworz klucz publiczny RSA z podanego strumienia i domyslnej klasy sterownika
  RSAKey := TlgoRSAEncrypt.CreateKey('', FileStream);
  FreeAndNil(FileStream);

  // Utworz obiekt klienta KSeF
  KSeF := TlgoKSeF.Create;
  // Uzyj obiektu klienta HTTPS
  KSeF.HTTPClient := HTTPClient;
  // Operujemy na bramce testowej
  KSeF.GateType := kgtTest;
  // Wysylane dokumenty sa zgodne z wersja FA(2)
  KSeF.FormCode := kfcFA2;
  // Nr NIP podmiotu
  KSeF.NIP := '1111111111';
  // Ustaw token do nawiazania sesji
  KSeF.Token := '0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF';
  // Ustaw klucz szyfrujacy RSA dla bramki testowej
  KSeF.RSAKey[kgtTest] := RSAKey;
  // Wylacz dodatkowe szyfrowanie AES wysylanych i pobieranych dokumentow
  KSeF.Encryption := False;

  WriteLn('Nawiazywanie sesji');
  try
    try
      // Nawiazanie seji
      InitSessionResponse := KSeF.SessionInitToken;

      // Sesja zostal nawiazana - wyswietl nr referencyjny sesji
      WriteLn('Nr referencyjny sesji: ', InitSessionResponse.ReferenceNumber);
      WriteLn(InitSessionResponse.RawResponse);
      // Zwolnij obiekt odpowiedzi
      InitSessionResponse.Free;

      // Nalezy chwile odczekac po zainicjowaniu sesji.
      // W przeciwnym wypadku kolejne zapytanie moze zostac odrzucone jako nieautoryzowane.
      WriteLn('Wcisnij Enter aby kontynuowac');
      ReadLn;

      // Utworz obiekt kryteriow zakresu daty
      QueryCriteria := TKSeFQueryCriteriaInvoiceRange.Create;
      // Wyszukaj faktury sprzedazy
      QueryCriteria.SubjectType := stSubject1;
      // Wyszukaj faktury wystawione w przeciagu ostatnich 30 dni
      QueryCriteria.InvoicingDateFrom := IncDay(Now, -30);
      QueryCriteria.InvoicingDateTo := Now;
      WriteLn('Zakres daty wystawienia: ', DateTimeToStr(QueryCriteria.InvoicingDateFrom),
        ' - ', DateTimeToStr(QueryCriteria.InvoicingDateTo));

      // Utworz obiekt zadania i przypisz kryteria.
      // Obiekt kryteriow zostanie zwolniony razem z obiektem zadania
      QueryRequest := TKSeFQueryInvoiceRequest.Create(QueryCriteria);

      // Wyszukaj synchronicznie po zadanych kryteriach,
      // pobierz 10 pierwszych wynikow
      WriteLn('Wyszukiwanie');
      QueryResponse := KSeF.QueryInvoiceSync(QueryRequest, 10, 0);

      // Wyswietl wyniki
      WriteLn('Licba wynikow: ', QueryResponse.NumberOfElements);
      for I := 0 to QueryResponse.InvoiceHeaderList.Count - 1 do
        with QueryResponse.InvoiceHeaderList.Items[I] do
          WriteLn('Rodzaj: ', InvoiceType, ', Nr fa: ', InvoiceReferenceNumber,
          ', Data: ', DateToStr(InvoicingDate), ', Nr KSeF: ', KsefReferenceNumber);

      // Pobierz pierwsza fakture z listy jesli dostepna
      if QueryResponse.InvoiceHeaderList.Count > 0 then
        with QueryResponse.InvoiceHeaderList.Items[0] do
        begin
          WriteLn('Pobierz fakture nr ', InvoiceReferenceNumber);
          // Utworz strumien pliku wyjsciowego
          FileStream := TFileStream.Create(KsefReferenceNumber + '.xml', fmCreate);
          // Pobierz fakture
          KSeF.InvoiceGet(KsefReferenceNumber, FileStream);
          FreeAndNil(FileStream);
          WriteLn('Zapisano do pliku ', KsefReferenceNumber + '.xml');
        end;

    except
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
    if Assigned(FileStream) then
      FileStream.Free;
    if Assigned(QueryCriteria) then
      QueryCriteria.Free;
    if Assigned(QueryResponse) then
      QueryResponse.Free;
  end;

  // Zakoncz sesje jesli sesja jest aktywn
  if KSeF.SessionActive then
  begin
    WriteLn('Zamykanie sesji');
    TerminateSessionResponse := KSeF.SessionTerminate;
    // Zwolnij jesli zwrocono obiekt odpowiedzi
    if TerminateSessionResponse <> nil then
      TerminateSessionResponse.Free;
  end;

  // Zwolnij utworzone obiekty
  KSeF.Free;
  RSAKey.Free;
  HTTPClient.Free;

  // Zwolnij zasoby biblioteki przed zakonczeniem programu
  lgplExit;;
end.

