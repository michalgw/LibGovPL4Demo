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

  TlgoUTF8StringArray = array of UTF8String;

  { TlgoBackend }

  TlgoBackend = class
  public
    class function ListDrivers(AClassType: Integer): TlgoUTF8StringArray;
    class function HTTPClientClasses: TlgoUTF8StringArray;
    class function RandomGeneratorClasses: TlgoUTF8StringArray;
    class function Base64EncoderClasses: TlgoUTF8StringArray;
    class function MD5HashClasses: TlgoUTF8StringArray;
    class function SHA1HashClasses: TlgoUTF8StringArray;
    class function SHA256HashClasses: TlgoUTF8StringArray;
    class function AES256EncryptClasses: TlgoUTF8StringArray;
    class function CertSignerClasses: TlgoUTF8StringArray;
    class function EDekGateClasses: TlgoUTF8StringArray;
    class function XMLCanonizatorClasses: TlgoUTF8StringArray;
    class function XMLReaderClasses: TlgoUTF8StringArray;
    class function ZipperClasses: TlgoUTF8StringArray;
    class function RSAEncryptClasses: TlgoUTF8StringArray;
  end;

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

  ElgWSTError = class(ElgoException);

  { ElgWinHTTPException }

  ElgWinHTTPException = class(ElgoException)
  protected
    procedure LoadObject(AException: LGP_EXCEPTION); override;
  public
    ErrorCode: LongWord;
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

{ ElgWinHTTPException }

procedure ElgWinHTTPException.LoadObject(AException: LGP_EXCEPTION);
var
  I: Integer;
begin
  inherited LoadObject(AException);
  if AException <> nil then
  begin
    lgoCheckResult(lgpObject_GetIntegerProp(AException, 'ErrorCode', I));
    ErrorCode := LongWord(I);
  end;
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

{ TlgoBackend }

class function TlgoBackend.ListDrivers(AClassType: Integer
  ): TlgoUTF8StringArray;
var
  I: Integer;
begin
  SetLength(Result, lgplDriverCount(AClassType));
  for I := 0 to lgplDriverCount(AClassType) - 1 do
    Result[I] := lgplDriverName(AClassType, I);
end;

class function TlgoBackend.HTTPClientClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_HTTP_CLIENT);
end;

class function TlgoBackend.RandomGeneratorClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_RAND_GENERATOR);
end;

class function TlgoBackend.Base64EncoderClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_BASE64_ENCODER);
end;

class function TlgoBackend.MD5HashClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_MD5_HASH);
end;

class function TlgoBackend.SHA1HashClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_SHA1_HASH);
end;

class function TlgoBackend.SHA256HashClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_SHA256_HASH);
end;

class function TlgoBackend.AES256EncryptClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_AES256_ENC);
end;

class function TlgoBackend.CertSignerClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_CERT_SIGNER);
end;

class function TlgoBackend.EDekGateClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_EDEK_GATE);
end;

class function TlgoBackend.XMLCanonizatorClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_XML_C14N);
end;

class function TlgoBackend.XMLReaderClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_XML_READER);
end;

class function TlgoBackend.ZipperClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_ZIPPRE);
end;

class function TlgoBackend.RSAEncryptClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_RSA_ENC);
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

procedure RegisterExceptions;
begin
  lgoRegisterExceptionClass(ElgBackendError);
  lgoRegisterExceptionClass(ElgWSTError);
  lgoRegisterExceptionClass(ElgWinHTTPException);
end;

initialization
  RegisterExceptions;

end.

