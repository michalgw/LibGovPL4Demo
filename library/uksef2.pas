unit uKSeF2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uObject, uTypes, uException, uBackend, lgKSeF2, lgBackend,
  lgKSeFTypes, lgXAdES, lgKSeF2Objects;

const
  LGP_KSEF_GATETYPE_PROD = 0;
  LGP_KSEF_GATETYPE_DEMO = 1;
  LGP_KSEF_GATETYPE_TEST = 2;

  LGP_KSEF_CERTAUTHTYPE_SERIALNUMBER = 0;
  LGP_KSEF_CERTAUTHTYPE_FINGERPRINT = 1;

  LGP_KSEF_IDENTIFIER_TYPE_NONE = 0;
  LGP_KSEF_IDENTIFIER_TYPE_ALLPARTNERS = 1;
  LGP_KSEF_IDENTIFIER_TYPE_NIP = 2;
  LGP_KSEF_IDENTIFIER_TYPE_INTERNALID = 3;
  LGP_KSEF_IDENTIFIER_TYPE_NIPVATUE = 4;
  LGP_KSEF_IDENTIFIER_TYPE_PEPPOLID = 5;

  LGP_KSEF_FORM_CODE_CUSTOM = 0;
  LGP_KSEF_FORM_CODE_FA1 = 1;
  LGP_KSEF_FORM_CODE_FA2 = 2;
  LGP_KSEF_FORM_CODE_FA3 = 3;
  LGP_KSEF_FORM_CODE_FA_PEF3 = 4;
  LGP_KSEF_FORM_CODE_FA_KOR_PEF3 = 5;

type
  TLgoRequestPartStreamEvent = procedure(ASender: LGP_OBJECT; ACargo: LGP_POINTER; APartNumber: LGP_INT32; var AStream: LGP_OBJECT); stdcall;

function lgpKSeF2_Create(var AKSeFObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetBase64EncoderClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetBase64EncoderClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetAES256EncryptClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetAES256EncryptClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetSHA256HashClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetSHA256HashClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetRandomGeneratorClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetRandomGeneratorClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetRSAPubliicKeyClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetRSAPubliicKeyClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetRSATokenEncKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetRSATokenEncKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetRSASymmetricKeyEncKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetRSASymmetricKeyEncKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetXAdES(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetXAdES(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetHTTPClient(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetHTTPClient(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetGateType(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetGateType(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetIdentifier(AKSeFObject: LGP_OBJECT; var AIdentifier: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetIdentifier(AKSeFObject: LGP_OBJECT; AIdentifier: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetIdentifierType(AKSeFObject: LGP_OBJECT; var AIdentifierType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetIdentifierType(AKSeFObject: LGP_OBJECT; AIdentifierType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetFormCode(AKSeFObject: LGP_OBJECT; var AFCode: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetFormCode(AKSeFObject: LGP_OBJECT; AFCode: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetFormCodeSystemCode(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetFormCodeSystemCode(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetFormCodeValue(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetFormCodeValue(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetAuthCertificate(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetAuthCertificate(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetAuthCertificateSubject(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetAuthCertificateSubject(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetKsefToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetKsefToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetAuthenticationToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetAuthenticationToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetAuthenticationTokenValidUntil(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetAuthenticationTokenValidUntil(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetAuthenticationRefNo(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetAuthenticationRefNo(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetAccessToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetAccessToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetAccessTokenValidUntil(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetAccessTokenValidUntil(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetRefreshToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetRefreshToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetRefreshTokenValidUntil(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetRefreshTokenValidUntil(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetInteractiveEncryptionKey(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetInteractiveEncryptionKey(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetInteractiveVector(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetInteractiveVector(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetInteractiveReferenceNumber(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetInteractiveReferenceNumber(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetInteractiveValidUntil(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetInteractiveValidUntil(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetBatchReferenceNumber(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetBatchReferenceNumber(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetBatchPartSize(AKSeFObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetBatchPartSize(AKSeFObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetInvoiceExportEncryptionKey(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetInvoiceExportEncryptionKey(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetInvoiceExportVector(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetInvoiceExportVector(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetInvoiceExportReferenceNumber(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetInvoiceExportReferenceNumber(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetRequestPartStreamCargo(AKSeFObject: LGP_OBJECT; var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetRequestPartStreamCargo(AKSeFObject: LGP_OBJECT; AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetAutoRefreshToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetAutoRefreshToken(AKSeFObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF2_GetOnRequestPartStream(AKSeFObject: LGP_OBJECT; var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SetOnRequestPartStream(AKSeFObject: LGP_OBJECT; AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;

function lgpKSeF2_AuthChallenge(AKSeFObject: LGP_OBJECT; var AAuthenticationChallengeResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_AuthXadesSignatureGenerate(AKSeFObject: LGP_OBJECT; var AAuthenticationStructure: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_AuthXadesSignatureGenerate2(AKSeFObject: LGP_OBJECT; ASubjectIdType: LGP_INT32; AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32; var AAuthenticationStructure: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_AuthXadesSignature(AKSeFObject: LGP_OBJECT; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_AuthXadesSignature2(AKSeFObject: LGP_OBJECT; ACertificate: LGP_OBJECT; ASubjectIdType: LGP_INT32; AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_AuthXadesSignature3(AKSeFObject: LGP_OBJECT; ASignedAuthData: LGP_PCHAR; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_AuthKsefToken(AKSeFObject: LGP_OBJECT; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_AuthKsefToken2(AKSeFObject: LGP_OBJECT; AToken: LGP_PCHAR; AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_AuthStatus(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAuthenticationToken: LGP_PCHAR; var AAuthenticationOperationStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_AuthTokenRedem(AKSeFObject: LGP_OBJECT; AAuthenticationToken: LGP_PCHAR; var AAuthenticationTokensResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_AuthTokenRefresh(AKSeFObject: LGP_OBJECT; ARefreshToken: LGP_PCHAR; var AAuthenticationTokenRefreshResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_AuthSessions(AKSeFObject: LGP_OBJECT; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var AAuthenticationListResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_AuthSessionTerminateCurrent(AKSeFObject: LGP_OBJECT; AToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_AuthSessionTerminate(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;

function lgpKSeF2_SecurityPublicKeyCertificates(AKSeFObject: LGP_OBJECT; AGate: LGP_INT32; var APublicKeyCertificateResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_SecurityLoadKeys(AKSeFObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_InteractiveOpen(AKSeFObject: LGP_OBJECT; AFormCode: LGP_INT32; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AFormCodeSystemCode: LGP_PCHAR; AFormCodeSchemaVersion: LGP_PCHAR; AFormCodeValue: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InteractiveOpen2(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InteractiveOpen3(AKSeFObject: LGP_OBJECT; var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InteractiveOpenSimple(AKSeFObject: LGP_OBJECT; var ASessionReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_InteractiveSend(AKSeFObject: LGP_OBJECT; AInvoiceStream: LGP_OBJECT; AOfflineMode: LGP_INT32; AHashOfCorrectedInvoice: LGP_PCHAR; ASessionReferenceNumber: LGP_PCHAR; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR; var AInvoiceRefenenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InteractiveSend2(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ASendInvoiceResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InteractiveSend3(AKSeFObject: LGP_OBJECT; AInvoiceStream: LGP_OBJECT; AOfflineMode: LGP_INT32; AHashOfCorrectedInvoice: LGP_PCHAR; var AInvoiceRefenenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_InteractiveClose(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;

function lgpKSeF2_BatchPrepare(AKSeFObject: LGP_OBJECT; AZIPFileStream: LGP_OBJECT; AOutputStream: LGP_OBJECT; AFormCode: LGP_INT32; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AFormCodeSystemCode: LGP_PCHAR; AFormCodeSchemaVersion: LGP_PCHAR; AFormCodeValue: LGP_PCHAR; APartSize: LGP_INT32; var AOpenBatchSessionRequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_BatchPrepare2(AKSeFObject: LGP_OBJECT; AZIPFileStream: LGP_OBJECT; AOutputStream: LGP_OBJECT; APartSize: LGP_INT32; var AOpenBatchSessionRequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_BatchOpen(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AOpenBatchSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_BatchSendPart(AKSeFObject: LGP_OBJECT; APartUploadRequest: LGP_OBJECT; ADataStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_BatchClose(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;

function lgpKSeF2_StatusSessions(AKSeFObject: LGP_OBJECT; ASessionType: LGP_INT32; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AReferenceNumber: LGP_PCHAR; ADateCreatedFrom: LGP_DOUBLE; ADateCreatedTo: LGP_DOUBLE; ADateClosedFrom: LGP_DOUBLE; ADateClosedTo: LGP_DOUBLE; ADateModifiedFrom: LGP_DOUBLE; ADateModifiedTo: LGP_DOUBLE; AStatuses: LGP_UINT32; AAccessToken: LGP_PCHAR; var ASessionsQueryResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusSession(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ASessionStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusInvoices(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusSessionInvoice(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusInvoicesFailed(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusUpoKsef(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AKsefNumber: LGP_PCHAR; AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusUpoKsefSimple(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AKsefNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusUpoSessionInvoice(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusUpoSessionInvoiceSimple(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusUpoSession(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AUpoReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_StatusUpoSessionSimple(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AUpoReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF2_InvoicesKsef(AKSeFObject: LGP_OBJECT; AKsefNumber: LGP_PCHAR; AOutputStram: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InvoicesQueryMetadata(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; APageOffset: LGP_INT32; APageSize: LGP_INT32; ASortOrder: LGP_INT32; AAccessToken: LGP_PCHAR; var AQueryInvoicesMetadataResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InvoicesExport(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AExportInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InvoicesExport2(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR; var AExportInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InvoicesExportSimple(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var ASessionReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InvoicesExportSimple2(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR; var AReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InvoicesExportStatus(AKSeFObject: LGP_OBJECT; AOperationReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AInvoiceExportStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_InvoicesExportDownload(AKSeFObject: LGP_OBJECT; AStatusResponse: LGP_OBJECT; AOutputStream: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE): LGP_EXCEPTION; stdcall;

function lgpKSeF2_TokensGenerate(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AGenerateTokenResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_TokensGenerate2(AKSeFObject: LGP_OBJECT; APermissions: LGP_INT32; ADescription: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AGenerateTokenResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_TokensList(AKSeFObject: LGP_OBJECT; AStatus: LGP_INT32; ADescription: LGP_PCHAR; AAuthorIdentifier: LGP_PCHAR; AAuthorIdentifierType: LGP_INT32; APageSize: LGP_INT32; AContinuationToken: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AQueryTokensResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_TokensStatus(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ATokenStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_TokensRevoke(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;

function lgpKSeF2_TestdataSubject(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_TestdataSubjectRemove(AKSeFObject: LGP_OBJECT; ASubjectNip: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF2_TestdataPerson(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF2_TestdataPersonRemove(AKSeFObject: LGP_OBJECT; ANip: LGP_PCHAR): LGP_EXCEPTION; stdcall;

implementation

uses
  lgUtils;

type

  { TlgKSeF2Lib }

  TlgKSeF2Lib = class(TlgKSeF2)
  public
    ExtRequestPartStreamHandler: TLgoRequestPartStreamEvent;
    Cargo: Pointer;
    constructor Create(AOwner: TComponent); override;
    procedure RequestPartStreamHandler(Sender: TObject; APartNumber: Integer; var AStream: TStream);
  end;

  { TlgKSeF2Lib }

constructor TlgKSeF2Lib.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OnRequestPartStream := @RequestPartStreamHandler;
end;

procedure TlgKSeF2Lib.RequestPartStreamHandler(Sender: TObject;
  APartNumber: Integer; var AStream: TStream);
var
  O: LGP_OBJECT;
begin
  AStream := nil;
  if ExtRequestPartStreamHandler <> nil then
  begin
    O := nil;
    ExtRequestPartStreamHandler(Self, Cargo, APartNumber, O);
    if O <> nil then
    begin
      CheckObject(O, TStream);
      AStream := TStream(O);
    end;
  end;
end;

function lgpKSeF2_Create(var AKSeFObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    AKSeFObj := TlgKSeF2Lib.Create(nil);
    {$ifdef LGP_DEBUG_OBJ}
    lgpDbgAddObject(TObject(AKSeFObj));
    {$endif}
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetBase64EncoderClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if Base64EncoderClass <> nil then
        AClassName := PVmt(Base64EncoderClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetBase64EncoderClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if AClassName = '' then
        Base64EncoderClass := nil
      else
        Base64EncoderClass := Base64EncoderClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetAES256EncryptClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if AES256EncryptClass <> nil then
        AClassName := PVmt(AES256EncryptClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetAES256EncryptClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if AClassName = '' then
        AES256EncryptClass := nil
      else
        AES256EncryptClass := AES256EncryptClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetSHA256HashClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if SHA256HashClass <> nil then
        AClassName := PVmt(SHA256HashClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetSHA256HashClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if AClassName = '' then
        SHA256HashClass := nil
      else
        SHA256HashClass := SHA256HashClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetRandomGeneratorClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if RandomGeneratorClass <> nil then
        AClassName := PVmt(RandomGeneratorClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetRandomGeneratorClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if AClassName = '' then
        RandomGeneratorClass := nil
      else
        RandomGeneratorClass := RandomGeneratorClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetRSAPubliicKeyClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if RandomGeneratorClass <> nil then
        AClassName := PVmt(RSAPublicKeyClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetRSAPubliicKeyClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with TObject(AKSeFObject) as TlgKSeF2 do
    begin
      if AClassName = '' then
        RSAPublicKeyClass := nil
      else
        RSAPublicKeyClass := RSAPublicKeyClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetRSATokenEncKey(AKSeFObject: LGP_OBJECT;
  AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AKey := (TObject(AKSeFObject) as TlgKSeF2).RSATokenEncKey[TlgKSeFGateType(AKeyType)];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetRSATokenEncKey(AKSeFObject: LGP_OBJECT;
  AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    if AKey <> nil then
      CheckObject(AKey, TlgRSAPublicKey);
    (TObject(AKSeFObject) as TlgKSeF2).RSATokenEncKey[TlgKSeFGateType(AKeyType)] := TlgRSAPublicKey(AKey);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetRSASymmetricKeyEncKey(AKSeFObject: LGP_OBJECT;
  AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AKey := (TObject(AKSeFObject) as TlgKSeF2).RSASymmetricKeyEncKey[TlgKSeFGateType(AKeyType)];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetRSASymmetricKeyEncKey(AKSeFObject: LGP_OBJECT;
  AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    if AKey <> nil then
      CheckObject(AKey, TlgRSAPublicKey);
    (TObject(AKSeFObject) as TlgKSeF2).RSASymmetricKeyEncKey[TlgKSeFGateType(AKeyType)] := TlgRSAPublicKey(AKey);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetXAdES(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AObj := (TObject(AKSeFObject) as TlgKSeF2).XAdES;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetXAdES(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    if AObj <> nil then
      CheckObject(AObj, TlgXAdES);
    (TObject(AKSeFObject) as TlgKSeF2).XAdES := TlgXAdES(AObj);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetHTTPClient(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AObj := (TObject(AKSeFObject) as TlgKSeF2).HTTPClient;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetHTTPClient(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    if AObj <> nil then
      CheckObject(AObj, TlgHTTPClient);
    (TObject(AKSeFObject) as TlgKSeF2).HTTPClient := TlgHTTPClient(AObj);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetGateType(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AType := Integer((TObject(AKSeFObject) as TlgKSeF2).GateType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetGateType(AKSeFObject: LGP_OBJECT; AType: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).GateType := TlgKSeFGateType(AType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetIdentifier(AKSeFObject: LGP_OBJECT;
  var AIdentifier: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AIdentifier := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).Identifier);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetIdentifier(AKSeFObject: LGP_OBJECT; AIdentifier: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).Identifier := AIdentifier;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetIdentifierType(AKSeFObject: LGP_OBJECT;
  var AIdentifierType: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AIdentifierType := Integer((TObject(AKSeFObject) as TlgKSeF2).IdentifierType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetIdentifierType(AKSeFObject: LGP_OBJECT;
  AIdentifierType: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).IdentifierType := TlgKSeFIdentifierType(AIdentifierType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetFormCode(AKSeFObject: LGP_OBJECT; var AFCode: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AFCode := Integer((TObject(AKSeFObject) as TlgKSeF2).FormCode);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetFormCode(AKSeFObject: LGP_OBJECT; AFCode: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).FormCode := TlgKSeFFormCode(AFCode);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetFormCodeSystemCode(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).FormCodeSystemCode);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetFormCodeSystemCode(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).FormCodeSystemCode := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).FormCodeSchemaVersion);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).FormCodeSchemaVersion := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetFormCodeValue(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).FormCodeValue);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetFormCodeValue(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).FormCodeValue := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetAuthCertificate(AKSeFObject: LGP_OBJECT;
  var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AObj := (TObject(AKSeFObject) as TlgKSeF2).AuthCertificate;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetAuthCertificate(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    if AObj <> nil then
      CheckObject(AObj, TlgCertificate);
    (TObject(AKSeFObject) as TlgKSeF2).AuthCertificate := TlgCertificate(AObj);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetAuthCertificateSubject(AKSeFObject: LGP_OBJECT;
  var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AType := Integer((TObject(AKSeFObject) as TlgKSeF2).AuthCertificateSubject);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetAuthCertificateSubject(AKSeFObject: LGP_OBJECT;
  AType: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).AuthCertificateSubject := TlgKSeFCertificateAuthType(AType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetKsefToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).KsefToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetKsefToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).KsefToken := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetAuthenticationToken(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).AuthenticationToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetAuthenticationToken(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).AuthenticationToken := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetAuthenticationTokenValidUntil(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := (TObject(AKSeFObject) as TlgKSeF2).AuthenticationTokenValidUntil;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetAuthenticationTokenValidUntil(AKSeFObject: LGP_OBJECT;
  AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).AuthenticationTokenValidUntil := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetAuthenticationRefNo(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).AuthenticationRefNo);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetAuthenticationRefNo(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).AuthenticationRefNo := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetAccessToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).AccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetAccessToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).AccessToken := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetAccessTokenValidUntil(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := (TObject(AKSeFObject) as TlgKSeF2).AccessTokenValidUntil;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetAccessTokenValidUntil(AKSeFObject: LGP_OBJECT;
  AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).AccessTokenValidUntil := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetRefreshToken(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).RefreshToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetRefreshToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).RefreshToken := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetRefreshTokenValidUntil(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := (TObject(AKSeFObject) as TlgKSeF2).RefreshTokenValidUntil;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetRefreshTokenValidUntil(AKSeFObject: LGP_OBJECT;
  AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).RefreshTokenValidUntil := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetInteractiveEncryptionKey(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with (TObject(AKSeFObject) as TlgKSeF2) do
      if Length(InteractiveEncryptionKey) = 0 then
        AValue := nil
      else
        AValue := @InteractiveEncryptionKey[0];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetInteractiveEncryptionKey(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
var
  A: TBytes = nil;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with (TObject(AKSeFObject) as TlgKSeF2) do
      if AValue <> nil then
      begin
        SetLength(A, AES256_KEY_SIZE);
        Move(AValue^, A[0], AES256_KEY_SIZE);
        InteractiveEncryptionKey := A;
      end
      else
        InteractiveEncryptionKey := [];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetInteractiveVector(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with (TObject(AKSeFObject) as TlgKSeF2) do
      if Length(InteractiveVector) = 0 then
        AValue := nil
      else
        AValue := @InteractiveVector[0];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetInteractiveVector(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
var
  A: TBytes = nil;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with (TObject(AKSeFObject) as TlgKSeF2) do
      if AValue <> nil then
      begin
        SetLength(A, AES256_IV_SIZE);
        Move(AValue^, A, AES256_IV_SIZE);
        InteractiveVector := A;
      end
      else
        InteractiveVector := [];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetInteractiveReferenceNumber(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).InteractiveReferenceNumber);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetInteractiveReferenceNumber(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).InteractiveReferenceNumber := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetInteractiveValidUntil(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := (TObject(AKSeFObject) as TlgKSeF2).InteractiveValidUntil;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetInteractiveValidUntil(AKSeFObject: LGP_OBJECT;
  AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).InteractiveValidUntil := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetBatchReferenceNumber(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).BatchReferenceNumber);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetBatchReferenceNumber(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).BatchReferenceNumber := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetBatchPartSize(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := (TObject(AKSeFObject) as TlgKSeF2).BatchPartSize;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetBatchPartSize(AKSeFObject: LGP_OBJECT; AValue: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).BatchPartSize := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetInvoiceExportEncryptionKey(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with (TObject(AKSeFObject) as TlgKSeF2) do
      if Length(InvoiceExportEncryptionKey) = 0 then
        AValue := nil
      else
        AValue := @InvoiceExportEncryptionKey[0];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetInvoiceExportEncryptionKey(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
var
  A: TBytes = nil;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with (TObject(AKSeFObject) as TlgKSeF2) do
      if AValue <> nil then
      begin
        SetLength(A, AES256_KEY_SIZE);
        Move(AValue^, A[0], AES256_KEY_SIZE);
        InvoiceExportEncryptionKey := A;
      end
      else
        InvoiceExportEncryptionKey := [];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetInvoiceExportVector(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with (TObject(AKSeFObject) as TlgKSeF2) do
      if Length(InvoiceExportVector) = 0 then
        AValue := nil
      else
        AValue := @InvoiceExportVector[0];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetInvoiceExportVector(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
var
  A: TBytes = nil;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    with (TObject(AKSeFObject) as TlgKSeF2) do
      if AValue <> nil then
      begin
        SetLength(A, AES256_IV_SIZE);
        Move(AValue^, A[0], AES256_IV_SIZE);
        InvoiceExportVector := A;
      end
      else
        InvoiceExportVector := [];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetInvoiceExportReferenceNumber(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).InvoiceExportReferenceNumber);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetInvoiceExportReferenceNumber(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).InvoiceExportReferenceNumber := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetRequestPartStreamCargo(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2Lib);
    AValue := (TObject(AKSeFObject) as TlgKSeF2Lib).Cargo;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetRequestPartStreamCargo(AKSeFObject: LGP_OBJECT;
  AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2Lib);
    (TObject(AKSeFObject) as TlgKSeF2Lib).Cargo := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetAutoRefreshToken(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2Lib);
    AValue := Ord((TObject(AKSeFObject) as TlgKSeF2Lib).AutoRefreshToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetAutoRefreshToken(AKSeFObject: LGP_OBJECT; AValue: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2Lib);
    (TObject(AKSeFObject) as TlgKSeF2Lib).AutoRefreshToken := AValue <> 0;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_GetOnRequestPartStream(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2Lib);
    AValue := Pointer((TObject(AKSeFObject) as TlgKSeF2Lib).ExtRequestPartStreamHandler);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SetOnRequestPartStream(AKSeFObject: LGP_OBJECT;
  AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2Lib);
    (TObject(AKSeFObject) as TlgKSeF2Lib).ExtRequestPartStreamHandler := TLgoRequestPartStreamEvent(AValue);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthChallenge(AKSeFObject: LGP_OBJECT;
  var AAuthenticationChallengeResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationChallengeResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationChallengeResponse := (TObject(AKSeFObject) as TlgKSeF2).AuthChallenge;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthXadesSignatureGenerate(AKSeFObject: LGP_OBJECT;
  var AAuthenticationStructure: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationStructure := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationStructure := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).AuthXadesSignatureGenerate);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthXadesSignatureGenerate2(AKSeFObject: LGP_OBJECT;
  ASubjectIdType: LGP_INT32; AIdentifier: LGP_PCHAR;
  AIdentifierType: LGP_INT32; var AAuthenticationStructure: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationStructure := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationStructure := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2)
      .AuthXadesSignatureGenerate(TlgKSeFCertificateAuthType(ASubjectIdType),
      AIdentifier, TlgKSeFIdentifierType(AIdentifierType)));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthXadesSignature(AKSeFObject: LGP_OBJECT;
  var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationInitResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationInitResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .AuthXadesSignature;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthXadesSignature2(AKSeFObject: LGP_OBJECT;
  ACertificate: LGP_OBJECT; ASubjectIdType: LGP_INT32; AIdentifier: LGP_PCHAR;
  AIdentifierType: LGP_INT32; var AAuthenticationInitResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationInitResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ACertificate, TlgCertificate);
    AAuthenticationInitResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .AuthXadesSignature(TlgCertificate(ACertificate), TlgKSeFCertificateAuthType(ASubjectIdType),
      AIdentifier, TlgKSeFIdentifierType(AIdentifierType));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthXadesSignature3(AKSeFObject: LGP_OBJECT;
  ASignedAuthData: LGP_PCHAR; var AAuthenticationInitResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationInitResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationInitResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .AuthXadesSignature(ASignedAuthData);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthKsefToken(AKSeFObject: LGP_OBJECT;
  var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationInitResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationInitResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .AuthKsefToken;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthKsefToken2(AKSeFObject: LGP_OBJECT; AToken: LGP_PCHAR;
  AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32;
  var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationInitResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationInitResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .AuthKsefToken(AToken, AIdentifier, TlgKSeFIdentifierType(AIdentifierType));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthStatus(AKSeFObject: LGP_OBJECT;
  AReferenceNumber: LGP_PCHAR; AAuthenticationToken: LGP_PCHAR;
  var AAuthenticationOperationStatusResponse: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  AAuthenticationOperationStatusResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationOperationStatusResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .AuthStatus(AReferenceNumber, AAuthenticationToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthTokenRedem(AKSeFObject: LGP_OBJECT;
  AAuthenticationToken: LGP_PCHAR; var AAuthenticationTokensResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationTokensResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationTokensResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .AuthTokenRedem(AAuthenticationToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthTokenRefresh(AKSeFObject: LGP_OBJECT;
  ARefreshToken: LGP_PCHAR; var AAuthenticationTokenRefreshResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationTokenRefreshResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationTokenRefreshResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .AuthTokenRefresh(ARefreshToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthSessions(AKSeFObject: LGP_OBJECT;
  AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR;
  var AAuthenticationListResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AAuthenticationListResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AAuthenticationListResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .AuthSessions(AContinuationToken, APageSize, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthSessionTerminateCurrent(AKSeFObject: LGP_OBJECT;
  AToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).AuthSessionTerminateCurrent(AToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_AuthSessionTerminate(AKSeFObject: LGP_OBJECT;
  AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).AuthSessionTerminate(AReferenceNumber, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SecurityPublicKeyCertificates(AKSeFObject: LGP_OBJECT;
  AGate: LGP_INT32; var APublicKeyCertificateResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  APublicKeyCertificateResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    APublicKeyCertificateResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .SecurityPublicKeyCertificates(TlgKSeFGateType(AGate));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_SecurityLoadKeys(AKSeFObject: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).SecurityLoadKeys;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InteractiveOpen(AKSeFObject: LGP_OBJECT;
  AFormCode: LGP_INT32; AEncryptionSymetricKey: LGP_PBYTE;
  AInitializationVector: LGP_PBYTE; AFormCodeSystemCode: LGP_PCHAR;
  AFormCodeSchemaVersion: LGP_PCHAR; AFormCodeValue: LGP_PCHAR;
  AAccessToken: LGP_PCHAR; var AOpenOnlineSessionResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
var
  EncKey: TBytes = nil;
  IV: TBytes = nil;
begin
  Result := nil;
  AOpenOnlineSessionResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    if AEncryptionSymetricKey <> nil then
    begin
      SetLength(EncKey, AES256_KEY_SIZE);
      Move(AEncryptionSymetricKey[0], EncKey[0], AES256_KEY_SIZE);
    end;
    if AInitializationVector <> nil then
    begin
      SetLength(IV, AES256_IV_SIZE);
      Move(AInitializationVector[0], IV[0], AES256_IV_SIZE);
    end;
    AOpenOnlineSessionResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .InteractiveOpen(TlgKSeFFormCode(AFormCode), EncKey, IV, AFormCodeSystemCode,
      AFormCodeSchemaVersion, AFormCodeValue, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InteractiveOpen2(AKSeFObject: LGP_OBJECT;
  ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR;
  var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AOpenOnlineSessionResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2OpenOnlineSessionRequest);
    AOpenOnlineSessionResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .InteractiveOpen(TKSeF2OpenOnlineSessionRequest(ARequest), AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InteractiveOpen3(AKSeFObject: LGP_OBJECT;
  var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AOpenOnlineSessionResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AOpenOnlineSessionResponse := (TObject(AKSeFObject) as TlgKSeF2).InteractiveOpen;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InteractiveOpenSimple(AKSeFObject: LGP_OBJECT;
  var ASessionReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ASessionReferenceNumber := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    ASessionReferenceNumber := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).InteractiveOpenSimple);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InteractiveSend(AKSeFObject: LGP_OBJECT;
  AInvoiceStream: LGP_OBJECT; AOfflineMode: LGP_INT32;
  AHashOfCorrectedInvoice: LGP_PCHAR; ASessionReferenceNumber: LGP_PCHAR;
  AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE;
  AAccessToken: LGP_PCHAR; var AInvoiceRefenenceNumber: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
var
  EncKey: TBytes = nil;
  IV: TBytes = nil;
begin
  Result := nil;
  AInvoiceRefenenceNumber := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(AInvoiceStream, TStream);
    if AEncryptionSymetricKey <> nil then
    begin
      SetLength(EncKey, AES256_KEY_SIZE);
      Move(AEncryptionSymetricKey[0], EncKey[0], AES256_KEY_SIZE);
    end;
    if AInitializationVector <> nil then
    begin
      SetLength(IV, AES256_IV_SIZE);
      Move(AInitializationVector[0], IV[0], AES256_IV_SIZE);
    end;
    AInvoiceRefenenceNumber := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2)
      .InteractiveSend(TStream(AInvoiceStream), AOfflineMode <> 0, AHashOfCorrectedInvoice,
      ASessionReferenceNumber, EncKey, IV, AAccessToken));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InteractiveSend2(AKSeFObject: LGP_OBJECT;
  ARequest: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR;
  AAccessToken: LGP_PCHAR; var ASendInvoiceResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ASendInvoiceResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2SendInvoiceRequest);
    ASendInvoiceResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .InteractiveSend(TKSeF2SendInvoiceRequest(ARequest),
      ASessionReferenceNumber, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InteractiveSend3(AKSeFObject: LGP_OBJECT;
  AInvoiceStream: LGP_OBJECT; AOfflineMode: LGP_INT32;
  AHashOfCorrectedInvoice: LGP_PCHAR; var AInvoiceRefenenceNumber: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AInvoiceRefenenceNumber := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(AInvoiceStream, TStream);
    AInvoiceRefenenceNumber := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2)
      .InteractiveSend(TStream(AInvoiceStream), AOfflineMode <> 0, AHashOfCorrectedInvoice));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InteractiveClose(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).InteractiveClose(ASessionReferenceNumber, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_BatchPrepare(AKSeFObject: LGP_OBJECT;
  AZIPFileStream: LGP_OBJECT; AOutputStream: LGP_OBJECT; AFormCode: LGP_INT32;
  AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE;
  AFormCodeSystemCode: LGP_PCHAR; AFormCodeSchemaVersion: LGP_PCHAR;
  AFormCodeValue: LGP_PCHAR; APartSize: LGP_INT32;
  var AOpenBatchSessionRequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  EncKey: TBytes = nil;
  IV: TBytes = nil;
begin
  Result := nil;
  AOpenBatchSessionRequest := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(AZIPFileStream, TStream);
    if AOutputStream <> nil then
      CheckObject(AOutputStream, TStream);
    if AEncryptionSymetricKey <> nil then
    begin
      SetLength(EncKey, AES256_KEY_SIZE);
      Move(AEncryptionSymetricKey[0], EncKey[0], AES256_KEY_SIZE);
    end;
    if AInitializationVector <> nil then
    begin
      SetLength(IV, AES256_IV_SIZE);
      Move(AInitializationVector[0], IV[0], AES256_IV_SIZE);
    end;
    AOpenBatchSessionRequest := (TObject(AKSeFObject) as TlgKSeF2)
      .BatchPrepare(TStream(AZIPFileStream), TStream(AOutputStream),
      TlgKSeFFormCode(AFormCode), EncKey, IV, AFormCodeSystemCode,
      AFormCodeSchemaVersion, AFormCodeValue, APartSize);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_BatchPrepare2(AKSeFObject: LGP_OBJECT;
  AZIPFileStream: LGP_OBJECT; AOutputStream: LGP_OBJECT; APartSize: LGP_INT32;
  var AOpenBatchSessionRequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AOpenBatchSessionRequest := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(AZIPFileStream, TStream);
    if AOutputStream <> nil then
      CheckObject(AOutputStream, TStream);
    AOpenBatchSessionRequest := (TObject(AKSeFObject) as TlgKSeF2)
      .BatchPrepare(TStream(AZIPFileStream), TStream(AOutputStream), APartSize);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_BatchOpen(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT;
  AAccessToken: LGP_PCHAR; var AOpenBatchSessionResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AOpenBatchSessionResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2OpenBatchSessionRequest);
    AOpenBatchSessionResponse := (TObject(AKSeFObject) as TlgKSeF2)
      .BatchOpen(TKSeF2OpenBatchSessionRequest(ARequest), AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_BatchSendPart(AKSeFObject: LGP_OBJECT;
  APartUploadRequest: LGP_OBJECT; ADataStream: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(APartUploadRequest, TKSeF2PartUploadRequest);
    CheckObject(ADataStream, TStream);
    (TObject(AKSeFObject) as TlgKSeF2).BatchSendPart(TKSeF2PartUploadRequest(APartUploadRequest),
      TStream(ADataStream));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_BatchClose(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).BatchClose(ASessionReferenceNumber,
      AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusSessions(AKSeFObject: LGP_OBJECT;
  ASessionType: LGP_INT32; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32;
  AReferenceNumber: LGP_PCHAR; ADateCreatedFrom: LGP_DOUBLE;
  ADateCreatedTo: LGP_DOUBLE; ADateClosedFrom: LGP_DOUBLE;
  ADateClosedTo: LGP_DOUBLE; ADateModifiedFrom: LGP_DOUBLE;
  ADateModifiedTo: LGP_DOUBLE; AStatuses: LGP_UINT32; AAccessToken: LGP_PCHAR;
  var ASessionsQueryResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Statuses: TKSeF2CommonSessionStatuses;
begin
  Result := nil;
  ASessionsQueryResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    Int32ToSet(AStatuses, Ord(High(TKSeF2CommonSessionStatus)), SizeOf(Statuses), @Statuses);
    ASessionsQueryResponse := (TObject(AKSeFObject) as TlgKSeF2).
      StatusSessions(TKSeF2SessionType(ASessionType), AContinuationToken, APageSize,
      AReferenceNumber, ADateCreatedFrom, ADateCreatedTo, ADateClosedFrom, ADateClosedTo,
      ADateModifiedFrom, ADateModifiedTo, Statuses, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusSession(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR;
  var ASessionStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ASessionStatusResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    ASessionStatusResponse := (TObject(AKSeFObject) as TlgKSeF2).
      StatusSession(ASessionReferenceNumber, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusInvoices(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AContinuationToken: LGP_PCHAR;
  APageSize: LGP_INT32; AAccessToken: LGP_PCHAR;
  var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ASessionInvoicesResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    ASessionInvoicesResponse := (TObject(AKSeFObject) as TlgKSeF2).
      StatusInvoices(ASessionReferenceNumber, AContinuationToken, APageSize,
      AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusSessionInvoice(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR;
  AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ASessionInvoicesResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    ASessionInvoicesResponse := (TObject(AKSeFObject) as TlgKSeF2).
      StatusSessionInvoice(ASessionReferenceNumber, AInvoiceReferenceNumber,
      AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusInvoicesFailed(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AContinuationToken: LGP_PCHAR;
  APageSize: LGP_INT32; AAccessToken: LGP_PCHAR;
  var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ASessionInvoicesResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    ASessionInvoicesResponse := (TObject(AKSeFObject) as TlgKSeF2).
      StatusInvoicesFailed(ASessionReferenceNumber, AContinuationToken, APageSize,
      AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusUpoKsef(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AKsefNumber: LGP_PCHAR;
  AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(AOutStream, TStream);
    (TObject(AKSeFObject) as TlgKSeF2).StatusUpoKsef(ASessionReferenceNumber,
    AKsefNumber, TStream(AOutStream), AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusUpoKsefSimple(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AKsefNumber: LGP_PCHAR;
  AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AUpo := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AUpo := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).
      StatusUpoKsefSimple(ASessionReferenceNumber, AKsefNumber, AAccessToken));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusUpoSessionInvoice(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR;
  AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(AOutStream, TStream);
    (TObject(AKSeFObject) as TlgKSeF2).StatusUpoSessionInvoice(ASessionReferenceNumber,
    AInvoiceReferenceNumber, TStream(AOutStream), AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusUpoSessionInvoiceSimple(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR;
  AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AUpo := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AUpo := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).
      StatusUpoSessionInvoiceSimple(ASessionReferenceNumber, AInvoiceReferenceNumber,
      AAccessToken));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusUpoSession(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AUpoReferenceNumber: LGP_PCHAR;
  AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(AOutStream, TStream);
    (TObject(AKSeFObject) as TlgKSeF2).StatusUpoSession(ASessionReferenceNumber,
    AUpoReferenceNumber, TStream(AOutStream), AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_StatusUpoSessionSimple(AKSeFObject: LGP_OBJECT;
  ASessionReferenceNumber: LGP_PCHAR; AUpoReferenceNumber: LGP_PCHAR;
  AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AUpo := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AUpo := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).
      StatusUpoSessionSimple(ASessionReferenceNumber, AUpoReferenceNumber,
      AAccessToken));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InvoicesKsef(AKSeFObject: LGP_OBJECT; AKsefNumber: LGP_PCHAR;
  AOutputStram: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(AOutputStram, TStream);
    (TObject(AKSeFObject) as TlgKSeF2).InvoicesKsef(AKsefNumber,
      TStream(AOutputStram), AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InvoicesQueryMetadata(AKSeFObject: LGP_OBJECT;
  ARequest: LGP_OBJECT; APageOffset: LGP_INT32; APageSize: LGP_INT32;
  ASortOrder: LGP_INT32; AAccessToken: LGP_PCHAR;
  var AQueryInvoicesMetadataResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AQueryInvoicesMetadataResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2InvoiceQueryFilters);
    AQueryInvoicesMetadataResponse := (TObject(AKSeFObject) as TlgKSeF2).
      InvoicesQueryMetadata(TKSeF2InvoiceQueryFilters(ARequest), APageOffset,
      APageSize, TKSeF2SortOrder(ASortOrder), AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InvoicesExport(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT;
  AAccessToken: LGP_PCHAR; var AExportInvoicesResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AExportInvoicesResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2InvoiceExportRequest);
    AExportInvoicesResponse := (TObject(AKSeFObject) as TlgKSeF2).
      InvoicesExport(TKSeF2InvoiceExportRequest(ARequest), AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InvoicesExport2(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT;
  AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE;
  AAccessToken: LGP_PCHAR; var AExportInvoicesResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
var
  EncKey: TBytes = nil;
  IV: TBytes = nil;
begin
  Result := nil;
  AExportInvoicesResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2InvoiceQueryFilters);
    if AEncryptionSymetricKey <> nil then
    begin
      SetLength(EncKey, AES256_KEY_SIZE);
      Move(AEncryptionSymetricKey[0], EncKey[0], AES256_KEY_SIZE);
    end;
    if AInitializationVector <> nil then
    begin
      SetLength(IV, AES256_IV_SIZE);
      Move(AInitializationVector[0], IV[0], AES256_IV_SIZE);
    end;
    AExportInvoicesResponse := (TObject(AKSeFObject) as TlgKSeF2).
      InvoicesExport(TKSeF2InvoiceQueryFilters(ARequest), EncKey, IV, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InvoicesExportSimple(AKSeFObject: LGP_OBJECT;
  ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR;
  var ASessionReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ASessionReferenceNumber := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2InvoiceExportRequest);
    ASessionReferenceNumber := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).
      InvoicesExportSimple(TKSeF2InvoiceExportRequest(ARequest), AAccessToken));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InvoicesExportSimple2(AKSeFObject: LGP_OBJECT;
  ARequest: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE;
  AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR;
  var AReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  EncKey: TBytes = nil;
  IV: TBytes = nil;
begin
  Result := nil;
  AReferenceNumber := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2InvoiceQueryFilters);
    if AEncryptionSymetricKey <> nil then
    begin
      SetLength(EncKey, AES256_KEY_SIZE);
      Move(AEncryptionSymetricKey[0], EncKey[0], AES256_KEY_SIZE);
    end;
    if AInitializationVector <> nil then
    begin
      SetLength(IV, AES256_IV_SIZE);
      Move(AInitializationVector[0], IV[0], AES256_IV_SIZE);
    end;
    AReferenceNumber := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF2).
      InvoicesExportSimple(TKSeF2InvoiceQueryFilters(ARequest), EncKey, IV, AAccessToken));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InvoicesExportStatus(AKSeFObject: LGP_OBJECT;
  AOperationReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR;
  var AInvoiceExportStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AInvoiceExportStatusResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    AInvoiceExportStatusResponse := (TObject(AKSeFObject) as TlgKSeF2).
      InvoicesExportStatus(AOperationReferenceNumber, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_InvoicesExportDownload(AKSeFObject: LGP_OBJECT;
  AStatusResponse: LGP_OBJECT; AOutputStream: LGP_OBJECT;
  AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE
  ): LGP_EXCEPTION; stdcall;
var
  EncKey: TBytes = nil;
  IV: TBytes = nil;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(AStatusResponse, TKSeF2InvoiceExportStatusResponse);
    CheckObject(AOutputStream, TStream);
    if AEncryptionSymetricKey <> nil then
    begin
      SetLength(EncKey, AES256_KEY_SIZE);
      Move(AEncryptionSymetricKey[0], EncKey[0], AES256_KEY_SIZE);
    end;
    if AInitializationVector <> nil then
    begin
      SetLength(IV, AES256_IV_SIZE);
      Move(AInitializationVector[0], IV[0], AES256_IV_SIZE);
    end;
    (TObject(AKSeFObject) as TlgKSeF2).InvoicesExportDownload(
      TKSeF2InvoiceExportStatusResponse(AStatusResponse), TStream(AOutputStream),
      EncKey, IV);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_TokensGenerate(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT;
  AAccessToken: LGP_PCHAR; var AGenerateTokenResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AGenerateTokenResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2GenerateTokenRequest);
    AGenerateTokenResponse := (TObject(AKSeFObject) as TlgKSeF2).
      TokensGenerate(TKSeF2GenerateTokenRequest(ARequest), AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_TokensGenerate2(AKSeFObject: LGP_OBJECT;
  APermissions: LGP_INT32; ADescription: LGP_PCHAR; AAccessToken: LGP_PCHAR;
  var AGenerateTokenResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Permissions: TKSeF2TokenPermissions;
begin
  Result := nil;
  AGenerateTokenResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    Int32ToSet(APermissions, Ord(High(TKSeF2TokenPermissionType)), SizeOf(Permissions), @Permissions);
    AGenerateTokenResponse := (TObject(AKSeFObject) as TlgKSeF2).
      TokensGenerate(Permissions, ADescription, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_TokensList(AKSeFObject: LGP_OBJECT; AStatus: LGP_INT32;
  ADescription: LGP_PCHAR; AAuthorIdentifier: LGP_PCHAR;
  AAuthorIdentifierType: LGP_INT32; APageSize: LGP_INT32;
  AContinuationToken: LGP_PCHAR; AAccessToken: LGP_PCHAR;
  var AQueryTokensResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Statuses: TKSeF2AuthenticationTokenStatuses;
begin
  Result := nil;
  AQueryTokensResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    Int32ToSet(AStatus, Ord(High(TKSeF2AuthenticationTokenStatus)), SizeOf(Statuses), @Statuses);
    AQueryTokensResponse := (TObject(AKSeFObject) as TlgKSeF2).
      TokensList(Statuses, ADescription, AAuthorIdentifier,
      TKSeF2TokenAuthorIdentifierType(AAuthorIdentifierType), APageSize,
      AContinuationToken, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_TokensStatus(AKSeFObject: LGP_OBJECT;
  AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR;
  var ATokenStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ATokenStatusResponse := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    ATokenStatusResponse := (TObject(AKSeFObject) as TlgKSeF2).
      TokensStatus(AReferenceNumber, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_TokensRevoke(AKSeFObject: LGP_OBJECT;
  AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).
      TokensRevoke(AReferenceNumber, AAccessToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_TestdataSubject(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2SubjectCreateRequest);
    (TObject(AKSeFObject) as TlgKSeF2).
      TestdataSubject(TKSeF2SubjectCreateRequest(ARequest));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_TestdataSubjectRemove(AKSeFObject: LGP_OBJECT;
  ASubjectNip: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).
      TestdataSubjectRemove(ASubjectNip);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_TestdataPerson(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    CheckObject(ARequest, TKSeF2PersonCreateRequest);
    (TObject(AKSeFObject) as TlgKSeF2).
      TestdataPerson(TKSeF2PersonCreateRequest(ARequest));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF2_TestdataPersonRemove(AKSeFObject: LGP_OBJECT; ANip: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF2);
    (TObject(AKSeFObject) as TlgKSeF2).
      TestdataPersonRemove(ANip);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

end.

