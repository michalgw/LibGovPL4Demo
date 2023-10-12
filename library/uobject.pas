{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uObject;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uTypes;

type

  { TStringObject }

  TStringObject = class
  public
    Value: String;
    constructor Create(const AValue: String);
  end;

function ValidObject(AObject: LGP_OBJECT; AClass: TClass = nil): Boolean;
procedure CheckObject(AObject: LGP_OBJECT; AClass: TClass = nil);

function lgpObject_Free(AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpObject_ClassName(AObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpObject_GetStringProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpObject_SetStringProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpObject_GetIntegerProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpObject_SetIntegerProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpObject_GetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpObject_SetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
function lgpObject_GetObjectProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpObject_SetObjectProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpObject_GetCurrencyProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_CURRENCY): LGP_EXCEPTION; stdcall;
function lgpObject_SetCurrencyProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_CURRENCY): LGP_EXCEPTION; stdcall;
function lgpObject_GetBooleanProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpObject_SetBooleanProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpObject_GetInt64Prop(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT64): LGP_EXCEPTION; stdcall;
function lgpObject_SetInt64Prop(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT64): LGP_EXCEPTION; stdcall;

function lgpStringObject_GetValue(AStringObject: LGP_OBJECT; var AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;

function lgpListObject_GetCount(AListObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpListObject_GetItem(AListObject: LGP_OBJECT; AIndex: LGP_INT32; var AItem: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpListObject_Delete(AListObject: LGP_OBJECT; AIndex: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpListObject_Remove(AListObject: LGP_OBJECT; AItem: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpListObject_GetOwnsObjects(AListObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpListObject_SetOwnsObjects(AListObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;

implementation

uses
  uException, lgBackend, Rtti, lgKSeFTypes;

function ValidObject(AObject: LGP_OBJECT; AClass: TClass): Boolean;
begin
  try
    if AClass = nil then
      AClass := TObject;
    Result := (AObject <> nil) and (TObject(AObject) is AClass);
  except
    Result := False;
  end;
end;

procedure CheckObject(AObject: LGP_OBJECT; AClass: TClass);
begin
  if AClass = nil then
    AClass := TObject;
  if (AObject = nil) or (not (TObject(AObject) is AClass)) then
    raise Exception.Create('Invalid typecast');
end;

function lgpObject_Free(AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    if ValidObject(AObject) then
      TObject(AObject).Free
    else
      Result := lgpCreateInvalidObjectException;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpObject_ClassName(AObject: LGP_OBJECT; var AClassName: LGP_PCHAR
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    if ValidObject(AObject) then
      AClassName := @(PVmt(TObject(AObject).ClassType)^.vClassName^[1])
    else
      Result := lgpCreateInvalidObjectException;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpObject_GetStringProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkAnsiString) then
        AValue := TStringObject.Create(P.GetValue(AObject).AsString)
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_SetStringProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkAnsiString) then
        if P.IsWritable then
          P.SetValue(AObject, AValue)
        else
          Result := lgpCreateExceptioObject('Property is read-only')
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_GetIntegerProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind in [tkInteger, tkEnumeration]) then
        AValue := P.GetValue(AObject).AsInteger
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_SetIntegerProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind in [tkInteger, tkEnumeration]) then
        if P.IsWritable then
          P.SetValue(AObject, AValue)
        else
          Result := lgpCreateExceptioObject('Property is read-only')
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_GetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkFloat) then
        AValue := P.GetValue(AObject).AsExtended
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_SetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkFloat) then
        if P.IsWritable then
          P.SetValue(AObject, AValue)
        else
          Result := lgpCreateExceptioObject('Property is read-only')
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_GetObjectProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkClass) then
        AValue := P.GetValue(AObject).AsObject
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_SetObjectProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkClass) then
        if P.IsWritable then
          P.SetValue(AObject, TObject(AValue))
        else
          Result := lgpCreateExceptioObject('Property is read-only')
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_GetCurrencyProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  var AValue: LGP_CURRENCY): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkFloat) then
        AValue := P.GetValue(AObject).AsCurrency
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_SetCurrencyProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  AValue: LGP_CURRENCY): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkFloat) then
        if P.IsWritable then
          P.SetValue(AObject, AValue)
        else
          Result := lgpCreateExceptioObject('Property is read-only')
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_GetBooleanProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkBool) then
        AValue := Integer(P.GetValue(AObject).AsBoolean)
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_SetBooleanProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind = tkBool) then
        if P.IsWritable then
          P.SetValue(AObject, AValue <> 0)
        else
          Result := lgpCreateExceptioObject('Property is read-only')
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_GetInt64Prop(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  var AValue: LGP_INT64): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind in [tkInteger, tkEnumeration, tkInt64]) then
        AValue := P.GetValue(AObject).AsInt64
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpObject_SetInt64Prop(AObject: LGP_OBJECT; APropName: LGP_PCHAR;
  AValue: LGP_INT64): LGP_EXCEPTION; stdcall;
var
  Ctx: TRttiContext;
  RT: TRttiType;
  P: TRttiProperty;
begin
  Result := nil;
  try
    try
      CheckObject(AObject, TObject);
      Ctx := TRttiContext.Create;
      RT := Ctx.GetType(TObject(AObject).ClassType);
      P := RT.GetProperty(APropName);
      if (P <> nil) and (P.PropertyType.TypeKind in [tkInteger, tkEnumeration, tkInt64]) then
        if P.IsWritable then
          P.SetValue(AObject, AValue)
        else
          Result := lgpCreateExceptioObject('Property is read-only')
      else
        Result := lgpCreateExceptioObject('Invalid property');
    except
      on E: Exception do
        Result := lgpCreateExceptioObject(E);
    end;
  finally
    Ctx.Free;
  end;
end;

function lgpStringObject_GetValue(AStringObject: LGP_OBJECT;
  var AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(AStringObject, TStringObject);
    AValue := @TStringObject(AStringObject).Value[1];
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpListObject_GetCount(AListObject: LGP_OBJECT; var AValue: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
var
  Obj: TObject absolute AListObject;
begin
  Result := nil;
  try
    CheckObject(AListObject, TObject);
    if Obj is TlgCertificates then
      AValue := (Obj as TlgCertificates).Count
    else if Supports(Obj, IKSeFArray_GUID) then
      AValue := (Obj as IKSeFArray).IntfCount
    else if Obj is TlgpKSeFExceptionDetailList then
      AValue := (Obj as TlgpKSeFExceptionDetailList).Count
    else
      raise EInvalidCast.Create('Invalid typecast');
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpListObject_GetItem(AListObject: LGP_OBJECT; AIndex: LGP_INT32;
  var AItem: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Obj: TObject absolute AListObject;
begin
  Result := nil;
  try
    CheckObject(AListObject, TObject);
    if Obj is TlgCertificates then
      AItem := (Obj as TlgCertificates).Items[AIndex]
    else if Supports(Obj, IKSeFArray_GUID) then
      AItem := (Obj as IKSeFArray).IntfGetItem(AIndex)
    else if Obj is TlgpKSeFExceptionDetailList then
      AItem := (Obj as TlgpKSeFExceptionDetailList).Items[AIndex]
    else
      raise EInvalidCast.Create('Invalid typecast');
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpListObject_Delete(AListObject: LGP_OBJECT; AIndex: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
var
  Obj: TObject absolute AListObject;
begin
  Result := nil;
  try
    CheckObject(AListObject, TObject);
    if Obj is TlgCertificates then
      (Obj as TlgCertificates).Delete(AIndex)
    else if Supports(Obj, IKSeFArray_GUID) then
      (Obj as IKSeFArray).Delete(AIndex)
    else
      raise EInvalidCast.Create('Invalid typecast');
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpListObject_Remove(AListObject: LGP_OBJECT; AItem: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
var
  Obj: TObject absolute AListObject;
begin
  Result := nil;
  try
    CheckObject(AListObject, TObject);
    if Obj is TlgCertificates then
      (Obj as TlgCertificates).Remove(TlgCertificate(AItem))
    else if Supports(Obj, IKSeFArray_GUID) then
      (Obj as IKSeFArray).IntfRemove(TKSeFObject(Obj))
    else
      raise EInvalidCast.Create('Invalid typecast');
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpListObject_GetOwnsObjects(AListObject: LGP_OBJECT;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  Obj: TObject absolute AListObject;
begin
  Result := nil;
  try
    CheckObject(AListObject, TObject);
    if Obj is TlgCertificates then
      AValue := Integer((Obj as TlgCertificates).OwnsObjects)
    else if Supports(Obj, IKSeFArray_GUID) then
      AValue := Integer((Obj as IKSeFArray).IntfGetOwnObj)
    else
      raise EInvalidCast.Create('Invalid typecast');
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpListObject_SetOwnsObjects(AListObject: LGP_OBJECT; AValue: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
var
  Obj: TObject absolute AListObject;
begin
  Result := nil;
  try
    CheckObject(AListObject, TObject);
    if Obj is TlgCertificates then
      (Obj as TlgCertificates).OwnsObjects := AValue <> 0
    else if Supports(Obj, IKSeFArray_GUID) then
      (Obj as IKSeFArray).IntfSetOwnObj(AValue <> 0)
    else
      raise EInvalidCast.Create('Invalid typecast');
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

{ TStringObject }

constructor TStringObject.Create(const AValue: String);
begin
  Value := AValue;
end;


end.

