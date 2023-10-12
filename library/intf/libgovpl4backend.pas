{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4Backend;

{$ifdef fpc}
{$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Obj;

type
  ElgBackendError = class(ElgoException);

  TlgoEDekGateType = (egtProduction, egtTest);
  TlgoEDekSignType = (estCertificate, estAuthData);

  { TlgoHTTPClient }

  TlgoHTTPClient = class(TlgoCreatableObject)
  private
    function GetIgnoreSSLErrors: Boolean;
    procedure SetIgnoreSSLErrors(AValue: Boolean);
  public
    constructor Create(AClassName: UTF8String); override;
  published
    property IgnoreSSLErrors: Boolean read GetIgnoreSSLErrors write SetIgnoreSSLErrors;
  end;

  TlgoRSAKey = class(TlgoObject)
  end;

  { TlgoRSAEncrypt }

  TlgoRSAEncrypt = class
  public
    class function CreateKey(AClassName: UTF8String; AStream: TStream): TlgoRSAKey;
  end;

  TlgoCertificates = class;

  { TlgoCertificate }

  TlgoCertificate = class
  private
    FItem: LGP_OBJECT;
    FList: TlgoCertificates;
    FIndex: Integer;
    function GetDisplayName: UTF8String;
    function GetIssuer: UTF8String;
    function GetSerialNoDec: UTF8String;
    function GetSerialNoHex: UTF8String;
    function GetSubject: UTF8String;
    function GetValidFrom: TDateTime;
    function GetValidTo: TDateTime;
  public
    destructor Destroy; override;
    function ObjClassName: UTF8String;
    property Item: LGP_OBJECT read FItem;
  published
    property DisplayName: UTF8String read GetDisplayName;
    property Subject: UTF8String read GetSubject;
    property Issuer: UTF8String read GetIssuer;
    property SerialNoDec: UTF8String read GetSerialNoDec;
    property SerialNoHex: UTF8String read GetSerialNoHex;
    property ValidFrom: TDateTime read GetValidFrom;
    property ValidTo: TDateTime read GetValidTo;
  end;

  { TlgoCertificates }

  TlgoCertificates = class(TlgoObject)
  private
    FClassItems: TList;
  public
    constructor Create;
    destructor Destroy; override;
    function Count: Integer;
    function GetItem(AIndex: Integer): TlgoCertificate;
    property Items[AIndex: Integer]: TlgoCertificate read GetItem; default;
  end;

  { TlgoCertificateSigner }

  TlgoCertificateSigner = class(TlgoCreatableObject)
  public
    constructor Create(AClassName: UTF8String); override;
    function List: TlgoCertificates;
    function UISelect: TlgoCertificate;
  end;

implementation

{ TlgoCertificateSigner }

constructor TlgoCertificateSigner.Create(AClassName: UTF8String);
begin
  lgoCheckResult(lgpCertificateSigner_Create(PChar(AClassName), ExtObject));
end;

function TlgoCertificateSigner.List: TlgoCertificates;
var
  L: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificateSigner_List(ExtObject, L));
  if L <> nil then
  begin
    Result := TlgoCertificates.Create;
    Result.ExtObject := L;
  end
  else
    Result := nil;
end;

function TlgoCertificateSigner.UISelect: TlgoCertificate;
var
  Cert: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificateSigner_UISelect(ExtObject, Cert));
  if Cert <> nil then
  begin
    Result := TlgoCertificate.Create;
    Result.FItem := Cert;
  end
  else
    Result := nil;
end;

{ TlgoCertificates }

constructor TlgoCertificates.Create;
begin
  FClassItems := TList.Create;
end;

destructor TlgoCertificates.Destroy;
var
  I: Integer;
begin
  for I := 0 to FClassItems.Count - 1 do
    if FClassItems[I] <> nil then
      TlgoCertificate(FClassItems[I]).Free;
  FClassItems.Free;
  inherited Destroy;
end;

function TlgoCertificates.Count: Integer;
begin
  lgoCheckResult(lgpListObject_GetCount(ExtObject, Result));
end;

function TlgoCertificates.GetItem(AIndex: Integer): TlgoCertificate;
var
  Item: LGP_OBJECT;
begin
  if (FClassItems.Count > AIndex) and (FClassItems.Items[AIndex] <> nil) then
    Result := TlgoCertificate(FClassItems[AIndex])
  else
  begin
    lgoCheckResult(lgpListObject_GetItem(ExtObject, AIndex, Item));
    if Item <> nil then
    begin
      Result := TlgoCertificate.Create;
      Result.FList := Self;
      Result.FIndex := AIndex;
      Result.FItem := Item;
      if AIndex >= FClassItems.Count then
        FClassItems.Count := AIndex + 1;
      FClassItems[AIndex] := Result;
    end;
  end;
end;

{ TlgoCertificate }

function TlgoCertificate.GetDisplayName: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetDisplayName(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetIssuer: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetIssuer(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSerialNoDec: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSerialNoDec(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSerialNoHex: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSerialNoHex(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSubject: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSubject(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetValidFrom: TDateTime;
begin
  lgoCheckResult(lgpCertificate_GetValidFrom(FItem, Result));
end;

function TlgoCertificate.GetValidTo: TDateTime;
begin
  lgoCheckResult(lgpCertificate_GetValidTo(FItem, Result));
end;

destructor TlgoCertificate.Destroy;
begin
  if FList = nil then
  begin
    if FItem <> nil then
      lgoCheckResult(lgpObject_Free(FItem), False);
  end
  else
  begin
    if FList.FClassItems.Count > FIndex then
      FList.FClassItems.Items[FIndex] := nil;
  end;
  inherited Destroy;
end;

function TlgoCertificate.ObjClassName: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpObject_ClassName(FItem, P));
  Result := P;
end;

{ TlgoRSAEncrypt }

class function TlgoRSAEncrypt.CreateKey(AClassName: UTF8String; AStream: TStream
  ): TlgoRSAKey;
var
  Key: LGP_OBJECT;
  LGStream: TlgoStream;
begin
  LGStream := nil;
  try
    LGStream := TlgoStream.Create(AStream);
    lgoCheckResult(lgpRSAEncrypt_CreateKey(PChar(AClassName), LGStream.StreamObj, Key));
    Result := TlgoRSAKey.Create;
    Result.ExtObject := Key;
  finally
    if Assigned(LGStream) then
      LGStream.Free;
  end;
end;

{ TlgoHTTPClient }

function TlgoHTTPClient.GetIgnoreSSLErrors: Boolean;
var
  V: LGP_INT32;
begin
  lgoCheckResult(lgpHTTPClient_GetIgnoreSSLErrors(ExtObject, V));
  Result := V <> 0;
end;

procedure TlgoHTTPClient.SetIgnoreSSLErrors(AValue: Boolean);
begin
  lgoCheckResult(lgpHTTPClient_SetIgnoreSSLErrors(ExtObject, Integer(AValue)));
end;

constructor TlgoHTTPClient.Create(AClassName: UTF8String);
begin
  lgoCheckResult(lgpHTTPClient_Create(PChar(AClassName), ExtObject));
end;

initialization
  lgoRegisterExceptionClass(ElgBackendError);

end.

