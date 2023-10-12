{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4KSeF;

{$ifdef fpc}
{$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Obj, LibGovPl4Backend,
  LibGovPl4XAdES, LibGovPl4KSeFObj;

type
  TlgoKSeFGateType = (kgtProd, kgtDemo, kgtTest);
  TlgoKSeFFormCode = (kfcCustom, kfcFA1, kfcFA2);
  TlgoKSeFCertificateAuthType = (catSerialNumber, catFingerprint);

  { TlgoKSeF }

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

    procedure GenerateAESKey;

    function SessionInitSigned: TKSeFInitSessionResponse;
    function SessionInitToken: TKSeFInitSessionResponse;
    function SessionChalangePZ: String;
    function SessionInitPZ(const ASignedInit: UTF8String): TKSeFInitSessionResponse;
    function SessionStatus(const APageSize: Integer = 10; APageOffset: Integer = 0; AIncludeDetails: Boolean = True): TKSeFSessionStatusResponse; overload;
    function SessionStatus(const AReferenceNumber: UTF8String; const APageSize: Integer = 10; APageOffset: Integer = 0; AIncludeDetails: Boolean = True): TKSeFSessionStatusResponse; overload;
    function SessionTerminate(const AForce: Boolean = False): TKSeFTerminateSessionResponse;
    function SessionGenerateInternalIdentifier(AInputDigitsSequence: UTF8String): TKSeFInternalIdentifierGeneratedResponse;

    procedure InvoiceGet(const AKSeFReferenceNumber: UTF8String; AOutputStream: TStream);
    function InvoiceSend(const ADataStream: TStream): TKSeFSendInvoiceResponse;
    function InvoiceStatus(const AInvoiceElementReferenceNumber: UTF8String): TKSeFStatusInvoiceResponse;

    function QueryInvoiceSync(AQueryCriteria: TKSeFQueryInvoiceRequest; const APageSize, APageOffset: Integer): TKSeFQueryInvoiceSyncResponse;
    function QueryInvoiceAsyncInit(AQueryCriteria: TKSeFQueryInvoiceRequest): TKSeFQueryInvoiceAsyncInitResponse;
    function QueryInvoiceAsyncStatus(const AQueryElementReferenceNumber: UTF8String): TKSeFQueryInvoiceAsyncStatusResponse;
    procedure QueryInvoiceAsyncFetch(const AQueryElementReferenceNumber, APartElementReferenceNumber: UTF8String; AOutStream: TStream); overload;
    procedure QueryInvoiceAsyncFetch(AStatusResponse: TKSeFQueryInvoiceAsyncStatusResponse; APartIndex: Integer; AOutStream: TStream); overload;

    function PaymentIdentifierGetReferenceNumbers(APaymentIdentifier: UTF8String): TKSeFGetPaymentIdentifierReferenceNumbersResponse;
    function PaymentIdentifierRequest(AKsefReferenceNumberList: TStringArray): TKSeFRequestPaymentIdentifierResponse;

    procedure CommonInvoiceKSeF(AInvoiceRequest: TKSeFInvoiceRequestKSeF; AOutStream: TStream; AGateType: TlgoKSeFGateType);
    function CommonStatus(const AReferenceNumber: UTF8String; const AGateType: TlgoKSeFGateType): TKSeFStatusResponse;

    procedure BatchSign(const AZIPDataStream: TStream; const APZ: Boolean; const AEncryptedStream: TStream; out AInitUpload: UTF8String; AZIPFileName: UTF8String = ''; APartFileName: UTF8String = '');
    function BatchSend(const APartStream: TStream; const AInitUpload: UTF8String): UTF8String;

    property RSAKey[AIndex: TlgoKSeFGateType]: TlgoRSAKey read GetRSAKey write SetRSAKey;
  published
    property RSAEncryptClass: UTF8String read GetRSAEncryptClass write SetRSAEncryptClass;
    property Base64EncoderClass: UTF8String read GetBase64EncoderClass write SetBase64EncoderClass;
    property AES256EncryptClass: UTF8String read GetAES256EncryptClass write SetAES256EncryptClass;
    property SHA256HashClass: UTF8String read GetSHA256HashClass write SetSHA256HashClass;
    property RandomGeneratorClass: UTF8String read GetRandomGeneratorClass write SetRandomGeneratorClass;
    property XAdES: TlgoXAdES read FXAdES write SetXAdES;
    property HTTPClient: TlgoHTTPClient read FHTTPClient write SetHTTPClient;
    property GateType: TlgoKSeFGateType read GetGateType write SetGateType;
    property NIP: UTF8String read GetNIP write SetNIP;
    property FormCode: TlgoKSeFFormCode read GetFormCode write SetFormCode;
    property FormCodeSystemCode: UTF8String read GetFormCodeSystemCode write SetFormCodeSystemCode;
    property FormCodeSchemaVersion: UTF8String read GetFormCodeSchemaVersion write SetFormCodeSchemaVersion;
    property FormCodeTargetNamespace: UTF8String read GetFormCodeTargetNamespace write SetFormCodeTargetNamespace;
    property FormCodeValue: UTF8String read GetFormCodeValue write SetFormCodeValue;
    property Certificate: TlgoCertificate read FCertificate write SetCertificate;
    property CertificateAuthType: TlgoKSeFCertificateAuthType read GetCertificateAuthType write SetCertificateAuthType;
    property Token: UTF8String read GetToken write SetToken;
    property Encryption: Boolean read GetEncryption write SetEncryption;
    property SessionToken: UTF8String read GetSessionToken;
    property SessionActive: Boolean read GetSessionActive;
  end;

implementation

{ TlgoKSeF }

function TlgoKSeF.GetAES256EncryptClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpKSeF_GetAES256EncryptClass(ExtObject, P));
  Result := P;
end;

function TlgoKSeF.GetBase64EncoderClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpKSeF_GetBase64EncoderClass(ExtObject, P));
  Result := P;
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
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpKSeF_GetRandomGeneratorClass(ExtObject, P));
  Result := P;
end;

function TlgoKSeF.GetRSAEncryptClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpKSeF_GetRSAEncryptClass(ExtObject, P));
  Result := P;
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
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpKSeF_GetSHA256HashClass(ExtObject, P));
  Result := P;
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
  lgoCheckResult(lgpKSeF_SetAES256EncryptClass(ExtObject, PChar(AValue)));
end;

procedure TlgoKSeF.SetBase64EncoderClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetBase64EncoderClass(ExtObject, PChar(AValue)));
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
  lgoCheckResult(lgpKSeF_SetFormCodeSchemaVersion(ExtObject, PChar(AValue)));
end;

procedure TlgoKSeF.SetFormCodeSystemCode(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetFormCodeSystemCode(ExtObject, PChar(AValue)));
end;

procedure TlgoKSeF.SetFormCodeTargetNamespace(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetFormCodeTargetNamespace(ExtObject, PChar(AValue)));
end;

procedure TlgoKSeF.SetFormCodeValue(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetFormCodeValue(ExtObject, PChar(AValue)));
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
  lgoCheckResult(lgpKSeF_SetNIP(ExtObject, PChar(AValue)));
end;

procedure TlgoKSeF.SetRandomGeneratorClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetRandomGeneratorClass(ExtObject, PChar(AValue)));
end;

procedure TlgoKSeF.SetRSAEncryptClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetRSAEncryptClass(ExtObject, PChar(AValue)));
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
  lgoCheckResult(lgpKSeF_SetSHA256HashClass(ExtObject, PChar(AValue)));
end;

procedure TlgoKSeF.SetToken(AValue: UTF8String);
begin
  lgoCheckResult(lgpKSeF_SetToken(ExtObject, PChar(AValue)));
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
  lgoCheckResult(lgpKSeF_SessionInitPZ(ExtObject, PAnsiChar(ASignedInit), R));
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

function TlgoKSeF.InvoiceStatus(const AInvoiceElementReferenceNumber: UTF8String
  ): TKSeFStatusInvoiceResponse;
var
  Resp: LGP_OBJECT;
begin
  lgoCheckResult(lgpKSeF_InvoiceStatus(ExtObject, LGP_PCHAR(AInvoiceElementReferenceNumber), Resp));
  if Resp <> nil then
    Result := TKSeFStatusInvoiceResponse.Create(Resp)
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

