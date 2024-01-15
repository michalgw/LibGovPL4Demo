{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4JPK;

{$ifdef FPC}
{$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Obj, LibGovPl4Backend,
  LibGovPl4XAdES;

type

  { TlgoJPK }

  TlgoJPK = class(TlgoObject)
  private
    FHTTPClient: TlgoHTTPClient;
    FRSAKeyProd: TlgoRSAKey;
    FRSAKeyTest: TlgoRSAKey;
    FXAdES: TlgoXAdES;
    function GetAES256EncryptClass: UTF8String;
    function GetBase64EncoderClass: UTF8String;
    function GetMD5HashClass: UTF8String;
    function GetRandomGeneratorClass: UTF8String;
    function GetRSAEncryptClass: UTF8String;
    function GetRSAKey(AIndex: TlgoEDekGateType): TlgoRSAKey;
    function GetSHA256HashClass: UTF8String;
    function GetXMLReaderClass: UTF8String;
    function GetZipperClass: UTF8String;
    procedure SetAES256EncryptClass(AValue: UTF8String);
    procedure SetBase64EncoderClass(AValue: UTF8String);
    procedure SetHTTPClient(AValue: TlgoHTTPClient);
    procedure SetMD5HashClass(AValue: UTF8String);
    procedure SetRandomGeneratorClass(AValue: UTF8String);
    procedure SetRSAEncryptClass(AValue: UTF8String);
    procedure SetRSAKey(AIndex: TlgoEDekGateType; AValue: TlgoRSAKey);
    procedure SetRSAKeyProd(AValue: TlgoRSAKey);
    procedure SetRSAKeyTest(AValue: TlgoRSAKey);
    procedure SetSHA256HashClass(AValue: UTF8String);
    procedure SetXAdES(AValue: TlgoXAdES);
    procedure SetXMLReaderClass(AValue: UTF8String);
    procedure SetZipperClass(AValue: UTF8String);
  public
    constructor Create;
    procedure SignCertificate(ACertificate: TlgoCertificate; AGateType: TlgoEDekGateType; AAdHoc: Boolean; AInputStream, AOutputStream: TStream; out AInitUpload: UTF8String);
    procedure SignAuthData(ANIP, AImiePierwsze, ANazwisko: UTF8String; ADataUrodzenia: TDateTime; AKwota: Currency; AGateType: TlgoEDekGateType; AAdHoc: Boolean; AInputStream, AOutputStream: TStream; out AInitUpload: UTF8String);
    procedure Send(AInitUpload: UTF8String; AEncryptedData: TStream; out ARefNo: UTF8String; AGateType: TlgoEDekGateType; AVerifySign: Boolean = True);
    function RequestUPO(ARefNo: UTF8String; AGateType: TlgoEDekGateType; out AStatusDesc, ADetails, AUPO, ATimeStamp: UTF8String): Integer;

    property Base64EncoderClass: UTF8String read GetBase64EncoderClass write SetBase64EncoderClass;
    property AES256EncryptClass: UTF8String read GetAES256EncryptClass write SetAES256EncryptClass;
    property MD5HashClass: UTF8String read GetMD5HashClass write SetMD5HashClass;
    property SHA256HashClass: UTF8String read GetSHA256HashClass write SetSHA256HashClass;
    property ZipperClass: UTF8String read GetZipperClass write SetZipperClass;
    property RSAEncryptClass: UTF8String read GetRSAEncryptClass write SetRSAEncryptClass;
    property RandomGeneratorClass: UTF8String read GetRandomGeneratorClass write SetRandomGeneratorClass;
    property XMLReaderClass: UTF8String read GetXMLReaderClass write SetXMLReaderClass;

    property RSAKeyProd: TlgoRSAKey read FRSAKeyProd write SetRSAKeyProd;
    property RSAKeyTest: TlgoRSAKey read FRSAKeyTest write SetRSAKeyTest;
    property RSAKey[AIndex: TlgoEDekGateType]: TlgoRSAKey read GetRSAKey write SetRSAKey;
    property XAdES: TlgoXAdES read FXAdES write SetXAdES;
    property HTTPClient: TlgoHTTPClient read FHTTPClient write SetHTTPClient;
  end;


implementation

{ TlgoJPK }

function TlgoJPK.GetAES256EncryptClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpJPK_GetAES256EncryptClass(ExtObject, P));
  Result := P;
end;

function TlgoJPK.GetBase64EncoderClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpJPK_GetBase64EncoderClass(ExtObject, P));
  Result := P;
end;

function TlgoJPK.GetMD5HashClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpJPK_GetMD5HashClass(ExtObject, P));
  Result := P;
end;

function TlgoJPK.GetRandomGeneratorClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpJPK_GetRandomGeneratorClass(ExtObject, P));
  Result := P;
end;

function TlgoJPK.GetRSAEncryptClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpJPK_GetRSAEncryptClass(ExtObject, P));
  Result := P;
end;

function TlgoJPK.GetRSAKey(AIndex: TlgoEDekGateType): TlgoRSAKey;
begin
  case AIndex of
    egtProduction: Result := FRSAKeyProd;
    egtTest: Result := FRSAKeyTest;
    else Result := nil;
  end;
end;

function TlgoJPK.GetSHA256HashClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpJPK_GetSHA256HashClass(ExtObject, P));
  Result := P;
end;

function TlgoJPK.GetXMLReaderClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpJPK_GetXMLReaderClass(ExtObject, P));
  Result := P;
end;

function TlgoJPK.GetZipperClass: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpJPK_GetZipperClass(ExtObject, P));
  Result := P;
end;

procedure TlgoJPK.SetAES256EncryptClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpJPK_SetAES256EncryptClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoJPK.SetBase64EncoderClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpJPK_SetBase64EncoderClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoJPK.SetHTTPClient(AValue: TlgoHTTPClient);
var
  O: LGP_OBJECT;
begin
  if FHTTPClient = AValue then Exit;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  lgoCheckResult(lgpJPK_SetHTTPClient(ExtObject, O));
  FHTTPClient := AValue;
end;

procedure TlgoJPK.SetMD5HashClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpJPK_SetMD5HashClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoJPK.SetRandomGeneratorClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpJPK_SetRandomGeneratorClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoJPK.SetRSAEncryptClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpJPK_SetRSAEncryptClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoJPK.SetRSAKey(AIndex: TlgoEDekGateType; AValue: TlgoRSAKey);
begin
  case AIndex of
    egtProduction: SetRSAKeyProd(AValue);
    egtTest: SetRSAKeyTest(AValue);
  end;
end;

procedure TlgoJPK.SetRSAKeyProd(AValue: TlgoRSAKey);
var
  O: LGP_OBJECT;
begin
  if FRSAKeyProd = AValue then Exit;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  lgoCheckResult(lgpJPK_SetRSAKeyProd(ExtObject, O));
  FRSAKeyProd := AValue;
end;

procedure TlgoJPK.SetRSAKeyTest(AValue: TlgoRSAKey);
var
  O: LGP_OBJECT;
begin
  if FRSAKeyTest = AValue then Exit;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  lgoCheckResult(lgpJPK_SetRSAKeyTest(ExtObject, O));
  FRSAKeyTest := AValue;
end;

procedure TlgoJPK.SetSHA256HashClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpJPK_SetSHA256HashClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoJPK.SetXAdES(AValue: TlgoXAdES);
var
  O: LGP_OBJECT;
begin
  if FXAdES = AValue then Exit;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  lgoCheckResult(lgpJPK_SetXAdES(ExtObject, O));
  FXAdES := AValue;
end;

procedure TlgoJPK.SetXMLReaderClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpJPK_SetXMLReaderClass(ExtObject, LGP_PCHAR(AValue)));
end;

procedure TlgoJPK.SetZipperClass(AValue: UTF8String);
begin
  lgoCheckResult(lgpJPK_SetZipperClass(ExtObject, LGP_PCHAR(AValue)));
end;

constructor TlgoJPK.Create;
begin
  lgoCheckResult(lgpJPK_Create(nil, nil, nil, nil, nil, nil, nil, nil, ExtObject));
end;

procedure TlgoJPK.SignCertificate(ACertificate: TlgoCertificate;
  AGateType: TlgoEDekGateType; AAdHoc: Boolean; AInputStream,
  AOutputStream: TStream; out AInitUpload: UTF8String);
var
  IStream, OStream: TlgoStream;
  InitUp: LGP_OBJECT;
begin
  IStream := TlgoStream.Create(AInputStream);
  OStream := TlgoStream.Create(AOutputStream);
  try
    lgoCheckResult(lgpJPK_SignCerificate(ExtObject, ACertificate.Item,
      LGP_INT32(AGateType), LGP_INT32(AAdHoc), IStream.StreamObj, OStream.StreamObj, InitUp));
    AInitUpload := lgoGetString(InitUp);
  finally
    IStream.Free;
    OStream.Free;
  end;
end;

procedure TlgoJPK.SignAuthData(ANIP, AImiePierwsze, ANazwisko: UTF8String;
  ADataUrodzenia: TDateTime; AKwota: Currency; AGateType: TlgoEDekGateType;
  AAdHoc: Boolean; AInputStream, AOutputStream: TStream; out
  AInitUpload: UTF8String);
var
  IStream, OStream: TlgoStream;
  InitUp: LGP_OBJECT;
begin
  IStream := TlgoStream.Create(AInputStream);
  OStream := TlgoStream.Create(AOutputStream);
  try
    lgoCheckResult(lgpJPK_SignDataAuth(ExtObject, LGP_PCHAR(ANIP),
      LGP_PCHAR(AImiePierwsze), LGP_PCHAR(ANazwisko), ADataUrodzenia, AKwota,
      LGP_INT32(AGateType), LGP_INT32(AAdHoc), IStream.StreamObj, OStream.StreamObj, InitUp));
    AInitUpload := lgoGetString(InitUp);
  finally
    IStream.Free;
    OStream.Free;
  end;
end;

procedure TlgoJPK.Send(AInitUpload: UTF8String; AEncryptedData: TStream; out
  ARefNo: UTF8String; AGateType: TlgoEDekGateType; AVerifySign: Boolean);
var
  DataStr: TlgoStream;
  RefNo: LGP_OBJECT;
begin
  DataStr := TlgoStream(AEncryptedData);
  try
    lgoCheckResult(lgpJPK_Send(ExtObject, LGP_PCHAR(AInitUpload), DataStr.StreamObj,
      RefNo, LGP_INT32(AGateType), LGP_INT32(AVerifySign)));
    ARefNo := lgoGetString(RefNo);
  finally
    DataStr.Free;
  end;
end;

function TlgoJPK.RequestUPO(ARefNo: UTF8String; AGateType: TlgoEDekGateType;
  out AStatusDesc, ADetails, AUPO, ATimeStamp: UTF8String): Integer;
var
  StatDesc, Det, Upo, Timest: LGP_OBJECT;
begin
  lgoCheckResult(lgpJPK_RequestUPO(ExtObject, LGP_PCHAR(ARefNo), LGP_INT32(AGateType),
    Result, StatDesc, Det, Upo, Timest));
  AStatusDesc := lgoGetString(StatDesc);
  ADetails := lgoGetString(Det);
  AUPO := lgoGetString(Upo);
  ATimeStamp := lgoGetString(Timest);
end;

end.

