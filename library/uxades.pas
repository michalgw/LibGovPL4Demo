{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uXAdES;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uTypes, lgXAdES, lgBackend, uObject, uException;

const
  LGP_XADES_SiGNTYPE_SHA1 = 0;
  LGP_XADES_SiGNTYPE_SHA256 = 1;
  LGP_XADES_SERIALNOFMT_DEC = 0;
  LGP_XADES_SERIALNOFMT_HEX = 1;

function lgpXAdES_Create(ASHA1HashClass, ASHA256HashClass, ABase64EncoderClass: LGP_PCHAR;
  ASigner: LGP_OBJECT; var AXAdESObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXAdES_GetSHA1HashClass(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpXAdES_SetSHA1HashClass(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpXAdES_GetSHA256HashClass(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpXAdES_SetSHA256HashClass(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpXAdES_GetBase64EncoderClass(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpXAdES_SetBase64EncoderClass(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpXAdES_GetSigner(AXAdESObject: LGP_OBJECT; var ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXAdES_SetSigner(AXAdESObject: LGP_OBJECT; ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXAdES_GetSignType(AXAdESObject: LGP_OBJECT; var ASignType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpXAdES_SetSignType(AXAdESObject: LGP_OBJECT; ASignType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpXAdES_GetSerialNoFormat(AXAdESObject: LGP_OBJECT; var ASerialNoFormat: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpXAdES_SetSerialNoFormat(AXAdESObject: LGP_OBJECT; ASerialNoFormat: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpXAdES_GetIncludeSigningTime(AXAdESObject: LGP_OBJECT; var AIncludeSigningTime: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpXAdES_SetIncludeSigningTime(AXAdESObject: LGP_OBJECT; AIncludeSigningTime: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpXAdES_GetSigningTime(AXAdESObject: LGP_OBJECT; var ASigningTime: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
function lgpXAdES_SetSigningTime(AXAdESObject: LGP_OBJECT; ASigningTime: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;

implementation

function lgpXAdES_Create(ASHA1HashClass, ASHA256HashClass,
  ABase64EncoderClass: LGP_PCHAR; ASigner: LGP_OBJECT;
  var AXAdESObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AXAdESObject := nil;
  try
    AXAdESObject := TlgXAdES.Create(nil);
    with TObject(AXAdESObject) as TlgXAdES do
    begin
      SHA1HashClass := SHA1HashClasses.FindByClassName(ASHA1HashClass);
      SHA256HashClass := SHA256HashClasses.FindByClassName(ASHA256HashClass);
      Base64EncoderClass := Base64EncoderClasses.FindByClassName(ABase64EncoderClass);
      if ValidObject(ASigner, TlgCertificateSigner) then
        Signer := TlgCertificateSigner(ASigner);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_GetSHA1HashClass(AXAdESObject: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    with TObject(AXAdESObject) as TlgXAdES do
    begin
      if SHA1HashClass <> nil then
        AClassName := @(PVmt(SHA1HashClass.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_SetSHA1HashClass(AXAdESObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    with TObject(AXAdESObject) as TlgXAdES do
    begin
      if AClassName = nil then
        SHA1HashClass := nil
      else
        SHA1HashClass := SHA1HashClasses.FindByClassName(AClassName);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_GetSHA256HashClass(AXAdESObject: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    with TObject(AXAdESObject) as TlgXAdES do
    begin
      if SHA256HashClass <> nil then
        AClassName := @(PVmt(SHA256HashClass.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_SetSHA256HashClass(AXAdESObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    with TObject(AXAdESObject) as TlgXAdES do
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

function lgpXAdES_GetBase64EncoderClass(AXAdESObject: LGP_OBJECT;
  var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AClassName := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    with TObject(AXAdESObject) as TlgXAdES do
    begin
      if Base64EncoderClass <> nil then
        AClassName := @(PVmt(Base64EncoderClass.ClassType)^.vClassName^[1]);
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_SetBase64EncoderClass(AXAdESObject: LGP_OBJECT;
  AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    with TObject(AXAdESObject) as TlgXAdES do
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

function lgpXAdES_GetSigner(AXAdESObject: LGP_OBJECT; var ASigner: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    ASigner := (TObject(AXAdESObject) as TlgXAdES).Signer;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_SetSigner(AXAdESObject: LGP_OBJECT; ASigner: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    if ASigner <> nil then
      CheckObject(ASigner, TlgCertificateSigner);
    (TObject(AXAdESObject) as TlgXAdES).Signer := TlgCertificateSigner(ASigner);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_GetSignType(AXAdESObject: LGP_OBJECT; var ASignType: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    ASignType := Integer((TObject(AXAdESObject) as TlgXAdES).SignType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_SetSignType(AXAdESObject: LGP_OBJECT; ASignType: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    (TObject(AXAdESObject) as TlgXAdES).SignType := TlgSignHashType(ASignType);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_GetSerialNoFormat(AXAdESObject: LGP_OBJECT;
  var ASerialNoFormat: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    ASerialNoFormat := Integer((TObject(AXAdESObject) as TlgXAdES).SerialNoFormat);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_SetSerialNoFormat(AXAdESObject: LGP_OBJECT;
  ASerialNoFormat: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    (TObject(AXAdESObject) as TlgXAdES).SerialNoFormat := TlgXAdESSerialNoFormat(ASerialNoFormat);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_GetIncludeSigningTime(AXAdESObject: LGP_OBJECT;
  var AIncludeSigningTime: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    AIncludeSigningTime := Integer((TObject(AXAdESObject) as TlgXAdES).IncludeSigningTime);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_SetIncludeSigningTime(AXAdESObject: LGP_OBJECT;
  AIncludeSigningTime: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    (TObject(AXAdESObject) as TlgXAdES).IncludeSigningTime := AIncludeSigningTime <> 0;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_GetSigningTime(AXAdESObject: LGP_OBJECT;
  var ASigningTime: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    ASigningTime := (TObject(AXAdESObject) as TlgXAdES).SigningTime;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXAdES_SetSigningTime(AXAdESObject: LGP_OBJECT;
  ASigningTime: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AXAdESObject, TlgXAdES);
    (TObject(AXAdESObject) as TlgXAdES).SigningTime := ASigningTime;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

end.

