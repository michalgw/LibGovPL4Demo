program ksef_20_2;

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$APPTYPE CONSOLE}

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Backend, LibGovPl4XAdES,
  LibGovPl4KSeF2, LibGovPl4KSeFObj2;

var
  HTTPClient: TlgoHTTPClient = nil;
  KSeF: TlgoKSeF2 = nil;

  AuthInitResponse: TKSeF2AuthenticationInitResponse;
  AuthStatusResponse: TKSeF2AuthenticationOperationStatusResponse = nil;

  NrRefSesjiIteraktywnej: String;
  NrRefWyslanejFa: String;
  FAStream: TFileStream = nil;

  StatusResponse: TKSeF2SessionInvoicesResponse = nil;

begin
  // Inicjuj biblioteke LibGovPL
  lgplInit;
  // Wyswietl wersje
  WriteLn('Wersja biblioteki: ', IntToHex(lgplVersion));

  // Tworzymy klienta HTTPS
  HTTPClient := TlgoHTTPClient.Create('');

  // Tworzymy obiekt klienta KSeF 2.0
  KSeF := TlgoKSeF2.Create;
  KSeF.HTTPClient := HTTPClient;

  // Wskazujemy rodzaj serwera KSeF (produkcyjny/test/demo)
  KSeF.GateType := kgtTest;
  // Wskazujemy token KSeF do uwierzytelnienia
  KSeF.KsefToken := '20251111-FF-123F456780-1234567896-B6|nip-1111111111|1111111111111222222222222233333333333334444444444445555555555556';
  // Wskazujemy rodzaj identyfikatora na nr NIP
  KSeF.IdentifierType := itNip;
  // Wskazujemy identyfikator czyli nr NIP podmiotu
  KSeF.Identifier := '1111111111';
  // Bedziemy wysylac faktury w formacie FA(3)
  KSeF.FormCode := kfcFA3;

  try
    // Uwirzytelnij za pomoca wskazanego tokena
    AuthInitResponse := KSeF.AuthKsefToken;

    // Rozpoczeto nawiazywanie sesji. Wypisz nr referencyjny sesji
    WriteLn('Nr referencyjny sesji: ', AuthInitResponse.ReferenceNumber);

    // Sprawdz status autoryzacji
    repeat
      // Zwolnij poprzedni status
      if Assigned(AuthStatusResponse) then
        AuthStatusResponse.Free;

      WriteLn('Czekam momencik');
      Sleep(500);

      // Pobierz status uwierzyteniania
      WriteLn('Sprawdzam status');
      AuthStatusResponse := KSeF.AuthStatus;

      WriteLn('Status uwierzytelniania: ', AuthStatusResponse.Status.Code);
      WriteLn('Opis: ', AuthStatusResponse.Status.Description);

    // Przerwij jesli kod 200 lub wiekszy
    until AuthStatusResponse.Status.Code >= 200;

    if AuthStatusResponse.Status.Code = 200 then
    begin
      // Uwierzytelnienie zakonczone sukcesem.
      // Pobierz tokeny: dostepu i odswiezenia
      KSeF.AuthTokenRedem;
      WriteLn('Token autoryzacyjny wazny do: ', DateTimeToStr(KSeF.AccessTokenValidUntil));
      WriteLn('Token odswiezania wazny do: ', DateTimeToStr(KSeF.RefreshTokenValidUntil));

      // Otworz sesje interaktywna
      NrRefSesjiIteraktywnej := KSeF.InteractiveOpenSimple;

      // Otfieramy plik z faktura do wyslania
      // Otrzymujemy nr referencyjny sesji
      FAStream := TFileStream.Create('dokument_fa3.xml', fmOpenRead);
      // Wysylamy fakture ze wskazanego strumienia
      // Otrzymujemy nr referencyjny
      NrRefWyslanejFa := KSeF.InteractiveSend(FAStream);

      // Zamykamy sesje interaktywna
      KSeF.InteractiveClose;

      // Sprawdzamy status wyslanej faktury
      StatusResponse := KSeF.StatusSessionInvoice(NrRefSesjiIteraktywnej, NrRefWyslanejFa);
      WriteLn('Ilosc faktur: ', StatusResponse.Invoices.Count);
      if StatusResponse.Invoices.Count > 0 then
      begin
        WriteLn('Status przetwarzania: ', StatusResponse.Invoices[0].Status.Code);
        WriteLn('Opis Statusu: ', StatusResponse.Invoices[0].Status.Description);
        WriteLn('Nr KSeF faktury: ', StatusResponse.Invoices[0].KsefNumber);
        WriteLn('Nr faktury: ', StatusResponse.Invoices[0].InvoiceNumber);
        WriteLn('UPO URL: ', StatusResponse.Invoices[0].UpoDownloadUrl);
      end;

      // Zakoncz aktualna sesje
      KSeF.AuthSessionTerminateCurrent;
      WriteLn('Sesja zakonczona.');
    end;
  except
    // W przypadku odpowiedzi serwera komunikatem bledu zglaszany jest wyjatek
    // EKSeF2ExceptionResponse zawierajacy szczegolowe informacje o bledzie
    on E: EKSeF2ExceptionResponseBase do
    begin
      WriteLn('Blad: ', E.Message);
      WriteLn('JSON: ', E.RawData);
    end;
    // W innych przypadkach (np bledy I/O, brak dostepu do serwerow KSeF, itp)
    on E: Exception do
      WriteLn('Blad: ', E.Message);
  end;

  // Sprzatamy
  if Assigned(FAStream) then
    FAStream.Free;
  if Assigned(AuthInitResponse) then
    AuthInitResponse.Free;
  if Assigned(AuthStatusResponse) then
    AuthStatusResponse.Free;
  if Assigned(StatusResponse) then
    StatusResponse.Free;
  if Assigned(KSeF) then
    KSeF.Free;
  if Assigned(HTTPClient) then
    HTTPClient.Free;
end.


