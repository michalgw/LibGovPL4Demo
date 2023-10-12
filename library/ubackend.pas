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
  Classes, SysUtils, uTypes, uObject, lgBackend, lgXAdES, lgEDeklaracja, lgJPK,
  lgCNG;

function lgplVersion: LGP_UINT32;
function lgplListDrivers(AClassType: LGP_INT32): LGP_PCHAR;
function lgplInit: LGP_INT32;
function lgpExit: LGP_INT32;
function lgplSetDefaultDriver(ADriverClass: LGP_INT32; ADriverName: LGP_PCHAR): LGP_INT32;

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


var
  LGPDrivers: array[0..LGP_CLSTYPE_MAX] of String;
  LGPDefaultDrivers: array[0..LGP_CLSTYPE_MAX] of TClass;

  LGPHttpClient: TlgHTTPClient = nil;
  LGPCertSigner: TlgCertificateSigner = nil;
  LGPXAdES: TlgXAdES = nil;
  LGPEDek: TlgEDeklaracja = nil;
  LGPJPK: TlgJPK = nil;

implementation

uses
  uStream, uException, uKSeFObj;

function lgplVersion: LGP_UINT32;
begin
  Result := $040000;
end;

function lgplListDrivers(AClassType: LGP_INT32): LGP_PCHAR;
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

function lgplInit: LGP_INT32;
var
  I: Integer;
begin
  //{$if declared(UseHeapTrace)}
  //SetHeapTraceOutput('Trace.log');
  //{$endif}
  for I := 0 to LGP_CLSTYPE_MAX do
    case I of
      LGP_CLSTYPE_HTTP_CLIENT: LGPDefaultDrivers[I] := HTTPClientClasses.FindByClassName('');
      LGP_CLSTYPE_CERT_SIGNER: LGPDefaultDrivers[I] := CertSignerClasses.FindByClassName('');
      LGP_CLSTYPE_RAND_GENERATOR: LGPDefaultDrivers[I] := RandomGeneratorClasses.FindByClassName('');
      LGP_CLSTYPE_BASE64_ENCODER: LGPDefaultDrivers[I] := Base64EncoderClasses.FindByClassName('');
      LGP_CLSTYPE_MD5_HASH: LGPDefaultDrivers[I] := MD5HashClasses.FindByClassName('');
      LGP_CLSTYPE_SHA1_HASH: LGPDefaultDrivers[I] := SHA1HashClasses.FindByClassName('');
      LGP_CLSTYPE_SHA256_HASH: LGPDefaultDrivers[I] := SHA256HashClasses.FindByClassName('');
      LGP_CLSTYPE_AES256_ENC: LGPDefaultDrivers[I] := AES256EncryptClasses.FindByClassName('');
      LGP_CLSTYPE_RSA_ENC: LGPDefaultDrivers[I] := RSAEncryptClasses.FindByClassName('');
      LGP_CLSTYPE_ZIPPRE: LGPDefaultDrivers[I] := ZipperClasses.FindByClassName('');
      LGP_CLSTYPE_XML_READER: LGPDefaultDrivers[I] := XMLReaderClasses.FindByClassName('');
      LGP_CLSTYPE_XML_C14N: LGPDefaultDrivers[I] := XMLCanonizatorClasses.FindByClassName('');
      LGP_CLSTYPE_EDEK_GATE: LGPDefaultDrivers[I] := EDekGateClasses.FindByClassName('');
    end;
  Result := 0;
  lgpInitKSeFClasses;
end;

function lgpExit: LGP_INT32;
begin
  //{$if declared(UseHeapTrace)}
  //DumpHeap;
  //{$endif}
  lgpFreeKSeFClasses;
  Result := 0;
end;

function lgplSetDefaultDriver(ADriverClass: LGP_INT32; ADriverName: LGP_PCHAR
  ): LGP_INT32;
begin
  Result := 0;
  if (ADriverClass >= 0) and (ADriverClass <= LGP_CLSTYPE_MAX) then
    case ADriverClass of
      LGP_CLSTYPE_HTTP_CLIENT: LGPDefaultDrivers[ADriverClass] := HTTPClientClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_CERT_SIGNER: LGPDefaultDrivers[ADriverClass] := CertSignerClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_RAND_GENERATOR: LGPDefaultDrivers[ADriverClass] := RandomGeneratorClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_BASE64_ENCODER: LGPDefaultDrivers[ADriverClass] := Base64EncoderClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_MD5_HASH: LGPDefaultDrivers[ADriverClass] := MD5HashClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_SHA1_HASH: LGPDefaultDrivers[ADriverClass] := SHA1HashClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_SHA256_HASH: LGPDefaultDrivers[ADriverClass] := SHA256HashClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_AES256_ENC: LGPDefaultDrivers[ADriverClass] := AES256EncryptClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_RSA_ENC: LGPDefaultDrivers[ADriverClass] := RSAEncryptClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_ZIPPRE: LGPDefaultDrivers[ADriverClass] := ZipperClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_XML_READER: LGPDefaultDrivers[ADriverClass] := XMLReaderClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_XML_C14N: LGPDefaultDrivers[ADriverClass] := XMLCanonizatorClasses.FindByClassName(ADriverName);
      LGP_CLSTYPE_EDEK_GATE: LGPDefaultDrivers[ADriverClass] := EDekGateClasses.FindByClassName(ADriverName);
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
    CheckObject(AKeyStream, TlgpStream);
    RSAEncClass := RSAEncryptClasses.FindByClassName(AClassName);
    if RSAEncClass <> nil then
      ARSAKey := RSAEncClass.CreateKey(TlgpStream(AKeyStream));
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
  Result := nil;
  try
    CheckObject(ACertificate, TlgCNGCertificate);
    TlgCNGCertificate(ACertificate).ShowCertificateInfo(AHWnd);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
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
  Result := nil;
  try
    CheckObject(ACertificateSigner, TlgCNGCertificateSigner);
    (TObject(ACertificateSigner) as TlgCNGCertificateSigner).HWnd := AHWnd;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

end.

