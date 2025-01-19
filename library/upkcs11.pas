{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uPKCS11;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, lgBackend, lgPKCS11, Contnrs, uTypes;

type
  TlgpPKCS11Info = class(TlgBaseClass)
  private
    FInfo: TlgPKCS11Info;
  published
    property CryptokitVersionStr: String read FInfo.CryptokitVersionStr;
    property CryptokitVersionMajor: Integer read FInfo.CryptokitVersionMajor;
    property CryptokitVersionMinor: Integer read FInfo.CryptokitVersionMinor;
    property ManufacturerID: String read FInfo.ManufacturerID;
    property LibraryDescription: String read FInfo.LibraryDescription;
    property LibraryVersionStr: String read FInfo.LibraryVersionStr;
    property LibraryVersionMajor: Integer read FInfo.LibraryVersionMajor;
    property LibraryVersionMinor: Integer read FInfo.LibraryVersionMinor;
  end;

  TlgpPKCS11TokenInfo = class(TlgBaseClass)
  private
    FInfo: TlgPKCS11TokenInfo;
  published
    property TokenLabel: String read FInfo.TokenLabel;
    property ManufacturerID: String read FInfo.ManufacturerID;
    property Model: String read FInfo.Model;
    property SerialNumber: String read FInfo.SerialNumber;
    property Flags: TlgPKCS11TokenFlags read FInfo.Flags;
    property FlagsRaw: LGP_CK_ULONG read FInfo.FlagsRaw;
    property MaxSessionCount: LGP_CK_ULONG read FInfo.MaxSessionCount;
    property SessionCount: LGP_CK_ULONG read FInfo.SessionCount;
    property MaxRwSessionCount: LGP_CK_ULONG read FInfo.MaxRwSessionCount;
    property RwSessionCount: LGP_CK_ULONG read FInfo.RwSessionCount;
    property MaxPinLen: LGP_CK_ULONG read FInfo.MaxPinLen;
    property MinPinLen: LGP_CK_ULONG read FInfo.MinPinLen;
    property TotalPublicMemory: LGP_CK_ULONG read FInfo.TotalPublicMemory;
    property FreePublicMemory: LGP_CK_ULONG read FInfo.FreePublicMemory;
    property TotalPrivateMemory: LGP_CK_ULONG read FInfo.TotalPrivateMemory;
    property FreePrivateMemory: LGP_CK_ULONG read FInfo.FreePrivateMemory;
    property HardwareVersionStr: String read FInfo.HardwareVersionStr;
    property HardwareVersionMajor: Integer read FInfo.HardwareVersionMajor;
    property HardwareVersionMinor: Integer read FInfo.HardwareVersionMinor;
    property FirmwareVersionStr: String read FInfo.FirmwareVersionStr;
    property FirmwareVersionMajor: Integer read FInfo.FirmwareVersionMajor;
    property FirmwareVersionMinor: Integer read FInfo.FirmwareVersionMinor;
    property UtcTime: String read FInfo.UtcTime;
  end;

  { TlgpPKCS11SlotInfo }

  TlgpPKCS11SlotInfo = class(TlgBaseClass)
  private
    FInfo: TlgPKCS11SlotInfo;
    FTokenInfo: TlgpPKCS11TokenInfo;
  public
    destructor Destroy; override;
  published
    property SlotID: LGP_CK_ULONG read FInfo.SlotID;
    property SlotDescription: String read FInfo.SlotDescription;
    property ManufacturerID: String read FInfo.ManufacturerID;
    property Flags: TlgPKCS11SlotFlags read FInfo.Flags;
    property FlagsRaw: LGP_CK_ULONG read FInfo.FlagsRaw;
    property HardwareVersionStr: String read FInfo.HardwareVersionStr;
    property HardwareVersionMajor: Integer read FInfo.HardwareVersionMajor;
    property HardwareVersionMinor: Integer read FInfo.HardwareVersionMinor;
    property FirmwareVersionStr: String read FInfo.FirmwareVersionStr;
    property FirmwareVersionMajor: Integer read FInfo.FirmwareVersionMajor;
    property FirmwareVersionMinor: Integer read FInfo.FirmwareVersionMinor;
    property TokenPresent: Boolean read FInfo.TokenPresent;
    property TokenInfo: TlgpPKCS11TokenInfo read FTokenInfo write FTokenInfo;
  end;

  TlgpPKCS11SlotInfoList = TObjectList;

function lgpPKCS11Certificate_GetSession(ACertificate: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpPKCS11Session_CheckActive(ASession: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpPKCS11Session_Login(ASession: LGP_OBJECT; APIN: LGP_PCHAR; AUserType: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpPKCS11Session_Logout(ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11Session_GetSigner(ASession: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11Session_GetHandle(ASession: LGP_OBJECT; var AHandle: LGP_CK_ULONG): LGP_EXCEPTION; stdcall;
function lgpPKCS11Session_GetSlotID(ASession: LGP_OBJECT; var ASlotID: LGP_CK_ULONG): LGP_EXCEPTION; stdcall;
function lgpPKCS11Session_GetState(ASession: LGP_OBJECT; var AState: LGP_UINT32): LGP_EXCEPTION; stdcall;
function lgpPKCS11Session_GetFlags(ASession: LGP_OBJECT; var AFlags: LGP_UINT32): LGP_EXCEPTION; stdcall;

function lgpPKCS11CertificateSigner_LoadLibrary(ASigner: LGP_OBJECT; ALibName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_FreeLibrary(ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_GetInfo(ASigner: LGP_OBJECT; var AInfo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_GetSlots(ASigner: LGP_OBJECT; AWithToken: LGP_INT32; var AList: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_SessionStart(ASigner: LGP_OBJECT; ACertificate: LGP_OBJECT; var ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_SessionClose(ASigner: LGP_OBJECT; ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_SessionCloseIdx(ASigner: LGP_OBJECT; ASessionIndex: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_SessionCloseAll(ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_GetLibLoaded(ASigner: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_GetLibFileName(ASigner: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_GetSessions(ASigner: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_FunctionList(ASigner: LGP_OBJECT; var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_CheckLibrary(ALibFile: LGP_PCHAR; var AKomunikat: LGP_OBJECT; var AResult: LGP_INT32): LGP_EXCEPTION; stdcall;
function lgpPKCS11CertificateSigner_GetLibraryInfo(ALibFile: LGP_PCHAR; var ALibInfo: LGP_OBJECT; var AKomunikat: LGP_OBJECT; var AResult: LGP_INT32): LGP_EXCEPTION; stdcall;

implementation

uses
  uObject, uException;

function lgpPKCS11Certificate_GetSession(ACertificate: LGP_OBJECT;
  var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AObject := nil;
  try
    CheckObject(ACertificate, TlgPKCS11Certificate);
    AObject := TlgPKCS11Certificate(ACertificate).Session;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11Session_CheckActive(ASession: LGP_OBJECT;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AValue := 0;
  try
    CheckObject(ASession, TlgPKCS11Session);
    AValue := LGP_INT32(TlgPKCS11Session(ASession).CheckActive);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11Session_Login(ASession: LGP_OBJECT; APIN: LGP_PCHAR;
  AUserType: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASession, TlgPKCS11Session);
    TlgPKCS11Session(ASession).Login(APIN, TlgPKCS11UserType(AUserType));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11Session_Logout(ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASession, TlgPKCS11Session);
    TlgPKCS11Session(ASession).Logout;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11Session_GetSigner(ASession: LGP_OBJECT;
  var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AObject := nil;
  try
    CheckObject(ASession, TlgPKCS11Session);
    AObject := TlgPKCS11Session(ASession).Signer;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11Session_GetHandle(ASession: LGP_OBJECT;
  var AHandle: LGP_CK_ULONG): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AHandle := 0;
  try
    CheckObject(ASession, TlgPKCS11Session);
    AHandle := TlgPKCS11Session(ASession).Handle;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11Session_GetSlotID(ASession: LGP_OBJECT;
  var ASlotID: LGP_CK_ULONG): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ASlotID := 0;
  try
    CheckObject(ASession, TlgPKCS11Session);
    ASlotID := TlgPKCS11Session(ASession).SlotID;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11Session_GetState(ASession: LGP_OBJECT; var AState: LGP_UINT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AState := 0;
  try
    CheckObject(ASession, TlgPKCS11Session);
    AState := LGP_INT32(TlgPKCS11Session(ASession).State);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11Session_GetFlags(ASession: LGP_OBJECT; var AFlags: LGP_UINT32
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AFlags := 0;
  try
    CheckObject(ASession, TlgPKCS11Session);
    AFlags := TlgPKCS11Session(ASession).FlagsRaw;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_LoadLibrary(ASigner: LGP_OBJECT;
  ALibName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    TlgPKCS11CertificateSigner(ASigner).LoadLibrary(ALibName);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_FreeLibrary(ASigner: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    TlgPKCS11CertificateSigner(ASigner).FreeLibrary;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_GetInfo(ASigner: LGP_OBJECT;
  var AInfo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  InfoRec: TlgPKCS11Info;
  InfoCls: TlgpPKCS11Info;
begin
  Result := nil;
  AInfo := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    InfoRec := TlgPKCS11CertificateSigner(ASigner).GetInfo;
    InfoCls := TlgpPKCS11Info.Create;
    InfoCls.FInfo := InfoRec;
    AInfo := InfoCls;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_GetSlots(ASigner: LGP_OBJECT;
  AWithToken: LGP_INT32; var AList: LGP_OBJECT): LGP_EXCEPTION; stdcall;
var
  Slots: TlgPKCS11SlotInfoList;
  SlotInfoRec: TlgPKCS11SlotInfo;
  SlotList: TlgpPKCS11SlotInfoList;
  SlotInfo: TlgpPKCS11SlotInfo;
begin
  Result := nil;
  AList := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    Slots := TlgPKCS11CertificateSigner(ASigner).GetSlots(AWithToken <> 0);
    SlotList := TlgpPKCS11SlotInfoList.Create(True);
    for SlotInfoRec in Slots do
    begin
      SlotInfo := TlgpPKCS11SlotInfo.Create;
      SlotInfo.FInfo := SlotInfoRec;
      if SlotInfoRec.TokenPresent then
      begin
        SlotInfo.FTokenInfo := TlgpPKCS11TokenInfo.Create;
        SlotInfo.FTokenInfo.FInfo := SlotInfoRec.TokenInfo;
      end;
      SlotList.Add(SlotInfo);
    end;
    AList := SlotList;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_SessionStart(ASigner: LGP_OBJECT;
  ACertificate: LGP_OBJECT; var ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  ASession := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    CheckObject(ACertificate, TlgPKCS11Certificate);
    ASession := TlgPKCS11CertificateSigner(ASigner).SessionStart(TlgPKCS11Certificate(ACertificate));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_SessionClose(ASigner: LGP_OBJECT;
  ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    CheckObject(ASession, TlgPKCS11Session);
    TlgPKCS11CertificateSigner(ASigner).SessionClose(TlgPKCS11Session(ASession));
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_SessionCloseIdx(ASigner: LGP_OBJECT;
  ASessionIndex: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    TlgPKCS11CertificateSigner(ASigner).SessionClose(ASessionIndex);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_SessionCloseAll(ASigner: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    TlgPKCS11CertificateSigner(ASigner).SessionCloseAll;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_GetLibLoaded(ASigner: LGP_OBJECT;
  var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    AValue := LGP_INT32(TlgPKCS11CertificateSigner(ASigner).LibLoaded);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_GetLibFileName(ASigner: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    AValue := TStringObject.Create(TlgPKCS11CertificateSigner(ASigner).LibFileName);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_GetSessions(ASigner: LGP_OBJECT;
  var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    AValue := TlgPKCS11CertificateSigner(ASigner).Sessions;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_FunctionList(ASigner: LGP_OBJECT;
  var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AValue := nil;
  try
    CheckObject(ASigner, TlgPKCS11CertificateSigner);
    AValue := TlgPKCS11CertificateSigner(ASigner).FunctionList;
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_CheckLibrary(ALibFile: LGP_PCHAR;
  var AKomunikat: LGP_OBJECT; var AResult: LGP_INT32): LGP_EXCEPTION; stdcall;
var
  Kom: String;
begin
  Result := nil;
  AKomunikat := nil;
  AResult := 0;
  try
    AResult := LGP_INT32(TlgPKCS11CertificateSigner.CheckLibrary(ALibFile, Kom));
    if Kom <> '' then
      AKomunikat := TStringObject.Create(Kom);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpPKCS11CertificateSigner_GetLibraryInfo(ALibFile: LGP_PCHAR;
  var ALibInfo: LGP_OBJECT; var AKomunikat: LGP_OBJECT; var AResult: LGP_INT32
  ): LGP_EXCEPTION; stdcall;
var
  InfoRec: TlgPKCS11Info;
  InfoCls: TlgpPKCS11Info;
  Kom: String;
begin
  Result := nil;
  ALibInfo := nil;
  AKomunikat := nil;
  try
    AResult := LGP_INT32(TlgPKCS11CertificateSigner.GetLibraryInfo(ALibFile, InfoRec, Kom));
    if AResult <> 0 then
    begin
      InfoCls := TlgpPKCS11Info.Create;
      InfoCls.FInfo := InfoRec;
      ALibInfo := InfoCls;
    end;
    if Kom <> '' then
      AKomunikat := TStringObject.Create(Kom);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

{ TlgpPKCS11SlotInfo }

destructor TlgpPKCS11SlotInfo.Destroy;
begin
  if Assigned(FTokenInfo) then
    FTokenInfo.Free;
  inherited Destroy;
end;

end.

