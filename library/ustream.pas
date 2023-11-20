{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uStream;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uTypes;

const
  LGP_SEEKORIGIN_BEGINNING = soFromBeginning;  // 0
  LGP_SEEKORIGIN_CURRENT   = soFromCurrent;    // 1
  LGP_SEEKORIGIN_END       = soFromEnd;        // 2

  LGP_FM_CREATE            = fmCreate;         // $FF00
  LGP_FM_OPEN_READ         = fmOpenRead;       // $0000
  LGP_FM_OPEN_WRITE        = fmOpenWrite;      // $0001
  LGP_FM_OPEN_READ_WRITE   = fmOpenReadWrite;  // $0002

  LGP_FM_SHARE_COMPAT      = fmShareCompat;    // $0000
  LGP_FM_SHARE_EXCLUSIVE   = fmShareExclusive; // $0010
  LGP_FM_SHARE_DENY_WRITE  = fmShareDenyWrite; // $0020
  LGP_FM_SHARE_DENY_READ   = fmShareDenyRead;  // $0030
  LGP_FM_SHARE_DENY_NONE   = fmShareDenyNone;  // $0040

type
  TlgpStreamReadFunc = function(AStreamObject: LGP_POINTER; AData: LGP_POINTER; ASize: LGP_INT32): LGP_INT32; stdcall;
  TlgpStreamWriteFunc = function(AStreamObject: LGP_POINTER; AData: LGP_POINTER; ASize: LGP_INT32): LGP_INT32; stdcall;
  TlgpStreamSeekFunc = function(AStreamObject: LGP_POINTER; AOffset: LGP_INT32; AOrigin: LGP_INT32): LGP_INT32; stdcall;
  TlgpStreamGetPositionFunc = function(AStreamObject: LGP_POINTER): LGP_INT32; stdcall;
  TlgpStreamGetSizeFunc = function(AStreamObject: LGP_POINTER): LGP_INT32; stdcall;

  { TlgpStream }

  TlgpStream = class(TStream)
  private
    FStreamObject: Pointer;
    FReadFunc: TlgpStreamReadFunc;
    FWriteFunc: TlgpStreamWriteFunc;
    FSeekFunc: TlgpStreamSeekFunc;
    FGetPosition: TlgpStreamGetPositionFunc;
    FGetSize: TlgpStreamGetSizeFunc;
  protected
    function GetSize: Int64; override;
    function GetPosition: Int64; override;
  public
    constructor Create(AStreamObject: Pointer; AReadFunc: TlgpStreamReadFunc;
      AWriteFunc: TlgpStreamWriteFunc; ASeekFunc: TlgpStreamSeekFunc;
      AGetPositionFunc: TlgpStreamGetPositionFunc; AGetSizeFunc: TlgpStreamGetSizeFunc);
    function Read(var Buffer; Count: Longint): Longint; override; overload;
    function Write(const Buffer; Count: Longint): Longint; override; overload;
    function Seek(Offset: Longint; Origin: Word): Longint; override; overload;
  end;

function lgpStream_Create(AStreamObject: Pointer; AReadFunc: TlgpStreamReadFunc;
  AWriteFunc: TlgpStreamWriteFunc; ASeekFunc: TlgpStreamSeekFunc;
  AGetPositionFunc: TlgpStreamGetPositionFunc; AGetSizeFunc: TlgpStreamGetSizeFunc;
  var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpFileStream_Create(AFileName: LGP_PCHAR; AMode: LGP_INT32; var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;

function lgpStringStream_Create(AData: LGP_PCHAR; var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
function lgpStringStream_GetString(AStringStream: LGP_OBJECT; var AString: LGP_OBJECT): LGP_EXCEPTION; stdcall;

implementation

uses
  uException, uObject;

function lgpStream_Create(AStreamObject: Pointer;
  AReadFunc: TlgpStreamReadFunc; AWriteFunc: TlgpStreamWriteFunc;
  ASeekFunc: TlgpStreamSeekFunc; AGetPositionFunc: TlgpStreamGetPositionFunc;
  AGetSizeFunc: TlgpStreamGetSizeFunc; var AStream: LGP_OBJECT): LGP_EXCEPTION;
  stdcall;
begin
  Result := nil;
  try
    AStream := TlgpStream.Create(AStreamObject, AReadFunc, AWriteFunc, ASeekFunc,
      AGetPositionFunc, AGetSizeFunc);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpFileStream_Create(AFileName: LGP_PCHAR; AMode: LGP_INT32;
  var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AStream := nil;
  try
    AStream := TFileStream.Create(AFileName, AMode);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpStringStream_Create(AData: LGP_PCHAR; var AStream: LGP_OBJECT
  ): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AStream := nil;
  try
    AStream := TStringStream.Create(AData);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

function lgpStringStream_GetString(AStringStream: LGP_OBJECT;
  var AString: LGP_OBJECT): LGP_EXCEPTION; stdcall;
begin
  Result := nil;
  AString := nil;
  try
    CheckObject(AStringStream, TStringStream);
    AString := TStringObject.Create(TStringStream(AStringStream).DataString);
  except
    on E: Exception do
      Result := lgpCreateExceptioObject(E);
  end;
end;

{ TlgpStream }

function TlgpStream.GetSize: Int64;
begin
  if FGetSize <> nil then
    Result := FGetSize(FStreamObject);
  Result := inherited GetSize;
end;

function TlgpStream.GetPosition: Int64;
begin
  if FGetPosition <> nil then
    Result := FGetPosition(FStreamObject)
  else
    Result := inherited GetPosition;
end;

constructor TlgpStream.Create(AStreamObject: Pointer; AReadFunc: TlgpStreamReadFunc;
  AWriteFunc: TlgpStreamWriteFunc; ASeekFunc: TlgpStreamSeekFunc;
  AGetPositionFunc: TlgpStreamGetPositionFunc;
  AGetSizeFunc: TlgpStreamGetSizeFunc);
begin
  FStreamObject := AStreamObject;
  FReadFunc := AReadFunc;
  FWriteFunc := AWriteFunc;
  FSeekFunc := ASeekFunc;
  FGetPosition := AGetPositionFunc;
  FGetSize := AGetSizeFunc;
end;

function TlgpStream.Read(var Buffer; Count: Longint): Longint;
begin
  if FReadFunc <> nil then
    Result := FReadFunc(FStreamObject, @Buffer, Count)
  else
    Result := 0;
end;

function TlgpStream.Write(const Buffer; Count: Longint): Longint;
begin
  if FWriteFunc <> nil then
    Result := FWriteFunc(FStreamObject, @Buffer, Count)
  else
    Result := 0;
end;

function TlgpStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  if FSeekFunc <> nil then
    Result := FSeekFunc(FStreamObject, Offset, Origin)
  else
    Result := inherited Seek(Offset, Origin);
end;

end.

