{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit uException;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Generics.Collections;

type

  { TlgpExceptionObject }

  TlgpExceptionObject = class
  private
    FExceptionClass: String;
    FMessage: String;
  public
    constructor Create(AClass, AMessage: String); virtual;
  published
    property ExceptionClass: String read FExceptionClass write FExceptionClass;
    property Message: String read FMessage write FMessage;
  end;

  { TlgpKSeFExceptionDetail }

  TlgpKSeFExceptionDetail = class
  private
    FExceptionCode: Integer;
    FExceptionDescription: String;
  published
    property ExceptionCode: Integer read FExceptionCode write FExceptionCode;
    property ExceptionDescription: String read FExceptionDescription write FExceptionDescription;
  end;

  TlgpKSeFExceptionDetailList = class(specialize TObjectList<TlgpKSeFExceptionDetail>);

  { TlgpKSeFExceptionResponse }

  TlgpKSeFExceptionResponse = class(TlgpExceptionObject)
  private
    FExceptionDetailList: TlgpKSeFExceptionDetailList;
    FRawData: String;
    FReferenceNumber: String;
    FResponseCode: Integer;
    FServiceCode: String;
    FServiceCtx: String;
    FServiceName: String;
    FTimestamp: TDateTime;
  public
    constructor Create(AClass, AMessage: String); override;
    destructor Destroy; override;
  published
    property ResponseCode: Integer read FResponseCode write FResponseCode;
    property RawData: String read FRawData write FRawData;
    property ServiceCtx: String read FServiceCtx write FServiceCtx;
    property ServiceCode: String read FServiceCode write FServiceCode;
    property ServiceName: String read FServiceName write FServiceName;
    property Timestamp: TDateTime read FTimestamp write FTimestamp;
    property ReferenceNumber: String read FReferenceNumber write FReferenceNumber;
    property ExceptionDetailList: TlgpKSeFExceptionDetailList read FExceptionDetailList;
  end;

function lgpCreateExceptioObject(AException: Exception): TlgpExceptionObject; overload;
function lgpCreateExceptioObject(AMessage: String): TlgpExceptionObject; overload;
function lgpCreateInvalidObjectException: TlgpExceptionObject;

implementation

uses
  lgKSeFTypes;

function lgpCreateExceptioObject(AException: Exception): TlgpExceptionObject;
var
  I: Integer;
  D: TlgpKSeFExceptionDetail;
begin
  if AException is EKSeFExceptionResponse then
  begin
    Result := TlgpKSeFExceptionResponse.Create(AException.ClassName, AException.Message);
    TlgpKSeFExceptionResponse(Result).ResponseCode := EKSeFExceptionResponse(AException).ResponseCode;
    TlgpKSeFExceptionResponse(Result).RawData := EKSeFExceptionResponse(AException).RawData;
    TlgpKSeFExceptionResponse(Result).ServiceCtx := EKSeFExceptionResponse(AException).ServiceCtx;
    TlgpKSeFExceptionResponse(Result).ServiceCode := EKSeFExceptionResponse(AException).ServiceCode;
    TlgpKSeFExceptionResponse(Result).ServiceName := EKSeFExceptionResponse(AException).ServiceName;
    TlgpKSeFExceptionResponse(Result).Timestamp := EKSeFExceptionResponse(AException).Timestamp;
    TlgpKSeFExceptionResponse(Result).ReferenceNumber := EKSeFExceptionResponse(AException).ReferenceNumber;
    for I := 0 to Length(EKSeFExceptionResponse(AException).ExceptionDetailList) - 1 do
    begin
      D := TlgpKSeFExceptionDetail.Create;
      D.ExceptionCode := EKSeFExceptionResponse(AException).ExceptionDetailList[I].ExceptionCode;
      D.ExceptionDescription := EKSeFExceptionResponse(AException).ExceptionDetailList[I].ExceptionDescription;
      TlgpKSeFExceptionResponse(Result).ExceptionDetailList.Add(D);
    end;
  end
  else
    Result := TlgpExceptionObject.Create(AException.ClassName, AException.Message);
end;

function lgpCreateExceptioObject(AMessage: String): TlgpExceptionObject;
begin
  Result := TlgpExceptionObject.Create('TlgpExceptionObject', AMessage);
end;

function lgpCreateInvalidObjectException: TlgpExceptionObject;
begin
  Result := lgpCreateExceptioObject('Invalid object handle');
end;

{ TlgpExceptionObject }

constructor TlgpExceptionObject.Create(AClass, AMessage: String);
begin
  FExceptionClass := AClass;
  FMessage := AMessage;
end;

{ TlgpKSeFExceptionResponse }

constructor TlgpKSeFExceptionResponse.Create(AClass, AMessage: String);
begin
  inherited;
  FExceptionDetailList := TlgpKSeFExceptionDetailList.Create(True);
end;

destructor TlgpKSeFExceptionResponse.Destroy;
begin
  FExceptionDetailList.Free;
  inherited Destroy;
end;

end.

