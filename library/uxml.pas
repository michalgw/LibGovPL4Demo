{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uXML;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uTypes, lgBackend, lgLibXML2, Contnrs, uObject, uException;

type

  { TlgpXMLValidationError }

  TlgpXMLValidationError = class(TlgBaseClass)
  private
    FError: TlgXMLValidationError;
  published
    constructor Create(AError: TlgXMLValidationError);
    property ErrorCode: Integer read FError.ErrorCode;
    property Message: String read FError.Message;
    property Line: Integer read FError.Line;
    property Path: String read FError.Path;
    property SimplePath: String read FError.SimplePath;
  end;

  TlgpXMLValidationErrors = TObjectList;

function lgpXMLReader_CreateFromFile(AClassName: LGP_PCHAR; AFileName: LGP_PCHAR; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXMLReader_CreateFromStream(AClassName: LGP_PCHAR; AStream: LGP_OBJECT; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXMLReader_CreateFromString(AClassName: LGP_PCHAR; AString: LGP_PCHAR; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXMLReader_ReadValue(AReader: LGP_OBJECT; AXPath: LGP_PCHAR; var AValue: LGP_OBJECT; var AFound: LGP_INT32): LGP_EXCEPTION; stdcall;

function lgpXMLValidator_Create(AClassName: LGP_PCHAR; var AValidator: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXMLValidator_AddSchemaLocation(AValidator: LGP_OBJECT; ANS: LGP_PCHAR; ALocation: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpXMLValidator_AddSchemaReader(AValidator: LGP_OBJECT; ANS: LGP_PCHAR; AXMLDoc: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXMLValidator_ClearSchemas(AValidator: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXMLValidator_Validate(AValidator: LGP_OBJECT; AXMLDoc: LGP_OBJECT; var AErrors: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpXMLXSLTransformation_Create(AClassName: LGP_PCHAR; var ATransformation: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXMLXSLTransformation_AddStyleLocation(ATransformation: LGP_OBJECT; ANS: LGP_PCHAR; ALocation: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpXMLXSLTransformation_AddStyleReader(ATransformation: LGP_OBJECT; ANS: LGP_PCHAR; AXMLDoc: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXMLXSLTransformation_ClearStyles(ATransformation: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpXMLXSLTransformation_Transform(ATransformation: LGP_OBJECT; AXMLDoc: LGP_OBJECT; AOutStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpLibXML2Backend_LibXMLLoaded: LGP_INT32; stdcall;
function lgpLibXML2Backend_LibXSLTLoaded: LGP_INT32; stdcall;
function lgpLibXML2Backend_LoadLibXML(ALibXML: LGP_PCHAR): LGP_INT32; stdcall;
function lgpLibXML2Backend_LoadLibXSLT(ALibXSLT, ALibEXSLT: LGP_PCHAR): LGP_INT32; stdcall;
function lgpLibXML2Backend_GetCacheExternals: LGP_INT32; stdcall;
procedure lgpLibXML2Backend_SetCacheExternals(AValue: LGP_INT32); stdcall;
function lgpLibXML2Backend_GetCacheDir: LGP_PCHAR; stdcall;
procedure lgpLibXML2Backend_SetCacheDir(AValue: LGP_PCHAR); stdcall;
function lgpLibXML2Backend_GetHTTPClient: LGP_OBJECT; stdcall;
function lgpLibXML2Backend_SetHTTPClient(AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;

implementation

function lgpXMLReader_CreateFromFile(AClassName: LGP_PCHAR;
  AFileName: LGP_PCHAR; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  XMLReaderClass: TlgXMLReaderClass;
begin
  Result := nil;
  AReader := nil;
  try
    XMLReaderClass := XMLReaderClasses.FindByClassName(AClassName);
    if XMLReaderClass <> nil then
    begin
      AReader := XMLReaderClass.CreateFromFile(AFileName);
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgAddObject(TObject(AReader));
      {$endif}
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLReader_CreateFromStream(AClassName: LGP_PCHAR;
  AStream: LGP_OBJECT; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  XMLReaderClass: TlgXMLReaderClass;
begin
  Result := nil;
  AReader := nil;
  try
    CheckObject(AStream, TStream);
    XMLReaderClass := XMLReaderClasses.FindByClassName(AClassName);
    if XMLReaderClass <> nil then
    begin
      AReader := XMLReaderClass.CreateFromStream(TStream(AStream));
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgAddObject(TObject(AReader));
      {$endif}
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLReader_CreateFromString(AClassName: LGP_PCHAR;
  AString: LGP_PCHAR; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  XMLReaderClass: TlgXMLReaderClass;
begin
  Result := nil;
  AReader := nil;
  try
    XMLReaderClass := XMLReaderClasses.FindByClassName(AClassName);
    if XMLReaderClass <> nil then
    begin
      AReader := XMLReaderClass.CreateFromString(AString);
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgAddObject(TObject(AReader));
      {$endif}
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLReader_ReadValue(AReader: LGP_OBJECT; AXPath: LGP_PCHAR;
  var AValue: LGP_OBJECT; var AFound: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  S: String;
begin
  Result := nil;
  AValue := nil;
  AFound := 0;
  try
    CheckObject(AReader, TlgXMLReader);
    AFound := LGP_INT32(TlgXMLReader(AReader).ReadValue(AXPath, S));
    if AFound <> 0 then
      AValue := TStringObject.Create(S);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLValidator_Create(AClassName: LGP_PCHAR;
  var AValidator: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  XMLValidatorClass: TlgXMLValidatorClass;
begin
  Result := nil;
  AValidator := nil;
  try
    XMLValidatorClass := XMLValidatorClasses.FindByClassName(AClassName);
    if XMLValidatorClass <> nil then
    begin
      AValidator := XMLValidatorClass.Create;
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgAddObject(TObject(AValidator));
      {$endif}
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLValidator_AddSchemaLocation(AValidator: LGP_OBJECT;
  ANS: LGP_PCHAR; ALocation: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AValidator, TlgXMLValidator);
    TlgXMLValidator(AValidator).AddSchema(ANS, ALocation);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLValidator_AddSchemaReader(AValidator: LGP_OBJECT;
  ANS: LGP_PCHAR; AXMLDoc: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AValidator, TlgXMLValidator);
    CheckObject(AXMLDoc, TlgXMLReader);
    TlgXMLValidator(AValidator).AddSchema(ANS, TlgXMLReader(AXMLDoc));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLValidator_ClearSchemas(AValidator: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AValidator, TlgXMLValidator);
    TlgXMLValidator(AValidator).ClearSchemas;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLValidator_Validate(AValidator: LGP_OBJECT; AXMLDoc: LGP_OBJECT;
  var AErrors: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  ErrArr: TlgXMLValidationErrors;
  ErrLst: TlgpXMLValidationErrors = nil;
  I: Integer;
begin
   Result := nil;
   AErrors := nil;
  try
    CheckObject(AValidator, TlgXMLValidator);
    CheckObject(AXMLDoc, TlgXMLReader);
    if not TlgXMLValidator(AValidator).Validate(TlgXMLReader(AXMLDoc), ErrArr) then
    begin
      ErrLst := TlgpXMLValidationErrors.Create(True);
      for I := 0 to Length(ErrArr) - 1 do
        ErrLst.Add(TlgpXMLValidationError.Create(ErrArr[I]));
      AErrors := ErrLst;
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLXSLTransformation_Create(AClassName: LGP_PCHAR;
  var ATransformation: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  XMLXSTClass: TlgXMLXSLTransformationClass;
begin
  Result := nil;
  ATransformation := nil;
  try
    XMLXSTClass := XMLXSLTClasses.FindByClassName(AClassName);
    if XMLXSTClass <> nil then
    begin
      ATransformation := XMLXSTClass.Create;
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgAddObject(TObject(ATransformation));
      {$endif}
    end;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLXSLTransformation_AddStyleLocation(ATransformation: LGP_OBJECT;
  ANS: LGP_PCHAR; ALocation: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ATransformation, TlgXMLXSLTransformation);
    TlgXMLXSLTransformation(ATransformation).AddStyle(ANS, ALocation);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLXSLTransformation_AddStyleReader(ATransformation: LGP_OBJECT;
  ANS: LGP_PCHAR; AXMLDoc: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ATransformation, TlgXMLXSLTransformation);
    CheckObject(AXMLDoc, TlgXMLReader);
    TlgXMLXSLTransformation(ATransformation).AddStyle(ANS, TlgXMLReader(AXMLDoc));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLXSLTransformation_ClearStyles(ATransformation: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ATransformation, TlgXMLXSLTransformation);
    TlgXMLXSLTransformation(ATransformation).ClearStyles;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpXMLXSLTransformation_Transform(ATransformation: LGP_OBJECT;
  AXMLDoc: LGP_OBJECT; AOutStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ATransformation, TlgXMLXSLTransformation);
    CheckObject(AXMLDoc, TlgXMLReader);
    CheckObject(AOutStream, TStream);
    TlgXMLXSLTransformation(ATransformation).Transform(TlgXMLReader(AXMLDoc), TStream(AOutStream));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpLibXML2Backend_LibXMLLoaded: LGP_INT32; stdcall;
begin
  Result := LGP_INT32(TlgLibXML2Backend.LibXMLLoaded);
end;

function lgpLibXML2Backend_LibXSLTLoaded: LGP_INT32; stdcall;
begin
  Result := LGP_INT32(TlgLibXML2Backend.LibXSLTLoaded);
end;

function lgpLibXML2Backend_LoadLibXML(ALibXML: LGP_PCHAR): LGP_INT32; stdcall;
begin
  Result := LGP_INT32(TlgLibXML2Backend.LoadLibXML(ALibXML));
end;

function lgpLibXML2Backend_LoadLibXSLT(ALibXSLT, ALibEXSLT: LGP_PCHAR): LGP_INT32; stdcall;
begin
  Result := LGP_INT32(TlgLibXML2Backend.LoadLibXSLT(ALibXSLT, ALibEXSLT));
end;

function lgpLibXML2Backend_GetCacheExternals: LGP_INT32; stdcall;
begin
  Result := LGP_INT32(TlgLibXML2Backend.CacheExternals);
end;

procedure lgpLibXML2Backend_SetCacheExternals(AValue: LGP_INT32); stdcall;
begin
  TlgLibXML2Backend.CacheExternals := AValue <> 0;
end;

function lgpLibXML2Backend_GetCacheDir: LGP_PCHAR; stdcall;
begin
  Result := @TlgLibXML2Backend.CacheDir[1];
end;

procedure lgpLibXML2Backend_SetCacheDir(AValue: LGP_PCHAR); stdcall;
begin
  TlgLibXML2Backend.CacheDir := AValue;
end;

function lgpLibXML2Backend_GetHTTPClient: LGP_OBJECT; stdcall;
begin
  Result := TlgLibXML2Backend.HTTPClient;
end;

function lgpLibXML2Backend_SetHTTPClient(AValue: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    CheckObject(AValue, TlgHTTPClient);
    TlgLibXML2Backend.HTTPClient := TlgHTTPClient(AValue);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

{ TlgpXMLValidationError }

constructor TlgpXMLValidationError.Create(AError: TlgXMLValidationError);
begin
  FError := AError;
end;

end.

