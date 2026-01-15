{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4XML;

{$I libgovpl4def.inc}

interface

uses
  Classes, LibGovPl4Intf, LibGovPl4Obj, LibGovPl4Backend;

type

  { TlgoXMLReader }

  TlgoXMLReader = class(TlgoObject)
  public
    constructor CreateFromFile(AClassName: UTF8String; AFileName: UTF8String);
    constructor CreateFromStream(AClassName: UTF8String; AStream: TStream);
    constructor CreateFromString(AClassName: UTF8String; AString: UTF8String);
    function ReadValue(AXPath: UTF8String; out AValue: UTF8String): Boolean;
  end;

  { TlgoXMLValidationError }

  TlgoXMLValidationError = class(TlgoObject)
  private
    function GetErrorCode: Integer;
    function GetLine: Integer;
    function GetMessage: UTF8String;
    function GetPath: UTF8String;
    function GetSimplePath: UTF8String;
  public
    destructor Destroy; override;
  published
    property ErrorCode: Integer read GetErrorCode;
    property Message: UTF8String read GetMessage;
    property Line: Integer read GetLine;
    property Path: UTF8String read GetPath;
    property SimplePath: UTF8String read GetSimplePath;
  end;

  { TlgoXMLValidationErrors }

  TlgoXMLValidationErrors = class(TlgoObject)
  private
    FList: TList;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
    function Count: Integer;
    function GetItem(AIndex: Integer): TlgoXMLValidationError;
  //published
    property Items[AIndex: Integer]: TlgoXMLValidationError read GetItem; default;
  end;

  { TlgoXMLValidator }

  TlgoXMLValidator = class(TlgoObject)
  public
    constructor Create(AClassName: UTF8String);
    procedure AddSchema(const ANS: UTF8String; const ALocation: UTF8String); overload;
    procedure AddSchema(const ANS: UTF8String; const AXMLDoc: TlgoXMLReader); overload;
    procedure ClearSchemas;
    function Validate(AXMLDoc: TlgoXMLReader; out AErrors: TlgoXMLValidationErrors): Boolean;
  end;

  { TlgoXMLXSLTransformation }

  TlgoXMLXSLTransformation = class(TlgoObject)
  public
    constructor Create(AClassName: UTF8String);
    procedure AddStyle(const ANS: UTF8String; const ALocation: UTF8String); overload;
    procedure AddStyle(const ANS: UTF8String; const AXMLDoc: TlgoXMLReader); overload;
    procedure ClearStyles;
    procedure Transform(AXMLDoc: TlgoXMLReader; AOutStream: TStream);
  end;

  { TlgoLibXML2Backend }

  TlgoLibXML2Backend = class
  public
    class function GetCacheDir: UTF8String; {$IFDEF LGP_HAVE_CLASS_FIELDS}static;{$ENDIF}
    class function GetCacheExternals: Boolean; {$IFDEF LGP_HAVE_CLASS_FIELDS}static;{$ENDIF}
    class function GetHTTPClient: TlgoHTTPClient; {$IFDEF LGP_HAVE_CLASS_FIELDS}static;{$ENDIF}
    class procedure SetCacheDir(AValue: UTF8String); {$IFDEF LGP_HAVE_CLASS_FIELDS}static;{$ENDIF}
    class procedure SetCacheExternals(AValue: Boolean); {$IFDEF LGP_HAVE_CLASS_FIELDS}static;{$ENDIF}
    class procedure SetHTTPClient(AValue: TlgoHTTPClient); {$IFDEF LGP_HAVE_CLASS_FIELDS}static;{$ENDIF}
    class function LibXMLLoaded: Boolean;
    class function LibXSLTLoaded: Boolean;
    class function LoadLibXML(ALibXML: UTF8String = ''): Boolean;
    class function LoadLibXSLT(ALibXSLT: UTF8String = ''; ALibEXSLT: UTF8String = ''): Boolean;
    {$IFDEF LGP_HAVE_CLASS_FIELDS}
    class property CacheExternals: Boolean read GetCacheExternals write SetCacheExternals;
    class property CacheDir: UTF8String read GetCacheDir write SetCacheDir;
    class property HTTPClient: TlgoHTTPClient read GetHTTPClient write SetHTTPClient;
    {$ENDIF}
  end;

implementation

var
  lgoLibXML2HTTPClient: TlgoHTTPClient = nil;

{ TlgoXMLReader }

constructor TlgoXMLReader.CreateFromFile(AClassName: UTF8String; AFileName: UTF8String);
begin
  lgoCheckResult(lgpXMLReader_CreateFromFile(LGP_PCHAR(AClassName), LGP_PCHAR(AFileName), ExtObject));
end;

constructor TlgoXMLReader.CreateFromStream(AClassName: UTF8String; AStream: TStream);
var
  LGStream: TlgoStream;
begin
  LGStream := TlgoStream.Create(AStream);
  try
    lgoCheckResult(lgpXMLReader_CreateFromStream(LGP_PCHAR(AClassName), LGStream.StreamObj, ExtObject));
  finally
    LGStream.Free;
  end;
end;

constructor TlgoXMLReader.CreateFromString(AClassName: UTF8String; AString: UTF8String);
begin
  lgoCheckResult(lgpXMLReader_CreateFromString(LGP_PCHAR(AClassName), LGP_PCHAR(AString), ExtObject));
end;

function TlgoXMLReader.ReadValue(AXPath: UTF8String; out AValue: UTF8String): Boolean;
var
  S: LGP_OBJECT;
  Res: LGP_INT32;
begin
  lgoCheckResult(lgpXMLReader_ReadValue(ExtObject, LGP_PCHAR(AXPath), S, Res));
  AValue := lgoGetString(S);
  Result := Res <> 0;
end;

{ TlgoXMLValidationError }

function TlgoXMLValidationError.GetErrorCode: Integer;
begin
  Result := GetIntegerProp('ErrorCode');
end;

function TlgoXMLValidationError.GetLine: Integer;
begin
  Result := GetIntegerProp('Line');
end;

function TlgoXMLValidationError.GetMessage: UTF8String;
begin
  Result := GetStringProp('Message');
end;

function TlgoXMLValidationError.GetPath: UTF8String;
begin
  Result := GetStringProp('Path');
end;

function TlgoXMLValidationError.GetSimplePath: UTF8String;
begin
  Result := GetStringProp('SimplePath');
end;

destructor TlgoXMLValidationError.Destroy;
begin
  ExtObject := nil;
  inherited Destroy;
end;

{ TlgoXMLValidationErrors }

constructor TlgoXMLValidationErrors.Create(AObject: LGP_OBJECT);
begin
  inherited Create(AObject);
  FList := TList.Create;
end;

destructor TlgoXMLValidationErrors.Destroy;
begin
  while FList.Count > 0 do
  begin
    TlgoXMLValidationError(FList[0]).Free;
    FList.Delete(0);
  end;
  FList.Free;
  inherited Destroy;
end;

function TlgoXMLValidationErrors.Count: Integer;
begin
  lgoCheckResult(lgpListObject_GetCount(ExtObject, Result));
end;

function TlgoXMLValidationErrors.GetItem(AIndex: Integer): TlgoXMLValidationError;
var
  Item: LGP_OBJECT;
begin
  if (FList.Count > AIndex) and (FList.Items[AIndex] <> nil) then
    Result := TlgoXMLValidationError(FList[AIndex])
  else
  begin
    lgoCheckResult(lgpListObject_GetItem(ExtObject, AIndex, Item));
    if Item <> nil then
    begin
      Result := TlgoXMLValidationError.Create(Item);
      if AIndex >= FList.Count then
        FList.Count := AIndex + 1;
      FList[AIndex] := Result;
    end
    else
      Result := nil;
  end;
end;

{ TlgoXMLValidator }

constructor TlgoXMLValidator.Create(AClassName: UTF8String);
begin
  lgoCheckResult(lgpXMLValidator_Create(LGP_PCHAR(AClassName), ExtObject));
end;

procedure TlgoXMLValidator.AddSchema(const ANS: UTF8String; const ALocation: UTF8String);
begin
  lgoCheckResult(lgpXMLValidator_AddSchemaLocation(ExtObject, LGP_PCHAR(ANS), LGP_PCHAR(ALocation)));
end;

procedure TlgoXMLValidator.AddSchema(const ANS: UTF8String; const AXMLDoc: TlgoXMLReader);
begin
  lgoCheckResult(lgpXMLValidator_AddSchemaReader(ExtObject, LGP_PCHAR(ANS), AXMLDoc.ExtObject));
end;

procedure TlgoXMLValidator.ClearSchemas;
begin
  lgoCheckResult(lgpXMLValidator_ClearSchemas(ExtObject));
end;

function TlgoXMLValidator.Validate(AXMLDoc: TlgoXMLReader; out AErrors: TlgoXMLValidationErrors): Boolean;
var
  Lst: LGP_OBJECT;
begin
  lgoCheckResult(lgpXMLValidator_Validate(ExtObject, AXMLDoc.ExtObject, Lst));
  if Lst = nil then
  begin
    AErrors := nil;
    Result := True;
  end
  else
  begin
    AErrors := TlgoXMLValidationErrors.Create(Lst);
    Result := False;
  end;
end;

{ TlgoXMLXSLTransformation }

constructor TlgoXMLXSLTransformation.Create(AClassName: UTF8String);
begin
  lgoCheckResult(lgpXMLXSLTransformation_Create(LGP_PCHAR(AClassName), ExtObject));
end;

procedure TlgoXMLXSLTransformation.AddStyle(const ANS: UTF8String; const ALocation: UTF8String);
begin
  lgoCheckResult(lgpXMLXSLTransformation_AddStyleLocation(ExtObject, LGP_PCHAR(ANS), LGP_PCHAR(ALocation)));
end;

procedure TlgoXMLXSLTransformation.AddStyle(const ANS: UTF8String; const AXMLDoc: TlgoXMLReader);
begin
  lgoCheckResult(lgpXMLXSLTransformation_AddStyleReader(ExtObject, LGP_PCHAR(ANS), AXMLDoc.ExtObject));
end;

procedure TlgoXMLXSLTransformation.ClearStyles;
begin
  lgoCheckResult(lgpXMLXSLTransformation_ClearStyles(ExtObject));
end;

procedure TlgoXMLXSLTransformation.Transform(AXMLDoc: TlgoXMLReader; AOutStream: TStream);
var
  LGStream: TlgoStream;
begin
  LGStream := TlgoStream.Create(AOutStream);
  try
    lgoCheckResult(lgpXMLXSLTransformation_Transform(ExtObject, AXMLDoc.ExtObject, LGStream.StreamObj));
  finally
    LGStream.Free;
  end;
end;

{ TlgoLibXML2Backend }

class function TlgoLibXML2Backend.GetCacheDir: UTF8String;
begin
   Result := lgpLibXML2Backend_GetCacheDir;
end;

class function TlgoLibXML2Backend.GetCacheExternals: Boolean;
begin
  Result := lgpLibXML2Backend_GetCacheExternals <> 0;
end;

class function TlgoLibXML2Backend.GetHTTPClient: TlgoHTTPClient;
begin
  Result := lgoLibXML2HTTPClient;
end;

class procedure TlgoLibXML2Backend.SetCacheDir(AValue: UTF8String);
begin
  lgpLibXML2Backend_SetCacheDir(LGP_PCHAR(AValue));
end;

class procedure TlgoLibXML2Backend.SetCacheExternals(AValue: Boolean);
begin
  lgpLibXML2Backend_SetCacheExternals(LGP_INT32(AValue));
end;

class procedure TlgoLibXML2Backend.SetHTTPClient(AValue: TlgoHTTPClient);
var
  O: LGP_OBJECT;
begin
  if lgoLibXML2HTTPClient = AValue then
    Exit;
  lgoLibXML2HTTPClient := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  lgoCheckResult(lgpLibXML2Backend_SetHTTPClient(O));
end;

class function TlgoLibXML2Backend.LibXMLLoaded: Boolean;
begin
  Result := lgpLibXML2Backend_LibXMLLoaded <> 0;
end;

class function TlgoLibXML2Backend.LibXSLTLoaded: Boolean;
begin
  Result := lgpLibXML2Backend_LibXSLTLoaded <> 0;
end;

class function TlgoLibXML2Backend.LoadLibXML(ALibXML: UTF8String): Boolean;
begin
  Result := lgpLibXML2Backend_LoadLibXML(LGP_PCHAR(ALibXML)) <> 0;
end;

class function TlgoLibXML2Backend.LoadLibXSLT(ALibXSLT: UTF8String;
  ALibEXSLT: UTF8String): Boolean;
begin
  Result := lgpLibXML2Backend_LoadLibXSLT(LGP_PCHAR(ALibXSLT), LGP_PCHAR(ALibEXSLT)) <> 0;
end;

end.
