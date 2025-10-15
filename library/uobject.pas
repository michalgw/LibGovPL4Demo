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
function lgpObject_ClassName(AObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
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
function lgpStringObject_GetValueAndLen(AStringObject: LGP_OBJECT; var AValue: LGP_PCHAR; var ALen: LGP_INT32): LGP_EXCEPTION; stdcall;

function lgpListObject_GetCount(AListObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpListObject_GetItem(AListObject: LGP_OBJECT; AIndex: LGP_INT32; var AItem: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpListObject_Delete(AListObject: LGP_OBJECT; AIndex: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpListObject_Remove(AListObject: LGP_OBJECT; AItem: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpListObject_Add(AListObject: LGP_OBJECT; AItem: LGP_OBJECT; var AIndex: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpListObject_GetOwnsObjects(AListObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpListObject_SetOwnsObjects(AListObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;

{$IFDEF LGP_DEBUG_OBJ}
procedure lgpDbgObjectListInit;
procedure lgpDbgObjectListDone;
procedure lgpDbgAddObject(AObject: TObject);
procedure lgpDbgRemoveObject(AObject: TObject);
{$ENDIF}

function lgpDbgObjectCount: LGP_INT32; stdcall;

implementation

uses
  uException, lgBackend, Rtti, lgKSeFTypes, Contnrs, lgKSeFObjects;

{$IFDEF LGP_DEBUG_OBJ}
var
  LGPDbgObjectList: TList = nil;

procedure lgpDbgObjectListInit;
begin
  if not Assigned(LGPDbgObjectList) then
    LGPDbgObjectList := TList.Create;
end;

procedure lgpDbgObjectListDone;
begin
  if Assigned(LGPDbgObjectList) then
    FreeAndNil(LGPDbgObjectList);
end;

procedure lgpDbgAddObject(AObject: TObject);
begin
  if Assigned(LGPDbgObjectList) then
    if LGPDbgObjectList.IndexOf(AObject) < 0 then
      LGPDbgObjectList.Add(AObject);
end;

procedure lgpDbgRemoveObject(AObject: TObject);
begin
  if Assigned(LGPDbgObjectList) and (LGPDbgObjectList.IndexOf(AObject) >= 0) then
    LGPDbgObjectList.Remove(AObject);
end;
{$ENDIF}

function lgpDbgObjectCount: LGP_INT32; stdcall;
begin
  Result := -1;
  {$IFDEF LGP_DEBUG_OBJ}
  if Assigned(LGPDbgObjectList) then
    Result := LGPDbgObjectList.Count;
  {$ENDIF}
end;

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
    begin
      {$ifdef LGP_DEBUG_OBJ}
      lgpDbgRemoveObject(TObject(AObject));
      {$endif}
      TObject(AObject).Free;
    end
    else
      Result := lgpCreateInvalidObjectException;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpObject_ClassName(AObject: LGP_OBJECT; var AClassName: LGP_PSSTRING
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    if ValidObject(AObject) then
      AClassName := PVmt(TObject(AObject).ClassType)^.vClassName
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
      if (P <> nil) and (P.PropertyType.TypeKind in [tkInteger, tkInt64, tkQWord, tkEnumeration]) then
        AValue := P.GetValue(AObject).AsOrdinal
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
      if (P <> nil) and (P.PropertyType.TypeKind in [tkInteger, tkInt64, tkQWord, tkEnumeration]) then
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
      if (P <> nil) and (P.PropertyType.TypeKind in [tkInteger, tkEnumeration, tkInt64, tkQWord]) then
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
      if (P <> nil) and (P.PropertyType.TypeKind in [tkInteger, tkEnumeration, tkInt64, tkQWord]) then
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

function lgpStringObject_GetValueAndLen(AStringObject: LGP_OBJECT;
  var AValue: LGP_PCHAR; var ALen: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AValue := nil;
  ALen := 0;
  try
    CheckObject(AStringObject, TStringObject);
    AValue := @TStringObject(AStringObject).Value[1];
    ALen := Length(TStringObject(AStringObject).Value);
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
    else if Obj is TObjectList then
      AValue := (Obj as TObjectList).Count
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
    else if Obj is TObjectList then
      AItem := (Obj as TObjectList).Items[AIndex]
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
    else if Obj is TObjectList then
      (Obj as TObjectList).Delete(AIndex)
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
    else if Obj is TObjectList then
      (Obj as TObjectList).Remove(TObject(AItem))
    else if Supports(Obj, IKSeFArray_GUID) then
      (Obj as IKSeFArray).IntfRemove(TKSeFObject(Obj))
    else
      raise EInvalidCast.Create('Invalid typecast');
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpListObject_Add(AListObject: LGP_OBJECT; AItem: LGP_OBJECT;
  var AIndex: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  Obj: TObject absolute AListObject;
begin
  Result := nil;
  AIndex := -1;
  try
    CheckObject(AListObject, TObject);
    CheckObject(AItem, TObject);
    if Obj is TlgCertificates then
    begin
      CheckObject(AItem, TlgCertificate);
      AIndex := (Obj as TlgCertificates).Add(TlgCertificate(AItem))
    end
    else if Obj is TObjectList then
      AIndex := (Obj as TObjectList).Add(TObject(AItem))
    else if Supports(Obj, IKSeFArray_GUID) then
      //(Obj as IKSeFArray).IntfRemove(TKSeFObject(Obj))
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
    else if Obj is TObjectList then
      AValue := Integer((Obj as TObjectList).OwnsObjects)
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
    else if Obj is TObjectList then
      (Obj as TObjectList).OwnsObjects := AValue <> 0
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

