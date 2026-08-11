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
    FCallStack: String;
  public
    constructor Create(AClass, AMessage: String); virtual;
  published
    property ExceptionClass: String read FExceptionClass write FExceptionClass;
    property Message: String read FMessage write FMessage;
    property CallStack: String read FCallStack write FCallStack;
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

  { TlgpKSeF2ExceptionResponseBase }

  TlgpKSeF2ExceptionResponseBase = class(TlgpExceptionObject)
  private
    FRawData: String;
    FResponseCode: Integer;
    FResponseHeaders: String;
  published
    property ResponseCode: Integer read FResponseCode write FResponseCode;
    property RawData: String read FRawData write FRawData;
    property ResponseHeaders: String read FResponseHeaders write FResponseHeaders;
  end;

  { TlgpEKSeF2ProblemDetails }

  TlgpEKSeF2ProblemDetails = class(TlgpKSeF2ExceptionResponseBase)
  private
    FDetail: String;
    FInstance: String;
    FStatus: Integer;
    FTimestamp: TDateTime;
    FTimestampRaw: String;
    FTitle: String;
    FTraceId: String;
  published
    property Title: String read FTitle write FTitle;
    property Status: Integer read FStatus write FStatus;
    property Instance: String read FInstance write FInstance;
    property Detail: String read FDetail write FDetail;
    property Timestamp: TDateTime read FTimestamp write FTimestamp;
    property TimestampRaw: String read FTimestampRaw write FTimestampRaw;
    property TraceId: String read FTraceId write FTraceId;
  end;

  { TlgpKSeF2ExceptionDetail }

  {$M+}
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
  {$M-}

  TlgpKSeF2ExceptionDetailList = class(specialize TObjectList<TlgpKSeF2ExceptionDetail>);

  { TlgpKSeF2ExceptionResponse }

  TlgpKSeF2ExceptionResponse = class(TlgpExceptionObject)
  private
    FExceptionDetailList: TlgpKSeF2ExceptionDetailList;
    FRawData: String;
    FReferenceNumber: String;
    FResponseCode: Integer;
    FResponseHeaders: String;
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
    property ResponseHeaders: String read FResponseHeaders write FResponseHeaders;
    property ServiceCtx: String read FServiceCtx write FServiceCtx;
    property ServiceCode: String read FServiceCode write FServiceCode;
    property ServiceName: String read FServiceName write FServiceName;
    property Timestamp: TDateTime read FTimestamp write FTimestamp;
    property ReferenceNumber: String read FReferenceNumber write FReferenceNumber;
    property ExceptionDetailList: TlgpKSeF2ExceptionDetailList read FExceptionDetailList;
  end;

  { TlgpEKSeF2BadRequest }

  TlgpEKSeF2BadRequest = class(TlgpEKSeF2ProblemDetails)
  private
    FErrors: TlgpKSeF2ExceptionDetailList;
  public
    constructor Create(AClass, AMessage: String); override;
    destructor Destroy; override;
  published
    property Errors: TlgpKSeF2ExceptionDetailList read FErrors;
  end;

  { TlgpKeyValuePair }

  {$M+}
  TlgpKeyValuePair = class
  private
    FKey: String;
    FValue: String;
  published
    property Key: String read FKey write FKey;
    property Value: String read FValue write FValue;
  end;
  {$M-}

  TlgpKeyValuePairs = class(specialize TObjectList<TlgpKeyValuePair>);

  { TlgpEKSeF2Forbidden }

  TlgpEKSeF2Forbidden = class(TlgpEKSeF2ProblemDetails)
  private
    FReasonCode: String;
    FSecurity: TlgpKeyValuePairs;
  public
    constructor Create(AClass, AMessage: String); override;
    destructor Destroy; override;
  published
    property ReasonCode: String read FReasonCode write FReasonCode;
    property Security: TlgpKeyValuePairs read FSecurity;
  end;

  { TlgpKSeF2TooManyRequests }

  TlgpKSeF2TooManyRequests = class(TlgpExceptionObject)
  private
    FCode: Integer;
    FDescription: String;
    FDetails: String;
    FRawData: String;
    FResponseCode: Integer;
    FResponseHeaders: String;
    FRetryAfter: Integer;
  published
    property ResponseCode: Integer read FResponseCode write FResponseCode;
    property RawData: String read FRawData write FRawData;
    property ResponseHeaders: String read FResponseHeaders write FResponseHeaders;
    property Code: Integer read FCode write FCode;
    property Description: String read FDescription write FDescription;
    property Details: String read FDetails write FDetails;
    property RetryAfter: Integer read FRetryAfter write FRetryAfter;
  end;

  { EKSeF2TooManyRequestsProblem }

  TlgpEKSeF2TooManyRequestsProblem = class(TlgpEKSeF2ProblemDetails)
  private
    FRetryAfter: Integer;
  published
    property RetryAfter: Integer read FRetryAfter write FRetryAfter;
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

function lgpCreateExceptioObject(const AException: Exception): TlgpExceptionObject; overload;
function lgpCreateExceptioObject(AMessage: String): TlgpExceptionObject; overload;
function lgpCreateInvalidObjectException: TlgpExceptionObject;

implementation

uses
  lgKSeFObjects, lgUtils, lgKSeF2Objects, uBackend;

function lgpCreateExceptioObject(const AException: Exception): TlgpExceptionObject;
var
  I: Integer;
  D: TlgpKSeFExceptionDetail;
  D2: TlgpKSeF2ExceptionDetail;
  D3: TlgpKeyValuePair;
  F: PCodePointer;
begin
  Result := nil;
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
  else if AException is EKSeF2TooManyRequests then
  begin
    Result := TlgpKSeF2TooManyRequests.Create(AException.ClassName, AException.Message);
    TlgpKSeF2TooManyRequests(Result).ResponseCode := EKSeF2TooManyRequests(AException).ResponseCode;
    TlgpKSeF2TooManyRequests(Result).RawData := EKSeF2TooManyRequests(AException).RawData;
    TlgpKSeF2TooManyRequests(Result).ResponseHeaders := EKSeF2TooManyRequests(AException).ResponseHeaders;
    TlgpKSeF2TooManyRequests(Result).Code := EKSeF2TooManyRequests(AException).Code;
    TlgpKSeF2TooManyRequests(Result).Description := EKSeF2TooManyRequests(AException).Description;
    TlgpKSeF2TooManyRequests(Result).Details := StringArrayToString(EKSeF2TooManyRequests(AException).Details, LineEnding);
    TlgpKSeF2TooManyRequests(Result).RetryAfter := EKSeF2TooManyRequests(AException).RetryAfter;
  end
  else if AException is EKSeF2ExceptionResponse then
  begin
    Result := TlgpKSeF2ExceptionResponse.Create(AException.ClassName, AException.Message);
    TlgpKSeF2ExceptionResponse(Result).ResponseCode := EKSeF2ExceptionResponse(AException).ResponseCode;
    TlgpKSeF2ExceptionResponse(Result).RawData := EKSeF2ExceptionResponse(AException).RawData;
    TlgpKSeF2ExceptionResponse(Result).ResponseHeaders := EKSeF2ExceptionResponse(AException).ResponseHeaders;
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
      D2.ExceptionDetails := StringArrayToString(EKSeF2ExceptionResponse(AException).ExceptionDetailList[I].Details, ';');
      TlgpKSeF2ExceptionResponse(Result).ExceptionDetailList.Add(D2);
    end;
  end
  else if AException is EKSeF2ProblemDetails then
  begin
    if AException is EKSeF2BadRequest then
    begin
      Result := TlgpEKSeF2BadRequest.Create(AException.ClassName, AException.Message);
      for I := 0 to Length(EKSeF2BadRequest(AException).Errors) - 1 do
      begin
        D2 := TlgpKSeF2ExceptionDetail.Create;
        D2.ExceptionCode := EKSeF2BadRequest(AException).Errors[I].ExceptionCode;
        D2.ExceptionDescription := EKSeF2BadRequest(AException).Errors[I].ExceptionDescription;
        D2.ExceptionDetails := StringArrayToString(EKSeF2BadRequest(AException).Errors[I].Details, ';');
        TlgpEKSeF2BadRequest(Result).Errors.Add(D2);
      end;
    end
    else if AException is EKSeF2Forbidden then
    begin
      Result := TlgpEKSeF2Forbidden.Create(AException.ClassName, AException.Message);
      TlgpEKSeF2Forbidden(Result).ReasonCode := EKSeF2Forbidden(AException).ReasonCode;
      for I := 0 to Length(EKSeF2Forbidden(AException).Security) - 1 do
      begin
        D3 := TlgpKeyValuePair.Create;
        D3.Key := EKSeF2Forbidden(AException).Security[I].Key;
        D3.Value := EKSeF2Forbidden(AException).Security[I].Value;
        TlgpEKSeF2Forbidden(Result).Security.Add(D3);
      end;
    end
    else if AException is EKSeF2TooManyRequestsProblem then
    begin
      Result := TlgpEKSeF2TooManyRequestsProblem.Create(AException.ClassName, AException.Message);
      TlgpEKSeF2TooManyRequestsProblem(Result).RetryAfter := EKSeF2TooManyRequestsProblem(AException).RetryAfter;
    end;
    if Result = nil then
      Result := TlgpEKSeF2ProblemDetails.Create(AException.ClassName, AException.Message);
    TlgpEKSeF2ProblemDetails(Result).ResponseCode := EKSeF2ProblemDetails(AException).ResponseCode;
    TlgpEKSeF2ProblemDetails(Result).RawData := EKSeF2ProblemDetails(AException).RawData;
    TlgpEKSeF2ProblemDetails(Result).ResponseHeaders := EKSeF2ProblemDetails(AException).ResponseHeaders;
    TlgpEKSeF2ProblemDetails(Result).Title := EKSeF2ProblemDetails(AException).Title;
    TlgpEKSeF2ProblemDetails(Result).Status := EKSeF2ProblemDetails(AException).Status;
    TlgpEKSeF2ProblemDetails(Result).Instance := EKSeF2ProblemDetails(AException).Instance;
    TlgpEKSeF2ProblemDetails(Result).Detail := EKSeF2ProblemDetails(AException).Detail;
    TlgpEKSeF2ProblemDetails(Result).Timestamp := EKSeF2ProblemDetails(AException).Timestamp;
    TlgpEKSeF2ProblemDetails(Result).TimestampRaw := EKSeF2ProblemDetails(AException).TimestampRaw;
    TlgpEKSeF2ProblemDetails(Result).TraceId := EKSeF2ProblemDetails(AException).TraceId;
  end
  else if AException is EKSeF2ExceptionResponseBase then
  begin
    Result := TlgpKSeF2ExceptionResponseBase.Create(AException.ClassName, AException.Message);
    TlgpKSeF2ExceptionResponseBase(Result).ResponseCode := EKSeF2ExceptionResponseBase(AException).ResponseCode;
    TlgpKSeF2ExceptionResponseBase(Result).RawData := EKSeF2ExceptionResponseBase(AException).RawData;
    TlgpKSeF2ExceptionResponseBase(Result).ResponseHeaders := EKSeF2ExceptionResponseBase(AException).ResponseHeaders;
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
  // Dodaj stos wywolania jesli potrzeba
  if (LGPDebugLevel > 0) and Assigned(Result) then
  begin
    F := ExceptFrames;
    Result.CallStack := BacktraceStrFunc(ExceptAddr);
    for I := 0 to ExceptFrameCount - 1 do;
      Result.CallStack := Result.CallStack + LineEnding + BacktraceStrFunc(F[I]);
  end;
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

{ TlgpEKSeF2BadRequest }

constructor TlgpEKSeF2BadRequest.Create(AClass, AMessage: String);
begin
  inherited Create(AClass, AMessage);
  FErrors := TlgpKSeF2ExceptionDetailList.Create(True);
end;

destructor TlgpEKSeF2BadRequest.Destroy;
begin
  FErrors.Free;
  inherited Destroy;
end;

{ TlgpEKSeF2Forbidden }

constructor TlgpEKSeF2Forbidden.Create(AClass, AMessage: String);
begin
  inherited Create(AClass, AMessage);
  FSecurity := TlgpKeyValuePairs.Create(True);
end;

destructor TlgpEKSeF2Forbidden.Destroy;
begin
  FSecurity.Free;
  inherited Destroy;
end;

end.

