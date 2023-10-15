{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4Obj;

{$ifdef fpc}
{$mode Delphi}
{$endif}

interface

uses
  Classes, SysUtils, LibGovPl4Intf;

type

  { ElgoException }

  ElgoException = class(Exception)
  private
    FMessage: UTF8String;
  protected
    procedure LoadObject(AException: LGP_EXCEPTION); virtual;
  public
    constructor Create(AException: LGP_EXCEPTION);
    property Message: UTF8String read FMessage;
  end;

  TlgoExceptionClass = class of ElgoException;

  { TlgoObject }

  TlgoObject = class
  public
    ExtObject: LGP_OBJECT;
  public
    constructor Create(AObject: LGP_OBJECT); overload; virtual;
    destructor Destroy; override;
    function ObjClassName: UTF8String;
    function GetIntegerProp(AName: UTF8String): Integer;
    procedure SetIntegerProp(AName: UTF8String; AValue: Integer);
    function GetStringProp(AName: UTF8String): UTF8String;
    procedure SetStringProp(AName: UTF8String; AValue: UTF8String);
    function GetDoubleProp(AName: UTF8String): Double;
    procedure SetDoubleProp(AName: UTF8String; AValue: Double);
    function GetObjectProp(AName: UTF8String): LGP_OBJECT;
    procedure SetObjectProp(AName: UTF8String; AValue: LGP_OBJECT);
    function GetCurrencyProp(AName: UTF8String): Currency;
    procedure SetCurrencyProp(AName: UTF8String; AValue: Currency);
    function GetBooleanProp(AName: UTF8String): Boolean;
    procedure SetBooleanProp(AName: UTF8String; AValue: Boolean);
    function GetInt64Prop(AName: UTF8String): Int64;
    procedure SetInt64Prop(AName: UTF8String; AValue: Int64);

    property IntegerProp[AIndex: UTF8String]: Integer read GetIntegerProp write SetIntegerProp;
    property StringProp[AIndex: UTF8String]: UTF8String read GetStringProp write SetStringProp;
    property DoubleProp[AIndex: UTF8String]: Double read GetDoubleProp write SetDoubleProp;
    property ObjectProp[AIndex: UTF8String]: LGP_OBJECT read GetObjectProp write SetObjectProp;
    property CurrencyProp[AIndex: UTF8String]: Currency read GetCurrencyProp write SetCurrencyProp;
    property BooleanProp[AIndex: UTF8String]: Boolean read GetBooleanProp write SetBooleanProp;
    property Int64Prop[AIndex: UTF8String]: Int64 read GetInt64Prop write SetInt64Prop;
  end;

  TlgoCreatableObject = class(TlgoObject)
  public
    constructor Create(AClassName: UTF8String); overload; virtual; abstract;
  end;

  {$IFNDEF FPC}
  { TOwnerStream }
  TOwnerStream = Class(TStream)
  Protected
    FOwner : Boolean;
    FSource : TStream;
  Public
    Constructor Create(ASource : TStream);
    Destructor Destroy; override;
    Property Source : TStream Read FSource;
    Property SourceOwner : Boolean Read Fowner Write FOwner;
  end;
  {$ENDIF}

  { TlgoStream }

  TlgoStream = class(TOwnerStream)
  private
    FStreamObj: LGP_OBJECT;
  public
    constructor Create(ASource: TStream);
    destructor Destroy; override;
    property StreamObj: LGP_OBJECT read FStreamObj;
  end;

  { TlgoClassList }

  TlgoClassList = class(TList)
  protected
    function Get(Index: Integer): TClass;
    procedure Put(Index: Integer; Item: TClass);
  public
    function FindByName(AName: String): TClass;
    property Items[Index: Integer]: TClass read Get write Put;
  end;

function lgoCheckResult(AExceptionObj: LGP_EXCEPTION; ARaiseExept: Boolean = True): Boolean;
function lgoCreateException(AException: LGP_EXCEPTION): Exception;
procedure lgoRegisterExceptionClass(AClass: ExceptClass; AName: String = '');
function lgoFindExceptionClass(AClassName: String): ExceptClass;
function lgoGetString(AStringObj: LGP_OBJECT; AFreeObj: Boolean = True): UTF8String;
function lgoClassName(AObject: LGP_OBJECT): UTF8String;

procedure lgoRegisterClass(AClass: TClass);
procedure lgoRegisterClasses(AClasses: array of TClass);
function lgoFindClass(AClassName: String): TClass;

implementation

uses
  Contnrs;

type
  TlgoExceptionListElement = class
    Name: String;
    ExceptionClass: ExceptClass;
  end;

var
  lgoClassList: TlgoClassList;
  lgoExceptions: TObjectList;

function lgoCheckResult(AExceptionObj: LGP_EXCEPTION; ARaiseExept: Boolean = True): Boolean;
begin
  if AExceptionObj <> nil then
  begin
    if ARaiseExept then
      raise lgoCreateException(AExceptionObj)
    else
    begin
      lgpObject_Free(AExceptionObj);
      Result := False;
    end;
  end
  else
    Result := True;
end;

function lgoCreateException(AException: LGP_EXCEPTION): Exception;
var
  SO: LGP_OBJECT;
  S, Msg: String;
  C: ExceptClass;
begin
  if lgoCheckResult(lgpObject_GetStringProp(AException, 'ExceptionClass', SO), False) then
  begin
    S := lgoGetString(SO);
    C := lgoFindExceptionClass(S);
    if C = nil then
      C := ElgoException;
    if C.InheritsFrom(ElgoException) then
      Result := TlgoExceptionClass(C).Create(AException)
    else
    begin
      Msg := '';
      if lgoCheckResult(lgpObject_GetStringProp(AException, 'Message', SO), False) then
        Msg := lgoGetString(SO);
      Result := C.Create(Msg);
    end
  end
  else
    Result := ElgoException.Create(AException);
end;

procedure lgoRegisterExceptionClass(AClass: ExceptClass; AName: String);
var
  E: TlgoExceptionListElement;
begin
  E := TlgoExceptionListElement.Create;
  E.ExceptionClass := AClass;
  if AName = '' then
    E.Name := AClass.ClassName
  else
    E.Name := AName;
  lgoExceptions.Add(E);
end;

function lgoFindExceptionClass(AClassName: String): ExceptClass;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to lgoExceptions.Count - 1 do
    if UpperCase(TlgoExceptionListElement(lgoExceptions[I]).Name) = UpperCase(AClassName) then
    begin
      Result := TlgoExceptionListElement(lgoExceptions[I]).ExceptionClass;
      Exit;
    end;
end;

function lgoGetString(AStringObj: LGP_OBJECT; AFreeObj: Boolean = True): UTF8String;
var
  S: LGP_PCHAR;
begin
  Result := '';
  if AStringObj <> nil then
  begin
    S := nil;
    if lgoCheckResult(lgpStringObject_GetValue(AStringObj, S), False) and (S <> nil) then
      Result := S;
    if AFreeObj then
      lgoCheckResult(lgpObject_Free(AStringObj), False);
  end;
end;

function lgoClassName(AObject: LGP_OBJECT): UTF8String;
var
  S: LGP_PCHAR;
begin
  lgoCheckResult(lgpObject_ClassName(AObject, S));
  Result := S;
end;

procedure lgoRegisterClass(AClass: TClass);
begin
  if lgoClassList.IndexOf(AClass) < 0 then
    lgoClassList.Add(AClass);
end;

procedure lgoRegisterClasses(AClasses: array of TClass);
var
  I: Integer;
begin
  for I := 0 to Length(AClasses) do
    lgoRegisterClass(AClasses[I]);
end;

function lgoFindClass(AClassName: String): TClass;
begin
  Result := lgoClassList.FindByName(AClassName);
end;

{ TlgoStream }

function lgpStreamReadFunc(AStreamObject: LGP_POINTER; AData: LGP_POINTER; ASize: LGP_INT32): LGP_INT32; stdcall;
var
  StreamObj: TlgoStream absolute AStreamObject;
begin
  try
    if (AStreamObject <> nil) and (StreamObj is TlgoStream) then
      Result := StreamObj.Source.Read(AData^, ASize)
    else
      Result := -1;
  except
    Result := -1;
  end;
end;

function lgpStreamWriteFunc(AStreamObject: LGP_POINTER; AData: LGP_POINTER; ASize: LGP_INT32): LGP_INT32; stdcall;
var
  StreamObj: TlgoStream absolute AStreamObject;
begin
  try
    if (AStreamObject <> nil) and (StreamObj is TlgoStream) then
      Result := StreamObj.Source.Write(AData^, ASize)
    else
      Result := -1;
  except
    Result := -1;
  end;
end;

function lgpStreamSeekFunc(AStreamObject: LGP_POINTER; AOffset: LGP_INT32; AOrigin: LGP_INT32): LGP_INT32; stdcall;
var
  StreamObj: TlgoStream absolute AStreamObject;
begin
  try
    if (AStreamObject <> nil) and (StreamObj is TlgoStream) then
      Result := StreamObj.Source.Seek(AOffset, AOrigin)
    else
      Result := -1;
  except
    Result := -1;
  end;
end;

function lgpStreamGetPositionFunc(AStreamObject: LGP_POINTER): LGP_INT32; stdcall;
var
  StreamObj: TlgoStream absolute AStreamObject;
begin
  try
    if (AStreamObject <> nil) and (StreamObj is TlgoStream) then
      Result := StreamObj.Source.Position
    else
      Result := -1;
  except
    Result := -1;
  end;
end;

function lgpStreamGetSizeFunc(AStreamObject: LGP_POINTER): LGP_INT32; stdcall;
var
  StreamObj: TlgoStream absolute AStreamObject;
begin
  try
    if (AStreamObject <> nil) and (StreamObj is TlgoStream) then
      Result := StreamObj.Source.Size
    else
      Result := -1;
  except
    Result := -1;
  end;
end;

{ TlgoClassList }

function TlgoClassList.Get(Index: Integer): TClass;
begin
  Result := TClass(inherited Get(Index));
end;

procedure TlgoClassList.Put(Index: Integer; Item: TClass);
begin
  inherited Put(Index, Item);
end;

function TlgoClassList.FindByName(AName: String): TClass;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if UpperCase(Items[I].ClassName) = UpperCase(AName) then
    begin
      Result := Items[I];
      Exit;
    end;
  Result := nil;
end;

{$IFNDEF FPC}
constructor TOwnerStream.Create(ASource: TStream);
begin
  FSource:=ASource;
end;

destructor TOwnerStream.Destroy;
begin
  If FOwner then
    FreeAndNil(FSource);
  inherited Destroy;
end;
{$ENDIF}

constructor TlgoStream.Create(ASource: TStream);
begin
  inherited Create(ASource);
  lgoCheckResult(lgpStream_Create(Self, @lgpStreamReadFunc, @lgpStreamWriteFunc,
    @lgpStreamSeekFunc, @lgpStreamGetPositionFunc, @lgpStreamGetSizeFunc, FStreamObj));
end;

destructor TlgoStream.Destroy;
begin
  if FStreamObj <> nil then
    lgoCheckResult(lgpObject_Free(FStreamObj), False);
  inherited Destroy;
end;

{ TlgoException }

procedure ElgoException.LoadObject(AException: LGP_EXCEPTION);
var
  StrObj: LGP_OBJECT;
begin
  StrObj := nil;
  if lgoCheckResult(lgpObject_GetStringProp(AException, 'Message', StrObj), False) and (StrObj <> nil) then
    FMessage := lgoGetString(StrObj);
end;

constructor ElgoException.Create(AException: LGP_EXCEPTION);
begin
  if AException <> nil then
  begin
    LoadObject(AException);
    lgoCheckResult(lgpObject_Free(AException), False);
  end;
end;

{ TlgoObject }

constructor TlgoObject.Create(AObject: LGP_OBJECT);
begin
  ExtObject := AObject;
end;

destructor TlgoObject.Destroy;
begin
  if ExtObject <> nil then
    lgpObject_Free(ExtObject);
  inherited Destroy;
end;

function TlgoObject.ObjClassName: UTF8String;
var
  P: LGP_PCHAR;
begin
  lgoCheckResult(lgpObject_ClassName(ExtObject, P));
  Result := P;
end;

function TlgoObject.GetIntegerProp(AName: UTF8String): Integer;
begin
  lgoCheckResult(lgpObject_GetIntegerProp(ExtObject, LGP_PCHAR(AName), Result));
end;

procedure TlgoObject.SetIntegerProp(AName: UTF8String; AValue: Integer);
begin
  lgoCheckResult(lgpObject_SetIntegerProp(ExtObject, LGP_PCHAR(AName), AValue));
end;

function TlgoObject.GetStringProp(AName: UTF8String): UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpObject_GetStringProp(ExtObject, LGP_PCHAR(AName), S));
  Result := lgoGetString(S);
end;

procedure TlgoObject.SetStringProp(AName: UTF8String; AValue: UTF8String);
begin
  lgoCheckResult(lgpObject_SetStringProp(ExtObject, LGP_PCHAR(AName), LGP_PCHAR(AValue)));
end;

function TlgoObject.GetDoubleProp(AName: UTF8String): Double;
begin
  lgoCheckResult(lgpObject_GetDoubleProp(ExtObject, LGP_PCHAR(AName), Result));
end;

procedure TlgoObject.SetDoubleProp(AName: UTF8String; AValue: Double);
begin
  lgoCheckResult(lgpObject_SetDoubleProp(ExtObject, LGP_PCHAR(AName), AValue));
end;

function TlgoObject.GetObjectProp(AName: UTF8String): LGP_OBJECT;
begin
  lgoCheckResult(lgpObject_GetObjectProp(ExtObject, LGP_PCHAR(AName), Result));
end;

procedure TlgoObject.SetObjectProp(AName: UTF8String; AValue: LGP_OBJECT);
begin
  lgoCheckResult(lgpObject_SetObjectProp(ExtObject, LGP_PCHAR(AName), AValue));
end;

function TlgoObject.GetCurrencyProp(AName: UTF8String): Currency;
begin
  lgoCheckResult(lgpObject_GetCurrencyProp(ExtObject, LGP_PCHAR(AName), Result));
end;

procedure TlgoObject.SetCurrencyProp(AName: UTF8String; AValue: Currency);
begin
  lgoCheckResult(lgpObject_SetCurrencyProp(ExtObject, LGP_PCHAR(AName), AValue));
end;

function TlgoObject.GetBooleanProp(AName: UTF8String): Boolean;
var
  I: LGP_INT32;
begin
  lgoCheckResult(lgpObject_GetBooleanProp(ExtObject, LGP_PCHAR(AName), I));
  Result := I <> 0;
end;

procedure TlgoObject.SetBooleanProp(AName: UTF8String; AValue: Boolean);
begin
  lgoCheckResult(lgpObject_SetBooleanProp(ExtObject, LGP_PCHAR(AName), Integer(AValue)));
end;

function TlgoObject.GetInt64Prop(AName: UTF8String): Int64;
begin
  lgoCheckResult(lgpObject_GetInt64Prop(ExtObject, LGP_PCHAR(AName), Result));
end;

procedure TlgoObject.SetInt64Prop(AName: UTF8String; AValue: Int64);
begin
  lgoCheckResult(lgpObject_SetInt64Prop(ExtObject, LGP_PCHAR(AName), AValue));
end;

procedure lgoRegisterExceptions;
begin
  lgoRegisterExceptionClass(EAbort);
end;

initialization
  lgoClassList := TlgoClassList.Create;
  lgoExceptions := TObjectList.Create(True);
  lgoRegisterExceptions;

finalization
  lgoClassList.Free;
  lgoExceptions.Free;

end.

