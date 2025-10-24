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
  Classes, SysUtils, Generics.Collections
{$IFDEF LGP_ENABLE_WINHTTP}
  , lgWinHTTP
{$ENDIF}
{$IFDEF LGP_ENABLE_MSXML}
  , lgMSXML
{$ENDIF}
{$IFDEF LGP_ENABLE_WINCNG}
  , lgCNG
{$ENDIF}
  ;

type

  { TlgpExceptionObject }
  {$M+}
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
  {$M-}

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

  { TlgpKSeF2ExceptionResponse }

  TlgpKSeF2ExceptionResponseBase = class(TlgpExceptionObject)
  private
    FRawData: String;
    FResponseCode: Integer;
  public
    property ResponseCode: Integer read FResponseCode write FResponseCode;
    property RawData: String read FRawData write FRawData;
  end;

  { TlgpKSeF2ExceptionDetail }

  TlgpKSeF2ExceptionDetail = class
  private
    FExceptionCode: Integer;
    FExceptionDescription: String;
    FExceptionDetails: String;
  published
    property ExceptionCode: Integer read FExceptionCode write FExceptionCode;
    property ExceptionDescription: String read FExceptionDescription write FExceptionDescription;
    property ExceptionDetails: String read FExceptionDetails write FExceptionDetails;
  end;

  TlgpKSeF2ExceptionDetailList = class(specialize TObjectList<TlgpKSeF2ExceptionDetail>);

  { TlgpKSeF2ExceptionResponse }

  TlgpKSeF2ExceptionResponse = class(TlgpExceptionObject)
  private
    FExceptionDetailList: TlgpKSeF2ExceptionDetailList;
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
    property ExceptionDetailList: TlgpKSeF2ExceptionDetailList read FExceptionDetailList;
  end;

{$IFDEF LGP_ENABLE_WINHTTP}

  { TlgpWinHTTPException }

  TlgpWinHTTPException = class(TlgpExceptionObject)
  private
    FErrorCode: DWord;
  published
    property ErrorCode: DWord read FErrorCode write FErrorCode;
  end;

{$ENDIF}

{$IFDEF LGP_ENABLE_MSXML}

  { TlgpMSXMLError }

  TlgpMSXMLError = class(TlgpExceptionObject)
  private
    FColNo: Integer;
    FContent: String;
    FErrorCode: Integer;
    FLineNo: Integer;
    FUrl: String;
  published
    property LineNo: Integer read FLineNo write FLineNo;
    property ColNo: Integer read FColNo write FColNo;
    property ErrorCode: Integer read FErrorCode write FErrorCode;
    property Content: String read FContent write FContent;
    property Url: String read FUrl write FUrl;
  end;

{$ENDIF}

{$IFDEF LGP_ENABLE_WINCNG}

  { TlgpCNGError }

  TlgpCNGError = class(TlgpExceptionObject)
  private
    FResultCode: LongInt;
  published
    property ResultCode: LongInt read FResultCode write FResultCode;
  end;

{$ENDIF}

function lgpCreateExceptioObject(AException: Exception): TlgpExceptionObject; overload;
function lgpCreateExceptioObject(AMessage: String): TlgpExceptionObject; overload;
function lgpCreateInvalidObjectException: TlgpExceptionObject;

implementation

uses
  lgKSeFTypes, lgKSeFObjects, lgUtils, lgKSeF2Objects;

function lgpCreateExceptioObject(AException: Exception): TlgpExceptionObject;
var
  I: Integer;
  D: TlgpKSeFExceptionDetail;
  D2: TlgpKSeF2ExceptionDetail;
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
  else if AException is EKSeF2ExceptionResponse then
  begin
    Result := TlgpKSeF2ExceptionResponse.Create(AException.ClassName, AException.Message);
    TlgpKSeF2ExceptionResponse(Result).ResponseCode := EKSeF2ExceptionResponse(AException).ResponseCode;
    TlgpKSeF2ExceptionResponse(Result).RawData := EKSeF2ExceptionResponse(AException).RawData;
    TlgpKSeF2ExceptionResponse(Result).ServiceCtx := EKSeF2ExceptionResponse(AException).ServiceCtx;
    TlgpKSeF2ExceptionResponse(Result).ServiceCode := EKSeF2ExceptionResponse(AException).ServiceCode;
    TlgpKSeF2ExceptionResponse(Result).ServiceName := EKSeF2ExceptionResponse(AException).ServiceName;
    TlgpKSeF2ExceptionResponse(Result).Timestamp := EKSeF2ExceptionResponse(AException).Timestamp;
    TlgpKSeF2ExceptionResponse(Result).ReferenceNumber := EKSeF2ExceptionResponse(AException).ReferenceNumber;
    for I := 0 to Length(EKSeF2ExceptionResponse(AException).ExceptionDetailList) - 1 do
    begin
      D2 := TlgpKSeF2ExceptionDetail.Create;
      D2.ExceptionCode := EKSeF2ExceptionResponse(AException).ExceptionDetailList[I].ExceptionCode;
      D2.ExceptionDescription := EKSeF2ExceptionResponse(AException).ExceptionDetailList[I].ExceptionDescription;
      D2.ExceptionDetails := EKSeF2ExceptionResponse(AException).ExceptionDetailList[I].Details.ToString(';');
      TlgpKSeF2ExceptionResponse(Result).ExceptionDetailList.Add(D2);
    end;
  end
  else if AException is EKSeF2ExceptionResponseBase then
  begin
    Result := TlgpKSeF2ExceptionResponseBase.Create(AException.ClassName, AException.Message);
    TlgpKSeF2ExceptionResponseBase(Result).ResponseCode := EKSeF2ExceptionResponseBase(AException).ResponseCode;
    TlgpKSeF2ExceptionResponseBase(Result).RawData := EKSeF2ExceptionResponseBase(AException).RawData;
  end
{$IFDEF LGP_ENABLE_WINHTTP}
  else if AException is ElgWinHTTPException then
  begin
    Result := TlgpWinHTTPException.Create(AException.ClassName, AException.Message);
    TlgpWinHTTPException(Result).ErrorCode := ElgWinHTTPException(AException).ErrorCode;
  end
{$ENDIF}
{$IFDEF LGP_ENABLE_MSXML}
  else if AException is ElgMSXMLError then
  begin
    Result := TlgpMSXMLError.Create(AException.ClassName, AException.Message);
    TlgpMSXMLError(Result).ErrorCode := ElgMSXMLError(AException).ErrorCode;
    TlgpMSXMLError(Result).ColNo := ElgMSXMLError(AException).ColNo;
    TlgpMSXMLError(Result).Content := ElgMSXMLError(AException).Content;
    TlgpMSXMLError(Result).LineNo := ElgMSXMLError(AException).LineNo;
    TlgpMSXMLError(Result).Url := ElgMSXMLError(AException).Url;
  end
{$ENDIF}
{$IFDEF LGP_ENABLE_WINCNG}
  else if AException is ElgCNGError then
  begin
    Result := TlgpCNGError.Create(AException.ClassName, AException.Message);
    TlgpCNGError(Result).ResultCode := ElgCNGError(AException).ResultCode;
  end
{$ENDIF}
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

{ TlgpKSeF2ExceptionResponse }

constructor TlgpKSeF2ExceptionResponse.Create(AClass, AMessage: String);
begin
  inherited Create(AClass, AMessage);
  FExceptionDetailList := TlgpKSeF2ExceptionDetailList.Create(True);
end;

destructor TlgpKSeF2ExceptionResponse.Destroy;
begin
  FExceptionDetailList.Free;
  inherited Destroy;
end;

end.

