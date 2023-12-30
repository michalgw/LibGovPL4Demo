{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uKSeF;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, lgKSeF, uTypes, uObject, uException, uBackend, lgBackend,
  lgXAdES, lgKSeFTypes, uStream;

const
  LGP_KSEF_GATETYPE_PROD = 0;
  LGP_KSEF_GATETYPE_DEMO = 1;
  LGP_KSEF_GATETYPE_TEST = 2;

  LGP_KSEF_CERTAUTHTYPE_SERIALNUMBER = 0;
  LGP_KSEF_CERTAUTHTYPE_FINGERPRINT = 1;

  LGP_KSEF_FORM_CODE_CUSTOM = 0;
  LGP_KSEF_FORM_CODE_FA1 = 1;
  LGP_KSEF_FORM_CODE_FA2 = 2;

  LGP_KSEF_SUBJECTTYPE_SUBJECT1 = 0;
  LGP_KSEF_SUBJECTTYPE_SUBJECT2 = 1;
  LGP_KSEF_SUBJECTTYPE_SUBJECT3 = 2;
  LGP_KSEF_SUBJECTTYPE_SUBJECTAUTHORIZED = 3;

function lgpKSeF_Create(var AKSeFObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetRSAEncryptClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetRSAEncryptClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetBase64EncoderClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetBase64EncoderClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetAES256EncryptClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetAES256EncryptClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetSHA256HashClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetSHA256HashClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetRandomGeneratorClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetRandomGeneratorClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetRSAKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetRSAKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetXAdES(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetXAdES(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetHTTPClient(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetHTTPClient(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetGateType(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetGateType(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetNIP(AKSeFObject: LGP_OBJECT; var ANIP: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetNIP(AKSeFObject: LGP_OBJECT; ANIP: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetFormCode(AKSeFObject: LGP_OBJECT; var AFCode: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetFormCode(AKSeFObject: LGP_OBJECT; AFCode: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetFormCodeSystemCode(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetFormCodeSystemCode(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetFormCodeTargetNamespace(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetFormCodeTargetNamespace(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetFormCodeValue(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetFormCodeValue(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetCertificate(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetCertificate(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetCertificateAuthType(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetCertificateAuthType(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetEncryption(AKSeFObject: LGP_OBJECT; var AEnc: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_SetEncryption(AKSeFObject: LGP_OBJECT; AEnc: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetSessionToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_GetSessionActive(AKSeFObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;

function lgpKSeF_GenerateAESKey(AKSeFObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF_SessionInitSigned(AKSeFObject: LGP_OBJECT; var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SessionInitToken(AKSeFObject: LGP_OBJECT; var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SessionChalangePZ(AKSeFObject: LGP_OBJECT; var AChalange: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SessionInitPZ(AKSeFObject: LGP_OBJECT; ASignedChalange: LGP_PCHAR; var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SessionStatus(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; APageSize, APageOffset, AIncludeDetails: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SessionTerminate(AKSeFObject: LGP_OBJECT; AForce: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_SessionGenerateInternalIdentifier(AKSeFObject: LGP_OBJECT; AInputDigitsSequence: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF_InvoiceGet(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; AOutputStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_InvoiceSend(AKSeFObject: LGP_OBJECT; ADataStream: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_InvoiceStatus(AKSeFObject: LGP_OBJECT; AInvoiceElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_InvoiceVisibilityHide(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber, AHidingReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_InvoiceVisibilityShow(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber, AHidingCancelationReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF_QueryInvoiceSync(AKSeFObject: LGP_OBJECT; AQueryCriteria: LGP_OBJECT; APageSize, APageOffset: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_QueryInvoiceAsyncInit(AKSeFObject: LGP_OBJECT; AQueryCriteria: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_QueryInvoiceAsyncStatus(AKSeFObject: LGP_OBJECT; AQueryElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_QueryInvoiceAsyncFetch(AKSeFObject: LGP_OBJECT; AQueryElementReferenceNumber, APartElementReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF_PaymentIdentifierGetReferenceNumbers(AKSeFObject: LGP_OBJECT; APaymentIdentifier: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_PaymentIdentifierRequest(AKSeFObject: LGP_OBJECT; AKsefReferenceNumberList: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpKSeF_CommonInvoiceKSeF(AKSeFObject: LGP_OBJECT; AInvoiceRequest: LGP_OBJECT; AOutStream: LGP_OBJECT; AGateType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_CommonDownload(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber: LGP_PCHAR; ADownloadRequest: LGP_OBJECT; AOutStream: LGP_OBJECT; AGateType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpKSeF_CommonStatus(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AGateType: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpKSeF_CommonVerification(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber: LGP_PCHAR; AVerificationRequest: LGP_OBJECT; AGateType: LGP_INT32): LGP_EXCEPTION; stdcall;

function lgpKSeF_BatchSign(AKSeFObject: LGP_OBJECT; AZIPDataStream: LGP_OBJECT; APZ: LGP_INT32; AEncryptedStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT; AZIPFileName, APartFileName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpKSeF_BatchSend(AKSeFObject: LGP_OBJECT; APartStream: LGP_OBJECT; AInitUpload: LGP_PCHAR; var ANrRef: LGP_OBJECT): LGP_EXCEPTION; stdcall;

implementation

function lgpKSeF_Create(var AKSeFObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    AKSeFObj := TlgKSeF.Create(nil);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetRSAEncryptClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if RSAEncryptClass <> nil then
        AClassName := @(PVmt(RSAEncryptClass.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetRSAEncryptClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if AClassName = nil then
        RSAEncryptClass := nil
      else
        RSAEncryptClass := RSAEncryptClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetBase64EncoderClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if Base64EncoderClass <> nil then
        AClassName := @(PVmt(Base64EncoderClass.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetBase64EncoderClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if AClassName = nil then
        Base64EncoderClass := nil
      else
        Base64EncoderClass := Base64EncoderClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetAES256EncryptClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if AES256EncryptClass <> nil then
        AClassName := @(PVmt(AES256EncryptClass.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetAES256EncryptClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if AClassName = nil then
        AES256EncryptClass := nil
      else
        AES256EncryptClass := AES256EncryptClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetSHA256HashClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if SHA256HashClass <> nil then
        AClassName := @(PVmt(SHA256HashClass.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetSHA256HashClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if AClassName = nil then
        SHA256HashClass := nil
      else
        SHA256HashClass := SHA256HashClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetRandomGeneratorClass(AKSeFObject: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if RandomGeneratorClass <> nil then
        AClassName := @(PVmt(RandomGeneratorClass.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetRandomGeneratorClass(AKSeFObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    with TObject(AKSeFObject) as TlgKSeF do
    begin
      if AClassName = nil then
        RandomGeneratorClass := nil
      else
        RandomGeneratorClass := RandomGeneratorClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetRSAKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32;
  var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AKey := (TObject(AKSeFObject) as TlgKSeF).RSAKey[TlgKSeFGateType(AKeyType)];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetRSAKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32;
  AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    if AKey <> nil then
      CheckObject(AKey, TlgRSAKey);
    (TObject(AKSeFObject) as TlgKSeF).RSAKey[TlgKSeFGateType(AKeyType)] := TlgRSAKey(AKey);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetXAdES(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AObj := (TObject(AKSeFObject) as TlgKSeF).XAdES;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetXAdES(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    if AObj <> nil then
      CheckObject(AObj, TlgXAdES);
    (TObject(AKSeFObject) as TlgKSeF).XAdES := TlgXAdES(AObj);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetHTTPClient(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AObj := (TObject(AKSeFObject) as TlgKSeF).HTTPClient;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetHTTPClient(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    if AObj <> nil then
      CheckObject(AObj, TlgHTTPClient);
    (TObject(AKSeFObject) as TlgKSeF).HTTPClient := TlgHTTPClient(AObj);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetGateType(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AType := Integer((TObject(AKSeFObject) as TlgKSeF).GateType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetGateType(AKSeFObject: LGP_OBJECT; AType: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).GateType := TlgKSeFGateType(AType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetNIP(AKSeFObject: LGP_OBJECT; var ANIP: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    ANIP := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF).NIP);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetNIP(AKSeFObject: LGP_OBJECT; ANIP: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).NIP := ANIP;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetFormCode(AKSeFObject: LGP_OBJECT; var AFCode: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AFCode := Integer((TObject(AKSeFObject) as TlgKSeF).FormCode);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetFormCode(AKSeFObject: LGP_OBJECT; AFCode: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).FormCode := TlgKSeFFormCode(AFCode);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetFormCodeSystemCode(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF).FormCodeSystemCode);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetFormCodeSystemCode(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).FormCodeSystemCode := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF).FormCodeSchemaVersion);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).FormCodeSchemaVersion := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetFormCodeTargetNamespace(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF).FormCodeTargetNamespace);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetFormCodeTargetNamespace(AKSeFObject: LGP_OBJECT;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).FormCodeTargetNamespace := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetFormCodeValue(AKSeFObject: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF).FormCodeValue);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetFormCodeValue(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).FormCodeValue := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetCertificate(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AObj := (TObject(AKSeFObject) as TlgKSeF).Certificate;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetCertificate(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    if AObj <> nil then
      CheckObject(AObj, TlgCertificate);
    (TObject(AKSeFObject) as TlgKSeF).Certificate := TlgCertificate(AObj);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetCertificateAuthType(AKSeFObject: LGP_OBJECT;
  var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AType := Integer((TObject(AKSeFObject) as TlgKSeF).CertificateAuthType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetCertificateAuthType(AKSeFObject: LGP_OBJECT;
  AType: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).CertificateAuthType := TlgKSeFCertificateAuthType(AType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF).Token);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).Token := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetEncryption(AKSeFObject: LGP_OBJECT; var AEnc: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AEnc := Integer((TObject(AKSeFObject) as TlgKSeF).Encryption);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SetEncryption(AKSeFObject: LGP_OBJECT; AEnc: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    (TObject(AKSeFObject) as TlgKSeF).Encryption := AEnc <> 0;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetSessionToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AValue := TStringObject.Create((TObject(AKSeFObject) as TlgKSeF).SessionToken);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GetSessionActive(AKSeFObject: LGP_OBJECT; var AValue: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AValue := Integer((TObject(AKSeFObject) as TlgKSeF).SessionActive);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_GenerateAESKey(AKSeFObject: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    TlgKSeF(AKSeFObject).GenerateAESKey;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SessionInitSigned(AKSeFObject: LGP_OBJECT;
  var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AInitSessionResponse := TlgKSeF(AKSeFObject).SessionInitSigned;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SessionInitToken(AKSeFObject: LGP_OBJECT;
  var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AInitSessionResponse := TlgKSeF(AKSeFObject).SessionInitToken;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SessionChalangePZ(AKSeFObject: LGP_OBJECT;
  var AChalange: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AChalange := TStringObject.Create(TlgKSeF(AKSeFObject).SessionChalangePZ);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SessionInitPZ(AKSeFObject: LGP_OBJECT;
  ASignedChalange: LGP_PCHAR; var AInitSessionResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AInitSessionResponse := TlgKSeF(AKSeFObject).SessionInitPZ(ASignedChalange);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SessionStatus(AKSeFObject: LGP_OBJECT;
  AReferenceNumber: LGP_PCHAR; APageSize, APageOffset,
  AIncludeDetails: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    if AReferenceNumber = '' then
      AResponse := TlgKSeF(AKSeFObject).SessionStatus(APageSize, APageOffset, AIncludeDetails <> 0)
    else
      AResponse := TlgKSeF(AKSeFObject).SessionStatus(AReferenceNumber, APageSize, APageOffset, AIncludeDetails <> 0);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SessionTerminate(AKSeFObject: LGP_OBJECT; AForce: LGP_INT32;
  var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AResponse := TlgKSeF(AKSeFObject).SessionTerminate(AForce <> 0);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_SessionGenerateInternalIdentifier(AKSeFObject: LGP_OBJECT;
  AInputDigitsSequence: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AResponse := TlgKSeF(AKSeFObject).SessionGenerateInternalIdentifier(AInputDigitsSequence);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_InvoiceGet(AKSeFObject: LGP_OBJECT;
  AKSeFReferenceNumber: LGP_PCHAR; AOutputStream: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    CheckObject(AOutputStream, TStream);
    TlgKSeF(AKSeFObject).InvoiceGet(AKSeFReferenceNumber, TStream(AOutputStream));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_InvoiceSend(AKSeFObject: LGP_OBJECT; ADataStream: LGP_OBJECT;
  var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    CheckObject(ADataStream, TStream);
    AResponse := TlgKSeF(AKSeFObject).InvoiceSend(TStream(ADataStream));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_InvoiceStatus(AKSeFObject: LGP_OBJECT;
  AInvoiceElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AResponse := TlgKSeF(AKSeFObject).InvoiceStatus(AInvoiceElementReferenceNumber);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_InvoiceVisibilityHide(AKSeFObject: LGP_OBJECT;
  AKsefReferenceNumber, AHidingReason: LGP_PCHAR; var AResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AResponse := TlgKSeF(AKSeFObject).InvoiceVisibilityHide(AKsefReferenceNumber, AHidingReason);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_InvoiceVisibilityShow(AKSeFObject: LGP_OBJECT;
  AKsefReferenceNumber, AHidingCancelationReason: LGP_PCHAR;
  var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AResponse := TlgKSeF(AKSeFObject).InvoiceVisibilityShow(AKsefReferenceNumber, AHidingCancelationReason);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_QueryInvoiceSync(AKSeFObject: LGP_OBJECT;
  AQueryCriteria: LGP_OBJECT; APageSize, APageOffset: LGP_INT32;
  var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    CheckObject(AQueryCriteria, TKSeFQueryInvoiceRequest);
    AResponse := TlgKSeF(AKSeFObject).QueryInvoiceSync(TKSeFQueryInvoiceRequest(AQueryCriteria), APageSize, APageOffset);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_QueryInvoiceAsyncInit(AKSeFObject: LGP_OBJECT;
  AQueryCriteria: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    CheckObject(AQueryCriteria, TKSeFQueryInvoiceRequest);
    AResponse := TlgKSeF(AKSeFObject).QueryInvoiceAsyncInit(TKSeFQueryInvoiceRequest(AQueryCriteria));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_QueryInvoiceAsyncStatus(AKSeFObject: LGP_OBJECT;
  AQueryElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AResponse := TlgKSeF(AKSeFObject).QueryInvoiceAsyncStatus(AQueryElementReferenceNumber);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_QueryInvoiceAsyncFetch(AKSeFObject: LGP_OBJECT;
  AQueryElementReferenceNumber, APartElementReferenceNumber: LGP_PCHAR;
  AOutStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    CheckObject(AOutStream, TStream);
    TlgKSeF(AKSeFObject).QueryInvoiceAsyncFetch(AQueryElementReferenceNumber, APartElementReferenceNumber, TStream(AOutStream));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_PaymentIdentifierGetReferenceNumbers(AKSeFObject: LGP_OBJECT;
  APaymentIdentifier: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AResponse := TlgKSeF(AKSeFObject).PaymentIdentifierGetReferenceNumbers(APaymentIdentifier);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_PaymentIdentifierRequest(AKSeFObject: LGP_OBJECT;
  AKsefReferenceNumberList: LGP_PCHAR; var AResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AResponse := TlgKSeF(AKSeFObject).PaymentIdentifierRequest(String(AKsefReferenceNumberList).Split([';']));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_CommonInvoiceKSeF(AKSeFObject: LGP_OBJECT;
  AInvoiceRequest: LGP_OBJECT; AOutStream: LGP_OBJECT; AGateType: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    CheckObject(AInvoiceRequest, TKSeFInvoiceRequestKSeF);
    CheckObject(AOutStream, TStream);
    TlgKSeF(AKSeFObject).CommonInvoiceKSeF(TKSeFInvoiceRequestKSeF(AInvoiceRequest), TStream(AOutStream), TlgKSeFGateType(AGateType));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_CommonDownload(AKSeFObject: LGP_OBJECT;
  AKsefReferenceNumber: LGP_PCHAR; ADownloadRequest: LGP_OBJECT;
  AOutStream: LGP_OBJECT; AGateType: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    CheckObject(ADownloadRequest, TKSeFInvoiceDownloadRequest);
    CheckObject(AOutStream, TStream);
    TlgKSeF(AKSeFObject).CommonDownload(AKsefReferenceNumber, TKSeFInvoiceDownloadRequest(ADownloadRequest), TStream(AOutStream), TlgKSeFGateType(AGateType));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_CommonStatus(AKSeFObject: LGP_OBJECT;
  AReferenceNumber: LGP_PCHAR; AGateType: LGP_INT32; var AResponse: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    AResponse := TlgKSeF(AKSeFObject).CommonStatus(AReferenceNumber, TlgKSeFGateType(AGateType));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_CommonVerification(AKSeFObject: LGP_OBJECT;
  AKsefReferenceNumber: LGP_PCHAR; AVerificationRequest: LGP_OBJECT;
  AGateType: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    CheckObject(AVerificationRequest, TKSeFInvoiceVerificationRequest);
    TlgKSeF(AKSeFObject).CommonVerification(AKsefReferenceNumber, TKSeFInvoiceVerificationRequest(AVerificationRequest), TlgKSeFGateType(AGateType));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_BatchSign(AKSeFObject: LGP_OBJECT; AZIPDataStream: LGP_OBJECT;
  APZ: LGP_INT32; AEncryptedStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT;
  AZIPFileName, APartFileName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
var
  InitUpload: String;
begin
  Result := nil;
  AInitUpload := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    TlgKSeF(AKSeFObject).BatchSign(TStream(AZIPDataStream), APZ <> 0, TStream(AEncryptedStream), InitUpload, AZIPFileName, APartFileName);
    AInitUpload := TStringObject.Create(InitUpload);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpKSeF_BatchSend(AKSeFObject: LGP_OBJECT; APartStream: LGP_OBJECT;
  AInitUpload: LGP_PCHAR; var ANrRef: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ANrRef := nil;
  try
    CheckObject(AKSeFObject, TlgKSeF);
    CheckObject(APartStream, TStream);
    ANrRef := TStringObject.Create(TlgKSeF(AKSeFObject).BatchSend(TStream(APartStream), AInitUpload));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

end.

