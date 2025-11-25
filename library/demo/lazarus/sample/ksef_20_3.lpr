program ksef_20_3;

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$APPTYPE CONSOLE}

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Backend, LibGovPl4XAdES,
  LibGovPl4KSeF2, LibGovPl4KSeFObj2, DateUtils;

var
  HTTPClient: TlgoHTTPClient = nil;
  KSeF: TlgoKSeF2 = nil;

  AuthInitResponse: TKSeF2AuthenticationInitResponse;
  AuthStatusResponse: TKSeF2AuthenticationOperationStatusResponse = nil;

  QueryCriteria: TKSeF2InvoiceQueryFilters = nil;
  FAStream: TFileStream = nil;

  InvoiceQueryResponse: TKSeF2QueryInvoicesMetadataResponse = nil;
  I: Integer;

  Nip: String = '1111111111';
  TokenKSeF: String = '20251111-FF-123F456780-1234567896-B6|nip-1111111111|1111111111111222222222222233333333333334444444444445555555555556';
  PlikDocelowyFA: String = 'pobrany_fa.xml';

begin
  // Inicjuj biblioteke LibGovPL
  lgplInit;
  // Wyswietl wersje
  WriteLn('Wersja biblioteki: ', IntToHex(lgplVersion));

  // Jesli podano parametry to wczytaj
  if ParamCount >= 2 then
  begin
    Nip := ParamStr(1);
    TokenKSeF := ParamStr(2);
    if ParamCount >= 3 then
      PlikDocelowyFA := ParamStr(3);
  end;

  // Tworzymy klienta HTTPS
  HTTPClient := TlgoHTTPClient.Create('');

  // Tworzymy obiekt klienta KSeF 2.0
  KSeF := TlgoKSeF2.Create;
  KSeF.HTTPClient := HTTPClient;

  // Wskazujemy rodzaj serwera KSeF (produkcyjny/test/demo)
  KSeF.GateType := kgtTest;
  // Wskazujemy token KSeF do uwierzytelnienia
  KSeF.KsefToken := TokenKSeF;
  // Wskazujemy rodzaj identyfikatora na nr NIP
  KSeF.IdentifierType := itNip;
  // Wskazujemy identyfikator czyli nr NIP podmiotu
  KSeF.Identifier := Nip;
  // Bedziemy wysylac faktury w formacie FA(3)
  KSeF.FormCode := kfcFA3;

  try
    // Pobierz certyfikaty kluczy publicznych z serwera KSeF.
    // Mozna rowniez wczytac z pliku za pomoca klay TlgoRSAPublicKey
    KSeF.SecurityLoadKeys;

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

      // Tworzymy obiekt kryteriow zapytania o faktury
      QueryCriteria := TKSeF2InvoiceQueryFilters.Create(nil, '');
      // Wybieramy wg daty fakturowania ostatnie 30 dni
      QueryCriteria.DateRange.DateType := Invoicing;
      QueryCriteria.DateRange.From := IncDay(Now, -30);

      // Pytamy o faktury, pobierz pierwsza strone odpowiedzi
      InvoiceQueryResponse := KSeF.InvoicesQueryMetadata(QueryCriteria, 0);
      WriteLn('Liczba wynikow: ', InvoiceQueryResponse.Invoices.Count);
      // Wyswietl wyniki
      for I := 0 to InvoiceQueryResponse.Invoices.Count - 1 do
      begin
        WriteLn('Nr faktury: ', InvoiceQueryResponse.Invoices[I].InvoiceNumber);
        WriteLn('Nr KSeF: ', InvoiceQueryResponse.Invoices[I].KsefNumber);
        WriteLn('Wartosc netto: ', InvoiceQueryResponse.Invoices[I].NetAmount);
        WriteLn('Skrot: ', InvoiceQueryResponse.Invoices[I].InvoiceHash);
        WriteLn('----------------');
      end;

      // Pobierz fakture jesli dostepna
      if InvoiceQueryResponse.Invoices.Count > 0 then
      begin
        // Utworz strumien pliku wynikowego
        FAStream := TFileStream.Create(PlikDocelowyFA, fmCreate);
        // Pobierz fakture po numerze KSeF
        KSeF.InvoicesKsef(InvoiceQueryResponse.Invoices[0].KsefNumber, FAStream);
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
  if Assigned(QueryCriteria) then
    QueryCriteria.Free;
  if Assigned(InvoiceQueryResponse) then
    InvoiceQueryResponse.Free;
  if Assigned(KSeF) then
    KSeF.Free;
  if Assigned(HTTPClient) then
    HTTPClient.Free;
end.


