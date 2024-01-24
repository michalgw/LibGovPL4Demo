{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uJPK;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uTypes, uException, uObject, uStream, lgJPK, lgBackend, lgXAdES;

function lgpJPK_Create(ABase64EncoderClass, AAES256EncryptClass, AMD5HashClass, ASHA256HashClass, AZipperClass, ARSAEncryptClass, ARandomGeneratorClass, AXMLReaderClass: LGP_PCHAR; var AJPKObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpJPK_GetBase64EncoderClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpJPK_SetBase64EncoderClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpJPK_GetAES256EncryptClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpJPK_SetAES256EncryptClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpJPK_GetMD5HashClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpJPK_SetMD5HashClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpJPK_GetSHA256HashClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpJPK_SetSHA256HashClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpJPK_GetZipperClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpJPK_SetZipperClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpJPK_GetRSAEncryptClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpJPK_SetRSAEncryptClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpJPK_GetRandomGeneratorClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpJPK_SetRandomGeneratorClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpJPK_GetXMLReaderClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
function lgpJPK_SetXMLReaderClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;

function lgpJPK_GetRSAKeyProd(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_SetRSAKeyProd(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_GetRSAKeyTest(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_SetRSAKeyTest(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_GetXAdES(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_SetXAdES(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_GetHTTPClient(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_SetHTTPClient(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpJPK_SignCerificate(AJPKObj: LGP_OBJECT; ACertificate: LGP_OBJECT; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_SignCerificateStream(AJPKObj: LGP_OBJECT; ACertificate: LGP_OBJECT; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_SignDataAuth(AJPKObj: LGP_OBJECT; ANIP, AImiePierwsze, ANazwisko: LGP_PCHAR; ADataUrodzenia: LGP_DOUBLE; AKwota: LGP_CURRENCY; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_SignDataAuthStream(AJPKObj: LGP_OBJECT; ANIP, AImiePierwsze, ANazwisko: LGP_PCHAR; ADataUrodzenia: LGP_DOUBLE; AKwota: LGP_CURRENCY; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_Send(AJPKObj: LGP_OBJECT; AInitUpload: LGP_PCHAR; AEncryptedData: LGP_OBJECT; var ARefNo: LGP_OBJECT; AGateType: LGP_INT32; AVerifySign: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpJPK_SendStream(AJPKObj: LGP_OBJECT; AInitUpload: LGP_OBJECT; AEncryptedData: LGP_OBJECT; var ARefNo: LGP_OBJECT; AGateType: LGP_INT32; AVerifySign: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpJPK_RequestUPO(AJPKObj: LGP_OBJECT; ARefNo: LGP_PCHAR; AGateType: LGP_INT32; var AStatus: LGP_INT32; var AStatusDesc, ADetails, AUPO, ATimeStamp: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpJPK_RequestUPOStream(AJPKObj: LGP_OBJECT; ARefNo: LGP_PCHAR; AGateType: LGP_INT32; var AStatus: LGP_INT32; var AStatusDesc, ADetails, ATimeStamp: LGP_OBJECT; AUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall;

implementation

function lgpJPK_Create(ABase64EncoderClass, AAES256EncryptClass, AMD5HashClass,
  ASHA256HashClass, AZipperClass, ARSAEncryptClass, ARandomGeneratorClass,
  AXMLReaderClass: LGP_PCHAR; var AJPKObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AJPKObj := nil;
  try
    AJPKObj := TlgJPK.Create(nil);
    with TlgJPK(AJPKObj) do
    begin
      Base64EncoderClass := Base64EncoderClasses.FindByClassName(ABase64EncoderClass);
      AES256EncryptClass := AES256EncryptClasses.FindByClassName(AAES256EncryptClass);
      MD5HashClass := MD5HashClasses.FindByClassName(AMD5HashClass);
      SHA256HashClass := SHA256HashClasses.FindByClassName(ASHA256HashClass);
      ZipperClass := ZipperClasses.FindByClassName(AZipperClass);
      RSAEncryptClass := RSAEncryptClasses.FindByClassName(ARSAEncryptClass);
      RandomGeneratorClass := RandomGeneratorClasses.FindByClassName(ARandomGeneratorClass) ;
      XMLReaderClass := XMLReaderClasses.FindByClassName(AXMLReaderClass);
    end;
    {$ifdef LGP_DEBUG_OBJ}
    lgpDbgAddObject(TObject(AJPKObj));
    {$endif}
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_GetBase64EncoderClass(AJPKObj: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if Base64EncoderClass <> nil then
        AClassName := PVmt(Base64EncoderClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetBase64EncoderClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
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

function lgpJPK_GetAES256EncryptClass(AJPKObj: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if AES256EncryptClass <> nil then
        AClassName := PVmt(AES256EncryptClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetAES256EncryptClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
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

function lgpJPK_GetMD5HashClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if MD5HashClass <> nil then
        AClassName := PVmt(MD5HashClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetMD5HashClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if AClassName = '' then
        MD5HashClass := nil
      else
        MD5HashClass := MD5HashClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_GetSHA256HashClass(AJPKObj: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if SHA256HashClass <> nil then
        AClassName := PVmt(SHA256HashClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetSHA256HashClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
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

function lgpJPK_GetZipperClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if ZipperClass <> nil then
        AClassName := PVmt(ZipperClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetZipperClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if AClassName = '' then
        ZipperClass := nil
      else
        ZipperClass := ZipperClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_GetRSAEncryptClass(AJPKObj: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if RSAEncryptClass <> nil then
        AClassName := PVmt(RSAEncryptClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetRSAEncryptClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if AClassName = '' then
        RSAEncryptClass := nil
      else
        RSAEncryptClass := RSAEncryptClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_GetRandomGeneratorClass(AJPKObj: LGP_OBJECT;
  var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if RandomGeneratorClass <> nil then
        AClassName := PVmt(RandomGeneratorClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetRandomGeneratorClass(AJPKObj: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
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

function lgpJPK_GetXMLReaderClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if XMLReaderClass <> nil then
        AClassName := PVmt(XMLReaderClass.ClassType)^.vClassName;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetXMLReaderClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    with TObject(AJPKObj) as TlgJPK do
    begin
      if AClassName = '' then
        XMLReaderClass := nil
      else
        XMLReaderClass := XMLReaderClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_GetRSAKeyProd(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AObject := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    AObject := (TObject(AJPKObj) as TlgJPK).RSAKeyProd;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetRSAKeyProd(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(AObject, TlgRSAKey);
    (TObject(AJPKObj) as TlgJPK).RSAKeyProd := TlgRSAKey(AObject);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_GetRSAKeyTest(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AObject := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    AObject := (TObject(AJPKObj) as TlgJPK).RSAKeyTest;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetRSAKeyTest(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(AObject, TlgRSAKey);
    (TObject(AJPKObj) as TlgJPK).RSAKeyTest := TlgRSAKey(AObject);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_GetXAdES(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AObject := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    AObject := (TObject(AJPKObj) as TlgJPK).XAdES;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetXAdES(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(AObject, TlgXAdES);
    (TObject(AJPKObj) as TlgJPK).XAdES := TlgXAdES(AObject);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_GetHTTPClient(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AObject := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    AObject := (TObject(AJPKObj) as TlgJPK).HTTPClient;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SetHTTPClient(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(AObject, TlgHTTPClient);
    (TObject(AJPKObj) as TlgJPK).HTTPClient := TlgHTTPClient(AObject);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SignCerificate(AJPKObj: LGP_OBJECT; ACertificate: LGP_OBJECT;
  AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream,
  AOutputStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
var
  JI: TlgJPKItem;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(ACertificate, TlgCertificate);
    CheckObject(AInputStream, TStream);
    CheckObject(AOutputStream, TStream);

    JI.Clear;
    JI.InputStream := TStream(AInputStream);
    JI.EncryptedStream := TStream(AOutputStream);
    JI.GateType := TlgEDekGateType(AGateType);
    JI.Certificate := TlgCertificate(ACertificate);
    JI.AdHoc := AAdHoc <> 0;

    TlgJPK(AJPKObj).Sign(JI);
    AInitUpload := TStringObject.Create(JI.InitUploadSigned);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SignCerificateStream(AJPKObj: LGP_OBJECT;
  ACertificate: LGP_OBJECT; AGateType: LGP_INT32; AAdHoc: LGP_INT32;
  AInputStream, AOutputStream: LGP_OBJECT; AInitUpload: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
var
  JI: TlgJPKItem;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(ACertificate, TlgCertificate);
    CheckObject(AInputStream, TStream);
    CheckObject(AOutputStream, TStream);
    CheckObject(AInitUpload, TStream);

    JI.Clear;
    JI.InputStream := TStream(AInputStream);
    JI.EncryptedStream := TStream(AOutputStream);
    JI.GateType := TlgEDekGateType(AGateType);
    JI.Certificate := TlgCertificate(ACertificate);
    JI.AdHoc := AAdHoc <> 0;

    TlgJPK(AJPKObj).Sign(JI);
    if JI.InitUploadSigned <> '' then
      TStream(AInitUpload).Write(JI.InitUploadSigned[1], Length(JI.InitUploadSigned));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SignDataAuth(AJPKObj: LGP_OBJECT; ANIP, AImiePierwsze,
  ANazwisko: LGP_PCHAR; ADataUrodzenia: LGP_DOUBLE; AKwota: LGP_CURRENCY;
  AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream,
  AOutputStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
var
  JI: TlgJPKItem;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(AInputStream, TStream);
    CheckObject(AOutputStream, TStream);

    JI.Clear;
    JI.InputStream := TStream(AInputStream);
    JI.EncryptedStream := TStream(AOutputStream);
    JI.GateType := TlgEDekGateType(AGateType);
    JI.NIP := ANIP;
    JI.ImiePierwsze := AImiePierwsze;
    JI.Nazwisko := ANazwisko;
    JI.DataUrodzenia := ADataUrodzenia;
    JI.Kwota := AKwota;
    JI.AdHoc := AAdHoc <> 0;

    TlgJPK(AJPKObj).Sign(JI);
    AInitUpload := TStringObject.Create(JI.InitUploadSigned);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SignDataAuthStream(AJPKObj: LGP_OBJECT; ANIP, AImiePierwsze,
  ANazwisko: LGP_PCHAR; ADataUrodzenia: LGP_DOUBLE; AKwota: LGP_CURRENCY;
  AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream,
  AOutputStream: LGP_OBJECT; AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  JI: TlgJPKItem;
begin
  Result := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(AInputStream, TStream);
    CheckObject(AOutputStream, TStream);
    CheckObject(AInitUpload, TStream);

    JI.Clear;
    JI.InputStream := TStream(AInputStream);
    JI.EncryptedStream := TStream(AOutputStream);
    JI.GateType := TlgEDekGateType(AGateType);
    JI.NIP := ANIP;
    JI.ImiePierwsze := AImiePierwsze;
    JI.Nazwisko := ANazwisko;
    JI.DataUrodzenia := ADataUrodzenia;
    JI.Kwota := AKwota;
    JI.AdHoc := AAdHoc <> 0;

    TlgJPK(AJPKObj).Sign(JI);
    if JI.InitUploadSigned <> '' then
      TStream(AInitUpload).Write(JI.InitUploadSigned[1], Length(JI.InitUploadSigned));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_Send(AJPKObj: LGP_OBJECT; AInitUpload: LGP_PCHAR;
  AEncryptedData: LGP_OBJECT; var ARefNo: LGP_OBJECT; AGateType: LGP_INT32;
  AVerifySign: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  S: String;
begin
  Result := nil;
  ARefNo := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(AEncryptedData, TStream);

    TlgJPK(AJPKObj).Send(AInitUpload, TStream(AEncryptedData), S, TlgEDekGateType(AGateType), AVerifySign <> 0);
    ARefNo := TStringObject.Create(S);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_SendStream(AJPKObj: LGP_OBJECT; AInitUpload: LGP_OBJECT;
  AEncryptedData: LGP_OBJECT; var ARefNo: LGP_OBJECT; AGateType: LGP_INT32;
  AVerifySign: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  RefNo, InitUp: String;
begin
  Result := nil;
  ARefNo := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(AEncryptedData, TStream);
    CheckObject(AInitUpload, TStream);

    SetLength(InitUp, TStream(AInitUpload).Size);
    TStream(AInitUpload).Read(InitUp[1], TStream(AInitUpload).Size);

    TlgJPK(AJPKObj).Send(InitUp, TStream(AEncryptedData), RefNo, TlgEDekGateType(AGateType), AVerifySign <> 0);
    ARefNo := TStringObject.Create(RefNo);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_RequestUPO(AJPKObj: LGP_OBJECT; ARefNo: LGP_PCHAR;
  AGateType: LGP_INT32; var AStatus: LGP_INT32; var AStatusDesc, ADetails,
  AUPO, ATimeStamp: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Desc, Details, UPO, Timestamp: String;
begin
  Result := nil;
  AStatusDesc := nil;
  ADetails := nil;
  AUPO := nil;
  ATimeStamp := nil;
  try
    CheckObject(AJPKObj, TlgJPK);

    AStatus := TlgJPK(AJPKObj).RequestUPO(ARefNo, TlgEDekGateType(AGateType),
      Desc, Details, UPO, Timestamp);

    if Desc <> '' then
      AStatusDesc := TStringObject.Create(Desc);
    if Details <> '' then
      ADetails := TStringObject.Create(Details);
    if UPO <> '' then
      AUPO := TStringObject.Create(UPO);
    if Timestamp <> '' then
      ATimeStamp := TStringObject.Create(Timestamp);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpJPK_RequestUPOStream(AJPKObj: LGP_OBJECT; ARefNo: LGP_PCHAR;
  AGateType: LGP_INT32; var AStatus: LGP_INT32; var AStatusDesc, ADetails,
  ATimeStamp: LGP_OBJECT; AUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Desc, Details, UPO, Timestamp: String;
begin
  Result := nil;
  AStatusDesc := nil;
  ADetails := nil;
  ATimeStamp := nil;
  try
    CheckObject(AJPKObj, TlgJPK);
    CheckObject(AUPO, TStream);

    AStatus := TlgJPK(AJPKObj).RequestUPO(ARefNo, TlgEDekGateType(AGateType),
      Desc, Details, UPO, Timestamp);

    if Desc <> '' then
      AStatusDesc := TStringObject.Create(Desc);
    if Details <> '' then
      ADetails := TStringObject.Create(Details);
    if UPO <> '' then
      TStream(AUPO).Write(UPO[1], Length(UPO));
    if Timestamp <> '' then
      ATimeStamp := TStringObject.Create(Timestamp);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

end.

