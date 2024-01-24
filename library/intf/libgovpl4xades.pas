{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4XAdES;

{$ifdef fpc}
{$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Backend, LibGovPl4Obj;

type

  TlgoSignHashType = (shtSHA1, shtSHA256);
  TlgoXAdESSerialNoFormat = (xsfDecimal, xsfHex);

  { TlgoXAdES }

  TlgoXAdES = class(TlgoObject)
  private
    FSigner: TlgoCertificateSigner;
    function GetBase64EncoderClass: UTF8String;
    function GetIncludeSigningTime: Boolean;
    function GetSerialNoFormat: TlgoXAdESSerialNoFormat;
    function GetSHA1HashClass: UTF8String;
    function GetSHA256HashClass: UTF8String;
    function GetSigningTime: TDateTime;
    function GetSignType: TlgoSignHashType;
    procedure SetBase64EncoderClass(AValue: UTF8String);
    procedure SetIncludeSigningTime(AValue: Boolean);
    procedure SetSerialNoFormat(AValue: TlgoXAdESSerialNoFormat);
    procedure SetSHA1HashClass(AValue: UTF8String);
    procedure SetSHA256HashClass(AValue: UTF8String);
    procedure SetSigner(AValue: TlgoCertificateSigner);
    procedure SetSigningTime(AValue: TDateTime);
    procedure SetSignType(AValue: TlgoSignHashType);
  public
    constructor Create(ASHA1HashClass: UTF8String = ''; ASHA256HashClass: UTF8String = ''; ABase64EncoderClass: UTF8String = '';
      ASigner: TlgoCertificateSigner = nil);
  published
    property SHA1HashClass: UTF8String read GetSHA1HashClass write SetSHA1HashClass;
    property SHA256HashClass: UTF8String read GetSHA256HashClass write SetSHA256HashClass;
    property Base64EncoderClass: UTF8String read GetBase64EncoderClass write SetBase64EncoderClass;
    property Signer: TlgoCertificateSigner read FSigner write SetSigner;
    property SignType: TlgoSignHashType read GetSignType write SetSignType;
    property SerialNoFormat: TlgoXAdESSerialNoFormat read GetSerialNoFormat write SetSerialNoFormat;
    property IncludeSigningTime: Boolean read GetIncludeSigningTime write SetIncludeSigningTime;
    property SigningTime: TDateTime read GetSigningTime write SetSigningTime;
  end;

implementation

{ TlgoXAdES }

function TlgoXAdES.GetBase64EncoderClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpXAdES_GetBase64EncoderClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoXAdES.GetIncludeSigningTime: Boolean;
var
  B: LGP_INT32;
begin
  lgoCheckResult(lgpXAdES_GetIncludeSigningTime(ExtObject, B));
  Result := B <> 0;
end;

function TlgoXAdES.GetSerialNoFormat: TlgoXAdESSerialNoFormat;
var
  B: LGP_INT32;
begin
  lgoCheckResult(lgpXAdES_GetSerialNoFormat(ExtObject, B));
  Result := TlgoXAdESSerialNoFormat(B);
end;

function TlgoXAdES.GetSHA1HashClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpXAdES_GetSHA1HashClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoXAdES.GetSHA256HashClass: UTF8String;
var
  P: LGP_PSSTRING;
begin
  lgoCheckResult(lgpXAdES_GetSHA256HashClass(ExtObject, P));
  if P <> nil then
    Result := P^
  else
    Result := '';
end;

function TlgoXAdES.GetSigningTime: TDateTime;
begin
  lgoCheckResult(lgpXAdES_GetSigningTime(ExtObject, Result));
end;

function TlgoXAdES.GetSignType: TlgoSignHashType;
var
  B: LGP_INT32;
begin
  lgoCheckResult(lgpXAdES_GetSignType(ExtObject, B));
  Result := TlgoSignHashType(B);
end;

procedure TlgoXAdES.SetBase64EncoderClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpXAdES_SetBase64EncoderClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoXAdES.SetIncludeSigningTime(AValue: Boolean);
begin
  lgoCheckResult(lgpXAdES_SetIncludeSigningTime(ExtObject, Integer(AValue)));
end;

procedure TlgoXAdES.SetSerialNoFormat(AValue: TlgoXAdESSerialNoFormat);
begin
  lgoCheckResult(lgpXAdES_SetSerialNoFormat(ExtObject, Integer(AValue)));
end;

procedure TlgoXAdES.SetSHA1HashClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpXAdES_SetSHA1HashClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoXAdES.SetSHA256HashClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpXAdES_SetSHA256HashClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoXAdES.SetSigner(AValue: TlgoCertificateSigner);
begin
  if FSigner = AValue then Exit;
  lgoCheckResult(lgpXAdES_SetSigner(ExtObject, AValue.ExtObject));
  FSigner := AValue;
end;

procedure TlgoXAdES.SetSigningTime(AValue: TDateTime);
begin
  lgoCheckResult(lgpXAdES_SetSigningTime(ExtObject, AValue));
end;

procedure TlgoXAdES.SetSignType(AValue: TlgoSignHashType);
begin
  lgoCheckResult(lgpXAdES_SetSignType(ExtObject, Integer(AValue)));
end;

constructor TlgoXAdES.Create(ASHA1HashClass: UTF8String; ASHA256HashClass: UTF8String;
  ABase64EncoderClass: UTF8String; ASigner: TlgoCertificateSigner);
var
  O: LGP_OBJECT;
begin
  if ASigner <> nil then
  begin
    O := ASigner.ExtObject;
    FSigner := ASigner;
  end
  else
    O := nil;
  lgoCheckResult(lgpXAdES_Create(LGP_PCHAR(ASHA1HashClass), LGP_PCHAR(ASHA256HashClass),
    LGP_PCHAR(ABase64EncoderClass), O, ExtObject));
end;

end.

