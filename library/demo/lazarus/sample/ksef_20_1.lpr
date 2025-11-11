program ksef_20_1;

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$APPTYPE CONSOLE}

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Backend, LibGovPl4XAdES,
  LibGovPl4KSeF2, LibGovPl4KSeFObj2;

var
  CertSigner: TlgoCertificateSigner = nil;
  Certyfikat: TlgoCertificate = nil;
  HTTPClient: TlgoHTTPClient = nil;
  XAdES: TlgoXAdES = nil;
  KSeF: TlgoKSeF2 = nil;

  CertStream: TFileStream = nil;
  KeyStream: TFileStream = nil;

  AuthInitResponse: TKSeF2AuthenticationInitResponse;
  AuthStatusResponse: TKSeF2AuthenticationOperationStatusResponse = nil;
  AuthList: TKSeF2AuthenticationListResponse = nil;

  I: Integer;

begin
  // Inicjuj biblioteke LibGovPL
  lgplInit;
  // Wyswietl wersje
  WriteLn('Wersja biblioteki: ', IntToHex(lgplVersion));

  // Utworz obiekt podpisu certyfikatem z domyslna klasa sterownika
  CertSigner := TlgoCertificateSigner.Create('');
  WriteLn('Klasa podpisu certyfikatem: ', CertSigner.ObjClassName);

  // Wczytanie certyfikatu i klucza prywatnego do uwierzytelnienia w KSeF.
  // Certyfikat i klucz wczytywany jest z osobnych plikow.
  // Klucz prywatny zabezpieczony jest haslem.
  CertStream := TFileStream.Create('CertyfikatKSeF.crt', fmOpenRead);
  KeyStream := TFileStream.Create('KluczPrywatnyKSeF.key', fmOpenRead);
  Certyfikat := CertSigner.LoadFromStream(CertStream, letPEM, KeyStream, letPEM, 'HasloDoCertyfikatuKSeF!123');
  CertStream.Free;
  KeyStream.Free;
  WriteLn('Wczytano certyfikat: ' + Certyfikat.DisplayName);

  // Tworzymu biekt XAdES
  XAdES := TlgoXAdES.Create;
  XAdES.SignType := shtSHA256;

  // Tworzymy klienta HTTPS
  HTTPClient := TlgoHTTPClient.Create('');

  // Tworzymy obiekt klienta KSeF 2.0
  KSeF := TlgoKSeF2.Create;
  KSeF.HTTPClient := HTTPClient;
  KSeF.XAdES := XAdES;

  // Wskazujemy rodzaj serwera KSeF (produkcyjny/test/demo)
  KSeF.GateType := kgtTest;
  // Wskazujemy certyfikat do uwierzytelnienia
  KSeF.AuthCertificate := Certyfikat;
  // Wskazujemy rodzaj identyfikatora na nr NIP
  KSeF.IdentifierType := itNip;
  // Wskazujemy identyfikator czyli nr NIP podmiotu
  KSeF.Identifier := '1111111111';

  try
    // Uwirzytelnij za pomoca wskazanego certyfikatu i klucza
    AuthInitResponse := KSeF.AuthXadesSignature;

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

      // Wypisz liste aktywnych sesji
      AuthList := KSeF.AuthSessions;
      WriteLn('Ilosc elementow: ', AuthList.Items.Count);
      for I := 0 to AuthList.Items.Count - 1 do
      begin
        WriteLn('Indeks: ', I);
        WriteLn('Nr ref: ', AuthList.Items[I].ReferenceNumber);
        WriteLn('Rozpoczeto: ', DateTimeToStr(AuthList.Items[I].StartDate));
        WriteLn('Czy to obecna sesja: ', AuthList.Items[I].IsCurrent);
        WriteLn('Status: ', AuthList.Items[I].Status.Code);
        WriteLn('Opis statusu: ', AuthList.Items[I].Status.Description);
        WriteLn('---------------------');
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
  if Assigned(AuthInitResponse) then
    AuthInitResponse.Free;
  if Assigned(AuthStatusResponse) then
    AuthStatusResponse.Free;
  if Assigned(AuthList) then
    AuthList.Free;
  if Assigned(KSeF) then
    KSeF.Free;
  if Assigned(XAdES) then
    XAdES.Free;
  if Assigned(HTTPClient) then
    HTTPClient.Free;
end.

