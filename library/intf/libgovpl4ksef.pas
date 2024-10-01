{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

{ Obsługa KSeF API }
unit LibGovPl4KSeF;

{$ifdef fpc}
{$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Obj, LibGovPl4Backend,
  LibGovPl4XAdES, LibGovPl4KSeFObj;

type

  { TlgoKSeF }

  { Komponent obsługi KSeF API }
  TlgoKSeF = class(TlgoObject)
  private
    FCertificate: TlgoCertificate;
    FRSAKeys: array[TlgoKSeFGateType] of TlgoRSAKey;
    FXAdES: TlgoXAdES;
    FHTTPClient: TlgoHTTPClient;
    function GetAES256EncryptClass: UTF8String;
    function GetBase64EncoderClass: UTF8String;
    function GetCertificateAuthType: TlgoKSeFCertificateAuthType;
    function GetEncryption: Boolean;
    function GetFormCode: TlgoKSeFFormCode;
    function GetFormCodeSchemaVersion: UTF8String;
    function GetFormCodeSystemCode: UTF8String;
    function GetFormCodeTargetNamespace: UTF8String;
    function GetFormCodeValue: UTF8String;
    function GetGateType: TlgoKSeFGateType;
    function GetNIP: UTF8String;
    function GetRandomGeneratorClass: UTF8String;
    function GetRSAEncryptClass: UTF8String;
    function GetRSAKey(AIndex: TlgoKSeFGateType): TlgoRSAKey;
    function GetSessionActive: Boolean;
    function GetSessionToken: UTF8String;
    function GetSHA256HashClass: UTF8String;
    function GetToken: UTF8String;
    procedure SetAES256EncryptClass(AValue: UTF8String);
    procedure SetBase64EncoderClass(AValue: UTF8String);
    procedure SetCertificate(AValue: TlgoCertificate);
    procedure SetCertificateAuthType(AValue: TlgoKSeFCertificateAuthType);
    procedure SetEncryption(AValue: Boolean);
    procedure SetFormCode(AValue: TlgoKSeFFormCode);
    procedure SetFormCodeSchemaVersion(AValue: UTF8String);
    procedure SetFormCodeSystemCode(AValue: UTF8String);
    procedure SetFormCodeTargetNamespace(AValue: UTF8String);
    procedure SetFormCodeValue(AValue: UTF8String);
    procedure SetGateType(AValue: TlgoKSeFGateType);
    procedure SetHTTPClient(AValue: TlgoHTTPClient);
    procedure SetNIP(AValue: UTF8String);
    procedure SetRandomGeneratorClass(AValue: UTF8String);
    procedure SetRSAEncryptClass(AValue: UTF8String);
    procedure SetRSAKey(AIndex: TlgoKSeFGateType; AValue: TlgoRSAKey);
    procedure SetSHA256HashClass(AValue: UTF8String);
    procedure SetToken(AValue: UTF8String);
    procedure SetXAdES(AValue: TlgoXAdES);
  public
    constructor Create;

    { Generuj klucz AES dla dodatkowego szyfrowania }
    procedure GenerateAESKey;

    { Sesja }

    { Inicjalizacja sesji za pomoca certyfikatu kwalifikowanego lub pieczęci.
      @returns(zwracany obiekt z informają o zainicjowanej sesji) }
    function SessionInitSigned: TKSeFInitSessionResponse;

    { Inicjalizacja sesji za pomoca tokena.
      @returns(zwracany obiekt z informają o zainicjowanej sesji) }
    function SessionInitToken: TKSeFInitSessionResponse;

    { Wygenerowanie struktury InitSession w celu podpisania przy pomocy Profilu Zaufanego.
      @returns(zwracany jest łańcuch zawierający strukturę InitSession,
      którą należy podpisać Profilem Zaufanym) }
    function SessionChalangePZ: String;

    { Inicjalizacja sesji za pomoca wcześniej wygenerowanej struktury InitSession, podpisanej przy pomocy PZ.
      @param(ASignedInit łańcuch zawierający podpisaną w PZ strukturę InitUpload)
      @returns(zwracany obiekt z informają o zainicjowanej sesji) }
    function SessionInitPZ(const ASignedInit: UTF8String): TKSeFInitSessionResponse;

    { Sprawdzenie statusu aktywnej sesji interaktywnej. (@italic(Sesja interaktywna))
      @param(APageSize ilość wyników na stronę)
      @param(APageOffset numer strony)
      @param(AIncludeDetails czy mają zostać pobrane dane szczegółowe)
      @returns(zwracany obiekt z informacją o statusie sesji) }
    function SessionStatus(const APageSize: Integer = 10; APageOffset: Integer = 0; AIncludeDetails: Boolean = True): TKSeFSessionStatusResponse; overload;

    { Sprawdzenie statusu sesji ogólnej. (@italic(Sesja interaktywna))
      @param(AReferenceNumber nr referencyjny)
      @param(APageSize ilość wyników na stronie)
      @param(AIncludeDetails czy mają zostać pobrane dane szczegółowe)
      @returns(zwracany obiekt z informacją o statusie sesji) }
    function SessionStatus(const AReferenceNumber: UTF8String; const APageSize: Integer = 10; APageOffset: Integer = 0; AIncludeDetails: Boolean = True): TKSeFSessionStatusResponse; overload;

    { Wymuszenie zamknięcia aktywnej sesji. (@italic(Sesja interaktywna))
      @param(AForce wymuszenie - wywołane wyjątki podczasz zamykania sesji zostaną przechwycone)
      @returns(zwracany obiekt ze zwróconą z serwera KSeF informacją o zakończeniu sesji) }
    function SessionTerminate(const AForce: Boolean = False): TKSeFTerminateSessionResponse;

    { Wygenerowanie identyfikatora wewnetrznego }
    function SessionGenerateInternalIdentifier(AInputDigitsSequence: UTF8String): TKSeFInternalIdentifierGeneratedResponse;

    { Faktury }

    { Pobranie faktury po numerze identyfikacyjnym KSeF. (@italic(Sesja interaktywna))
      @param(AKSeFReferenceNumber numer referencyjny żądanej faktury)
      @param(AOutputStream strumień do którego zostanie zapisana pobrana faktura) }
    procedure InvoiceGet(const AKSeFReferenceNumber: UTF8String; AOutputStream: TStream);

    { Wysyłka faktury. (@italic(Sesja interaktywna))
      @param(ADataStream strumień zawierający dane XML faktury)
      @returns(zwracana struktura zawierająca nadany numer referencyjny oraz
      informacje o statusie przetwarzania faktury) }
    function InvoiceSend(const ADataStream: TStream): TKSeFSendInvoiceResponse;

    { Sprawdzenie statusu wysłanej faktury. (@italic(Sesja interaktywna))
      @param(AInvoiceElementReferenceNumber numer referencyjny faktury)
      @returns(zwracany obiekt z informacją o statusie przetwarzania faktury) }
    function InvoiceStatus(const AInvoiceElementReferenceNumber: UTF8String; const AKSeFNumberVariant: TlgoKSeFNumberVariant = knvDefault): TKSeFStatusInvoiceResponse;

    { Ukrywanie wybranej faktury. (@italic(Sesja interaktywna))
      @param(AKsefReferenceNumber numer referencyjny faktury)
      @param(AHidingReason przyczyna ukrycia faktury)
      @returns(zwraca obiekt z informacją o statusie ukrycia faktury) }
    function InvoiceVisibilityHide(const AKsefReferenceNumber, AHidingReason: UTF8String): TKSeFVisibilityInvoiceResponseStatusMain;

    { Anulowanie ukrycia wybranej faktury. (@italic(Sesja interaktywna))
      @param(AKsefReferenceNumber numer referencyjny faktury)
      @param(AHidingReason przyczyna anulowania ukrycia faktury)
      @returns(zwraca obiekt z informacją o statusie anulowania ukrycia faktury) }
    function InvoiceVisibilityShow(const AKsefReferenceNumber, AHidingCancelationReason: UTF8String): TKSeFVisibilityInvoiceResponseStatusMain;

    { Sprawdzenie statusu operacji ukrycia/odsłonienia faktury }
    function InvoiceVisibilityStatus(const AHidingElementReferenceNumber: UTF8String; const AKSeFNumberVariant: TlgoKSeFNumberVariant = knvDefault): TKSeFVisibilityInvoiceStatusResponse;

    { Sprawdzenie statusu widoczności faktury }
    function InvoiceVisibility(const AKSeFReferenceNumber: UTF8String; const AKSeFNumberVariant: TlgoKSeFNumberVariant = knvDefault): TKSeFVisibilityInvoiceGetResponse;

    { Wycofanie faktury scamowej }
    //function InvoiceScamCancel(ACancelScamInvoiceRequest: TKSeFCancelScamInvoiceRequest): TKSeFScamInvoiceResponse; overload;
    function InvoiceScamCancel(const AKSeFReferenceNumber: UTF8String; const AReportCancelationReason: UTF8String): TKSeFScamInvoiceResponse; //overload;

    { Zgłoszenie faktury scamowej }
    //function InvoiceScamReport(AReportScamInvoiceRequest: TKSeFReportScamInvoiceRequest): TKSeFScamInvoiceResponse; overload;
    function InvoiceScamReport(const AKSeFReferenceNumber: UTF8String; const AReportReason: UTF8String): TKSeFScamInvoiceResponse; //overload;

    { Pobranie statusu zgłoszenia nadużycia faktury }
    function InvoiceScamStatus(AScamElementReferenceNumber: UTF8String): TKSeFScamInvoiceResponse;

    { Pobranie zgłoszenia nadużycia faktury }
    function InvoiceScam(AKSeFReferenceNumber: UTF8String): TKSeFScamInvoiceStatusResponse;

    { Poświadczenia }

    { Nadanie poświadczeń dla biura rachunkowego }
    function CredentialsAccountingGrant(AGrantAccountingCredentialsRequest: TKSeFGrantAccountingCredentialsRequest): TKSeFStatusCredentialsResponse;

    { Odebranie poświadczeń biur rachunkowych }
    function CredentialsAccountingRevoke(ARevokeAccountingCredentialsRequest: TKSeFRevokeAccountingCredentialsRequest): TKSeFStatusCredentialsResponse;

    { Nadanie poświadczeń kontekstowych (@italic(Sesja interaktywna)) }
    function CredentialsContextGrant(AGrantContextCredentialsRequest: TKSeFGrantContextCredentialsRequest): TKSeFStatusCredentialsResponse;

    { Odebranie poświadczeń kontekstowych (@italic(Sesja interaktywna)) }
    function CredentialsContextRevoke(ARevokeContextCredentialsRequest: TKSeFRevokeContextCredentialsRequest): TKSeFStatusCredentialsResponse;

    { Generowanie tokena autoryzacyjnego (@italic(Sesja interaktywna)) }
    function CredentialsGenerateToken(AGenerateTokenRequest: TKSeFGenerateTokenRequest): TKSeFGenerateTokenResponse;

    { Nadanie poświadczeń (@italic(Sesja interaktywna)) }
    function CredentialsGrant(AGrantCredentialsRequest: TKSeFGrantCredentialsRequest): TKSeFStatusCredentialsResponse;

    { Odebranie poświadczeń (@italic(Sesja interaktywna)) }
    function CredentialsRevoke(ARevokeCredentialsRequest: TKSeFRevokeCredentialsRequest): TKSeFStatusCredentialsResponse;

    { Usunięcie tokena autoryzacyjnego (@italic(Sesja interaktywna)) }
    function CredentialsRevokeToken(ARevokeTokenRequest: TKSeFRevokeTokenRequest): TKSeFStatusCredentialsResponse;

    { Sprawdzenie statusu poświadczeń (@italic(Sesja interaktywna)) }
    function CredentialsStatus(const ACredentialsElementReferenceNumber: UTF8String): TKSeFStatusCredentialsResponse;

    { Zapytanie o poświadczenia nadane przez jednostkę nadrzędną (@italic(Sesja interaktywna))
      @param(AContextNip Identyfikator kontekstu)
      @param(ASourceIdentifier Identyfikator nadajacego uprawnienia)
      @param(ATargetIdentifier Identyfikator uprawnionego) }
    function QueryCredentialContextSync(const AContextNip, ASourceIdentifier, ATargetIdentifier: UTF8String): TKSeFQuerySyncCredentialsResponse;

    { Zapytanie o poświadczenia (@italic(Sesja interaktywna)) }
    function QueryCredentialSync(AQuerySyncCredentialsRequest: TKSeFQuerySyncCredentialsRequest): TKSeFQuerySyncCredentialsResponse;

    { Zapytania o faktury }

    { Zapytanie o faktury (synchroniczne). (@italic(Sesja interaktywna)) }
    function QueryInvoiceSync(AQueryCriteria: TKSeFQueryInvoiceRequest; const APageSize, APageOffset: Integer): TKSeFQueryInvoiceSyncResponse;

    { Inicjalizacja asynchronicznego zapytania o faktury. (@italic(Sesja interaktywna)) }
    function QueryInvoiceAsyncInit(AQueryCriteria: TKSeFQueryInvoiceRequest): TKSeFQueryInvoiceAsyncInitResponse;

    { Sprawdzenie statusu asynchronicznego zapytania o faktury. (@italic(Sesja interaktywna)) }
    function QueryInvoiceAsyncStatus(const AQueryElementReferenceNumber: UTF8String): TKSeFQueryInvoiceAsyncStatusResponse;

    { Pobranie wyników asynchronicznego zapytania o faktury. (@italic(Sesja interaktywna)) }
    procedure QueryInvoiceAsyncFetch(const AQueryElementReferenceNumber, APartElementReferenceNumber: UTF8String; AOutStream: TStream); overload;

    { Pobranie wyników asynchronicznego zapytania o faktury. (@italic(Sesja interaktywna)) }
    procedure QueryInvoiceAsyncFetch(AStatusResponse: TKSeFQueryInvoiceAsyncStatusResponse; APartIndex: Integer; AOutStream: TStream); overload;

    { Identyfikatory płatności }

    { Pobranie listy faktur dla identyfikatora płatności. (@italic(Sesja interaktywna)) }
    function PaymentIdentifierGetReferenceNumbers(APaymentIdentifier: UTF8String): TKSeFGetPaymentIdentifierReferenceNumbersResponse;

    { Wygenerowanie identyfikatora płatności. (@italic(Sesja interaktywna)) }
    function PaymentIdentifierRequest(AKsefReferenceNumberList: TStringArray): TKSeFRequestPaymentIdentifierResponse;

    { Interfejsy wspólne }

    { Pobranie faktury z repozytorium KSeF - kryteria oparte o numer KSeF }
    procedure CommonInvoiceKSeF(AInvoiceRequest: TKSeFInvoiceRequestKSeF; AOutStream: TStream; AGateType: TlgoKSeFGateType);

    { Pobranie faktury z repozytorium KSeF na podstawie kryteriów opartych o numer KSeF i skrót dokumentu }
    procedure CommonDownload(const AKsefReferenceNumber: UTF8String; ADownloadRequest: TKSeFInvoiceDownloadRequest; AOutStream: TStream; AGateType: TlgoKSeFGateType);

    { Interfejs wspólny pobrania statusu przetwarzania wsadowego }
    function CommonStatus(const AReferenceNumber: UTF8String; const AGateType: TlgoKSeFGateType): TKSeFStatusResponse;

    { Weryfikacja faktury }
    function CommonVerification(const AKsefReferenceNumber: UTF8String; AVerificationRequest: TKSeFInvoiceVerificationRequest; const AGateType: TlgoKSeFGateType): TKSeFInvoiceVerificationResponse;

    { Wysyłka wsadowa }

    { Przygotowanie danych i podpisanie struktury InitUpload }
    procedure BatchSign(const AZIPDataStream: TStream; const APZ: Boolean; const AEncryptedStream: TStream; out AInitUpload: UTF8String; AZIPFileName: UTF8String = ''; APartFileName: UTF8String = '');

    { Wysłanie uprzednio przygotowanych danych faktur i podpisanej struktury InitUpload }
    function BatchSend(const APartStream: TStream; const AInitUpload: UTF8String): UTF8String;

    { Klucze szyfrowania RSA }
    property RSAKey[AIndex: TlgoKSeFGateType]: TlgoRSAKey read GetRSAKey write SetRSAKey;
  published
    { Klasy sterowników }

    { Klasa sterownika szyfrowania RSA }
    property RSAEncryptClass: UTF8String read GetRSAEncryptClass write SetRSAEncryptClass;
    { Klasa enkodera Base64 }
    property Base64EncoderClass: UTF8String read GetBase64EncoderClass write SetBase64EncoderClass;
    { Klasa sterownika szyfrowania AES256 }
    property AES256EncryptClass: UTF8String read GetAES256EncryptClass write SetAES256EncryptClass;
    { Klasa funkcji skrótu SHA256 }
    property SHA256HashClass: UTF8String read GetSHA256HashClass write SetSHA256HashClass;
    { Klasa generatora liczb pseudolosowych }
    property RandomGeneratorClass: UTF8String read GetRandomGeneratorClass write SetRandomGeneratorClass;
    { Objekt XAdES dla podpisu certyfikatem kwalifikowanym struktury InitUpload }
    property XAdES: TlgoXAdES read FXAdES write SetXAdES;
    { Obiekt połączenia HTTPS }
    property HTTPClient: TlgoHTTPClient read FHTTPClient write SetHTTPClient;

    { Bramka i podmiot }

    { Rodzaj bramki (produkcyjna/demo/testowa) }
    property GateType: TlgoKSeFGateType read GetGateType write SetGateType;
    { Nr NIP podmiotu }
    property NIP: UTF8String read GetNIP write SetNIP;

    { Kod formularza FA }

    { Predefiniowany rodzaj bramki. }
    property FormCode: TlgoKSeFFormCode read GetFormCode write SetFormCode;
    property FormCodeSystemCode: UTF8String read GetFormCodeSystemCode write SetFormCodeSystemCode;
    property FormCodeSchemaVersion: UTF8String read GetFormCodeSchemaVersion write SetFormCodeSchemaVersion;
    property FormCodeTargetNamespace: UTF8String read GetFormCodeTargetNamespace write SetFormCodeTargetNamespace;
    property FormCodeValue: UTF8String read GetFormCodeValue write SetFormCodeValue;

    { Certyfikar kwalifikowany }

    { Certyfikat kwalifikowany z kluczem prywatnym do zainicjowania sesji
      interaktywnej oraz podpisania struktury InitUpload wysyłki wsadowej. }
    property Certificate: TlgoCertificate read FCertificate write SetCertificate;
    { Rodzaj autoryzacji certyfikatu kwalifikowanego lub pieczęci elektronicznej }
    property CertificateAuthType: TlgoKSeFCertificateAuthType read GetCertificateAuthType write SetCertificateAuthType;

    { Token autoryzujący }

    { Token do nawiązania sesji interaktywnej }
    property Token: UTF8String read GetToken write SetToken;

    { Opcionalne szyfrowanie AES }

    { Aktywacja opcionalnego szyfrowania AES }
    property Encryption: Boolean read GetEncryption write SetEncryption;

    { Informacja o sesji }

    { Token sesji }
    property SessionToken: UTF8String read GetSessionToken;
    { Czy sesjia aktywna }
    property SessionActive: Boolean read GetSessionActive;
  end;

implementation

{ TlgoKSeF }

function TlgoKSeF.GetAES256EncryptClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpKSeF_GetAES256EncryptClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoKSeF.GetBase64EncoderClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpKSeF_GetBase64EncoderClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoKSeF.GetCertificateAuthType: TlgoKSeFCertificateAuthType;
var
  P: LGP_INT32;
begin
  lgoCheckResult(lgpKSeF_GetCertificateAuthType(ExtObject, P));
  Result := TlgoKSeFCertificateAuthType(P);
end;

function TlgoKSeF.GetEncryption: Boolean;
var
  P: LGP_INT32;
begin
  lgoCheckResult(lgpKSeF_GetEncryption(ExtObject, P));
  Result := P <> 0;
end;

function TlgoKSeF.GetFormCode: TlgoKSeFFormCode;
var
  P: LGP_INT32;
begin
  lgoCheckResult(lgpKSeF_GetFormCode(ExtObject, P));
  Result := TlgoKSeFFormCode(P);
end;

function TlgoKSeF.GetFormCodeSchemaVersion: UTF8String;
var
  P: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_GetFormCodeSchemaVersion(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF.GetFormCodeSystemCode: UTF8String;
var
  P: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_GetFormCodeSystemCode(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF.GetFormCodeTargetNamespace: UTF8String;
var
  P: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_GetFormCodeTargetNamespace(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF.GetFormCodeValue: UTF8String;
var
  P: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_GetFormCodeValue(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF.GetGateType: TlgoKSeFGateType;
var
  P: LGP_INT32;
begin
  lgoCheckResult(lgpKSeF_GetGateType(ExtObject, P));
  Result := TlgoKSeFGateType(P);
end;

function TlgoKSeF.GetNIP: UTF8String;
var
  P: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_GetNIP(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF.GetRandomGeneratorClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpKSeF_GetRandomGeneratorClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoKSeF.GetRSAEncryptClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpKSeF_GetRSAEncryptClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoKSeF.GetRSAKey(AIndex: TlgoKSeFGateType): TlgoRSAKey;
begin
  Result := FRSAKeys[AIndex];
end;

function TlgoKSeF.GetSessionActive: Boolean;
var
  P: LGP_INT32;
begin
  lgoCheckResult(lgpKSeF_GetSessionActive(ExtObject, P));
  Result := P <> 0;
end;

function TlgoKSeF.GetSessionToken: UTF8String;
var
  P: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_GetSessionToken(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF.GetSHA256HashClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpKSeF_GetSHA256HashClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoKSeF.GetToken: UTF8String;
var
  P: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_GetToken(ExtObject, P));
  Result := lgoGetString(P);
end;

procedure TlgoKSeF.SetAES256EncryptClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetAES256EncryptClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetBase64EncoderClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetBase64EncoderClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetCertificate(AValue: TlgoCertificate);
var
  O: LGP_OBJECT;
begin
  if FCertificate = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.Item;
  lgoCheckResult(lgpKSeF_SetCertificate(ExtObject, O));
  FCertificate := AValue;
end;

procedure TlgoKSeF.SetCertificateAuthType(AValue: TlgoKSeFCertificateAuthType);
begin
  lgoCheckResult(lgpKSeF_SetCertificateAuthType(ExtObject, Integer(AValue)));
end;

procedure TlgoKSeF.SetEncryption(AValue: Boolean);
begin
  lgoCheckResult(lgpKSeF_SetEncryption(ExtObject, Integer(AValue)));
end;

procedure TlgoKSeF.SetFormCode(AValue: TlgoKSeFFormCode);
begin
  lgoCheckResult(lgpKSeF_SetFormCode(ExtObject, Integer(AValue)));
end;

procedure TlgoKSeF.SetFormCodeSchemaVersion(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetFormCodeSchemaVersion(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetFormCodeSystemCode(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetFormCodeSystemCode(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetFormCodeTargetNamespace(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetFormCodeTargetNamespace(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetFormCodeValue(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetFormCodeValue(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetGateType(AValue: TlgoKSeFGateType);
begin
  lgoCheckResult(lgpKSeF_SetGateType(ExtObject, Integer(AValue)));
end;

procedure TlgoKSeF.SetHTTPClient(AValue: TlgoHTTPClient);
var
  O: LGP_OBJECT;
begin
  if FHTTPClient = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  lgoCheckResult(lgpKSeF_SetHTTPClient(ExtObject, O));
  FHTTPClient := AValue;
end;

procedure TlgoKSeF.SetNIP(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetNIP(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetRandomGeneratorClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetRandomGeneratorClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetRSAEncryptClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetRSAEncryptClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetRSAKey(AIndex: TlgoKSeFGateType; AValue: TlgoRSAKey);
var
  O: LGP_OBJECT;
begin
  if FRSAKeys[AIndex] = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  lgoCheckResult(lgpKSeF_SetRSAKey(ExtObject, Integer(AIndex), O));
  FRSAKeys[AIndex] := AValue;
end;

procedure TlgoKSeF.SetSHA256HashClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetSHA256HashClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetToken(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetToken(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF.SetXAdES(AValue: TlgoXAdES);
var
  O: LGP_OBJECT;
begin
  if FXAdES = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  lgoCheckResult(lgpKSeF_SetXAdES(ExtObject, O));
  FXAdES := AValue;
end;

constructor TlgoKSeF.Create;
begin
  lgoCheckResult(lgpKSeF_Create(ExtObject));
end;

procedure TlgoKSeF.GenerateAESKey;
begin
  lgoCheckResult(lgpKSeF_GenerateAESKey(ExtObject));
end;

function TlgoKSeF.SessionInitSigned: TKSeFInitSessionResponse;
var
  R: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_SessionInitSigned(ExtObject, R));
  if R <> nil then
    Result := TKSeFInitSessionResponse.Create(R)
  else
    Result := nil;
end;

function TlgoKSeF.SessionInitToken: TKSeFInitSessionResponse;
var
  R: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_SessionInitToken(ExtObject, R));
  if R <> nil then
    Result := TKSeFInitSessionResponse.Create(R)
  else
    Result := nil;
end;

function TlgoKSeF.SessionChalangePZ: String;
var
  R: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_SessionChalangePZ(ExtObject, R));
  Result := lgoGetString(R);
end;

function TlgoKSeF.SessionInitPZ(const ASignedInit: UTF8String
  ): TKSeFInitSessionResponse;
var
  R: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_SessionInitPZ(ExtObject, LGP_PCHAR(ASignedInit), R));
  if R <> nil then
    Result := TKSeFInitSessionResponse.Create(R)
  else
    Result := nil;
end;

function TlgoKSeF.SessionStatus(const APageSize: Integer; APageOffset: Integer;
  AIncludeDetails: Boolean): TKSeFSessionStatusResponse;
var
  R: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_SessionStatus(ExtObject, '', APageSize, APageOffset, Integer(AIncludeDetails), R));
  if R <> nil then
    Result := TKSeFSessionStatusResponse.Create(R)
  else
    Result := nil;
end;

function TlgoKSeF.SessionStatus(const AReferenceNumber: UTF8String;
  const APageSize: Integer; APageOffset: Integer; AIncludeDetails: Boolean
  ): TKSeFSessionStatusResponse;
var
  R: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_SessionStatus(ExtObject, LGP_PCHAR(AReferenceNumber), APageSize, APageOffset, Integer(AIncludeDetails), R));
  if R <> nil then
    Result := TKSeFSessionStatusResponse.Create(R)
  else
    Result := nil;
end;

function TlgoKSeF.SessionTerminate(const AForce: Boolean
  ): TKSeFTerminateSessionResponse;
var
  R: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_SessionTerminate(ExtObject, Integer(AForce), R));
  if R <> nil then
    Result := TKSeFTerminateSessionResponse.Create(R)
  else
    Result := nil;
end;

function TlgoKSeF.SessionGenerateInternalIdentifier(AInputDigitsSequence: UTF8String
  ): TKSeFInternalIdentifierGeneratedResponse;
var
  R: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_SessionGenerateInternalIdentifier(ExtObject, LGP_PCHAR(AInputDigitsSequence), R));
  if R <> nil then
    Result := TKSeFInternalIdentifierGeneratedResponse.Create(R)
  else
    Result := nil;
end;

procedure TlgoKSeF.InvoiceGet(const AKSeFReferenceNumber: UTF8String;
  AOutputStream: TStream);
var
  LGStream: TlgoStream;
begin
  LGStream := TlgoStream.Create(AOutputStream);
  try
    lgoCheckResult(lgpKSeF_InvoiceGet(ExtObject, LGP_PCHAR(AKSeFReferenceNumber), LGStream.StreamObj));
  finally
    LGStream.Free;
  end;
end;

function TlgoKSeF.InvoiceSend(const ADataStream: TStream
  ): TKSeFSendInvoiceResponse;
var
  LGStream: TlgoStream;
  Resp: LGP_OBJECT;
begin
  LGStream := TlgoStream.Create(ADataStream);
  try
    lgoCheckResult(lgpKSeF_InvoiceSend(ExtObject, LGStream.StreamObj, Resp));
    if Resp <> nil then
      Result := TKSeFSendInvoiceResponse.Create(Resp)
    else
      Result := nil;
  finally
    LGStream.Free;
  end;
end;

function TlgoKSeF.InvoiceStatus(
  const AInvoiceElementReferenceNumber: UTF8String;
  const AKSeFNumberVariant: TlgoKSeFNumberVariant): TKSeFStatusInvoiceResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceStatus(ExtObject, LGP_PCHAR(AInvoiceElementReferenceNumber), LGP_INT32(AKSeFNumberVariant), Resp));
  if Resp <> nil then
    Result := TKSeFStatusInvoiceResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.InvoiceVisibilityHide(const AKsefReferenceNumber,
  AHidingReason: UTF8String): TKSeFVisibilityInvoiceResponseStatusMain;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceVisibilityHide(ExtObject, LGP_PCHAR(AKsefReferenceNumber),
    LGP_PCHAR(AHidingReason),  Resp));
  if Resp <> nil then
    Result := TKSeFVisibilityInvoiceResponseStatusMain.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.InvoiceVisibilityShow(const AKsefReferenceNumber,
  AHidingCancelationReason: UTF8String
  ): TKSeFVisibilityInvoiceResponseStatusMain;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceVisibilityShow(ExtObject, LGP_PCHAR(AKsefReferenceNumber),
    LGP_PCHAR(AHidingCancelationReason), Resp));
  if Resp <> nil then
    Result := TKSeFVisibilityInvoiceResponseStatusMain.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.InvoiceVisibilityStatus(
  const AHidingElementReferenceNumber: UTF8String;
  const AKSeFNumberVariant: TlgoKSeFNumberVariant
  ): TKSeFVisibilityInvoiceStatusResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceVisibilityStatus(ExtObject, LGP_PCHAR(AHidingElementReferenceNumber),
    LGP_INT32(AKSeFNumberVariant), Resp));
  if Resp <> nil then
    Result := TKSeFVisibilityInvoiceStatusResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.InvoiceVisibility(const AKSeFReferenceNumber: UTF8String;
  const AKSeFNumberVariant: TlgoKSeFNumberVariant
  ): TKSeFVisibilityInvoiceGetResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceVisibility(ExtObject, LGP_PCHAR(AKSeFReferenceNumber),
    LGP_INT32(AKSeFNumberVariant), Resp));
  if Resp <> nil then
    Result := TKSeFVisibilityInvoiceGetResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.InvoiceScamCancel(const AKSeFReferenceNumber: UTF8String;
  const AReportCancelationReason: UTF8String): TKSeFScamInvoiceResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceScamCancel(ExtObject, LGP_PCHAR(AKSeFReferenceNumber),
    LGP_PCHAR(AReportCancelationReason), Resp));
  if Resp <> nil then
    Result := TKSeFScamInvoiceResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.InvoiceScamReport(const AKSeFReferenceNumber: UTF8String;
  const AReportReason: UTF8String): TKSeFScamInvoiceResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceScamReport(ExtObject, LGP_PCHAR(AKSeFReferenceNumber),
    LGP_PCHAR(AReportReason), Resp));
  if Resp <> nil then
    Result := TKSeFScamInvoiceResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.InvoiceScamStatus(AScamElementReferenceNumber: UTF8String
  ): TKSeFScamInvoiceResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceScamStatus(ExtObject, LGP_PCHAR(AScamElementReferenceNumber), Resp));
  if Resp <> nil then
    Result := TKSeFScamInvoiceResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.InvoiceScam(AKSeFReferenceNumber: UTF8String
  ): TKSeFScamInvoiceStatusResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceScam(ExtObject, LGP_PCHAR(AKSeFReferenceNumber), Resp));
  if Resp <> nil then
    Result := TKSeFScamInvoiceStatusResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CredentialsAccountingGrant(
  AGrantAccountingCredentialsRequest: TKSeFGrantAccountingCredentialsRequest
  ): TKSeFStatusCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CredentialsAccountingGrant(ExtObject, AGrantAccountingCredentialsRequest.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFStatusCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CredentialsAccountingRevoke(
  ARevokeAccountingCredentialsRequest: TKSeFRevokeAccountingCredentialsRequest
  ): TKSeFStatusCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CredentialsAccountingRevoke(ExtObject, ARevokeAccountingCredentialsRequest.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFStatusCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CredentialsContextGrant(
  AGrantContextCredentialsRequest: TKSeFGrantContextCredentialsRequest
  ): TKSeFStatusCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CredentialsContextGrant(ExtObject, AGrantContextCredentialsRequest.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFStatusCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CredentialsContextRevoke(
  ARevokeContextCredentialsRequest: TKSeFRevokeContextCredentialsRequest
  ): TKSeFStatusCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CredentialsContextRevoke(ExtObject, ARevokeContextCredentialsRequest.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFStatusCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CredentialsGenerateToken(
  AGenerateTokenRequest: TKSeFGenerateTokenRequest): TKSeFGenerateTokenResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CredentialsGenerateToken(ExtObject, AGenerateTokenRequest.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFGenerateTokenResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CredentialsGrant(
  AGrantCredentialsRequest: TKSeFGrantCredentialsRequest
  ): TKSeFStatusCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CredentialsGrant(ExtObject, AGrantCredentialsRequest.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFStatusCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CredentialsRevoke(
  ARevokeCredentialsRequest: TKSeFRevokeCredentialsRequest
  ): TKSeFStatusCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CredentialsRevoke(ExtObject, ARevokeCredentialsRequest.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFStatusCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CredentialsRevokeToken(
  ARevokeTokenRequest: TKSeFRevokeTokenRequest): TKSeFStatusCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CredentialsRevokeToken(ExtObject, ARevokeTokenRequest.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFStatusCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CredentialsStatus(
  const ACredentialsElementReferenceNumber: UTF8String
  ): TKSeFStatusCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CredentialsStatus(ExtObject, LGP_PCHAR(ACredentialsElementReferenceNumber), Resp));
  if Resp <> nil then
    Result := TKSeFStatusCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.QueryCredentialContextSync(const AContextNip,
  ASourceIdentifier, ATargetIdentifier: UTF8String
  ): TKSeFQuerySyncCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_QueryCredentialContextSync(ExtObject, LGP_PCHAR(AContextNip),
    LGP_PCHAR(ASourceIdentifier), LGP_PCHAR(ATargetIdentifier), Resp));
  if Resp <> nil then
    Result := TKSeFQuerySyncCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.QueryCredentialSync(
  AQuerySyncCredentialsRequest: TKSeFQuerySyncCredentialsRequest
  ): TKSeFQuerySyncCredentialsResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_QueryCredentialSync(ExtObject, AQuerySyncCredentialsRequest.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFQuerySyncCredentialsResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.QueryInvoiceSync(AQueryCriteria: TKSeFQueryInvoiceRequest;
  const APageSize, APageOffset: Integer): TKSeFQueryInvoiceSyncResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_QueryInvoiceSync(ExtObject, AQueryCriteria.ExtObject, APageSize, APageOffset, Resp));
  if Resp <> nil then
    Result := TKSeFQueryInvoiceSyncResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.QueryInvoiceAsyncInit(AQueryCriteria: TKSeFQueryInvoiceRequest
  ): TKSeFQueryInvoiceAsyncInitResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_QueryInvoiceAsyncInit(ExtObject, AQueryCriteria.ExtObject, Resp));
  if Resp <> nil then
    Result := TKSeFQueryInvoiceAsyncInitResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.QueryInvoiceAsyncStatus(
  const AQueryElementReferenceNumber: UTF8String
  ): TKSeFQueryInvoiceAsyncStatusResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_QueryInvoiceAsyncStatus(ExtObject, LGP_PCHAR(AQueryElementReferenceNumber), Resp));
  if Resp <> nil then
    Result := TKSeFQueryInvoiceAsyncStatusResponse.Create(Resp)
  else
    Result := nil;
end;

procedure TlgoKSeF.QueryInvoiceAsyncFetch(const AQueryElementReferenceNumber,
  APartElementReferenceNumber: UTF8String; AOutStream: TStream);
var
  LGStream: TlgoStream;
begin
  LGStream := TlgoStream.Create(AOutStream);
  try
    lgoCheckResult(lgpKSeF_QueryInvoiceAsyncFetch(ExtObject, LGP_PCHAR(AQueryElementReferenceNumber),
      LGP_PCHAR(APartElementReferenceNumber), LGStream.StreamObj));
  finally
    LGStream.Free;
  end;
end;

procedure TlgoKSeF.QueryInvoiceAsyncFetch(
  AStatusResponse: TKSeFQueryInvoiceAsyncStatusResponse; APartIndex: Integer;
  AOutStream: TStream);
begin
  if APartIndex < AStatusResponse.PartList.Count then
    QueryInvoiceAsyncFetch(AStatusResponse.PartList.Items[APartIndex].PartReferenceNumber,
      AStatusResponse.ElementReferenceNumber, AOutStream)
  else
    raise ERangeError.Create('invalid index');
end;

function TlgoKSeF.PaymentIdentifierGetReferenceNumbers(
  APaymentIdentifier: UTF8String
  ): TKSeFGetPaymentIdentifierReferenceNumbersResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_PaymentIdentifierGetReferenceNumbers(ExtObject, LGP_PCHAR(APaymentIdentifier), Resp));
  if Resp <> nil then
    Result := TKSeFGetPaymentIdentifierReferenceNumbersResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.PaymentIdentifierRequest(
  AKsefReferenceNumberList: TStringArray
  ): TKSeFRequestPaymentIdentifierResponse;
var
  S: UTF8String;
  I: Integer;
  Resp: LGP_OBJECT;
begin
  S := '';
  for I := 0 to Length(AKsefReferenceNumberList) do
  begin
    if S <> '' then
      S := S + ';';
    S := S + AKsefReferenceNumberList[I];
  end;
  lgoCheckResult(lgpKSeF_PaymentIdentifierRequest(ExtObject, LGP_PCHAR(S), Resp));
  if Resp <> nil then
    Result := TKSeFRequestPaymentIdentifierResponse.Create(Resp)
  else
    Result := nil;
end;

procedure TlgoKSeF.CommonInvoiceKSeF(AInvoiceRequest: TKSeFInvoiceRequestKSeF;
  AOutStream: TStream; AGateType: TlgoKSeFGateType);
var
  LGStream: TlgoStream;
begin
  LGStream := TlgoStream.Create(AOutStream);
  try
    lgoCheckResult(lgpKSeF_CommonInvoiceKSeF(ExtObject, AInvoiceRequest.ExtObject,
      LGStream.StreamObj, LGP_INT32(AGateType)));
  finally
    LGStream.Free;
  end;
end;

procedure TlgoKSeF.CommonDownload(const AKsefReferenceNumber: UTF8String;
  ADownloadRequest: TKSeFInvoiceDownloadRequest; AOutStream: TStream;
  AGateType: TlgoKSeFGateType);
var
  LGStream: TlgoStream;
begin
  LGStream := TlgoStream.Create(AOutStream);
  try
    lgoCheckResult(lgpKSeF_CommonDownload(ExtObject, LGP_PCHAR(AKsefReferenceNumber),
      ADownloadRequest.ExtObject, LGStream.StreamObj, LGP_INT32(AGateType)));
  finally
    LGStream.Free;
  end;
end;

function TlgoKSeF.CommonStatus(const AReferenceNumber: UTF8String;
  const AGateType: TlgoKSeFGateType): TKSeFStatusResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CommonStatus(ExtObject, LGP_PCHAR(AReferenceNumber), LGP_INT32(AGateType), Resp));
  if Resp <> nil then
    Result := TKSeFStatusResponse.Create(Resp)
  else
    Result := nil;
end;

function TlgoKSeF.CommonVerification(const AKsefReferenceNumber: UTF8String;
  AVerificationRequest: TKSeFInvoiceVerificationRequest;
  const AGateType: TlgoKSeFGateType): TKSeFInvoiceVerificationResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_CommonVerification(ExtObject, LGP_PCHAR(AKsefReferenceNumber), AVerificationRequest.ExtObject, LGP_INT32(AGateType), Resp));
  if Resp <> nil then
    Result := TKSeFInvoiceVerificationResponse.Create(Resp)
  else
    Result := nil;
end;

procedure TlgoKSeF.BatchSign(const AZIPDataStream: TStream; const APZ: Boolean;
  const AEncryptedStream: TStream; out AInitUpload: UTF8String;
  AZIPFileName: UTF8String; APartFileName: UTF8String);
var
  InitUpload: LGP_OBJECT;
  LGZIPDataStream, LGEncryptedStream: TlgoStream;
begin
  LGZIPDataStream := TlgoStream.Create(AZIPDataStream);
  LGEncryptedStream := TlgoStream.Create(AEncryptedStream);
  try
    lgoCheckResult(lgpKSeF_BatchSign(ExtObject, LGZIPDataStream.StreamObj, LGP_INT32(APZ), LGEncryptedStream.StreamObj, InitUpload, LGP_PCHAR(AZIPFileName), LGP_PCHAR(APartFileName)));
    AInitUpload := lgoGetString(InitUpload);
  finally
    LGZIPDataStream.Free;
    LGEncryptedStream.Free;
  end;
end;

function TlgoKSeF.BatchSend(const APartStream: TStream;
  const AInitUpload: UTF8String): UTF8String;
var
  LGPartStream: TlgoStream;
  Res: LGP_OBJECT;
begin
  LGPartStream := TlgoStream.Create(APartStream);
  try
    lgoCheckResult(lgpKSeF_BatchSend(ExtObject, LGPartStream.StreamObj, LGP_PCHAR(AInitUpload), Res));
    Result := lgoGetString(Res);
  finally
    LGPartStream.Free;
  end;
end;

end.

