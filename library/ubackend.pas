{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uBackend;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uTypes, uObject, lgBackend, lgXAdES, lgEDeklaracja, lgJPK
  {$IFDEF LGP_ENABLE_WINCNG}
  , lgCNG
  {$ENDIF}
  ;

const
  LGP_CKU_DIGITAL_SIGNATURE = 1 shr Ord(ckuDigitalSignature);
  LGP_CKU_NON_REPUDIATION   = 1 shr Ord(ckuNonRepudiation);
  LGP_CKU_KEY_ENCIPHERMENT  = 1 shr Ord(ckuKeyEncipherment);
  LGP_CKU_DATA_ENCIPHERMENT = 1 shr Ord(ckuDataEncipherment);
  LGP_CKU_KEY_AGREEMENT     = 1 shr Ord(ckuKeyAgreement);
  LGP_CKU_KEY_CERT_SIGN     = 1 shr Ord(ckuKeyCertSign);
  LGP_CKU_CRL_SIGN          = 1 shr Ord(ckuCRLSign);
  LGP_CKU_ENCIPHER_ONLY     = 1 shr Ord(ckuEncipherOnly);
  LGP_CKU_DECIPHER_ONLY     = 1 shr Ord(ckuDecipherOnly);

function lgplVersion: LGP_UINT32; stdcall;
function lgplListDrivers(AClassType: LGP_INT32): LGP_PCHAR; stdcall;
function lgplDriverCount(AClassType: LGP_INT32): LGP_INT32; stdcall;
function lgplDriverName(AClassType, ADriverIndex: LGP_INT32): LGP_PCHAR; stdcall;
function lgplInit: LGP_INT32; stdcall;
function lgplExit: LGP_INT32; stdcall;
function lgplSetDefaultDriver(ADriverClass: LGP_INT32; ADriverName: LGP_PCHAR): LGP_INT32; stdcall;
function lgplGetDebugLevel: LGP_INT32; stdcall;
function lgplSetDebugLevel(ADebugLevel: LGP_INT32): LGP_INT32; stdcall;

function lgpHTTPClient_Create(AClassName: LGP_PCHAR; var AHttpClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpHTTPClient_GetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpHTTPClient_SetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;

function lgpRSAEncrypt_CreateKey(AClassName: LGP_PCHAR; AKeyStream: LGP_OBJECT; AFormat: LGP_INT32; var ARSAKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpCertificate_GetVersion(ACertificate: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetDisplayName(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSubject(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSubjectField(ACertificate: LGP_OBJECT; AField: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSubjectFields(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSubjectUID(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetIssuer(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetIssuerField(ACertificate: LGP_OBJECT; AField: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetIssuerFields(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetIssuerUID(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSerialNoDec(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSerialNoHex(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetValidFrom(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetValidTo(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSignature(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetKeyUsage(ACertificate: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetPublicKeyAlgorithm(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_SetPIN(ACertificate: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;

function lgpCNGCertificate_ShowCertificateInfo(ACertificate: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall;

function lgpCertificateSigner_Create(AClassName: LGP_PCHAR; var ACertSigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificateSigner_List(ACertificateSigner: LGP_OBJECT; var ACertList: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificateSigner_FindBySerialNumber(ACertificateSigner: LGP_OBJECT; ASerialNo: LGP_PCHAR; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificateSigner_UISelect(ACertificateSigner: LGP_OBJECT; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificateSigner_LoadFromStream(ACertificateSigner: LGP_OBJECT; ACertificateStream: LGP_OBJECT; ACertificateFormat: LGP_INT32;
  APrivateKeyStream: LGP_OBJECT; APrivateKeyFormat: LGP_INT32; APassword: LGP_PCHAR; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpCertificates_Create(AOwnsObjects: LGP_INT32; var ACertificates: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpCNGCertificateSigner_SetHWnd(ACertificateSigner: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall;

function lgpEncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASec, AMSec: LGP_INT32): LGP_PASDATETIME; stdcall;
procedure lgpDecodeDateTime(ADateTime: LGP_PASDATETIME; var AYear, AMonth, ADay, AHour, AMinute, ASec, AMSec: LGP_INT32); stdcall;

function lgpLoadLibXML2(AFileName: LGP_PCHAR): LGP_INT32; stdcall;

function lgpHash_Create(AClassName: LGP_PCHAR; var AHashObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpHash_Start(AHashObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpHash_HashData(AHashObject: LGP_OBJECT; AData: LGP_POINTER; ALen: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpHash_Finish(AHashObject: LGP_OBJECT; ABase64Class: LGP_PCHAR; var AResStr: LGP_OBJECT): LGP_EXCEPTION; stdcall;

var
  LGPDrivers: array[0..LGP_CLSTYPE_MAX] of String;

  LGPHttpClient: TlgHTTPClient = nil;
  LGPCertSigner: TlgCertificateSigner = nil;
  LGPXAdES: TlgXAdES = nil;
  LGPEDek: TlgEDeklaracja = nil;
  LGPJPK: TlgJPK = nil;

  LGPDebugLevel: Integer = 0;

implementation

uses
  uException, uKSeFObj, DateUtils, FileInfo, lgUtils, uKSeF2Obj
  {$IFDEF LGP_ENABLE_LIBXML2}
  , xml2dyn, lgLibXML2
  {$ENDIF}
  {$IFDEF WINDOWS}
  , winpeimagereader
  {$ENDIF}
  {$IFDEF UNIX}
  , elfreader
  {$ENDIF}
  {$IFDEF DARWIN}
  , machoreader
  {$ENDIF}
  ;

function lgplVersion: LGP_UINT32; stdcall;
var
  FVer: TFileVersionInfo;
  VerArr: array of String;
begin
  Result := 0;
  FVer := TFileVersionInfo.Create(nil);
  try
    FVer.ReadFileInfo;
    VerArr := FVer.VersionStrings.Values['FileVersion'].Split(['.',',']);
    FVer.Free;
    if Length(VerArr) >= 3 then
      Result := ((StrToIntDef(VerArr[0], 0) and $FF) shl 16) +
        ((StrToIntDef(VerArr[1], 0) and $FF) shl 8) +
        (StrToIntDef(VerArr[2], 0) and $FF);
  except
  end;
end;

function lgplListDrivers(AClassType: LGP_INT32): LGP_PCHAR; stdcall;
begin
  if (AClassType >= 0) and (AClassType <= LGP_CLSTYPE_MAX) then
  begin
    if LGPDrivers[AClassType] = '' then
      case AClassType of
        LGP_CLSTYPE_HTTP_CLIENT: LGPDrivers[AClassType] := HTTPClientClasses.GetNames;
        LGP_CLSTYPE_CERT_SIGNER: LGPDrivers[AClassType] := CertSignerClasses.GetNames;
        LGP_CLSTYPE_RAND_GENERATOR: LGPDrivers[AClassType] := RandomGeneratorClasses.GetNames;
        LGP_CLSTYPE_BASE64_ENCODER: LGPDrivers[AClassType] := Base64EncoderClasses.GetNames;
        LGP_CLSTYPE_MD5_HASH: LGPDrivers[AClassType] := MD5HashClasses.GetNames;
        LGP_CLSTYPE_SHA1_HASH: LGPDrivers[AClassType] := SHA1HashClasses.GetNames;
        LGP_CLSTYPE_SHA256_HASH: LGPDrivers[AClassType] := SHA256HashClasses.GetNames;
        LGP_CLSTYPE_AES256_ENC: LGPDrivers[AClassType] := AES256EncryptClasses.GetNames;
        LGP_CLSTYPE_RSA_ENC: LGPDrivers[AClassType] := RSAPublicKeyClasses.GetNames;
        LGP_CLSTYPE_ZIPPRE: LGPDrivers[AClassType] := ZipperClasses.GetNames;
        LGP_CLSTYPE_XML_READER: LGPDrivers[AClassType] := XMLReaderClasses.GetNames;
        LGP_CLSTYPE_XML_C14N: LGPDrivers[AClassType] := XMLCanonizatorClasses.GetNames;
        LGP_CLSTYPE_EDEK_GATE: LGPDrivers[AClassType] := EDekGateClasses.GetNames;
        LGP_CLSTYPE_XML_VALIDATOR: LGPDrivers[AClassType] := XMLValidatorClasses.GetNames;
        LGP_CLSTYPE_XML_XSLT: LGPDrivers[AClassType] := XMLXSLTClasses.GetNames;
      end;
    Result := PChar(LGPDrivers[AClassType]);
  end
  else
    Result := nil;
end;

function lgplDriverCount(AClassType: LGP_INT32): LGP_INT32; stdcall;
begin
  case AClassType of
    LGP_CLSTYPE_HTTP_CLIENT: Result := HTTPClientClasses.Count;
    LGP_CLSTYPE_CERT_SIGNER: Result := CertSignerClasses.Count;
    LGP_CLSTYPE_RAND_GENERATOR: Result := RandomGeneratorClasses.Count;
    LGP_CLSTYPE_BASE64_ENCODER: Result := Base64EncoderClasses.Count;
    LGP_CLSTYPE_MD5_HASH: Result := MD5HashClasses.Count;
    LGP_CLSTYPE_SHA1_HASH: Result := SHA1HashClasses.Count;
    LGP_CLSTYPE_SHA256_HASH: Result := SHA256HashClasses.Count;
    LGP_CLSTYPE_AES256_ENC: Result := AES256EncryptClasses.Count;
    LGP_CLSTYPE_RSA_ENC: Result := RSAPublicKeyClasses.Count;
    LGP_CLSTYPE_ZIPPRE: Result := ZipperClasses.Count;
    LGP_CLSTYPE_XML_READER: Result := XMLReaderClasses.Count;
    LGP_CLSTYPE_XML_C14N: Result := XMLCanonizatorClasses.Count;
    LGP_CLSTYPE_EDEK_GATE: Result := EDekGateClasses.Count;
    LGP_CLSTYPE_XML_VALIDATOR: Result := XMLValidatorClasses.Count;
    LGP_CLSTYPE_XML_XSLT: Result := XMLXSLTClasses.Count
    else Result := 0;
  end;
end;

function lgplDriverName(AClassType, ADriverIndex: LGP_INT32): LGP_PCHAR;
  stdcall;
var
  C: TClass = nil;
begin
  try
    case AClassType of
      LGP_CLSTYPE_HTTP_CLIENT: C := HTTPClientClasses[ADriverIndex];
      LGP_CLSTYPE_CERT_SIGNER: C := CertSignerClasses[ADriverIndex];
      LGP_CLSTYPE_RAND_GENERATOR: C := RandomGeneratorClasses[ADriverIndex];
      LGP_CLSTYPE_BASE64_ENCODER: C := Base64EncoderClasses[ADriverIndex];
      LGP_CLSTYPE_MD5_HASH: C := MD5HashClasses[ADriverIndex];
      LGP_CLSTYPE_SHA1_HASH: C := SHA1HashClasses[ADriverIndex];
      LGP_CLSTYPE_SHA256_HASH: C := SHA256HashClasses[ADriverIndex];
      LGP_CLSTYPE_AES256_ENC: C := AES256EncryptClasses[ADriverIndex];
      LGP_CLSTYPE_RSA_ENC: C := RSAPublicKeyClasses[ADriverIndex];
      LGP_CLSTYPE_ZIPPRE: C := ZipperClasses[ADriverIndex];
      LGP_CLSTYPE_XML_READER: C := XMLReaderClasses[ADriverIndex];
      LGP_CLSTYPE_XML_C14N: C := XMLCanonizatorClasses[ADriverIndex];
      LGP_CLSTYPE_EDEK_GATE: C := EDekGateClasses[ADriverIndex];
      LGP_CLSTYPE_XML_VALIDATOR: C := XMLValidatorClasses[ADriverIndex];
      LGP_CLSTYPE_XML_XSLT: C := XMLXSLTClasses[ADriverIndex];
      else C := nil;
    end;
  except
    Result := nil;
  end;
  if C <> nil then
    Result := @(PVmt(C)^.vClassName^[1])
  else
    Result := nil;
end;

function lgplInit: LGP_INT32; stdcall;
begin
  lgpInitKSeFClasses;
  lgpInitKSeF2Classes;
  {$IFDEF LGP_DEBUG_OBJ}
  lgpDbgObjectListInit;
  {$ENDIF}
  Result := 0;
end;

function lgplExit: LGP_INT32; stdcall;
begin
  //{$if declared(UseHeapTrace)}
  //DumpHeap;
  //{$endif}
  lgpFreeKSeFClasses;
  {$IFDEF LGP_ENABLE_LIBXML2}
  lgLibXml2Done;
  {$ENDIF}
  {$IFDEF LGP_DEBUG_OBJ}
  lgpDbgObjectListDone;
  {$ENDIF}
  Result := 0;
end;

function lgplSetDefaultDriver(ADriverClass: LGP_INT32; ADriverName: LGP_PCHAR
  ): LGP_INT32; stdcall;
begin
  Result := 0;
  if (ADriverClass >= 0) and (ADriverClass <= LGP_CLSTYPE_MAX) then
    case ADriverClass of
      LGP_CLSTYPE_HTTP_CLIENT: HTTPClientClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_CERT_SIGNER: CertSignerClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_RAND_GENERATOR: RandomGeneratorClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_BASE64_ENCODER: Base64EncoderClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_MD5_HASH: MD5HashClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_SHA1_HASH: SHA1HashClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_SHA256_HASH: SHA256HashClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_AES256_ENC: AES256EncryptClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_RSA_ENC: RSAPublicKeyClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_ZIPPRE: ZipperClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_XML_READER: XMLReaderClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_XML_C14N: XMLCanonizatorClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_EDEK_GATE: EDekGateClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_XML_VALIDATOR: XMLValidatorClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_XML_XSLT: XMLXSLTClasses.SetDefault(ADriverName);
    end
  else
    Result := 1;
end;

function lgplGetDebugLevel: LGP_INT32; stdcall;
begin
  Result := LGPDebugLevel;
end;

function lgplSetDebugLevel(ADebugLevel: LGP_INT32): LGP_INT32; stdcall;
begin
  LGPDebugLevel := ADebugLevel;
  RaiseMaxFrameCount := 255;
  Result := 0;
end;

function lgpHTTPClient_Create(AClassName: LGP_PCHAR; var AHttpClient: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
var
  HTTPClass: TlgHTTPClientClass;
begin
  Result := nil;
  AHttpClient := nil;
  try
    HTTPClass := HTTPClientClasses.FindByClassName(AClassName);
    if HTTPClass <> nil then
    begin
      AHttpClient := HTTPClass.Create(nil);
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgAddObject(TObject(AHttpClient));
      {$endif}
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpHTTPClient_GetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AHTTPClientObject, TlgHTTPClient);
    AValue := Integer(TlgHTTPClient(AHTTPClientObject).IgnoreSSLErrors);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpHTTPClient_SetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT;
  AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AHTTPClientObject, TlgHTTPClient);
    TlgHTTPClient(AHTTPClientObject).IgnoreSSLErrors := AValue <> 0;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpRSAEncrypt_CreateKey(AClassName: LGP_PCHAR; AKeyStream: LGP_OBJECT;
  AFormat: LGP_INT32; var ARSAKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  RSAEncClass: TlgRSAPublicKeyClass;
begin
  Result := nil;
  ARSAKey := nil;
  try
    CheckObject(AKeyStream, TStream);
    RSAEncClass := RSAPublicKeyClasses.FindByClassName(AClassName);
    if RSAEncClass <> nil then
    begin
      ARSAKey := RSAEncClass.Create(nil, TStream(AKeyStream), TlgEncodingType(AFormat));
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgAddObject(TObject(ARSAKey));
      {$endif}
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetVersion(ACertificate: LGP_OBJECT;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := Ord((TObject(ACertificate) as TlgCertificate).Version);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetDisplayName(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).DisplayName);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetSubject(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).Subject);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetSubjectField(ACertificate: LGP_OBJECT;
  AField: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).SubjectField[AField]);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetSubjectFields(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).SubjectFields.Text);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetSubjectUID(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create(BytesToHex((TObject(ACertificate) as TlgCertificate).SubjectUID));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetIssuer(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).Issuer);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetIssuerField(ACertificate: LGP_OBJECT;
  AField: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).IssuerField[AField]);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetIssuerFields(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).IssuerFields.Text);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetIssuerUID(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create(BytesToHex((TObject(ACertificate) as TlgCertificate).IssuerUID));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetSerialNoDec(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).SerialNoDec);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetSerialNoHex(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).SerialNoHex);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetValidFrom(ACertificate: LGP_OBJECT;
  var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := (TObject(ACertificate) as TlgCertificate).ValidFrom;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetValidTo(ACertificate: LGP_OBJECT;
  var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := (TObject(ACertificate) as TlgCertificate).ValidTo;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetSignature(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).Signature);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetKeyUsage(ACertificate: LGP_OBJECT;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := 0;
    with TObject(ACertificate) as TlgCertificate do
    begin
      if ckuDigitalSignature in KeyUsage then
        AValue := AValue or LGP_CKU_DIGITAL_SIGNATURE;
      if ckuNonRepudiation in KeyUsage then
        AValue := AValue or LGP_CKU_NON_REPUDIATION;
      if ckuKeyEncipherment in KeyUsage then
        AValue := AValue or LGP_CKU_KEY_ENCIPHERMENT;
      if ckuDataEncipherment in KeyUsage then
        AValue := AValue or LGP_CKU_DATA_ENCIPHERMENT;
      if ckuKeyAgreement in KeyUsage then
        AValue := AValue or LGP_CKU_KEY_AGREEMENT;
      if ckuKeyCertSign in KeyUsage then
        AValue := AValue or LGP_CKU_KEY_CERT_SIGN;
      if ckuCRLSign in KeyUsage then
        AValue := AValue or LGP_CKU_CRL_SIGN;
      if ckuEncipherOnly in KeyUsage then
        AValue := AValue or LGP_CKU_ENCIPHER_ONLY;
      if ckuDecipherOnly in KeyUsage then
        AValue := AValue or LGP_CKU_DECIPHER_ONLY;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_GetPublicKeyAlgorithm(ACertificate: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    AValue := TStringObject.Create((TObject(ACertificate) as TlgCertificate).PublicKeyAlgorithm);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificate_SetPIN(ACertificate: LGP_OBJECT; AValue: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ACertificate, TlgCertificate);
    (TObject(ACertificate) as TlgCertificate).PIN := AValue;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCNGCertificate_ShowCertificateInfo(ACertificate: LGP_OBJECT;
  AHWnd: THandle): LGP_EXCEPTION; stdcall;
begin
  {$IFDEF LGP_ENABLE_WINCNG}
  Result := nil;
  try
    CheckObject(ACertificate, TlgCNGCertificate);
    TlgCNGCertificate(ACertificate).ShowCertificateInfo(AHWnd);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
  {$ELSE}
  Result := lgpCreateExceptioObject('Brak obsługi WinCNG');
  {$ENDIF}
end;

function lgpCertificateSigner_Create(AClassName: LGP_PCHAR;
  var ACertSigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  CertSignerClass: TlgCertificateSignerClass;
begin
  Result := nil;
  ACertSigner := nil;
  try
    CertSignerClass := CertSignerClasses.FindByClassName(AClassName);
    if CertSignerClass <> nil then
    begin
      ACertSigner := CertSignerClass.Create(nil);
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgAddObject(TObject(ACertSigner));
      {$endif}
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificateSigner_List(ACertificateSigner: LGP_OBJECT;
  var ACertList: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ACertList := nil;
  try
    CheckObject(ACertificateSigner, TlgCertificateSigner);
    ACertList := (TObject(ACertificateSigner) as TlgCertificateSigner).List;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificateSigner_FindBySerialNumber(
  ACertificateSigner: LGP_OBJECT; ASerialNo: LGP_PCHAR;
  var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ACertificate := nil;
  try
    CheckObject(ACertificateSigner, TlgCertificateSigner);
    ACertificate := (TObject(ACertificateSigner) as TlgCertificateSigner).FindBySerialNumber(ASerialNo);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificateSigner_UISelect(ACertificateSigner: LGP_OBJECT;
  var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ACertificate := nil;
  try
    CheckObject(ACertificateSigner, TlgCertificateSigner);
    ACertificate := (TObject(ACertificateSigner) as TlgCertificateSigner).UISelect;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificateSigner_LoadFromStream(ACertificateSigner: LGP_OBJECT;
  ACertificateStream: LGP_OBJECT; ACertificateFormat: LGP_INT32;
  APrivateKeyStream: LGP_OBJECT; APrivateKeyFormat: LGP_INT32;
  APassword: LGP_PCHAR; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ACertificate := nil;
  try
    CheckObject(ACertificateSigner, TlgCertificateSigner);
    CheckObject(ACertificateStream, TStream);
    if APrivateKeyStream <> nil then
      CheckObject(APrivateKeyStream, TStream);
    ACertificate := (TObject(ACertificateSigner) as TlgCertificateSigner).LoadFromStream(TStream(ACertificateStream),
      TlgEncodingType(ACertificateFormat), TStream(APrivateKeyStream), TlgEncodingType(APrivateKeyFormat),
      APassword);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCertificates_Create(AOwnsObjects: LGP_INT32;
  var ACertificates: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ACertificates := nil;
  try
    ACertificates := TlgCertificates.Create(AOwnsObjects <> 0);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpCNGCertificateSigner_SetHWnd(ACertificateSigner: LGP_OBJECT;
  AHWnd: THandle): LGP_EXCEPTION; stdcall;
begin
  {$IFDEF LGP_ENABLE_WINCNG}
  Result := nil;
  try
    CheckObject(ACertificateSigner, TlgCNGCertificateSigner);
    (TObject(ACertificateSigner) as TlgCNGCertificateSigner).HWnd := AHWnd;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
  {$ELSE}
  Result := lgpCreateExceptioObject('Brak obsługi WinCNG');
  {$ENDIF}
end;

function lgpEncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASec,
  AMSec: LGP_INT32): LGP_PASDATETIME; stdcall;
begin
  if not TryEncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASec, AMSec, Result) then
    Result := 0;
end;

procedure lgpDecodeDateTime(ADateTime: LGP_PASDATETIME; var AYear, AMonth, ADay,
  AHour, AMinute, ASec, AMSec: LGP_INT32); stdcall;
var
  WYear, WMonth, WDay, WHour, WMinute, WSec, WMSec: Word;
begin
  DecodeDateTime(ADateTime, WYear, WMonth, WDay, WHour, WMinute, WSec, WMSec);
  AYear := WYear;
  AMonth := WMonth;
  ADay := WDay;
  AHour := WHour;
  AMinute := WMinute;
  ASec := WSec;
  AMSec := WMSec;
end;

function lgpLoadLibXML2(AFileName: LGP_PCHAR): LGP_INT32; stdcall;
begin
  {$IFDEF LGP_ENABLE_LIBXML2}
  try
    Result := LGP_INT32(LoadLibXML(AFileName));
  except
    Result := 0;
  end;
  {$ELSE}
  Result := 0;
  {$ENDIF}
end;

function lgpHash_Create(AClassName: LGP_PCHAR; var AHashObject: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
var
  HashClass: TlgHashClass;
begin
  Result := nil;
  AHashObject := nil;
  try
    HashClass := SHA256HashClasses.FindByClassName(AClassName);
    if HashClass = nil then
      HashClass := SHA1HashClasses.FindByClassName(AClassName);
    if HashClass = nil then
      HashClass := MD5HashClasses.FindByClassName(AClassName);
    if HashClass <> nil then
    begin
      AHashObject := HashClass.Create;
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgAddObject(TObject(AHashObject));
      {$endif}
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpHash_Start(AHashObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AHashObject, TlgHash);
    (TObject(AHashObject) as TlgHash).Start;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpHash_HashData(AHashObject: LGP_OBJECT; AData: LGP_POINTER;
  ALen: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AHashObject, TlgHash);
    (TObject(AHashObject) as TlgHash).HashData(AData^, ALen);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpHash_Finish(AHashObject: LGP_OBJECT; ABase64Class: LGP_PCHAR;
  var AResStr: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Base64EncClass: TlgBase64EncoderClass = nil;
begin
  Result := nil;
  AResStr := nil;
  try
    CheckObject(AHashObject, TlgHash);
    if ABase64Class <> '' then
      Base64EncClass := Base64EncoderClasses.FindByClassName(ABase64Class);
    if (Base64EncClass = nil) and (Base64EncoderClasses.Count > 0) then
      Base64EncClass := Base64EncoderClasses[0];
    if Base64EncClass <> nil then
      AResStr := TStringObject.Create(Base64EncClass.EncodeBytes((TObject(AHashObject) as TlgHash).Finish));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

end.

