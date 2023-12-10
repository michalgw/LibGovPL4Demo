{ LibGovPL 4

  KSeF - inicjowanie sesji interaktywnej za pomocą tokena, wyszukiwanie asynchroniczne,
  spawdzenie statusu zapytania, pobranie packi faktur }

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$APPTYPE CONSOLE}

program ksef4;

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

  FileStream: TFileStream = nil;
  Ch: Char;

  // Odpowiedz inicjacji secji
  InitSessionResponse: TKSeFInitSessionResponse = nil;
  // Odpowiedz zakonczenia sesji
  TerminateSessionResponse: TKSeFTerminateSessionResponse = nil;
  // Zadanie wyszukiwania
  QueryRequest: TKSeFQueryInvoiceRequest = nil;
  // Kryteria wyszukiwania zakresu daty wystawienia faktury
  QueryCriteria: TKSeFQueryCriteriaInvoiceRange;
  // Odpowiedz inicjacji wyszukiwania
  QueryInitResponse: TKSeFQueryInvoiceAsyncInitResponse = nil;
  // Odpowiedz statusu wyszukiwania
  QueryStatusResponse: TKSeFQueryInvoiceAsyncStatusResponse = nil;

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

      // Inicjuj wyszukiwanie asynchronicznie po zadanych kryteriach,
      WriteLn('Inicjowanie wyszukiwania');
      QueryInitResponse := KSeF.QueryInvoiceAsyncInit(QueryRequest);

      WriteLn('Nr ref. zapytania: ', QueryInitResponse.ElementReferenceNumber);
      WriteLn('JSON: ', QueryInitResponse.RawResponse);

      repeat
        // Jesli istnieje poprzednia odpowiedz to ja zwolnij
        if Assigned(QueryStatusResponse) then
          QueryStatusResponse.Free;

        // Sprawdz status przetwarzania zapytania
        WriteLn('Sprawdzenie statusu przetwarzania zapytania');
        QueryStatusResponse := KSeF.QueryInvoiceAsyncStatus(QueryInitResponse.ElementReferenceNumber);

        WriteLn('Kod przetwarzania: ', QueryStatusResponse.ProcessingCode);
        WriteLn('Opis przetwarzania: ', QueryStatusResponse.ProcessingDescription);
        WriteLn('Liczba elementow: ', QueryStatusResponse.NumberOfElements);
        WriteLn('JSON: ', QueryStatusResponse.RawResponse);

        WriteLn('Czy sprawdzic ponownie? (T/N)');
        ReadLn(Ch);
      until Ch in ['N', 'n'];

      // Pobierz paczke jesli jest gotowa
      if (QueryStatusResponse.ProcessingCode = 200) and  Assigned(QueryStatusResponse.PartList)
        and (QueryStatusResponse.PartList.Count > 0) then
      begin
        WriteLn('Pobieranie zawartosci do pliku out.zip');
        // Utworz strumien pliku do ktorego zostanie zapisana pobrana zawartosc
        FileStream := TFileStream.Create('out.zip', fmCreate);
        // Pobierz pierwsza czesc
        KSeF.QueryInvoiceAsyncFetch(QueryInitResponse.ElementReferenceNumber,
          QueryStatusResponse.PartList.Items[0].PartReferenceNumber, FileStream);
        FreeAndNil(FileStream);
        WriteLn('Pobrano');
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
    if Assigned(QueryStatusResponse) then
      QueryStatusResponse.Free;
    if Assigned(QueryInitResponse) then
      QueryInitResponse.Free;
    if Assigned(QueryCriteria) then
      QueryCriteria.Free;
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

