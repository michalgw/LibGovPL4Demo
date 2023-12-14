{ LibGovPL 4

  KSeF - inicjowanie sesji interaktywnej za pomocą tokena, wysylanie faktury,
  sprawdzenie statusu faktury }

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$APPTYPE CONSOLE}

program ksef2;

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Backend, LibGovPl4XAdES,
  LibGovPl4KSeF, LibGovPl4KSeFObj;

var
  // Klient HTTPS
  HTTPClient: TlgoHTTPClient = nil;
  // Klucz RSA dla bramki testowj KSeF
  RSAKey: TlgoRSAKey = nil;
  // Klient KSeF
  KSeF: TlgoKSeF = nil;

  FileStream: TFileStream;
  Ch: Char;

  // Odpowiedz inicjacji secji
  InitSessionResponse: TKSeFInitSessionResponse;
  // Odpowiedz zakonczenia sesji
  TerminateSessionResponse: TKSeFTerminateSessionResponse;
  // Odpowiedz przeslania faktury
  SendInvoiceResponse: TKSeFSendInvoiceResponse;
  // Odpowiedz zapytania o status faktury
  StatusInvoiceResponse: TKSeFStatusInvoiceResponse;

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
  FileStream.Free;

  // Utworz obiekt klienta KSeF
  KSeF := TlgoKSeF.Create;
  // Uzyj obiektu klienta HTTPS
  KSeF.HTTPClient := HTTPClient;
  // Operujemy na bramce testowej
  KSeF.GateType := kgtTest;
  // Wysylane dokumenty sa zgodne z wersja FA(1)
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
    // Nawiazanie seji
    InitSessionResponse := KSeF.SessionInitToken;

    // Sesja zostal nawiazana - wyswietl nr referencyjny sesji
    WriteLn('Nr referencyjny sesji: ', InitSessionResponse.ReferenceNumber);
    // Zwolnij obiekt odpowiedzi
    InitSessionResponse.Free;

    WriteLn('Wysylanie faktury');
    // Otworz strumien pliku z faktura FA XML
    FileStream := TFileStream.Create('fa2.xml', fmOpenRead);
    // Wyslij dane ze strumienia
    SendInvoiceResponse := KSeF.InvoiceSend(FileStream);
    // Zwalniamy strumien z plikiem
    FileStream.Free;
    WriteLn('Nr referencyjny wyslanej faktury: ', SendInvoiceResponse.ElementReferenceNumber);

    repeat
      WriteLn('Sprawdzanie statusu wyslanej faktury');
      // Sprawdz status wyslanej faktury
      StatusInvoiceResponse := KSeF.InvoiceStatus(SendInvoiceResponse.ElementReferenceNumber);
      WriteLn('Status: ', SendInvoiceResponse.ProcessingCode);
      WriteLn('Opis: ', StatusInvoiceResponse.ProcessingDescription);

      Write('Sprawdzic ponownie? (T/N): ');
      ReadLn(Ch);
    until Ch in ['n', 'N'];

    // Zwolnij obiekty odpowiedzi
    SendInvoiceResponse.Free;
    StatusInvoiceResponse.Free;
  except
    // W przypadku odpowiedzi serwera komunikatem bledu zglaszany jest wyjatek
    // EKSeFExceptionResponse zawierajacy szczegolowe informacje o bledzie
    on E: EKSeFExceptionResponse do
    begin
      WriteLn('Błąd: ', E.Message);
      WriteLn('JSON: ', E.RawData);
    end;
    // W innych przypadkach (np bledy I/O, brak dostepu do serwerow KSeF, itp)
    on E: Exception do
      WriteLn('Błąd: ', E.Message);
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
  lgplExit;
end.

