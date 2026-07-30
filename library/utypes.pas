{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uTypes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  LGP_PCHAR = PAnsiChar;
  LGP_PSSTRING = PShortString;
  LGP_INT32 = Int32;
  LGP_UINT32 = UInt32;
  LGP_DOUBLE = Double;
  LGP_INT64 = Int64;
  LGP_PASDATETIME = Double;
  LGP_CURRENCY = Currency;
  LGP_POINTER = Pointer;
  LGP_OBJECT = type Pointer;
  LGP_EXCEPTION = LGP_OBJECT;
  LGP_PBYTE = PByte;
  LGP_PPCHAR = ^LGP_PCHAR;

  LGP_CK_ULONG = {$IFDEF WINDOWS}LongWord{$ELSE}PtrUInt{$ENDIF};

const
  LGP_CLSTYPE_HTTP_CLIENT    = 0;
  LGP_CLSTYPE_CERT_SIGNER    = 1;
  LGP_CLSTYPE_RAND_GENERATOR = 2;
  LGP_CLSTYPE_BASE64_ENCODER = 3;
  LGP_CLSTYPE_MD5_HASH       = 4;
  LGP_CLSTYPE_SHA1_HASH      = 5;
  LGP_CLSTYPE_SHA256_HASH    = 6;
  LGP_CLSTYPE_AES256_ENC     = 7;
  LGP_CLSTYPE_RSA_ENC        = 8;
  LGP_CLSTYPE_ZIPPRE         = 9;
  LGP_CLSTYPE_XML_READER     = 10;
  LGP_CLSTYPE_XML_C14N       = 11;
  LGP_CLSTYPE_EDEK_GATE      = 12;
  LGP_CLSTYPE_XML_VALIDATOR  = 13;
  LGP_CLSTYPE_XML_XSLT       = 14;

  LGP_CLSTYPE_MAX = LGP_CLSTYPE_XML_XSLT;

  LGP_XADES_SHA1 = 1;
  LGP_XADES_SHA256 = 2;


function PCharArrayToStringArray(APCharArray: LGP_PPCHAR): TStringArray;

function StringToArray(AValue: String): TStringArray; inline;
function ArrayToString(AValue: TStringArray): String; inline;

implementation

function PCharArrayToStringArray(APCharArray: LGP_PPCHAR): TStringArray;
var
  I: Integer;
  S: UTF8String;
begin
  Result := [];
  if (APCharArray = nil) or (APCharArray[0] = nil) then
    Exit;
  I := 0;
  while APCharArray[I] <> nil do
  begin
    S := APCharArray[I];
    Result := Concat(Result, [S]);
    Inc(I);
  end;
end;

function StringToArray(AValue: String): TStringArray;
begin
  if Length(AValue) > 0 then
    Result := AValue.Split([LineEnding, ',', ';', '|'])
  else
    Result := nil;
end;

function ArrayToString(AValue: TStringArray): String;
begin
  if Length(AValue) > 0 then
    Result := String.Join(';', AValue)
  else
    Result := '';
end;

end.

