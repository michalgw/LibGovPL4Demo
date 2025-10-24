{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

{ Obsługa KSeF API }
unit LibGovPl4KSeF2;

{$ifdef fpc}
{$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Obj, LibGovPl4Backend,
  LibGovPl4XAdES, LibGovPl4KSeFObj2;

const
  KSEF2_MAX_PART_SIZE = 100 * 1024 * 1024 - AES256_BLOCK_SIZE;

type
  {$IFNDEF FPC}
  TBytes = array of Byte;
  {$ENDIF}

  TKSeF2RequestPartStreamEvent = procedure(Sender: TObject; APartNumber: Integer;
    var APartStream: TStream) of Object;

  { Komponent obsługi KSeF API }

  { TlgoKSeF2 }

  TlgoKSeF2 = class(TlgoObject)
  private
    FAuthCertificate: TlgoCertificate;
    FHTTPClient: TlgoHTTPClient;
    FOnRequestPartStream: TKSeF2RequestPartStreamEvent;
    FXAdES: TlgoXAdES;
    FRSATokenEncKey: array[TlgoKSeFGateType] of TlgoRSAPublicKey;
    FRSASymmetricKeyEncKey: array[TlgoKSeFGateType] of TlgoRSAPublicKey;
    FPartStream: TlgoStream;
    function GetAccessToken: UTF8String;
    function GetAccessTokenValidUntil: TDateTime;
    function GetAES256EncryptClass: UTF8String;
    function GetAuthCertificateSubject: TlgoKSeFCertificateAuthType;
    function GetAuthenticationRefNo: UTF8String;
    function GetAuthenticationToken: UTF8String;
    function GetAuthenticationTokenValidUntil: TDateTime;
    function GetBase64EncoderClass: UTF8String;
    function GetBatchPartSize: Integer;
    function GetBatchReferenceNumber: UTF8String;
    function GetFormCode: TlgoKSeFFormCode;
    function GetFormCodeSchemaVersion: UTF8String;
    function GetFormCodeSystemCode: UTF8String;
    function GetFormCodeValue: UTF8String;
    function GetGateType: TlgoKSeFGateType;
    function GetIdentifier: UTF8String;
    function GetIdentifierType: TlgoKSeFIdentifierType;
    function GetInteractiveEncryptionKey: TBytes;
    function GetInteractiveReferenceNumber: UTF8String;
    function GetInteractiveValidUntil: TDateTime;
    function GetInteractiveVector: TBytes;
    function GetInvoiceExportEncryptionKey: TBytes;
    function GetInvoiceExportReferenceNumber: UTF8String;
    function GetInvoiceExportVector: TBytes;
    function GetKsefToken: UTF8String;
    function GetRandomGeneratorClass: UTF8String;
    function GetRefreshToken: UTF8String;
    function GetRefreshTokenValidUntil: TDateTime;
    function GetRSAPublicKeyClass: UTF8String;
    function GetRSASymmetricKeyEncKey(AGateType: TlgoKSeFGateType
      ): TlgoRSAPublicKey;
    function GetRSATokenEncKey(AGateType: TlgoKSeFGateType): TlgoRSAPublicKey;
    function GetSHA256HashClass: UTF8String;
    procedure SetAccessToken(AValue: UTF8String);
    procedure SetAccessTokenValidUntil(AValue: TDateTime);
    procedure SetAES256EncryptClass(AValue: UTF8String);
    procedure SetAuthCertificate(AValue: TlgoCertificate);
    procedure SetAuthCertificateSubject(AValue: TlgoKSeFCertificateAuthType);
    procedure SetAuthenticationRefNo(AValue: UTF8String);
    procedure SetAuthenticationToken(AValue: UTF8String);
    procedure SetAuthenticationTokenValidUntil(AValue: TDateTime);
    procedure SetBase64EncoderClass(AValue: UTF8String);
    procedure SetBatchPartSize(AValue: Integer);
    procedure SetBatchReferenceNumber(AValue: UTF8String);
    procedure SetFormCode(AValue: TlgoKSeFFormCode);
    procedure SetFormCodeSchemaVersion(AValue: UTF8String);
    procedure SetFormCodeSystemCode(AValue: UTF8String);
    procedure SetFormCodeValue(AValue: UTF8String);
    procedure SetGateType(AValue: TlgoKSeFGateType);
    procedure SetHTTPClient(AValue: TlgoHTTPClient);
    procedure SetIdentifier(AValue: UTF8String);
    procedure SetIdentifierType(AValue: TlgoKSeFIdentifierType);
    procedure SetInteractiveEncryptionKey(AValue: TBytes);
    procedure SetInteractiveReferenceNumber(AValue: UTF8String);
    procedure SetInteractiveValidUntil(AValue: TDateTime);
    procedure SetInteractiveVector(AValue: TBytes);
    procedure SetInvoiceExportEncryptionKey(AValue: TBytes);
    procedure SetInvoiceExportReferenceNumber(AValue: UTF8String);
    procedure SetInvoiceExportVector(AValue: TBytes);
    procedure SetKsefToken(AValue: UTF8String);
    procedure SetOnRequestPartStream(AValue: TKSeF2RequestPartStreamEvent);
    procedure SetRandomGeneratorClass(AValue: UTF8String);
    procedure SetRefreshToken(AValue: UTF8String);
    procedure SetRefreshTokenValidUntil(AValue: TDateTime);
    procedure SetRSAPublicKeyClass(AValue: UTF8String);
    procedure SetRSASymmetricKeyEncKey(AGateType: TlgoKSeFGateType;
      AValue: TlgoRSAPublicKey);
    procedure SetRSATokenEncKey(AGateType: TlgoKSeFGateType;
      AValue: TlgoRSAPublicKey);
    procedure SetSHA256HashClass(AValue: UTF8String);
    procedure SetXAdES(AValue: TlgoXAdES);
  public
    constructor Create;

    function AuthChallenge: TKSeF2AuthenticationChallengeResponse;

    function AuthXadesSignatureGenerate: UTF8String; overload;
    function AuthXadesSignatureGenerate(ASubjectIdType: TlgoKSeFCertificateAuthType; AIdentifier: UTF8String;
      AIdentifierType: TlgoKSeFIdentifierType): UTF8String; overload;

    function AuthXadesSignature: TKSeF2AuthenticationInitResponse; overload;
    function AuthXadesSignature(ACertificate: TlgoCertificate; ASubjectIdType: TlgoKSeFCertificateAuthType; AIdentifier: UTF8String;
      AIdentifierType: TlgoKSeFIdentifierType): TKSeF2AuthenticationInitResponse; overload;
    function AuthXadesSignature(ASignedAuthData: UTF8String): TKSeF2AuthenticationInitResponse; overload;

    function AuthKsefToken: TKSeF2AuthenticationInitResponse; overload;
    function AuthKsefToken(AToken: UTF8String; AIdentifier: UTF8String; AIdentifierType: TlgoKSeFIdentifierType): TKSeF2AuthenticationInitResponse; overload;

    function AuthStatus(AReferenceNumber: UTF8String = ''; AAuthenticationToken: UTF8String = ''): TKSeF2AuthenticationOperationStatusResponse;

    function AuthTokenRedem(AAuthenticationToken: UTF8String = ''): TKSeF2AuthenticationTokensResponse;

    function AuthTokenRefresh(ARefreshToken: UTF8String = ''): TKSeF2AuthenticationTokenRefreshResponse;

    function AuthSessions(AContinuationToken: UTF8String = ''; APageSize: Integer = 0; AAccessToken: UTF8String = ''): TKSeF2AuthenticationListResponse;
    procedure AuthSessionTerminateCurrent(AToken: UTF8String = '');
    procedure AuthSessionTerminate(AReferenceNumber: UTF8String; AAccessToken: UTF8String = '');

    function SecurityPublicKeyCertificates(AGate: TlgoKSeFGateType): TKSeF2PublicKeyCertificateResponse;
    procedure SecurityLoadKeys;

    function InteractiveOpen(AFormCode: TlgoKSeFFormCode; AEncryptionSymetricKey: TBytes;
      AInitializationVector: TBytes; AFormCodeSystemCode: UTF8String;
      AFormCodeSchemaVersion: UTF8String; AFormCodeValue: UTF8String;
      AAccessToken: UTF8String = ''): TKSeF2OpenOnlineSessionResponse; overload;
    function InteractiveOpen(ARequest: TKSeF2OpenOnlineSessionRequest; AAccessToken: UTF8String = ''): TKSeF2OpenOnlineSessionResponse; overload;
    function InteractiveOpen: TKSeF2OpenOnlineSessionResponse; overload;
    function InteractiveOpenSimple: UTF8String; overload;

    function InteractiveSend(AInvoiceStream: TStream; AOfflineMode: Boolean;
      AHashOfCorrectedInvoice: UTF8String; ASessionReferenceNumber: UTF8String;
      AEncryptionSymetricKey: TBytes; AInitializationVector: TBytes;
      AAccessToken: UTF8String = ''): UTF8String; overload;
    function InteractiveSend(ARequest: TKSeF2SendInvoiceRequest;
      ASessionReferenceNumber: UTF8String; AAccessToken: UTF8String = ''): TKSeF2SendInvoiceResponse; overload;
    function InteractiveSend(AInvoiceStream: TStream; AOfflineMode: Boolean = False;
      AHashOfCorrectedInvoice: UTF8String = ''): UTF8String; overload;

    procedure InteractiveClose(ASessionReferenceNumber: UTF8String = ''; AAccessToken: UTF8String = '');

    function BatchPrepare(AZIPFileStream: TStream; AOutputStream: TStream; AFormCode: TlgoKSeFFormCode;
      AEncryptionSymetricKey: TBytes; AInitializationVector: TBytes; AFormCodeSystemCode: UTF8String;
      AFormCodeSchemaVersion: UTF8String; AFormCodeValue: UTF8String; APartSize: Integer = 0): TKSeF2OpenBatchSessionRequest; overload;
    function BatchPrepare(AZIPFileStream: TStream; AOutputStream: TStream = nil; APartSize: Integer = 0): TKSeF2OpenBatchSessionRequest; overload;
    function BatchOpen(ARequest: TKSeF2OpenBatchSessionRequest; AAccessToken: UTF8String = ''): TKSeF2OpenBatchSessionResponse;
    procedure BatchSendPart(APartUploadRequest: TKSeF2PartUploadRequest; ADataStream: TStream);
    procedure BatchClose(ASessionReferenceNumber: UTF8String = ''; AAccessToken: UTF8String = '');

    function StatusSessions(ASessionType: TKSeF2SessionType;
      AContinuationToken: UTF8String = ''; APageSize: Integer = 0;
      AReferenceNumber: UTF8String = ''; ADateCreatedFrom: TDateTime = 0;
      ADateCreatedTo: TDateTime = 0; ADateClosedFrom: TDateTime = 0;
      ADateClosedTo: TDateTime = 0; ADateModifiedFrom: TDateTime = 0;
      ADateModifiedTo: TDateTime = 0; AStatuses: TKSeF2CommonSessionStatuses = [];
      AAccessToken: UTF8String = ''): TKSeF2SessionsQueryResponse;
    function StatusSession(ASessionReferenceNumber: UTF8String; AAccessToken: UTF8String = ''): TKSeF2SessionStatusResponse;
    function StatusInvoices(ASessionReferenceNumber: UTF8String; AContinuationToken: UTF8String = ''; APageSize: Integer = 0; AAccessToken: UTF8String = ''): TKSeF2SessionInvoicesResponse;
    function StatusSessionInvoice(ASessionReferenceNumber: UTF8String;
      AInvoiceReferenceNumber: UTF8String; AAccessToken: UTF8String = ''): TKSeF2SessionInvoicesResponse;
    function StatusInvoicesFailed(ASessionReferenceNumber: UTF8String; AContinuationToken: UTF8String = '';
      APageSize: Integer = 0; AAccessToken: UTF8String = ''): TKSeF2SessionInvoicesResponse;
    procedure StatusUpoKsef(ASessionReferenceNumber: UTF8String; AKsefNumber: UTF8String; AOutStream: TStream; AAccessToken: UTF8String = '');
    function StatusUpoKsefSimple(ASessionReferenceNumber: UTF8String; AKsefNumber: UTF8String; AAccessToken: UTF8String = ''): UTF8String;
    procedure StatusUpoSessionInvoice(ASessionReferenceNumber: UTF8String; AInvoiceReferenceNumber: UTF8String; AOutStream: TStream; AAccessToken: UTF8String = '');
    function StatusUpoSessionInvoiceSimple(ASessionReferenceNumber: UTF8String; AInvoiceReferenceNumber: UTF8String; AAccessToken: UTF8String = ''): UTF8String;
    procedure StatusUpoSession(ASessionReferenceNumber: UTF8String; AUpoReferenceNumber: UTF8String; AOutStream: TStream; AAccessToken: UTF8String = '');
    function StatusUpoSessionSimple(ASessionReferenceNumber: UTF8String; AUpoReferenceNumber: UTF8String; AAccessToken: UTF8String = ''): UTF8String;

    procedure InvoicesKsef(AKsefNumber: UTF8String; AOutputStram: TStream;
      AAccessToken: UTF8String = '');
    function InvoicesQueryMetadata(ARequest: TKSeF2InvoiceQueryFilters;
      APageOffset: Integer = 0; APageSize: Integer = 0;
      AAccessToken: UTF8String = ''): TKSeF2QueryInvoicesMetadataResponse;
    function InvoicesExport(ARequest: TKSeF2InvoiceExportRequest; AAccessToken: UTF8String = ''): TKSeF2ExportInvoicesResponse; overload;
    function InvoicesExport(ARequest: TKSeF2InvoiceQueryFilters; AEncryptionSymetricKey: TBytes = nil; AInitializationVector: TBytes = nil; AAccessToken: UTF8String = ''): TKSeF2ExportInvoicesResponse; overload;
    function InvoicesExportSimple(ARequest: TKSeF2InvoiceExportRequest; AAccessToken: UTF8String = ''): UTF8String; overload;
    function InvoicesExportSimple(ARequest: TKSeF2InvoiceQueryFilters; AEncryptionSymetricKey: TBytes = nil; AInitializationVector: TBytes = nil; AAccessToken: UTF8String = ''): UTF8String; overload;
    function InvoicesExportStatus(AOperationReferenceNumber: UTF8String; AAccessToken: UTF8String = ''): TKSeF2InvoiceExportStatusResponse;
    procedure InvoicesExportDownload(AStatusResponse: TKSeF2InvoiceExportStatusResponse; AOutputStream: TStream; AEncryptionSymetricKey: TBytes = nil; AInitializationVector: TBytes = nil);

    function TokensGenerate(ARequest: TKSeF2GenerateTokenRequest; AAccessToken: UTF8String = ''): TKSeF2GenerateTokenResponse; overload;
    function TokensGenerate(APermissions: TKSeF2TokenPermissions; ADescription: UTF8String; AAccessToken: UTF8String = ''): TKSeF2GenerateTokenResponse; overload;
    function TokensList(AStatus: TKSeF2AuthenticationTokenStatuses = []; ADescription: UTF8String = '';
      AAuthorIdentifier: UTF8String = ''; AAuthorIdentifierType: TKSeF2TokenAuthorIdentifierType = taiNone;
      APageSize: Integer = 0; AContinuationToken: UTF8String = ''; AAccessToken: UTF8String = ''): TKSeF2QueryTokensResponse;
    function TokensStatus(AReferenceNumber: UTF8String; AAccessToken: UTF8String = ''): TKSeF2TokenStatusResponse;
    procedure TokensRevoke(AReferenceNumber: UTF8String; AAccessToken: UTF8String = '');

    procedure TestdataSubject(ARequest: TKSeF2SubjectCreateRequest);
    procedure TestdataSubjectRemove(const ASubjectNip: UTF8String);
    procedure TestdataPerson(ARequest: TKSeF2PersonCreateRequest);
    procedure TestdataPersonRemove(const ANip: UTF8String);

    { Klasa sterownika szyfrowania RSA }
    property RSAPublicKeyClass: UTF8String read GetRSAPublicKeyClass write SetRSAPublicKeyClass;
    { Klasa enkodera Base64 }
    property Base64EncoderClass: UTF8String read GetBase64EncoderClass write SetBase64EncoderClass;
    { Klasa sterownika szyfrowania AES256 }
    property AES256EncryptClass: UTF8String read GetAES256EncryptClass write SetAES256EncryptClass;
    { Klasa funkcji skrótu SHA256 }
    property SHA256HashClass: UTF8String read GetSHA256HashClass write SetSHA256HashClass;
    { Klasa generatora liczb pseudolosowych }
    property RandomGeneratorClass: UTF8String read GetRandomGeneratorClass write SetRandomGeneratorClass;

    { Obiekt XAdES dla podpisu certyfikatem kwalifikowanym struktury InitUpload }
    property XAdES: TlgoXAdES read FXAdES write SetXAdES;
    { Obiekt połączenia HTTPS }
    property HTTPClient: TlgoHTTPClient read FHTTPClient write SetHTTPClient;

    { Rodzaj bramki (produkcyjna/demo/testowa) }
    property GateType: TlgoKSeFGateType read GetGateType write SetGateType;

    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
    property IdentifierType: TlgoKSeFIdentifierType read GetIdentifierType write SetIdentifierType;

    property AuthCertificate: TlgoCertificate read FAuthCertificate write SetAuthCertificate;
    property AuthCertificateSubject: TlgoKSeFCertificateAuthType read GetAuthCertificateSubject write SetAuthCertificateSubject;

    property KsefToken: UTF8String read GetKsefToken write SetKsefToken;

    property RSATokenEncKey[AGateType: TlgoKSeFGateType]: TlgoRSAPublicKey read GetRSATokenEncKey write SetRSATokenEncKey;
    property RSASymmetricKeyEncKey[AGateType: TlgoKSeFGateType]: TlgoRSAPublicKey read GetRSASymmetricKeyEncKey write SetRSASymmetricKeyEncKey;

    { Predefiniowany rodzaj i wersji przesyłanego dokumentu. }
    property FormCode: TlgoKSeFFormCode read GetFormCode write SetFormCode;
    property FormCodeSystemCode: UTF8String read GetFormCodeSystemCode write SetFormCodeSystemCode;
    property FormCodeSchemaVersion: UTF8String read GetFormCodeSchemaVersion write SetFormCodeSchemaVersion;
    property FormCodeValue: UTF8String read GetFormCodeValue write SetFormCodeValue;

    property AuthenticationToken: UTF8String read GetAuthenticationToken write SetAuthenticationToken;
    property AuthenticationTokenValidUntil: TDateTime read GetAuthenticationTokenValidUntil write SetAuthenticationTokenValidUntil;
    property AuthenticationRefNo: UTF8String read GetAuthenticationRefNo write SetAuthenticationRefNo;

    property AccessToken: UTF8String read GetAccessToken write SetAccessToken;
    property AccessTokenValidUntil: TDateTime read GetAccessTokenValidUntil write SetAccessTokenValidUntil;

    property RefreshToken: UTF8String read GetRefreshToken write SetRefreshToken;
    property RefreshTokenValidUntil: TDateTime read GetRefreshTokenValidUntil write SetRefreshTokenValidUntil;

    property InteractiveEncryptionKey: TBytes read GetInteractiveEncryptionKey write SetInteractiveEncryptionKey;
    property InteractiveVector: TBytes read GetInteractiveVector write SetInteractiveVector;
    property InteractiveReferenceNumber: UTF8String read GetInteractiveReferenceNumber write SetInteractiveReferenceNumber;
    property InteractiveValidUntil: TDateTime read GetInteractiveValidUntil write SetInteractiveValidUntil;

    property BatchReferenceNumber: UTF8String read GetBatchReferenceNumber write SetBatchReferenceNumber;
    property BatchPartSize: Integer read GetBatchPartSize write SetBatchPartSize;

    property InvoiceExportEncryptionKey: TBytes read GetInvoiceExportEncryptionKey write SetInvoiceExportEncryptionKey;
    property InvoiceExportVector: TBytes read GetInvoiceExportVector write SetInvoiceExportVector;
    property InvoiceExportReferenceNumber: UTF8String read GetInvoiceExportReferenceNumber write SetInvoiceExportReferenceNumber;

    property OnRequestPartStream: TKSeF2RequestPartStreamEvent read FOnRequestPartStream write SetOnRequestPartStream;
  end;


implementation

procedure lgoRequestPartStreamHandler(ASender: LGP_OBJECT; ACargo: LGP_POINTER;
  APartNumber: LGP_INT32; var AStream: LGP_OBJECT); stdcall;
var
  OwnedStream: TStream;
begin
  OwnedStream := nil;
  AStream := nil;
  if (ACargo <> nil) and (TObject(ACargo) is TlgoKSeF2) then
  begin
    try
      with TlgoKSeF2(ACargo) do
      begin
        if Assigned(FPartStream) then
          FreeAndNil(FPartStream);
        if Assigned(FOnRequestPartStream) then
          FOnRequestPartStream(TlgoKSeF2(ACargo), APartNumber, OwnedStream);
        if OwnedStream <> nil then
          FPartStream := TlgoStream.Create(OwnedStream);
        AStream := FPartStream.StreamObj;
      end;
    except

    end;
  end;
end;

{ TlgoKSeF2 }

function TlgoKSeF2.GetAccessToken: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetAccessToken(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetAccessTokenValidUntil: TDateTime;
begin
  Result := 0;
  lgoCheckResult(lgpKSeF2_GetAccessTokenValidUntil(ExtObject, Double(Result)));
end;

function TlgoKSeF2.GetAES256EncryptClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetAES256EncryptClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoKSeF2.GetAuthCertificateSubject: TlgoKSeFCertificateAuthType;
var
  P: LGP_INT32;
begin
  P := 0;
  lgoCheckResult(lgpKSeF2_GetAuthCertificateSubject(ExtObject, P));
  Result := TlgoKSeFCertificateAuthType(P);
end;

function TlgoKSeF2.GetAuthenticationRefNo: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetAuthenticationRefNo(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetAuthenticationToken: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetAuthenticationToken(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetAuthenticationTokenValidUntil: TDateTime;
begin
  Result := 0;
  lgoCheckResult(lgpKSeF2_GetAccessTokenValidUntil(ExtObject, Double(Result)));
end;

function TlgoKSeF2.GetBase64EncoderClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetBase64EncoderClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoKSeF2.GetBatchPartSize: Integer;
begin
  Result := 0;
  lgoCheckResult(lgpKSeF2_GetBatchPartSize(ExtObject, Result));
end;

function TlgoKSeF2.GetBatchReferenceNumber: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetBatchReferenceNumber(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetFormCode: TlgoKSeFFormCode;
var
  P: LGP_INT32;
begin
  P := 0;
  lgoCheckResult(lgpKSeF2_GetFormCode(ExtObject, P));
  Result := TlgoKSeFFormCode(P);
end;

function TlgoKSeF2.GetFormCodeSchemaVersion: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetFormCodeSchemaVersion(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetFormCodeSystemCode: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetFormCodeSystemCode(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetFormCodeValue: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetFormCodeValue(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetGateType: TlgoKSeFGateType;
var
  P: LGP_INT32;
begin
  P := 0;
  lgoCheckResult(lgpKSeF2_GetGateType(ExtObject, P));
  Result := TlgoKSeFGateType(P);
end;

function TlgoKSeF2.GetIdentifier: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetIdentifier(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetIdentifierType: TlgoKSeFIdentifierType;
var
  P: LGP_INT32;
begin
  P := 0;
  lgoCheckResult(lgpKSeF2_GetIdentifierType(ExtObject, P));
  Result := TlgoKSeFIdentifierType(P);
end;

function TlgoKSeF2.GetInteractiveEncryptionKey: TBytes;
var
  B: LGP_PBYTE;
begin
  B := nil;
  SetLength(Result, 0);
  lgoCheckResult(lgpKSeF2_GetInteractiveEncryptionKey(ExtObject, B));
  if B <> nil then
  begin
    SetLength(Result, AES256_KEY_SIZE);
    Move(B^, Result[0], AES256_KEY_SIZE);
  end;
end;

function TlgoKSeF2.GetInteractiveReferenceNumber: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetInteractiveReferenceNumber(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetInteractiveValidUntil: TDateTime;
begin
  Result := 0;
  lgoCheckResult(lgpKSeF2_GetInteractiveValidUntil(ExtObject, Double(Result)));
end;

function TlgoKSeF2.GetInteractiveVector: TBytes;
var
  B: LGP_PBYTE;
begin
  B := nil;
  SetLength(Result, 0);
  lgoCheckResult(lgpKSeF2_GetInteractiveVector(ExtObject, B));
  if B <> nil then
  begin
    SetLength(Result, AES256_IV_SIZE);
    Move(B^, Result[0], AES256_IV_SIZE);
  end;
end;

function TlgoKSeF2.GetInvoiceExportEncryptionKey: TBytes;
var
  B: LGP_PBYTE;
begin
  B := nil;
  SetLength(Result, 0);
  lgoCheckResult(lgpKSeF2_GetInvoiceExportEncryptionKey(ExtObject, B));
  if B <> nil then
  begin
    SetLength(Result, AES256_KEY_SIZE);
    Move(B^, Result[0], AES256_KEY_SIZE);
  end;
end;

function TlgoKSeF2.GetInvoiceExportReferenceNumber: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetInvoiceExportReferenceNumber(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetInvoiceExportVector: TBytes;
var
  B: LGP_PBYTE;
begin
  B := nil;
  SetLength(Result, 0);
  lgoCheckResult(lgpKSeF2_GetInvoiceExportVector(ExtObject, B));
  if B <> nil then
  begin
    SetLength(Result, AES256_IV_SIZE);
    Move(B^, Result[0], AES256_IV_SIZE);
  end;
end;

function TlgoKSeF2.GetKsefToken: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetKsefToken(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetRandomGeneratorClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetRandomGeneratorClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoKSeF2.GetRefreshToken: UTF8String;
var
  P: LGP_OBJECT;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetRefreshToken(ExtObject, P));
  Result := lgoGetString(P);
end;

function TlgoKSeF2.GetRefreshTokenValidUntil: TDateTime;
begin
  Result := 0;
  lgoCheckResult(lgpKSeF2_GetRefreshTokenValidUntil(ExtObject, Double(Result)));
end;

function TlgoKSeF2.GetRSAPublicKeyClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetRSAPubliicKeyClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoKSeF2.GetRSASymmetricKeyEncKey(AGateType: TlgoKSeFGateType
  ): TlgoRSAPublicKey;
begin
  Result := FRSASymmetricKeyEncKey[AGateType];
end;

function TlgoKSeF2.GetRSATokenEncKey(AGateType: TlgoKSeFGateType
  ): TlgoRSAPublicKey;
begin
  Result := FRSATokenEncKey[AGateType];
end;

function TlgoKSeF2.GetSHA256HashClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  P := nil;
  lgoCheckResult(lgpKSeF2_GetSHA256HashClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

procedure TlgoKSeF2.SetAccessToken(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetAccessToken(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetAccessTokenValidUntil(AValue: TDateTime);
begin
  lgoCheckResult(lgpKSeF2_SetAccessTokenValidUntil(ExtObject, AValue));
end;

procedure TlgoKSeF2.SetAES256EncryptClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetAES256EncryptClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetAuthCertificate(AValue: TlgoCertificate);
var
  O: LGP_OBJECT;
begin
  if FAuthCertificate = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.Item;
  lgoCheckResult(lgpKSeF2_SetAuthCertificate(ExtObject, O));
  FAuthCertificate := AValue;
end;

procedure TlgoKSeF2.SetAuthCertificateSubject(AValue: TlgoKSeFCertificateAuthType);
begin
  lgoCheckResult(lgpKSeF2_SetAuthCertificateSubject(ExtObject, Ord(AValue)));
end;

procedure TlgoKSeF2.SetAuthenticationRefNo(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetAuthenticationRefNo(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetAuthenticationToken(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetAuthenticationToken(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetAuthenticationTokenValidUntil(AValue: TDateTime);
begin
  lgoCheckResult(lgpKSeF2_SetAuthenticationTokenValidUntil(ExtObject, AValue));
end;

procedure TlgoKSeF2.SetBase64EncoderClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetBase64EncoderClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetBatchPartSize(AValue: Integer);
begin
  lgoCheckResult(lgpKSeF2_SetBatchPartSize(ExtObject, AValue));
end;

procedure TlgoKSeF2.SetBatchReferenceNumber(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetBatchReferenceNumber(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetFormCode(AValue: TlgoKSeFFormCode);
begin
  lgoCheckResult(lgpKSeF2_SetFormCode(ExtObject, Ord(AValue)));
end;

procedure TlgoKSeF2.SetFormCodeSchemaVersion(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetFormCodeSchemaVersion(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetFormCodeSystemCode(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetFormCodeSystemCode(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetFormCodeValue(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetFormCodeValue(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetGateType(AValue: TlgoKSeFGateType);
begin
  lgoCheckResult(lgpKSeF2_SetGateType(ExtObject, Ord(AValue)));
end;

procedure TlgoKSeF2.SetHTTPClient(AValue: TlgoHTTPClient);
var
  O: LGP_OBJECT;
begin
  if FHTTPClient = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  lgoCheckResult(lgpKSeF2_SetHTTPClient(ExtObject, O));
  FHTTPClient := AValue;
end;

procedure TlgoKSeF2.SetIdentifier(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetIdentifier(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetIdentifierType(AValue: TlgoKSeFIdentifierType);
begin
  lgoCheckResult(lgpKSeF2_SetIdentifierType(ExtObject, Ord(AValue)));
end;

procedure TlgoKSeF2.SetInteractiveEncryptionKey(AValue: TBytes);
var
  P: LGP_PBYTE;
begin
  if Length(AValue) <> AES256_KEY_SIZE then
    P := nil
  else
    P := @AValue[0];
  lgoCheckResult(lgpKSeF2_SetInteractiveEncryptionKey(ExtObject, P));
end;

procedure TlgoKSeF2.SetInteractiveReferenceNumber(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetInteractiveReferenceNumber(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetInteractiveValidUntil(AValue: TDateTime);
begin
  lgoCheckResult(lgpKSeF2_SetInteractiveValidUntil(ExtObject, AValue));
end;

procedure TlgoKSeF2.SetInteractiveVector(AValue: TBytes);
var
  P: LGP_PBYTE;
begin
  if Length(AValue) <> AES256_IV_SIZE then
    P := nil
  else
    P := @AValue[0];
  lgoCheckResult(lgpKSeF2_SetInteractiveVector(ExtObject, P));
end;

procedure TlgoKSeF2.SetInvoiceExportEncryptionKey(AValue: TBytes);
var
  P: LGP_PBYTE;
begin
  if Length(AValue) <> AES256_KEY_SIZE then
    P := nil
  else
    P := @AValue[0];
  lgoCheckResult(lgpKSeF2_SetInvoiceExportEncryptionKey(ExtObject, P));
end;

procedure TlgoKSeF2.SetInvoiceExportReferenceNumber(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetInvoiceExportReferenceNumber(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetInvoiceExportVector(AValue: TBytes);
var
  P: LGP_PBYTE;
begin
  if Length(AValue) <> AES256_IV_SIZE then
    P := nil
  else
    P := @AValue[0];
  lgoCheckResult(lgpKSeF2_SetInvoiceExportVector(ExtObject, P));
end;

procedure TlgoKSeF2.SetKsefToken(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetKsefToken(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetOnRequestPartStream(AValue: TKSeF2RequestPartStreamEvent);
begin
  FOnRequestPartStream := AValue;
end;

procedure TlgoKSeF2.SetRandomGeneratorClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetRandomGeneratorClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetRefreshToken(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetRefreshToken(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetRefreshTokenValidUntil(AValue: TDateTime);
begin
  lgoCheckResult(lgpKSeF2_SetRefreshTokenValidUntil(ExtObject, AValue));
end;

procedure TlgoKSeF2.SetRSAPublicKeyClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetRSAPubliicKeyClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetRSASymmetricKeyEncKey(AGateType: TlgoKSeFGateType;
  AValue: TlgoRSAPublicKey);
var
  O: LGP_OBJECT;
begin
  if FRSASymmetricKeyEncKey[AGateType] = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  lgoCheckResult(lgpKSeF2_SetRSASymmetricKeyEncKey(ExtObject, Integer(AGateType), O));
  FRSASymmetricKeyEncKey[AGateType] := AValue;
end;

procedure TlgoKSeF2.SetRSATokenEncKey(AGateType: TlgoKSeFGateType;
  AValue: TlgoRSAPublicKey);
var
  O: LGP_OBJECT;
begin
  if FRSATokenEncKey[AGateType] = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  lgoCheckResult(lgpKSeF2_SetRSATokenEncKey(ExtObject, Integer(AGateType), O));
  FRSATokenEncKey[AGateType] := AValue;
end;

procedure TlgoKSeF2.SetSHA256HashClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_SetSHA256HashClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoKSeF2.SetXAdES(AValue: TlgoXAdES);
var
  O: LGP_OBJECT;
begin
  if FXAdES = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  lgoCheckResult(lgpKSeF2_SetXAdES(ExtObject, O));
  FXAdES := AValue;
end;

constructor TlgoKSeF2.Create;
begin
  lgoCheckResult(lgpKSeF2_Create(ExtObject));
  lgoCheckResult(lgpKSeF2_SetOnRequestPartStream(ExtObject, @lgoRequestPartStreamHandler));
  lgoCheckResult(lgpKSeF2_SetRequestPartStreamCargo(ExtObject, Self));
end;

function TlgoKSeF2.AuthChallenge: TKSeF2AuthenticationChallengeResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthChallenge(ExtObject, O));
  if O <> nil then
    Result := TKSeF2AuthenticationChallengeResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.AuthXadesSignatureGenerate: UTF8String;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthXadesSignatureGenerate(ExtObject, O));
  if O <> nil then
    Result := lgoGetString(O);
end;

function TlgoKSeF2.AuthXadesSignatureGenerate(
  ASubjectIdType: TlgoKSeFCertificateAuthType; AIdentifier: UTF8String;
  AIdentifierType: TlgoKSeFIdentifierType): UTF8String;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthXadesSignatureGenerate2(ExtObject, Ord(ASubjectIdType),
    LGP_PCHAR(AIdentifier), Ord(AIdentifierType), O));
  if O <> nil then
    Result := lgoGetString(O);
end;

function TlgoKSeF2.AuthXadesSignature: TKSeF2AuthenticationInitResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthXadesSignature(ExtObject, O));
  if O <> nil then
    Result := TKSeF2AuthenticationInitResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.AuthXadesSignature(ACertificate: TlgoCertificate;
  ASubjectIdType: TlgoKSeFCertificateAuthType; AIdentifier: UTF8String;
  AIdentifierType: TlgoKSeFIdentifierType): TKSeF2AuthenticationInitResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthXadesSignature2(ExtObject, ACertificate.Item,
    Ord(ASubjectIdType), LGP_PCHAR(AIdentifier), Ord(AIdentifierType), O));
  if O <> nil then
    Result := TKSeF2AuthenticationInitResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.AuthXadesSignature(ASignedAuthData: UTF8String
  ): TKSeF2AuthenticationInitResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthXadesSignature3(ExtObject, LGP_PCHAR(ASignedAuthData), O));
  if O <> nil then
    Result := TKSeF2AuthenticationInitResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.AuthKsefToken: TKSeF2AuthenticationInitResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthKsefToken(ExtObject, O));
  if O <> nil then
    Result := TKSeF2AuthenticationInitResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.AuthKsefToken(AToken: UTF8String; AIdentifier: UTF8String;
  AIdentifierType: TlgoKSeFIdentifierType): TKSeF2AuthenticationInitResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthKsefToken2(ExtObject, LGP_PCHAR(AToken), LGP_PCHAR(AIdentifier),
    Ord(AIdentifierType), O));
  if O <> nil then
    Result := TKSeF2AuthenticationInitResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.AuthStatus(AReferenceNumber: UTF8String;
  AAuthenticationToken: UTF8String
  ): TKSeF2AuthenticationOperationStatusResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthStatus(ExtObject, LGP_PCHAR(AReferenceNumber),
    LGP_PCHAR(AAuthenticationToken), O));
  if O <> nil then
    Result := TKSeF2AuthenticationOperationStatusResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.AuthTokenRedem(AAuthenticationToken: UTF8String
  ): TKSeF2AuthenticationTokensResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthTokenRedem(ExtObject, LGP_PCHAR(AAuthenticationToken), O));
  if O <> nil then
    Result := TKSeF2AuthenticationTokensResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.AuthTokenRefresh(ARefreshToken: UTF8String
  ): TKSeF2AuthenticationTokenRefreshResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthTokenRefresh(ExtObject, LGP_PCHAR(ARefreshToken), O));
  if O <> nil then
    Result := TKSeF2AuthenticationTokenRefreshResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.AuthSessions(AContinuationToken: UTF8String;
  APageSize: Integer; AAccessToken: UTF8String
  ): TKSeF2AuthenticationListResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_AuthSessions(ExtObject, LGP_PCHAR(AContinuationToken), APageSize,
    LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2AuthenticationListResponse.Create(nil, O)
  else
    Result := nil;
end;

procedure TlgoKSeF2.AuthSessionTerminateCurrent(AToken: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_AuthSessionTerminateCurrent(ExtObject, LGP_PCHAR(AToken)));
end;

procedure TlgoKSeF2.AuthSessionTerminate(AReferenceNumber: UTF8String;
  AAccessToken: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_AuthSessionTerminate(ExtObject, LGP_PCHAR(AReferenceNumber),
    LGP_PCHAR(AAccessToken)));
end;

function TlgoKSeF2.SecurityPublicKeyCertificates(AGate: TlgoKSeFGateType
  ): TKSeF2PublicKeyCertificateResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_SecurityPublicKeyCertificates(ExtObject, Ord(AGate), O));
  if O <> nil then
    Result := TKSeF2PublicKeyCertificateResponse.Create(nil, O)
  else
    Result := nil;
end;

procedure TlgoKSeF2.SecurityLoadKeys;
begin
  lgoCheckResult(lgpKSeF2_SecurityLoadKeys(ExtObject));
end;

function TlgoKSeF2.InteractiveOpen(AFormCode: TlgoKSeFFormCode;
  AEncryptionSymetricKey: TBytes; AInitializationVector: TBytes;
  AFormCodeSystemCode: UTF8String; AFormCodeSchemaVersion: UTF8String;
  AFormCodeValue: UTF8String; AAccessToken: UTF8String
  ): TKSeF2OpenOnlineSessionResponse;
var
  Key, IV: PByte;
  O: LGP_OBJECT;
begin
  O := nil;
  if Length(AEncryptionSymetricKey) = AES256_KEY_SIZE then
    Key := @AEncryptionSymetricKey[0]
  else
    Key := nil;
  if Length(AInitializationVector) = AES256_IV_SIZE then
    IV := @AInitializationVector[0]
  else
    IV := nil;
  lgoCheckResult(lgpKSeF2_InteractiveOpen(ExtObject, Ord(AFormCode), Key, IV,
    LGP_PCHAR(AFormCodeSystemCode), LGP_PCHAR(AFormCodeSchemaVersion),
    LGP_PCHAR(AFormCodeValue), LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2OpenOnlineSessionResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.InteractiveOpen(ARequest: TKSeF2OpenOnlineSessionRequest;
  AAccessToken: UTF8String): TKSeF2OpenOnlineSessionResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_InteractiveOpen2(ExtObject, ARequest.ExtObject, LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2OpenOnlineSessionResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.InteractiveOpen: TKSeF2OpenOnlineSessionResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_InteractiveOpen3(ExtObject, O));
  if O <> nil then
    Result := TKSeF2OpenOnlineSessionResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.InteractiveOpenSimple: UTF8String;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_InteractiveOpenSimple(ExtObject, O));
  Result := lgoGetString(O);
end;

function TlgoKSeF2.InteractiveSend(AInvoiceStream: TStream;
  AOfflineMode: Boolean; AHashOfCorrectedInvoice: UTF8String;
  ASessionReferenceNumber: UTF8String; AEncryptionSymetricKey: TBytes;
  AInitializationVector: TBytes; AAccessToken: UTF8String): UTF8String;
var
  LGStream: TlgoStream;
  Resp: LGP_OBJECT;
  Key, IV: PByte;
begin
  Resp := nil;
  LGStream := TlgoStream.Create(AInvoiceStream);
  if Length(AEncryptionSymetricKey) = AES256_KEY_SIZE then
    Key := @AEncryptionSymetricKey[0]
  else
    Key := nil;
  if Length(AInitializationVector) = AES256_IV_SIZE then
    IV := @AInitializationVector[0]
  else
    IV := nil;
  try
    lgoCheckResult(lgpKSeF2_InteractiveSend(ExtObject, LGStream.StreamObj,
      Ord(AOfflineMode), LGP_PCHAR(AHashOfCorrectedInvoice),
      LGP_PCHAR(ASessionReferenceNumber), Key, IV, LGP_PCHAR(AAccessToken), Resp));
    Result := lgoGetString(Resp);
  finally
    LGStream.Free;
  end;
end;

function TlgoKSeF2.InteractiveSend(ARequest: TKSeF2SendInvoiceRequest;
  ASessionReferenceNumber: UTF8String; AAccessToken: UTF8String
  ): TKSeF2SendInvoiceResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_InteractiveSend2(ExtObject, ARequest.ExtObject,
    LGP_PCHAR(ASessionReferenceNumber), LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2SendInvoiceResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.InteractiveSend(AInvoiceStream: TStream;
  AOfflineMode: Boolean; AHashOfCorrectedInvoice: UTF8String): UTF8String;
var
  LGStream: TlgoStream;
  Resp: LGP_OBJECT;
begin
  Resp := nil;
  LGStream := TlgoStream.Create(AInvoiceStream);
  try
    lgoCheckResult(lgpKSeF2_InteractiveSend3(ExtObject, LGStream.StreamObj,
      Ord(AOfflineMode), LGP_PCHAR(AHashOfCorrectedInvoice), Resp));
    Result := lgoGetString(Resp);
  finally
    LGStream.Free;
  end;
end;

procedure TlgoKSeF2.InteractiveClose(ASessionReferenceNumber: UTF8String;
  AAccessToken: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_InteractiveClose(ExtObject,
    LGP_PCHAR(ASessionReferenceNumber), LGP_PCHAR(AAccessToken)));
end;

function TlgoKSeF2.BatchPrepare(AZIPFileStream: TStream;
  AOutputStream: TStream; AFormCode: TlgoKSeFFormCode;
  AEncryptionSymetricKey: TBytes; AInitializationVector: TBytes;
  AFormCodeSystemCode: UTF8String; AFormCodeSchemaVersion: UTF8String;
  AFormCodeValue: UTF8String; APartSize: Integer): TKSeF2OpenBatchSessionRequest;
var
  LGZipStream, LGOutputStream: TlgoStream;
  EOOutStream: LGP_OBJECT;
  Key, IV: PByte;
  O: LGP_OBJECT;
begin
  O := nil;
  LGZipStream := nil;
  LGOutputStream := nil;
  EOOutStream := nil;
  if Assigned(FPartStream) then
    FreeAndNil(FPartStream);
  try
    if Length(AEncryptionSymetricKey) = AES256_KEY_SIZE then
      Key := @AEncryptionSymetricKey[0]
    else
      Key := nil;
    if Length(AInitializationVector) = AES256_IV_SIZE then
      IV := @AInitializationVector[0]
    else
      IV := nil;
    LGZipStream := TlgoStream.Create(AZIPFileStream);
    if Assigned(AOutputStream) then
    begin
      LGOutputStream := TlgoStream.Create(AOutputStream);
      EOOutStream := LGOutputStream.StreamObj;
    end;
    lgoCheckResult(lgpKSeF2_BatchPrepare(ExtObject, LGZipStream.StreamObj,
      EOOutStream, Ord(AFormCode), Key, IV, LGP_PCHAR(AFormCodeSystemCode),
      LGP_PCHAR(AFormCodeSchemaVersion), LGP_PCHAR(AFormCodeValue), APartSize, O));
    if O <> nil then
      Result := TKSeF2OpenBatchSessionRequest.Create(nil, O)
    else
      Result := nil;
  finally
    if Assigned(FPartStream) then
      FreeAndNil(FPartStream);
    if Assigned(LGOutputStream) then
      LGOutputStream.Free;
    if Assigned(LGZipStream) then
      LGZipStream.Free;
  end;
end;

function TlgoKSeF2.BatchPrepare(AZIPFileStream: TStream;
  AOutputStream: TStream; APartSize: Integer): TKSeF2OpenBatchSessionRequest;
var
  LGZipStream, LGOutputStream: TlgoStream;
  EOOutStream: LGP_OBJECT;
  O: LGP_OBJECT;
begin
  O := nil;
  LGZipStream := nil;
  LGOutputStream := nil;
  EOOutStream := nil;
  if Assigned(FPartStream) then
    FreeAndNil(FPartStream);
  try
    LGZipStream := TlgoStream.Create(AZIPFileStream);
    if Assigned(AOutputStream) then
    begin
      LGOutputStream := TlgoStream.Create(AOutputStream);
      EOOutStream := LGOutputStream.StreamObj;
    end;
    lgoCheckResult(lgpKSeF2_BatchPrepare2(ExtObject, LGZipStream.StreamObj,
      EOOutStream, APartSize, O));
    if O <> nil then
      Result := TKSeF2OpenBatchSessionRequest.Create(nil, O)
    else
      Result := nil;
  finally
    if Assigned(FPartStream) then
      FreeAndNil(FPartStream);
    if Assigned(LGOutputStream) then
      LGOutputStream.Free;
    if Assigned(LGZipStream) then
      LGZipStream.Free;
  end;
end;

function TlgoKSeF2.BatchOpen(ARequest: TKSeF2OpenBatchSessionRequest;
  AAccessToken: UTF8String): TKSeF2OpenBatchSessionResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_BatchOpen(ExtObject, ARequest.ExtObject,
    LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2OpenBatchSessionResponse.Create(nil, O)
  else
    Result := nil;
end;

procedure TlgoKSeF2.BatchSendPart(APartUploadRequest: TKSeF2PartUploadRequest;
  ADataStream: TStream);
var
  LGDataStream: TlgoStream;
begin
  LGDataStream := nil;
  try
    LGDataStream := TlgoStream.Create(ADataStream);
    lgoCheckResult(lgpKSeF2_BatchSendPart(ExtObject, APartUploadRequest.ExtObject,
      LGDataStream.StreamObj));
  finally
    if Assigned(LGDataStream) then
      LGDataStream.Free;
  end;
end;

procedure TlgoKSeF2.BatchClose(ASessionReferenceNumber: UTF8String;
  AAccessToken: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_BatchClose(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
    LGP_PCHAR(AAccessToken)));
end;

function TlgoKSeF2.StatusSessions(ASessionType: TKSeF2SessionType;
  AContinuationToken: UTF8String; APageSize: Integer;
  AReferenceNumber: UTF8String; ADateCreatedFrom: TDateTime;
  ADateCreatedTo: TDateTime; ADateClosedFrom: TDateTime;
  ADateClosedTo: TDateTime; ADateModifiedFrom: TDateTime;
  ADateModifiedTo: TDateTime; AStatuses: TKSeF2CommonSessionStatuses;
  AAccessToken: UTF8String): TKSeF2SessionsQueryResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_StatusSessions(ExtObject, Ord(ASessionType),
    LGP_PCHAR(AContinuationToken), APageSize, LGP_PCHAR(AReferenceNumber),
    ADateCreatedFrom, ADateCreatedTo, ADateClosedFrom, ADateClosedTo,
    ADateModifiedFrom, ADateModifiedTo, SetToInt32(@AStatuses,
    Ord(High(TKSeF2CommonSessionStatus)), SizeOf(AStatuses)),
    LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2SessionsQueryResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.StatusSession(ASessionReferenceNumber: UTF8String;
  AAccessToken: UTF8String): TKSeF2SessionStatusResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_StatusSession(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
    LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2SessionStatusResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.StatusInvoices(ASessionReferenceNumber: UTF8String;
  AContinuationToken: UTF8String; APageSize: Integer; AAccessToken: UTF8String
  ): TKSeF2SessionInvoicesResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_StatusInvoices(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
    LGP_PCHAR(AContinuationToken), APageSize, LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2SessionInvoicesResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.StatusSessionInvoice(ASessionReferenceNumber: UTF8String;
  AInvoiceReferenceNumber: UTF8String; AAccessToken: UTF8String
  ): TKSeF2SessionInvoicesResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_StatusSessionInvoice(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
    LGP_PCHAR(AInvoiceReferenceNumber), LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2SessionInvoicesResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.StatusInvoicesFailed(ASessionReferenceNumber: UTF8String;
  AContinuationToken: UTF8String; APageSize: Integer; AAccessToken: UTF8String
  ): TKSeF2SessionInvoicesResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_StatusInvoicesFailed(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
    LGP_PCHAR(AContinuationToken), APageSize, LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2SessionInvoicesResponse.Create(nil, O)
  else
    Result := nil;
end;

procedure TlgoKSeF2.StatusUpoKsef(ASessionReferenceNumber: UTF8String;
  AKsefNumber: UTF8String; AOutStream: TStream; AAccessToken: UTF8String);
var
  LGOutStream: TlgoStream;
begin
  LGOutStream := nil;
  try
    LGOutStream := TlgoStream.Create(AOutStream);
    lgoCheckResult(lgpKSeF2_StatusUpoKsef(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
      LGP_PCHAR(AKsefNumber), LGOutStream.StreamObj, LGP_PCHAR(AAccessToken)));
  finally
    if Assigned(LGOutStream) then
      LGOutStream.Free;
  end;
end;

function TlgoKSeF2.StatusUpoKsefSimple(ASessionReferenceNumber: UTF8String;
  AKsefNumber: UTF8String; AAccessToken: UTF8String): UTF8String;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_StatusUpoKsefSimple(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
    LGP_PCHAR(AKsefNumber), LGP_PCHAR(AAccessToken), O));
  Result := lgoGetString(O);
end;

procedure TlgoKSeF2.StatusUpoSessionInvoice(
  ASessionReferenceNumber: UTF8String; AInvoiceReferenceNumber: UTF8String;
  AOutStream: TStream; AAccessToken: UTF8String);
var
  LGOutStream: TlgoStream;
begin
  LGOutStream := nil;
  try
    LGOutStream := TlgoStream.Create(AOutStream);
    lgoCheckResult(lgpKSeF2_StatusUpoSessionInvoice(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
      LGP_PCHAR(AInvoiceReferenceNumber), LGOutStream.StreamObj, LGP_PCHAR(AAccessToken)));
  finally
    if Assigned(LGOutStream) then
      LGOutStream.Free;
  end;
end;

function TlgoKSeF2.StatusUpoSessionInvoiceSimple(
  ASessionReferenceNumber: UTF8String; AInvoiceReferenceNumber: UTF8String;
  AAccessToken: UTF8String): UTF8String;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_StatusUpoSessionInvoiceSimple(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
    LGP_PCHAR(AInvoiceReferenceNumber), LGP_PCHAR(AAccessToken), O));
  Result := lgoGetString(O);
end;

procedure TlgoKSeF2.StatusUpoSession(ASessionReferenceNumber: UTF8String;
  AUpoReferenceNumber: UTF8String; AOutStream: TStream; AAccessToken: UTF8String);
var
  LGOutStream: TlgoStream;
begin
  LGOutStream := nil;
  try
    LGOutStream := TlgoStream.Create(AOutStream);
    lgoCheckResult(lgpKSeF2_StatusUpoSession(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
      LGP_PCHAR(AUpoReferenceNumber), LGOutStream.StreamObj, LGP_PCHAR(AAccessToken)));
  finally
    if Assigned(LGOutStream) then
      LGOutStream.Free;
  end;
end;

function TlgoKSeF2.StatusUpoSessionSimple(ASessionReferenceNumber: UTF8String;
  AUpoReferenceNumber: UTF8String; AAccessToken: UTF8String): UTF8String;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_StatusUpoSessionSimple(ExtObject, LGP_PCHAR(ASessionReferenceNumber),
    LGP_PCHAR(AUpoReferenceNumber), LGP_PCHAR(AAccessToken), O));
  Result := lgoGetString(O);
end;

procedure TlgoKSeF2.InvoicesKsef(AKsefNumber: UTF8String;
  AOutputStram: TStream; AAccessToken: UTF8String);
var
  LGOutStream: TlgoStream;
begin
  LGOutStream := nil;
  try
    LGOutStream := TlgoStream.Create(AOutputStram);
    lgoCheckResult(lgpKSeF2_InvoicesKsef(ExtObject, LGP_PCHAR(AKsefNumber),
      LGOutStream.StreamObj, LGP_PCHAR(AAccessToken)));
  finally
    if Assigned(LGOutStream) then
      LGOutStream.Free;
  end;
end;

function TlgoKSeF2.InvoicesQueryMetadata(ARequest: TKSeF2InvoiceQueryFilters;
  APageOffset: Integer; APageSize: Integer; AAccessToken: UTF8String
  ): TKSeF2QueryInvoicesMetadataResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_InvoicesQueryMetadata(ExtObject, ARequest.ExtObject,
    APageOffset, APageSize, LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2QueryInvoicesMetadataResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.InvoicesExport(ARequest: TKSeF2InvoiceExportRequest;
  AAccessToken: UTF8String): TKSeF2ExportInvoicesResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_InvoicesExport(ExtObject, ARequest.ExtObject,
    LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2ExportInvoicesResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.InvoicesExport(ARequest: TKSeF2InvoiceQueryFilters;
  AEncryptionSymetricKey: TBytes; AInitializationVector: TBytes;
  AAccessToken: UTF8String): TKSeF2ExportInvoicesResponse;
var
  O: LGP_OBJECT;
  Key, IV: PByte;
begin
  O := nil;
  if Length(AEncryptionSymetricKey) = AES256_KEY_SIZE then
    Key := @AEncryptionSymetricKey[0]
  else
    Key := nil;
  if Length(AInitializationVector) = AES256_IV_SIZE then
    IV := @AInitializationVector[0]
  else
    IV := nil;
  lgoCheckResult(lgpKSeF2_InvoicesExport2(ExtObject, ARequest.ExtObject,
    Key, IV, LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2ExportInvoicesResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.InvoicesExportSimple(ARequest: TKSeF2InvoiceExportRequest;
  AAccessToken: UTF8String): UTF8String;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_InvoicesExportSimple(ExtObject, ARequest.ExtObject,
    LGP_PCHAR(AAccessToken), O));
  Result := lgoGetString(O);
end;

function TlgoKSeF2.InvoicesExportSimple(ARequest: TKSeF2InvoiceQueryFilters;
  AEncryptionSymetricKey: TBytes; AInitializationVector: TBytes;
  AAccessToken: UTF8String): UTF8String;
var
  O: LGP_OBJECT;
  Key, IV: PByte;
begin
  O := nil;
  if Length(AEncryptionSymetricKey) = AES256_KEY_SIZE then
    Key := @AEncryptionSymetricKey[0]
  else
    Key := nil;
  if Length(AInitializationVector) = AES256_IV_SIZE then
    IV := @AInitializationVector[0]
  else
    IV := nil;
  lgoCheckResult(lgpKSeF2_InvoicesExportSimple2(ExtObject, ARequest.ExtObject,
    Key, IV, LGP_PCHAR(AAccessToken), O));
  Result := lgoGetString(O);
end;

function TlgoKSeF2.InvoicesExportStatus(AOperationReferenceNumber: UTF8String;
  AAccessToken: UTF8String): TKSeF2InvoiceExportStatusResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_InvoicesExportStatus(ExtObject, LGP_PCHAR(AOperationReferenceNumber),
    LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2InvoiceExportStatusResponse.Create(nil, O)
  else
    Result := nil;
end;

procedure TlgoKSeF2.InvoicesExportDownload(
  AStatusResponse: TKSeF2InvoiceExportStatusResponse; AOutputStream: TStream;
  AEncryptionSymetricKey: TBytes; AInitializationVector: TBytes);
var
  LGOutStream: TlgoStream;
  Key, IV: PByte;
begin
  LGOutStream := nil;
  try
    if Length(AEncryptionSymetricKey) = AES256_KEY_SIZE then
      Key := @AEncryptionSymetricKey[0]
    else
      Key := nil;
    if Length(AInitializationVector) = AES256_IV_SIZE then
      IV := @AInitializationVector[0]
    else
      IV := nil;
    LGOutStream := TlgoStream.Create(AOutputStream);
    lgoCheckResult(lgpKSeF2_InvoicesExportDownload(ExtObject,AStatusResponse.ExtObject,
      LGOutStream.StreamObj, key, IV));
  finally
    if Assigned(LGOutStream) then
      LGOutStream.Free;
  end;
end;

function TlgoKSeF2.TokensGenerate(ARequest: TKSeF2GenerateTokenRequest;
  AAccessToken: UTF8String): TKSeF2GenerateTokenResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_TokensGenerate(ExtObject, ARequest.ExtObject,
    LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2GenerateTokenResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.TokensGenerate(APermissions: TKSeF2TokenPermissions;
  ADescription: UTF8String; AAccessToken: UTF8String
  ): TKSeF2GenerateTokenResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_TokensGenerate2(ExtObject, SetToInt32(@APermissions,
    Ord(High(TKSeF2TokenPermissionType)), SizeOf(APermissions)),
    LGP_PCHAR(ADescription), LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2GenerateTokenResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.TokensList(AStatus: TKSeF2AuthenticationTokenStatuses;
  ADescription: UTF8String; AAuthorIdentifier: UTF8String;
  AAuthorIdentifierType: TKSeF2TokenAuthorIdentifierType; APageSize: Integer;
  AContinuationToken: UTF8String; AAccessToken: UTF8String
  ): TKSeF2QueryTokensResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_TokensList(ExtObject, SetToInt32(@AStatus,
    Ord(High(TKSeF2AuthenticationTokenStatus)), SizeOf(AStatus)),
    LGP_PCHAR(ADescription), LGP_PCHAR(AAuthorIdentifier),
    Ord(AAuthorIdentifierType), APageSize, LGP_PCHAR(AContinuationToken),
    LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2QueryTokensResponse.Create(nil, O)
  else
    Result := nil;
end;

function TlgoKSeF2.TokensStatus(AReferenceNumber: UTF8String;
  AAccessToken: UTF8String): TKSeF2TokenStatusResponse;
var
  O: LGP_OBJECT;
begin
  O := nil;
  lgoCheckResult(lgpKSeF2_TokensStatus(ExtObject, LGP_PCHAR(AReferenceNumber),
    LGP_PCHAR(AAccessToken), O));
  if O <> nil then
    Result := TKSeF2TokenStatusResponse.Create(nil, O)
  else
    Result := nil;
end;

procedure TlgoKSeF2.TokensRevoke(AReferenceNumber: UTF8String;
  AAccessToken: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_TokensRevoke(ExtObject, LGP_PCHAR(AReferenceNumber),
    LGP_PCHAR(AAccessToken)));
end;

procedure TlgoKSeF2.TestdataSubject(ARequest: TKSeF2SubjectCreateRequest);
begin
  lgoCheckResult(lgpKSeF2_TestdataSubject(ExtObject, ARequest.ExtObject));
end;

procedure TlgoKSeF2.TestdataSubjectRemove(const ASubjectNip: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_TestdataSubjectRemove(ExtObject, LGP_PCHAR(ASubjectNip)));
end;

procedure TlgoKSeF2.TestdataPerson(ARequest: TKSeF2PersonCreateRequest);
begin
  lgoCheckResult(lgpKSeF2_TestdataPerson(ExtObject, ARequest.ExtObject));
end;

procedure TlgoKSeF2.TestdataPersonRemove(const ANip: UTF8String);
begin
  lgoCheckResult(lgpKSeF2_TestdataPersonRemove(ExtObject, LGP_PCHAR(ANip)));
end;

end.
