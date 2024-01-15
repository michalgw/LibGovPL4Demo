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
  LGP_VERSION_NUMBER = $040004;

function lgplVersion: LGP_UINT32; stdcall;
function lgplListDrivers(AClassType: LGP_INT32): LGP_PCHAR; stdcall;
function lgplDriverCount(AClassType: LGP_INT32): LGP_INT32; stdcall;
function lgplDriverName(AClassType, ADriverIndex: LGP_INT32): LGP_PCHAR; stdcall;
function lgplInit: LGP_INT32; stdcall;
function lgplExit: LGP_INT32; stdcall;
function lgplSetDefaultDriver(ADriverClass: LGP_INT32; ADriverName: LGP_PCHAR): LGP_INT32; stdcall;

function lgpHTTPClient_Create(AClassName: LGP_PCHAR; var AHttpClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpHTTPClient_GetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpHTTPClient_SetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;

function lgpRSAEncrypt_CreateKey(AClassName: LGP_PCHAR; AKeyStream: LGP_OBJECT; var ARSAKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpCertificate_GetDisplayName(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSubject(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetIssuer(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSerialNoDec(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetSerialNoHex(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetValidFrom(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
function lgpCertificate_GetValidTo(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;

function lgpCNGCertificate_ShowCertificateInfo(ACertificate: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall;

function lgpCertificateSigner_Create(AClassName: LGP_PCHAR; var ACertSigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificateSigner_List(ACertificateSigner: LGP_OBJECT; var ACertList: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificateSigner_FindBySerialNumber(ACertificateSigner: LGP_OBJECT; ASerialNo: LGP_PCHAR; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpCertificateSigner_UISelect(ACertificateSigner: LGP_OBJECT; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpCNGCertificateSigner_SetHWnd(ACertificateSigner: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall;

function lgpEncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASec, AMSec: LGP_INT32): LGP_PASDATETIME; stdcall;
procedure lgpDecodeDateTime(ADateTime: LGP_PASDATETIME; var AYear, AMonth, ADay, AHour, AMinute, ASec, AMSec: LGP_INT32); stdcall;

function lgpLoadLibXML2(AFileName: LGP_PCHAR): LGP_INT32; stdcall;

var
  LGPDrivers: array[0..LGP_CLSTYPE_MAX] of String;

  LGPHttpClient: TlgHTTPClient = nil;
  LGPCertSigner: TlgCertificateSigner = nil;
  LGPXAdES: TlgXAdES = nil;
  LGPEDek: TlgEDeklaracja = nil;
  LGPJPK: TlgJPK = nil;

implementation

uses
  uException, uKSeFObj, DateUtils
  {$IFDEF LGP_ENABLE_LIBXML2}
  , xml2dyn
  {$ENDIF}
  ;

function lgplVersion: LGP_UINT32; stdcall;
begin
  Result := LGP_VERSION_NUMBER;
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
        LGP_CLSTYPE_RSA_ENC: LGPDrivers[AClassType] := RSAEncryptClasses.GetNames;
        LGP_CLSTYPE_ZIPPRE: LGPDrivers[AClassType] := ZipperClasses.GetNames;
        LGP_CLSTYPE_XML_READER: LGPDrivers[AClassType] := XMLReaderClasses.GetNames;
        LGP_CLSTYPE_XML_C14N: LGPDrivers[AClassType] := XMLCanonizatorClasses.GetNames;
        LGP_CLSTYPE_EDEK_GATE: LGPDrivers[AClassType] := EDekGateClasses.GetNames;
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
    LGP_CLSTYPE_RSA_ENC: Result := RSAEncryptClasses.Count;
    LGP_CLSTYPE_ZIPPRE: Result := ZipperClasses.Count;
    LGP_CLSTYPE_XML_READER: Result := XMLReaderClasses.Count;
    LGP_CLSTYPE_XML_C14N: Result := XMLCanonizatorClasses.Count;
    LGP_CLSTYPE_EDEK_GATE: Result := EDekGateClasses.Count;
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
      LGP_CLSTYPE_RSA_ENC: C := RSAEncryptClasses[ADriverIndex];
      LGP_CLSTYPE_ZIPPRE: C := ZipperClasses[ADriverIndex];
      LGP_CLSTYPE_XML_READER: C := XMLReaderClasses[ADriverIndex];
      LGP_CLSTYPE_XML_C14N: C := XMLCanonizatorClasses[ADriverIndex];
      LGP_CLSTYPE_EDEK_GATE: C := EDekGateClasses[ADriverIndex];
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
  Result := 0;
end;

function lgplExit: LGP_INT32; stdcall;
begin
  //{$if declared(UseHeapTrace)}
  //DumpHeap;
  //{$endif}
  lgpFreeKSeFClasses;
  {$IFDEF LGP_ENABLE_LIBXML2}
  if libXmlHandle <> 0 then
    xmlCleanupParser();
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
      LGP_CLSTYPE_RSA_ENC: RSAEncryptClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_ZIPPRE: ZipperClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_XML_READER: XMLReaderClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_XML_C14N: XMLCanonizatorClasses.SetDefault(ADriverName);
      LGP_CLSTYPE_EDEK_GATE: EDekGateClasses.SetDefault(ADriverName);
    end
  else
    Result := 1;
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
      AHttpClient := HTTPClass.Create;
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
  var ARSAKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  RSAEncClass: TlgRSAEncryptClass;
begin
  Result := nil;
  ARSAKey := nil;
  try
    CheckObject(AKeyStream, TStream);
    RSAEncClass := RSAEncryptClasses.FindByClassName(AClassName);
    if RSAEncClass <> nil then
      ARSAKey := RSAEncClass.CreateKey(TStream(AKeyStream));
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
      ACertSigner := CertSignerClass.Create(nil);
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

end.

