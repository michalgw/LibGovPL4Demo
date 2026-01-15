{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4KSeFObj2;

{$I libgovpl4def.inc}

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Obj;

type
  { Rodzaj serwera (bramki) KSeF }
  TlgoKSeFGateType = (
    { Serwer produkcyjny }
    kgtProd,
    { Serwer demo }
    kgtDemo,
    { Serwer testowy }
    kgtTest);

  TlgoKSeFIdentifierType = (itNone, itAllPartners, itNip, itInternalId,
    itNipVatUe, itPeppolId);

  { Rodzaj autoryzacji certyfikatu kwalifikowanego }
  TlgoKSeFCertificateAuthType = (
    { Numer seryjny }
    catSerialNumber,
    { Odcisk palca }
    catFingerprint);

  { Kod formularza FA }
  TlgoKSeFFormCode = (kfcCustom, kfcFA1, kfcFA2, kfcFA3, kfcFA_PEF3, kfcFA_KOR_PEF3);

  TKSeF2SessionType = (stOnline, stBatch);
  TKSeF2CommonSessionStatus = (cssInProgress, cssSucceeded, cssFailed, cssCancelled);
  TKSeF2CommonSessionStatuses = set of TKSeF2CommonSessionStatus;

  { Podstawowa klasa wyjątku przy obsłudze KSeF }

  { EKSeF2ExceptionResponseBase }

  EKSeF2ExceptionResponseBase = class(ElgoException)
  private
    FResponseCode: Integer;
    FRawData: UTF8String;
  protected
    procedure LoadObject(AException: LGP_EXCEPTION); override;
  public
    property ResponseCode: Integer read FResponseCode;
    property RawData: UTF8String read FRawData;
  end;

  TKSeF2ExceptionDetail = record
    ExceptionCode: Integer;
    ExceptionDescription: UTF8String;
    ExceptionDetails: UTF8String;
  end;

  TKSeF2ExceptionDetailList = array of TKSeF2ExceptionDetail;

  { EKSeFExceptionResponse }

  { Klasa wjątku zawierająca informacje zwracane przez serwery KSeF }
  EKSeF2ExceptionResponse = class(EKSeF2ExceptionResponseBase)
  private
    FExceptionDetailList: TKSeF2ExceptionDetailList;
    FReferenceNumber: UTF8String;
    FServiceCode: UTF8String;
    FServiceCtx: UTF8String;
    FServiceName: UTF8String;
    FTimestamp: TDateTime;
  protected
    procedure LoadObject(AException: LGP_EXCEPTION); override;
  public
    property ServiceCtx: UTF8String read FServiceCtx;
    property ServiceCode: UTF8String read FServiceCode;
    property ServiceName: UTF8String read FServiceName;
    property Timestamp: TDateTime read FTimestamp;
    property ReferenceNumber: UTF8String read FReferenceNumber;
    property ExceptionDetailList: TKSeF2ExceptionDetailList read FExceptionDetailList;
  end;

  EKSeF2Unauthorized = class(EKSeF2ExceptionResponseBase);

  EKSeF2Forbidden = class(EKSeF2ExceptionResponseBase);

  EKSeF2NotFound = class(EKSeF2ExceptionResponseBase);

  {$M+}

  { TKSeF2Object }

  TKSeF2Object = class(TlgoObject)
  private
    FOwner: TKSeF2Object;
    FObjects: {$IFDEF FPC}TFPList{$ELSE}TList{$ENDIF};
  protected
    procedure CreateExtObject(AClassName: UTF8String);
    procedure LoadObject; virtual;
  public
    constructor Create(AOwner: TKSeF2Object; AClassName: UTF8String = ''); overload; virtual;
    constructor Create(AOwner: TKSeF2Object; AExtObject: LGP_OBJECT); overload; virtual;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    procedure InsertObject(AObject: TKSeF2Object); virtual;
    procedure RemoveObject(AObject: TKSeF2Object); virtual;
    property Owner: TKSeF2Object read FOwner;
  end;
  {$M-}

  TKSeF2ObjectClass = class of TKSeF2Object;

  { TKSeF2Array }

  { Podstawa list obiektów KSeF }
  TKSeF2Array = class(TKSeF2Object)
  private
    FList: TList;
    function GetOwnObjects: Boolean;
    procedure SetOwnObjects(AValue: Boolean);
  protected
    function GetItem(AIndex: Integer): TKSeF2Object;
    class function GetItemClass(AObject: LGP_OBJECT): TKSeF2ObjectClass; virtual;
  public
    constructor Create(AOwner: TKSeF2Object; AClassName: UTF8String = ''); overload; override;
    constructor Create(AOwner: TKSeF2Object; AExtObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
    function Count: Integer;
    function Add(AObject: TKSeF2Object): Integer;
    procedure Delete(AIndex: Integer);
    property Items[AIndex: Integer]: TKSeF2Object read GetItem;
    property OwnObjects: Boolean read GetOwnObjects write SetOwnObjects;
  end;

  { TKSeF2Request }

  { Podstawa żądania KSeF }
  TKSeF2Request = class(TKSeF2Object)
  private
    function GetAsJSONString: UTF8String;
  published
    property AsJSONString: UTF8String read GetAsJSONString;
  end;


  { TKSeF2Response }

  { Podstawa odpowiedzi serwera KSeF }
  TKSeF2Response = class(TKSeF2Object)
  private
    function GetRawResponse: UTF8String;
  published
    property RawResponse: UTF8String read GetRawResponse;
  end;

  { TKSeF2AuthenticationChallengeResponse }

  TKSeF2AuthenticationChallengeResponse = class(TKSeF2Response)
  private
    function GetChallenge: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampMs: Int64;
    function GetTimestampRaw: UTF8String;
  published
    property Challenge: UTF8String read GetChallenge;
    property Timestamp: TDateTime read GetTimestamp;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property TimestampMs: Int64 read GetTimestampMs;
  end;

  { TKSeF2TokenInfo }

  TKSeF2TokenInfo = class(TKSeF2Object)
  private
    function GetToken: UTF8String;
    function GetValidUntil: TDateTime;
    function GetValidUntilRaw: UTF8String;
  published
    property Token: UTF8String read GetToken;
    property ValidUntil: TDateTime read GetValidUntil;
    property ValidUntilRaw: UTF8String read GetValidUntilRaw;
  end;

  { TKSeF2AuthenticationInitResponse }

  TKSeF2AuthenticationInitResponse = class(TKSeF2Response)
  private
    FAuthenticationToken: TKSeF2TokenInfo;
    function GetReferenceNumber: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property AuthenticationToken: TKSeF2TokenInfo read FAuthenticationToken;
  end;

  { TKSeF2StatusInfo }

  TKSeF2StatusInfo = class(TKSeF2Object)
  private
    function GetCode: Integer;
    function GetDescription: UTF8String;
    function GetDetails: UTF8String;
  published
    property Code: Integer read GetCode;
    property Description: UTF8String read GetDescription;
    property Details: UTF8String read GetDetails;
  end;

  { TKSeF2AuthenticationOperationStatusResponse }

  TKSeF2AuthenticationOperationStatusResponse = class(TKSeF2Response)
  private
    FStatus: TKSeF2StatusInfo;
    function GetAuthenticationMethod: UTF8String;
    function GetIsTokenRedeemed: Boolean;
    function GetLastTokenRefreshDate: TDateTime;
    function GetLastTokenRefreshDateRaw: UTF8String;
    function GetRefreshTokenValidUntil: TDateTime;
    function GetRefreshTokenValidUntilRaw: UTF8String;
    function GetStartDate: TDateTime;
    function GetStartDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property StartDate: TDateTime read GetStartDate;
    property StartDateRaw: UTF8String read GetStartDateRaw;
    property AuthenticationMethod: UTF8String read GetAuthenticationMethod;
    property Status: TKSeF2StatusInfo read FStatus;
    property IsTokenRedeemed: Boolean read GetIsTokenRedeemed;
    property LastTokenRefreshDate: TDateTime read GetLastTokenRefreshDate;
    property LastTokenRefreshDateRaw: UTF8String read GetLastTokenRefreshDateRaw;
    property RefreshTokenValidUntil: TDateTime read GetRefreshTokenValidUntil;
    property RefreshTokenValidUntilRaw: UTF8String read GetRefreshTokenValidUntilRaw;
  end;

  { TKSeF2AuthenticationTokensResponse }

  TKSeF2AuthenticationTokensResponse = class(TKSeF2Response)
  private
    FAccessToken: TKSeF2TokenInfo;
    FRefreshToken: TKSeF2TokenInfo;
  protected
    procedure LoadObject; override;
  published
    property AccessToken: TKSeF2TokenInfo read FAccessToken;
    property RefreshToken: TKSeF2TokenInfo read FRefreshToken;
  end;

  { TKSeF2AuthenticationTokenRefreshResponse }

  TKSeF2AuthenticationTokenRefreshResponse = class(TKSeF2Response)
  private
    FAccessToken: TKSeF2TokenInfo;
  protected
    procedure LoadObject; override;
  published
    property AccessToken: TKSeF2TokenInfo read FAccessToken;
  end;

  { TKSeF2AuthenticationListItem }

  TKSeF2AuthenticationListItem = class(TKSeF2Object)
  private
    FStatus: TKSeF2StatusInfo;
    function GetAuthenticationMethod: UTF8String;
    function GetIsCurrent: Boolean;
    function GetIsTokenRedeemed: Boolean;
    function GetLastTokenRefreshDate: TDateTime;
    function GetLastTokenRefreshDateRaw: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetRefreshTokenValidUntil: TDateTime;
    function GetRefreshTokenValidUntilRaw: UTF8String;
    function GetStartDate: TDateTime;
    function GetStartDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property StartDate: TDateTime read GetStartDate;
    property StartDateRaw: UTF8String read GetStartDateRaw;
    property AuthenticationMethod: UTF8String read GetAuthenticationMethod;
    property Status: TKSeF2StatusInfo read FStatus;
    property IsTokenRedeemed: Boolean read GetIsTokenRedeemed;
    property LastTokenRefreshDate: TDateTime read GetLastTokenRefreshDate;
    property LastTokenRefreshDateRaw: UTF8String read GetLastTokenRefreshDateRaw;
    property RefreshTokenValidUntil: TDateTime read GetRefreshTokenValidUntil;
    property RefreshTokenValidUntilRaw: UTF8String read GetRefreshTokenValidUntilRaw;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property IsCurrent: Boolean read GetIsCurrent;
  end;

  TKSeF2AuthenticationList = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2AuthenticationListItem;
  public
    property Items[AIndex: Integer]: TKSeF2AuthenticationListItem read GetItem; default;
  end;

  { TKSeF2AuthenticationListResponse }

  TKSeF2AuthenticationListResponse = class(TKSeF2Response)
  private
    FItems: TKSeF2AuthenticationList;
    function GetContinuationToken: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property ContinuationToken: UTF8String read GetContinuationToken;
    property Items: TKSeF2AuthenticationList read FItems;
  end;

  TKSeF2KeyUsageType = (kuKsefTokenEncryption, kuSymmetricKeyEncryption);
  TKSeF2KeyUsage = set of TKSeF2KeyUsageType;

  { TKSeF2PublicKeyCertificate }

  TKSeF2PublicKeyCertificate = class(TKSeF2Object)
  private
    function GetCertificate: UTF8String;
    function GetUsage: TKSeF2KeyUsage;
    function GetValidFrom: TDateTime;
    function GetValidFromRaw: UTF8String;
    function GetValidTo: TDateTime;
    function GetValidToRaw: UTF8String;
  published
    property Certificate: UTF8String read GetCertificate;
    property ValidFrom: TDateTime read GetValidFrom;
    property ValidFromRaw: UTF8String read GetValidFromRaw;
    property ValidTo: TDateTime read GetValidTo;
    property ValidToRaw: UTF8String read GetValidToRaw;
    property Usage: TKSeF2KeyUsage read GetUsage;
  end;

  { TKSeF2PublicKeyCertificateArray }

  TKSeF2PublicKeyCertificateArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2PublicKeyCertificate;
  public
    property Items[AIndex: Integer]: TKSeF2PublicKeyCertificate read GetItem; default;
  end;

  { TKSeF2PublicKeyCertificateResponse }

  TKSeF2PublicKeyCertificateResponse = class(TKSeF2Response)
  private
    FItems: TKSeF2PublicKeyCertificateArray;
  protected
    procedure LoadObject; override;
  published
    property Items: TKSeF2PublicKeyCertificateArray read FItems;
  end;

  { TKSeF2FormCode }

  TKSeF2FormCode = class(TKSeF2Object)
  private
    function GetSchemaVersion: UTF8String;
    function GetSystemCode: UTF8String;
    function GetValue: UTF8String;
    procedure SetSchemaVersion(AValue: UTF8String);
    procedure SetSystemCode(AValue: UTF8String);
    procedure SetValue(AValue: UTF8String);
  published
    property SystemCode: UTF8String read GetSystemCode write SetSystemCode;
    property SchemaVersion: UTF8String read GetSchemaVersion write SetSchemaVersion;
    property Value: UTF8String read GetValue write SetValue;
  end;

  { TKSeF2EncryptionInfo }

  TKSeF2EncryptionInfo = class(TKSeF2Object)
  private
    function GetEncryptedSymmetricKeyBase64: UTF8String;
    function GetInitializationVectorBase64: UTF8String;
    procedure SetEncryptedSymmetricKeyBase64(AValue: UTF8String);
    procedure SetInitializationVectorBase64(AValue: UTF8String);
  published
    property EncryptedSymmetricKeyBase64: UTF8String read GetEncryptedSymmetricKeyBase64 write SetEncryptedSymmetricKeyBase64;
    property InitializationVectorBase64: UTF8String read GetInitializationVectorBase64 write SetInitializationVectorBase64;
  end;

  { TKSeF2OpenOnlineSessionRequest }

  TKSeF2OpenOnlineSessionRequest = class(TKSeF2Request)
  private
    FEncryption: TKSeF2EncryptionInfo;
    FFormCode: TKSeF2FormCode;
    procedure SetEncryption(AValue: TKSeF2EncryptionInfo);
    procedure SetFormCode(AValue: TKSeF2FormCode);
  protected
    procedure LoadObject; override;
  published
    property FormCode: TKSeF2FormCode read FFormCode write SetFormCode;
    property Encryption: TKSeF2EncryptionInfo read FEncryption write SetEncryption;
  end;

  { TKSeF2OpenOnlineSessionResponse }

  TKSeF2OpenOnlineSessionResponse = class(TKSeF2Response)
  private
    function GetReferenceNumber: UTF8String;
    function GetValidUntil: TDateTime;
    function GetValidUntilRaw: UTF8String;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property ValidUntil: TDateTime read GetValidUntil;
    property ValidUntilRaw: UTF8String read GetValidUntilRaw;
  end;

  { TKSeF2SendInvoiceRequest }

  TKSeF2SendInvoiceRequest = class(TKSeF2Request)
  private
    function GetEncryptedInvoiceContent: UTF8String;
    function GetEncryptedInvoiceHash: UTF8String;
    function GetEncryptedInvoiceSize: Int64;
    function GetHashOfCorrectedInvoice: UTF8String;
    function GetInvoiceHash: UTF8String;
    function GetInvoiceSize: Int64;
    function GetOfflineMode: Boolean;
    procedure SetEncryptedInvoiceContent(AValue: UTF8String);
    procedure SetEncryptedInvoiceHash(AValue: UTF8String);
    procedure SetEncryptedInvoiceSize(AValue: Int64);
    procedure SetHashOfCorrectedInvoice(AValue: UTF8String);
    procedure SetInvoiceHash(AValue: UTF8String);
    procedure SetInvoiceSize(AValue: Int64);
    procedure SetOfflineMode(AValue: Boolean);
  published
    property InvoiceHash: UTF8String read GetInvoiceHash write SetInvoiceHash;
    property InvoiceSize: Int64 read GetInvoiceSize write SetInvoiceSize;
    property EncryptedInvoiceHash: UTF8String read GetEncryptedInvoiceHash write SetEncryptedInvoiceHash;
    property EncryptedInvoiceSize: Int64 read GetEncryptedInvoiceSize write SetEncryptedInvoiceSize;
    property EncryptedInvoiceContent: UTF8String read GetEncryptedInvoiceContent write SetEncryptedInvoiceContent;
    property OfflineMode: Boolean read GetOfflineMode write SetOfflineMode;
    property HashOfCorrectedInvoice: UTF8String read GetHashOfCorrectedInvoice write SetHashOfCorrectedInvoice;
  end;

  { TKSeF2SendInvoiceResponse }

  TKSeF2SendInvoiceResponse = class(TKSeF2Response)
  private
    function GetReferenceNumber: UTF8String;
    procedure SetReferenceNumber(AValue: UTF8String);
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber write SetReferenceNumber;
  end;

  { TKSeF2BatchFilePartInfo }

  TKSeF2BatchFilePartInfo = class(TKSeF2Object)
  private
    function GetFileHash: UTF8String;
    function GetFileSize: Int64;
    function GetOrdinalNumber: Integer;
    procedure SetFileHash(AValue: UTF8String);
    procedure SetFileSize(AValue: Int64);
    procedure SetOrdinalNumber(AValue: Integer);
  published
    property OrdinalNumber: Integer read GetOrdinalNumber write SetOrdinalNumber;
    property FileSize: Int64 read GetFileSize write SetFileSize;
    property FileHash: UTF8String read GetFileHash write SetFileHash;
  end;

  { TKSeF2BatchFilePartInfoArray }

  TKSeF2BatchFilePartInfoArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2BatchFilePartInfo;
  public
    property Items[AIndex: Integer]: TKSeF2BatchFilePartInfo read GetItem; default;
  end;

  { TKSeF2BatchFileInfo }

  TKSeF2BatchFileInfo = class(TKSeF2Object)
  private
    FFileParts: TKSeF2BatchFilePartInfoArray;
    function GetFileHash: UTF8String;
    function GetFileSize: Int64;
    procedure SetFileHash(AValue: UTF8String);
    procedure SetFileParts(AValue: TKSeF2BatchFilePartInfoArray);
    procedure SetFileSize(AValue: Int64);
  protected
    procedure LoadObject; override;
  published
    property FileSize: Int64 read GetFileSize write SetFileSize;
    property FileHash: UTF8String read GetFileHash write SetFileHash;
    property FileParts: TKSeF2BatchFilePartInfoArray read FFileParts write SetFileParts;
  end;

  { TKSeF2OpenBatchSessionRequest }

  TKSeF2OpenBatchSessionRequest = class(TKSeF2Request)
  private
    FBatchFile: TKSeF2BatchFileInfo;
    FEncryption: TKSeF2EncryptionInfo;
    FFormCode: TKSeF2FormCode;
    function GetOfflineMode: Boolean;
    procedure SetBatchFile(AValue: TKSeF2BatchFileInfo);
    procedure SetEncryption(AValue: TKSeF2EncryptionInfo);
    procedure SetFormCode(AValue: TKSeF2FormCode);
    procedure SetOfflineMode(AValue: Boolean);
  protected
    procedure LoadObject; override;
  published
    property FormCode: TKSeF2FormCode read FFormCode write SetFormCode;
    property BatchFile: TKSeF2BatchFileInfo read FBatchFile write SetBatchFile;
    property Encryption: TKSeF2EncryptionInfo read FEncryption write SetEncryption;
    property OfflineMode: Boolean read GetOfflineMode write SetOfflineMode;
  end;

  { TKSeF2KeyValuePair }

  TKSeF2KeyValuePair = class(TKSeF2Object)
  private
    function GetKey: UTF8String;
    function GetValue: UTF8String;
  published
    property Key: UTF8String read GetKey;
    property Value: UTF8String read GetValue;
  end;

  { TKSeF2KeyValuePairs }

  TKSeF2KeyValuePairs = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2KeyValuePair;
  public
    property Items[AIndex: Integer]: TKSeF2KeyValuePair read GetItem; default;
  end;

  { TKSeF2PartUploadRequest }

  TKSeF2PartUploadRequest = class(TKSeF2Object)
  private
    FHeaders: TKSeF2KeyValuePairs;
    function GetMethod: UTF8String;
    function GetOrdinalNumber: Integer;
    function GetUrl: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property OrdinalNumber: Integer read GetOrdinalNumber;
    property Method: UTF8String read GetMethod;
    property Url: UTF8String read GetUrl;
    property Headers: TKSeF2KeyValuePairs read FHeaders;
  end;

  { TKSeF2PartUploadRequestArray }

  TKSeF2PartUploadRequestArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2PartUploadRequest;
  public
    property Items[AIndex: Integer]: TKSeF2PartUploadRequest read GetItem; default;
  end;

  { TKSeF2OpenBatchSessionResponse }

  TKSeF2OpenBatchSessionResponse = class(TKSeF2Response)
  private
    FPartUploadRequests: TKSeF2PartUploadRequestArray;
    function GetReferenceNumber: UTF8String;
    procedure SetReferenceNumber(AValue: UTF8String);
  protected
    procedure LoadObject; override;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber write SetReferenceNumber;
    property PartUploadRequests: TKSeF2PartUploadRequestArray read FPartUploadRequests;
  end;

  { TKSeF2SessionsQueryResponseItem }

  TKSeF2SessionsQueryResponseItem = class(TKSeF2Object)
  private
    FStatus: TKSeF2StatusInfo;
    function GetDateCreated: TDateTime;
    function GetDateCreatedRaw: UTF8String;
    function GetDateUpdated: TDateTime;
    function GetDateUpdatedRaw: UTF8String;
    function GetFailedInvoiceCount: Integer;
    function GetReferenceNumber: UTF8String;
    function GetSuccessfulInvoiceCount: Integer;
    function GetTotalInvoiceCount: Integer;
    function GetValidUntil: TDateTime;
    function GetValidUntilRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property Status: TKSeF2StatusInfo read FStatus;
    property DateCreated: TDateTime read GetDateCreated;
    property DateCreatedRaw: UTF8String read GetDateCreatedRaw;
    property DateUpdated: TDateTime read GetDateUpdated;
    property DateUpdatedRaw: UTF8String read GetDateUpdatedRaw;
    property ValidUntil: TDateTime read GetValidUntil;
    property ValidUntilRaw: UTF8String read GetValidUntilRaw;
    property TotalInvoiceCount: Integer read GetTotalInvoiceCount;
    property SuccessfulInvoiceCount: Integer read GetSuccessfulInvoiceCount;
    property FailedInvoiceCount: Integer read GetFailedInvoiceCount;
  end;

  { TKSeF2SessionsQueryResponseArray }

  TKSeF2SessionsQueryResponseArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2SessionsQueryResponseItem;
  public
    property Items[AIndex: Integer]: TKSeF2SessionsQueryResponseItem read GetItem; default;
  end;

  TKSeF2SessionsQueryResponse = class(TKSeF2Response)
  private
    FSessions: TKSeF2SessionsQueryResponseArray;
    function GetContinuationToken: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property ContinuationToken: UTF8String read GetContinuationToken;
    property Sessions: TKSeF2SessionsQueryResponseArray read FSessions;
  end;

  { TKSeF2UpoPageResponse }

  TKSeF2UpoPageResponse = class(TKSeF2Object)
  private
    function GetDownloadUrl: UTF8String;
    function GetDownloadUrlExpirationDate: TDateTime;
    function GetDownloadUrlExpirationDateRaw: UTF8String;
    function GetReferenceNumber: UTF8String;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property DownloadUrl: UTF8String read GetDownloadUrl;
    property DownloadUrlExpirationDate: TDateTime read GetDownloadUrlExpirationDate;
    property DownloadUrlExpirationDateRaw: UTF8String read GetDownloadUrlExpirationDateRaw;
  end;

  { TKSeF2UpoPageResponseArray }

  TKSeF2UpoPageResponseArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2UpoPageResponse;
  public
    property Items[AIndex: Integer]: TKSeF2UpoPageResponse read GetItem; default;
  end;

  { TKSeF2UpoResponse }

  TKSeF2UpoResponse = class(TKSeF2Object)
  private
    FPages: TKSeF2UpoPageResponseArray;
  protected
    procedure LoadObject; override;
  published
    property Pages: TKSeF2UpoPageResponseArray read FPages;
  end;

  { TKSeF2SessionStatusResponse }

  TKSeF2SessionStatusResponse = class(TKSeF2Response)
  private
    FStatus: TKSeF2StatusInfo;
    FUpo: TKSeF2UpoResponse;
    function GetDateCreated: TDateTime;
    function GetDateCreatedRaw: UTF8String;
    function GetDateUpdated: TDateTime;
    function GetDateUpdatedRaw: UTF8String;
    function GetFailedInvoiceCount: Integer;
    function GetInvoiceCount: Integer;
    function GetSuccessfulInvoiceCount: Integer;
    function GetValidUntil: TDateTime;
    function GetValidUntilRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property Status: TKSeF2StatusInfo read FStatus;
    property DateCreated: TDateTime read GetDateCreated;
    property DateCreatedRaw: UTF8String read GetDateCreatedRaw;
    property DateUpdated: TDateTime read GetDateUpdated;
    property DateUpdatedRaw: UTF8String read GetDateUpdatedRaw;
    property ValidUntil: TDateTime read GetValidUntil;
    property ValidUntilRaw: UTF8String read GetValidUntilRaw;
    property Upo: TKSeF2UpoResponse read FUpo;
    property InvoiceCount: Integer read GetInvoiceCount;
    property SuccessfulInvoiceCount: Integer read GetSuccessfulInvoiceCount;
    property FailedInvoiceCount: Integer read GetFailedInvoiceCount;
  end;

  TKSeF2InvoicingMode = (imNotDefined, imOnline, imOffline);
  TKSeF2SortOrder = (soDefault, soAsc, soDesc);

  { TKSeF2InvoiceStatusInfo }

  TKSeF2InvoiceStatusInfo = class(TKSeF2StatusInfo)
  private
    FExtensions: TKSeF2KeyValuePairs;
  public
    procedure LoadObject; override;
  published
    property Extensions: TKSeF2KeyValuePairs read FExtensions;
  end;

  { TKSeF2SessionInvoiceStatusResponse }

  TKSeF2SessionInvoiceStatusResponse = class(TKSeF2Response)
  private
    FStatus: TKSeF2InvoiceStatusInfo;
    function GetAcquisitionDate: TDateTime;
    function GetAcquisitionDateRaw: UTF8String;
    function GetInvoiceFileName: UTF8String;
    function GetInvoiceHash: UTF8String;
    function GetInvoiceNumber: UTF8String;
    function GetInvoicingDate: TDateTime;
    function GetInvoicingDateRaw: UTF8String;
    function GetInvoicingMode: TKSeF2InvoicingMode;
    function GetKsefNumber: UTF8String;
    function GetOrdinalNumber: Integer;
    function GetPermanentStorageDate: TDateTime;
    function GetPermanentStorageDateRaw: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetUpoDownloadUrl: UTF8String;
    function GetUpoDownloadUrlExpirationDate: TDateTime;
    function GetUpoDownloadUrlExpirationDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property OrdinalNumber: Integer read GetOrdinalNumber;
    property InvoiceNumber: UTF8String read GetInvoiceNumber;
    property KsefNumber: UTF8String read GetKsefNumber;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property InvoiceHash: UTF8String read GetInvoiceHash;
    property InvoiceFileName: UTF8String read GetInvoiceFileName;
    property AcquisitionDate: TDateTime read GetAcquisitionDate;
    property AcquisitionDateRaw: UTF8String read GetAcquisitionDateRaw;
    property InvoicingDate: TDateTime read GetInvoicingDate;
    property InvoicingDateRaw: UTF8String read GetInvoicingDateRaw;
    property PermanentStorageDate: TDateTime read GetPermanentStorageDate;
    property PermanentStorageDateRaw: UTF8String read GetPermanentStorageDateRaw;
    property UpoDownloadUrl: UTF8String read GetUpoDownloadUrl;
    property UpoDownloadUrlExpirationDate: TDateTime read GetUpoDownloadUrlExpirationDate;
    property UpoDownloadUrlExpirationDateRaw: UTF8String read GetUpoDownloadUrlExpirationDateRaw;
    property InvoicingMode: TKSeF2InvoicingMode read GetInvoicingMode;
    property Status: TKSeF2InvoiceStatusInfo read FStatus;
  end;

  { TKSeF2SessionInvoiceStatusResponseArray }

  TKSeF2SessionInvoiceStatusResponseArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2SessionInvoiceStatusResponse;
  public
    property Items[AIndex: Integer]: TKSeF2SessionInvoiceStatusResponse read GetItem; default;
  end;

  { TKSeF2SessionInvoicesResponse }

  TKSeF2SessionInvoicesResponse = class(TKSeF2Response)
  private
    FInvoices: TKSeF2SessionInvoiceStatusResponseArray;
    function GetContinuationToken: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property ContinuationToken: UTF8String read GetContinuationToken;
    property Invoices: TKSeF2SessionInvoiceStatusResponseArray read FInvoices;
  end;

  TKSeF2InvoiceQuerySubjectType = (stSubject1, stSubject2, stSubject3, stSubjectAuthorized);

  TKSeF2InvoiceQueryDateType = (Issue, Invoicing, PermanentStorage);

  { TKSeF2InvoiceQueryDateRange }

  TKSeF2InvoiceQueryDateRange = class(TKSeF2Object)
  private
    function GetDateType: TKSeF2InvoiceQueryDateType;
    function GetFrom: TDateTime;
    function GetRestrictToPermanentStorageHwmDate: Boolean;
    function GetTo: TDateTime;
    procedure SetDateType(AValue: TKSeF2InvoiceQueryDateType);
    procedure SetFrom(AValue: TDateTime);
    procedure SetRestrictToPermanentStorageHwmDate(AValue: Boolean);
    procedure SetTo(AValue: TDateTime);
  published
    property DateType: TKSeF2InvoiceQueryDateType read GetDateType write SetDateType;
    property From: TDateTime read GetFrom write SetFrom;
    property To_: TDateTime read GetTo write SetTo;
    property RestrictToPermanentStorageHwmDate: Boolean read GetRestrictToPermanentStorageHwmDate write SetRestrictToPermanentStorageHwmDate;
  end;

  TKSeF2AmountType = (atBrutto, atNetto, atVat);

  { TKSeF2InvoiceQueryAmount }

  TKSeF2InvoiceQueryAmount = class(TKSeF2Object)
  private
    function GetFrom: Double;
    function GetTo: Double;
    function GetType: TKSeF2AmountType;
    procedure SetFrom(AValue: Double);
    procedure SetTo(AValue: Double);
    procedure SetType(AValue: TKSeF2AmountType);
  published
    property Type_: TKSeF2AmountType read GetType write SetType;
    property From: Double read GetFrom write SetFrom;
    property To_: Double read GetTo write SetTo;
  end;

  TKSeF2BuyerIdentifierType = (biNone, biOther, biNip, biVatUe);

  { TKSeF2InvoiceQueryBuyerIdentifier }

  TKSeF2InvoiceQueryBuyerIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2BuyerIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2BuyerIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2BuyerIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2NullableBoolean = (nbNotDefined, nbFalse, nbTrue);

  TKSeF2InvoiceQueryFormType = (iqfNotDefined, iqfFA, iqfPEF, iqfRR);

  TKSeF2InvoiceType = (ivVat, ivZal, ivKor, ivRoz, ivUpr, ivKorZal, ivKorRoz,
    ivVatPef, ivVatPefSp, ivKorPef, ivVatRr, ivKorVatRr);
  TKSeF2InvoiceTypes = set of TKSeF2InvoiceType;

  { TKSeF2InvoiceQueryFilters }

  TKSeF2InvoiceQueryFilters = class(TKSeF2Request)
  private
    FAmount: TKSeF2InvoiceQueryAmount;
    FBuyerIdentifier: TKSeF2InvoiceQueryBuyerIdentifier;
    FDateRange: TKSeF2InvoiceQueryDateRange;
    function GetCurrencyCodes: UTF8String;
    function GetFormType: TKSeF2InvoiceQueryFormType;
    function GetHasAttachment: TKSeF2NullableBoolean;
    function GetInvoiceNumber: UTF8String;
    function GetInvoiceTypes: TKSeF2InvoiceTypes;
    function GetInvoicingMode: TKSeF2InvoicingMode;
    function GetIsSelfInvoicing: TKSeF2NullableBoolean;
    function GetKsefNumber: UTF8String;
    function GetSellerNip: UTF8String;
    function GetSubjectType: TKSeF2InvoiceQuerySubjectType;
    procedure SetAmount(AValue: TKSeF2InvoiceQueryAmount);
    procedure SetBuyerIdentifier(AValue: TKSeF2InvoiceQueryBuyerIdentifier);
    procedure SetCurrencyCodes(AValue: UTF8String);
    procedure SetDateRange(AValue: TKSeF2InvoiceQueryDateRange);
    procedure SetFormType(AValue: TKSeF2InvoiceQueryFormType);
    procedure SetHasAttachment(AValue: TKSeF2NullableBoolean);
    procedure SetInvoiceNumber(AValue: UTF8String);
    procedure SetInvoiceTypes(AValue: TKSeF2InvoiceTypes);
    procedure SetInvoicingMode(AValue: TKSeF2InvoicingMode);
    procedure SetIsSelfInvoicing(AValue: TKSeF2NullableBoolean);
    procedure SetKsefNumber(AValue: UTF8String);
    procedure SetSellerNip(AValue: UTF8String);
    procedure SetSubjectType(AValue: TKSeF2InvoiceQuerySubjectType);
  protected
    procedure LoadObject; override;
  published
    property SubjectType: TKSeF2InvoiceQuerySubjectType read GetSubjectType write SetSubjectType;
    property DateRange: TKSeF2InvoiceQueryDateRange read FDateRange write SetDateRange;
    property KsefNumber: UTF8String read GetKsefNumber write SetKsefNumber;
    property InvoiceNumber: UTF8String read GetInvoiceNumber write SetInvoiceNumber;
    property Amount: TKSeF2InvoiceQueryAmount read FAmount write SetAmount;
    property SellerNip: UTF8String read GetSellerNip write SetSellerNip;
    property BuyerIdentifier: TKSeF2InvoiceQueryBuyerIdentifier read FBuyerIdentifier write SetBuyerIdentifier;
    property CurrencyCodes: UTF8String read GetCurrencyCodes write SetCurrencyCodes;
    property InvoicingMode: TKSeF2InvoicingMode read GetInvoicingMode write SetInvoicingMode;
    property IsSelfInvoicing: TKSeF2NullableBoolean read GetIsSelfInvoicing write SetIsSelfInvoicing;
    property FormType: TKSeF2InvoiceQueryFormType read GetFormType write SetFormType;
    property InvoiceTypes: TKSeF2InvoiceTypes read GetInvoiceTypes write SetInvoiceTypes;
    property HasAttachment: TKSeF2NullableBoolean read GetHasAttachment write SetHasAttachment;
  end;

  { TKSeF2InvoiceMetadataSeller }

  TKSeF2InvoiceMetadataSeller = class(TKSeF2Object)
  private
    function GetName: UTF8String;
    function GetNip: UTF8String;
  published
    property Nip: UTF8String read GetNip;
    property Name: UTF8String read GetName;
  end;

  { TKSeF2InvoiceMetadataBuyerIdentifier }

  TKSeF2InvoiceMetadataBuyerIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2BuyerIdentifierType;
    function GetValue: UTF8String;
  published
    property Type_: TKSeF2BuyerIdentifierType read GetType;
    property Value: UTF8String read GetValue;
  end;

  TKSeF2InvoiceMetadataBuyer = class(TKSeF2Object)
  private
    FIdentifier: TKSeF2InvoiceMetadataBuyerIdentifier;
    function GetName: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property Identifier: TKSeF2InvoiceMetadataBuyerIdentifier read FIdentifier;
    property Name: UTF8String read GetName;
  end;

  TKSeF2ThirdSubjectIdentifierType = (tsiNip, tsiInternalId, tsiVatUe, tsiOther, tsiNone);

  { TKSeF2InvoiceMetadataThirdSubjectIdentifier }

  TKSeF2InvoiceMetadataThirdSubjectIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2ThirdSubjectIdentifierType;
    function GetValue: UTF8String;
  published
    property Type_: TKSeF2ThirdSubjectIdentifierType read GetType;
    property Value: UTF8String read GetValue;
  end;

  TKSeF2InvoiceMetadataThirdSubject = class(TKSeF2Object)
  private
    FIdentifier: TKSeF2InvoiceMetadataThirdSubjectIdentifier;
    function GetName: UTF8String;
    function GetRole: Integer;
  protected
    procedure LoadObject; override;
  published
    property Identifier: TKSeF2InvoiceMetadataThirdSubjectIdentifier read FIdentifier;
    property Name: UTF8String read GetName;
    property Role: Integer read GetRole;
  end;

  { TKSeF2InvoiceMetadataThirdSubjectArray }

  TKSeF2InvoiceMetadataThirdSubjectArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2InvoiceMetadataThirdSubject;
  public
    property Items[AIndex: Integer]: TKSeF2InvoiceMetadataThirdSubject read GetItem; default;
  end;

  { TKSeF2InvoiceMetadataAuthorizedSubject }

  TKSeF2InvoiceMetadataAuthorizedSubject = class(TKSeF2Object)
  private
    function GetName: UTF8String;
    function GetNip: UTF8String;
    function GetRole: Integer;
  published
    property Nip: UTF8String read GetNip;
    property Name: UTF8String read GetName;
    property Role: Integer read GetRole;
  end;

  TKSeF2InvoiceMetadata = class(TKSeF2Object)
  private
    FAuthorizedSubject: TKSeF2InvoiceMetadataAuthorizedSubject;
    FBuyer: TKSeF2InvoiceMetadataBuyer;
    FFormCode: TKSeF2FormCode;
    FSeller: TKSeF2InvoiceMetadataSeller;
    FThirdSubjects: TKSeF2InvoiceMetadataThirdSubjectArray;
    function GetAcquisitionDate: TDateTime;
    function GetAcquisitionDateRaw: UTF8String;
    function GetCurrency: UTF8String;
    function GetGrossAmount: Double;
    function GetHasAttachment: Boolean;
    function GetHashOfCorrectedInvoice: UTF8String;
    function GetInvoiceHash: UTF8String;
    function GetInvoiceNumber: UTF8String;
    function GetInvoiceType: TKSeF2InvoiceType;
    function GetInvoicingDate: TDateTime;
    function GetInvoicingDateRaw: UTF8String;
    function GetInvoicingMode: TKSeF2InvoicingMode;
    function GetIsSelfInvoicing: Boolean;
    function GetIssueDate: TDateTime;
    function GetIssueDateRaw: UTF8String;
    function GetKsefNumber: UTF8String;
    function GetNetAmount: Double;
    function GetPermanentStorageDate: TDateTime;
    function GetPermanentStorageDateRaw: UTF8String;
    function GetVatAmount: Double;
  protected
    procedure LoadObject; override;
  published
    property KsefNumber: UTF8String read GetKsefNumber;
    property InvoiceNumber: UTF8String read GetInvoiceNumber;
    property IssueDate: TDateTime read GetIssueDate;
    property IssueDateRaw: UTF8String read GetIssueDateRaw;
    property InvoicingDate: TDateTime read GetInvoicingDate;
    property InvoicingDateRaw: UTF8String read GetInvoicingDateRaw;
    property AcquisitionDate: TDateTime read GetAcquisitionDate;
    property AcquisitionDateRaw: UTF8String read GetAcquisitionDateRaw;
    property PermanentStorageDate: TDateTime read GetPermanentStorageDate;
    property PermanentStorageDateRaw: UTF8String read GetPermanentStorageDateRaw;
    property Seller: TKSeF2InvoiceMetadataSeller read FSeller;
    property Buyer: TKSeF2InvoiceMetadataBuyer read FBuyer;
    property NetAmount: Double read GetNetAmount;
    property GrossAmount: Double read GetGrossAmount;
    property VatAmount: Double read GetVatAmount;
    property Currency: UTF8String read GetCurrency;
    property InvoicingMode: TKSeF2InvoicingMode read GetInvoicingMode;
    property InvoiceType: TKSeF2InvoiceType read GetInvoiceType;
    property FormCode: TKSeF2FormCode read FFormCode;
    property IsSelfInvoicing: Boolean read GetIsSelfInvoicing;
    property HasAttachment: Boolean read GetHasAttachment;
    property InvoiceHash: UTF8String read GetInvoiceHash;
    property HashOfCorrectedInvoice: UTF8String read GetHashOfCorrectedInvoice;
    property ThirdSubjects: TKSeF2InvoiceMetadataThirdSubjectArray read FThirdSubjects;
    property AuthorizedSubject: TKSeF2InvoiceMetadataAuthorizedSubject read FAuthorizedSubject;
  end;

  { TKSeF2InvoiceMetadataArray }

  TKSeF2InvoiceMetadataArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2InvoiceMetadata;
  public
    property Items[AIndex: Integer]: TKSeF2InvoiceMetadata read GetItem; default;
  end;

  { TKSeF2QueryInvoicesMetadataResponse }

  TKSeF2QueryInvoicesMetadataResponse = class(TKSeF2Response)
  private
    FInvoices: TKSeF2InvoiceMetadataArray;
    function GetHasMore: Boolean;
    function GetIsTruncated: Boolean;
    function GetPermanentStorageHwmDate: TDateTime;
    function GetPermanentStorageHwmDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property HasMore: Boolean read GetHasMore;
    property IsTruncated: Boolean read GetIsTruncated;
    property PermanentStorageHwmDate: TDateTime read GetPermanentStorageHwmDate;
    property PermanentStorageHwmDateRaw: UTF8String read GetPermanentStorageHwmDateRaw;
    property Invoices: TKSeF2InvoiceMetadataArray read FInvoices;
  end;

  { TKSeF2InvoiceExportRequest }

  TKSeF2InvoiceExportRequest = class(TKSeF2Request)
  private
    FEncryption: TKSeF2EncryptionInfo;
    FFilters: TKSeF2InvoiceQueryFilters;
    procedure SetEncryption(AValue: TKSeF2EncryptionInfo);
    procedure SetFilters(AValue: TKSeF2InvoiceQueryFilters);
  protected
    procedure LoadObject; override;
  published
    property Encryption: TKSeF2EncryptionInfo read FEncryption write SetEncryption;
    property Filters: TKSeF2InvoiceQueryFilters read FFilters write SetFilters;
  end;

  { TKSeF2ExportInvoicesResponse }

  TKSeF2ExportInvoicesResponse = class(TKSeF2Response)
  private
    function GetReferenceNumber: UTF8String;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
  end;

  { TKSeF2InvoicePackagePart }

  TKSeF2InvoicePackagePart = class(TKSeF2Object)
  private
    function GetEncryptedPartHash: UTF8String;
    function GetEncryptedPartSize: Int64;
    function GetExpirationDate: TDateTime;
    function GetExpirationDateRaw: UTF8String;
    function GetMethod: UTF8String;
    function GetOrdinalNumber: Integer;
    function GetPartHash: UTF8String;
    function GetPartName: UTF8String;
    function GetPartSize: Int64;
    function GetPermanentStorageHwmDate: TDateTime;
    function GetPermanentStorageHwmDateRaw: UTF8String;
    function GetUrl: UTF8String;
  published
    property OrdinalNumber: Integer read GetOrdinalNumber;
    property PartName: UTF8String read GetPartName;
    property Method: UTF8String read GetMethod;
    property Url: UTF8String read GetUrl;
    property PartSize: Int64 read GetPartSize;
    property PartHash: UTF8String read GetPartHash;
    property EncryptedPartSize: Int64 read GetEncryptedPartSize;
    property EncryptedPartHash: UTF8String read GetEncryptedPartHash;
    property ExpirationDate: TDateTime read GetExpirationDate;
    property ExpirationDateRaw: UTF8String read GetExpirationDateRaw;
    property PermanentStorageHwmDate: TDateTime read GetPermanentStorageHwmDate;
    property PermanentStorageHwmDateRaw: UTF8String read GetPermanentStorageHwmDateRaw;
  end;

  { TKSeF2InvoicePackagePartArray }

  TKSeF2InvoicePackagePartArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2InvoicePackagePart;
  public
    property Items[AIndex: Integer]: TKSeF2InvoicePackagePart read GetItem; default;
  end;

  {$IFNDEF FPC}
  TDate = TDateTime;
  {$ENDIF}

  TKSeF2InvoicePackage = class(TKSeF2Object)
  private
    FParts: TKSeF2InvoicePackagePartArray;
    function GetInvoiceCount: Int64;
    function GetIsTruncated: Boolean;
    function GetLastInvoicingDate: TDateTime;
    function GetLastInvoicingDateRaw: UTF8String;
    function GetLastIssueDate: TDate;
    function GetLastIssueDateRaw: UTF8String;
    function GetLastPermanentStorageDate: TDateTime;
    function GetLastPermanentStorageDateRaw: UTF8String;
    function GetSize: Int64;
  protected
    procedure LoadObject; override;
  published
    property InvoiceCount: Int64 read GetInvoiceCount;
    property Size: Int64 read GetSize;
    property Parts: TKSeF2InvoicePackagePartArray read FParts;
    property IsTruncated: Boolean read GetIsTruncated;
    property LastIssueDate: TDate read GetLastIssueDate;
    property LastIssueDateRaw: UTF8String read GetLastIssueDateRaw;
    property LastInvoicingDate: TDateTime read GetLastInvoicingDate;
    property LastInvoicingDateRaw: UTF8String read GetLastInvoicingDateRaw;
    property LastPermanentStorageDate: TDateTime read GetLastPermanentStorageDate;
    property LastPermanentStorageDateRaw: UTF8String read GetLastPermanentStorageDateRaw;
  end;

  { TKSeF2InvoiceExportStatusResponse }

  TKSeF2InvoiceExportStatusResponse = class(TKSeF2Response)
  private
    FPackage: TKSeF2InvoicePackage;
    FStatus: TKSeF2StatusInfo;
    function GetCompletedDate: TDateTime;
    function GetCompletedDateRaw: UTF8String;
    function GetPackageExpirationDate: TDateTime;
    function GetPackageExpirationDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property Status: TKSeF2StatusInfo read FStatus;
    property CompletedDate: TDateTime read GetCompletedDate;
    property CompletedDateRaw: UTF8String read GetCompletedDateRaw;
    property PackageExpirationDate: TDateTime read GetPackageExpirationDate;
    property PackageExpirationDateRaw: UTF8String read GetPackageExpirationDateRaw;
    property Package: TKSeF2InvoicePackage read FPackage;
  end;

  TKSeF2TokenPermissionType = (tpInvoiceRead, tpInvoiceWrite, tpCredentialsRead,
    tpCredentialsManage, tpSubunitManage, tpEnforcementOperations);
  TKSeF2TokenPermissions = set of TKSeF2TokenPermissionType;

  { TKSeF2GenerateTokenRequest }

  TKSeF2GenerateTokenRequest = class(TKSeF2Request)
  private
    function GetDescription: UTF8String;
    function GetPermissions: TKSeF2TokenPermissions;
    procedure SetDescription(AValue: UTF8String);
    procedure SetPermissions(AValue: TKSeF2TokenPermissions);
  published
    property Permissions: TKSeF2TokenPermissions read GetPermissions write SetPermissions;
    property Description: UTF8String read GetDescription write SetDescription;
  end;

  { TKSeF2GenerateTokenResponse }

  TKSeF2GenerateTokenResponse = class(TKSeF2Response)
  private
    function GetReferenceNumber: UTF8String;
    function GetToken: UTF8String;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property Token: UTF8String read GetToken;
  end;

  TKSeF2AuthenticationTokenStatus = (tsPending, tsActive, tsRevoking, tsRevoked, tsFailed);
  TKSeF2AuthenticationTokenStatuses = set of TKSeF2AuthenticationTokenStatus;

  TKSeF2TokenAuthorIdentifierType = (taiNone, taiNip, taiPesel, taiFingerprint);

  { TKSeF2TokenAuthorIdentifierTypeIdentifier }

  TKSeF2TokenAuthorIdentifierTypeIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2TokenAuthorIdentifierType;
    function GetValue: UTF8String;
  published
    property Type_: TKSeF2TokenAuthorIdentifierType read GetType;
    property Value: UTF8String read GetValue;
  end;

  TKSeF2TokenContextIdentifierType = (tciNip, tciInternalId, tciNipVatUe, tciPeppolId);

  { TKSeF2TokenContextIdentifierTypeIdentifier }

  TKSeF2TokenContextIdentifierTypeIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2TokenContextIdentifierType;
    function GetValue: UTF8String;
  published
    property Type_: TKSeF2TokenContextIdentifierType read GetType;
    property Value: UTF8String read GetValue;
  end;

  { TKSeF2QueryTokensResponseItem }

  TKSeF2QueryTokensResponseItem = class(TKSeF2Object)
  private
    FAuthorIdentifier: TKSeF2TokenAuthorIdentifierTypeIdentifier;
    FContextIdentifier: TKSeF2TokenContextIdentifierTypeIdentifier;
    function GetDateCreated: TDateTime;
    function GetDateCreatedRaw: UTF8String;
    function GetDescription: UTF8String;
    function GetLastUseDate: TDateTime;
    function GetLastUseDateRaw: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetRequestedPermissions: TKSeF2TokenPermissions;
    function GetStatus: TKSeF2AuthenticationTokenStatus;
    function GetStatusDetails: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property AuthorIdentifier: TKSeF2TokenAuthorIdentifierTypeIdentifier read FAuthorIdentifier;
    property ContextIdentifier: TKSeF2TokenContextIdentifierTypeIdentifier read FContextIdentifier;
    property Description: UTF8String read GetDescription;
    property RequestedPermissions: TKSeF2TokenPermissions read GetRequestedPermissions;
    property DateCreated: TDateTime read GetDateCreated;
    property DateCreatedRaw: UTF8String read GetDateCreatedRaw;
    property LastUseDate: TDateTime read GetLastUseDate;
    property LastUseDateRaw: UTF8String read GetLastUseDateRaw;
    property Status: TKSeF2AuthenticationTokenStatus read GetStatus;
    property StatusDetails: UTF8String read GetStatusDetails;
  end;

  { TKSeF2QueryTokensResponseArray }

  TKSeF2QueryTokensResponseArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2QueryTokensResponseItem;
  public
    property Items[AIndex: Integer]: TKSeF2QueryTokensResponseItem read GetItem; default;
  end;

  TKSeF2QueryTokensResponse = class(TKSeF2Response)
  private
    FTokens: TKSeF2QueryTokensResponseArray;
    function GetContinuationToken: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property ContinuationToken: UTF8String read GetContinuationToken;
    property Tokens: TKSeF2QueryTokensResponseArray read FTokens;
  end;

  { TKSeF2TokenStatusResponse }

  TKSeF2TokenStatusResponse = class(TKSeF2Response)
  private
    FAuthorIdentifier: TKSeF2TokenAuthorIdentifierTypeIdentifier;
    FContextIdentifier: TKSeF2TokenContextIdentifierTypeIdentifier;
    function GetDateCreated: TDateTime;
    function GetDateCreatedRaw: UTF8String;
    function GetDescription: UTF8String;
    function GetLastUseDate: TDateTime;
    function GetLastUseDateRaw: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetRequestedPermissions: TKSeF2TokenPermissions;
    function GetStatus: TKSeF2AuthenticationTokenStatus;
    function GetStatusDetails: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property AuthorIdentifier: TKSeF2TokenAuthorIdentifierTypeIdentifier read FAuthorIdentifier;
    property ContextIdentifier: TKSeF2TokenContextIdentifierTypeIdentifier read FContextIdentifier;
    property Description: UTF8String read GetDescription;
    property RequestedPermissions: TKSeF2TokenPermissions read GetRequestedPermissions;
    property DateCreated: TDateTime read GetDateCreated;
    property DateCreatedRaw: UTF8String read GetDateCreatedRaw;
    property LastUseDate: TDateTime read GetLastUseDate;
    property LastUseDateRaw: UTF8String read GetLastUseDateRaw;
    property Status: TKSeF2AuthenticationTokenStatus read GetStatus;
    property StatusDetails: UTF8String read GetStatusDetails;
  end;

  { TKSeF2Subunit }

  TKSeF2Subunit = class(TKSeF2Object)
  private
    function GetDescription: UTF8String;
    function GetSubjectNip: UTF8String;
    procedure SetDescription(AValue: UTF8String);
    procedure SetSubjectNip(AValue: UTF8String);
  published
    property SubjectNip: UTF8String read GetSubjectNip write SetSubjectNip;
    property Description: UTF8String read GetDescription write SetDescription;
  end;

  { TKSeF2SubunitArray }

  TKSeF2SubunitArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2Subunit;
  public
    property Items[AIndex: Integer]: TKSeF2Subunit read GetItem; default;
  end;

  TKSeF2SubjectType = (stEnforcementAuthority, stVatGroup, stJST);

  { TKSeF2SubjectCreateRequest }

  TKSeF2SubjectCreateRequest = class(TKSeF2Request)
  private
    FSubunits: TKSeF2SubunitArray;
    function GetCreatedDate: TDateTime;
    function GetDescription: UTF8String;
    function GetSubjectNip: UTF8String;
    function GetSubjectType: TKSeF2SubjectType;
    procedure SetCreatedDate(AValue: TDateTime);
    procedure SetDescription(AValue: UTF8String);
    procedure SetSubjectNip(AValue: UTF8String);
    procedure SetSubjectType(AValue: TKSeF2SubjectType);
    procedure SetSubunits(AValue: TKSeF2SubunitArray);
  protected
    procedure LoadObject; override;
  published
    property SubjectNip: UTF8String read GetSubjectNip write SetSubjectNip;
    property SubjectType: TKSeF2SubjectType read GetSubjectType write SetSubjectType;
    property Subunits: TKSeF2SubunitArray read FSubunits write SetSubunits;
    property Description: UTF8String read GetDescription write SetDescription;
    property CreatedDate: TDateTime read GetCreatedDate write SetCreatedDate;
  end;

  { TKSeF2PersonCreateRequest }

  TKSeF2PersonCreateRequest = class(TKSeF2Request)
  private
    function GetCreatedDate: TDateTime;
    function GetDescription: UTF8String;
    function GetIsBailiff: Boolean;
    function GetNip: UTF8String;
    function GetPesel: UTF8String;
    procedure SetCreatedDate(AValue: TDateTime);
    procedure SetDescription(AValue: UTF8String);
    procedure SetIsBailiff(AValue: Boolean);
    procedure SetNip(AValue: UTF8String);
    procedure SetPesel(AValue: UTF8String);
  published
    property Nip: UTF8String read GetNip write SetNip;
    property Pesel: UTF8String read GetPesel write SetPesel;
    property IsBailiff: Boolean read GetIsBailiff write SetIsBailiff;
    property Description: UTF8String read GetDescription write SetDescription;
    property CreatedDate: TDateTime read GetCreatedDate write SetCreatedDate;
  end;

  TKSeF2PersonPermissionsSubjectIdentifierType = (ppsitNip, ppsitPesel, ppsitFingerprint);

  { TKSeF2PersonPermissionsSubjectIdentifier }

  TKSeF2PersonPermissionsSubjectIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2PersonPermissionsSubjectIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2PersonPermissionsSubjectIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2PersonPermissionsSubjectIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  { TKSeF2PersonDetails }

  TKSeF2PersonDetails = class(TKSeF2Object)
  private
    function GetFirstName: UTF8String;
    function GetLastName: UTF8String;
    procedure SetFirstName(AValue: UTF8String);
    procedure SetLastName(AValue: UTF8String);
  published
    property FirstName: UTF8String read GetFirstName write SetFirstName;
    property LastName: UTF8String read GetLastName write SetLastName;
  end;

  TKSeF2PersonIdentifierType = (pitPesel, pitNip);

  { TKSeF2PersonIdentifier }

  TKSeF2PersonIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2PersonIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2PersonIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2PersonIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  { TKSeF2IdDocument }

  TKSeF2IdDocument = class(TKSeF2Object)
  private
    function GetCountry: UTF8String;
    function GetNumber: UTF8String;
    function GetType: UTF8String;
    procedure SetCountry(AValue: UTF8String);
    procedure SetNumber(AValue: UTF8String);
    procedure SetType(AValue: UTF8String);
  published
    property Type_: UTF8String read GetType write SetType;
    property Number: UTF8String read GetNumber write SetNumber;
    property Country: UTF8String read GetCountry write SetCountry;
  end;

  { TKSeF2PersonByFingerprintWithIdentifierDetails }

  TKSeF2PersonByFingerprintWithIdentifierDetails = class(TKSeF2PersonDetails)
  private
    FIdentifier: TKSeF2PersonIdentifier;
    procedure SetIdentifier(AValue: TKSeF2PersonIdentifier);
  protected
    procedure LoadObject; override;
  published
    property Identifier: TKSeF2PersonIdentifier read FIdentifier write SetIdentifier;
  end;

  { TKSeF2PersonByFingerprintWithoutIdentifierDetails }

  TKSeF2PersonByFingerprintWithoutIdentifierDetails = class(TKSeF2PersonDetails)
  private
    FIdDocument: TKSeF2IdDocument;
    function GetBirthDate: TDate;
    procedure SetBirthDate(AValue: TDate);
    procedure SetIdDocument(AValue: TKSeF2IdDocument);
  protected
    procedure LoadObject; override;
  published
    property BirthDate: TDate read GetBirthDate write SetBirthDate;
    property IdDocument: TKSeF2IdDocument read FIdDocument write SetIdDocument;
  end;

  TKSeF2PersonPermissionSubjectDetailsType = (ppsdPersonByIdentifier,
    ppsdPersonByFingerprintWithIdentifier, ppsdPersonByFingerprintWithoutIdentifier);

  { TKSeF2PersonPermissionSubjectDetails }

  TKSeF2PersonPermissionSubjectDetails = class(TKSeF2Object)
  private
    FPersonByFpNoId: TKSeF2PersonByFingerprintWithoutIdentifierDetails;
    FPersonByFpWithId: TKSeF2PersonByFingerprintWithIdentifierDetails;
    FPersonById: TKSeF2PersonDetails;
    function GetSubjectDetailsType: TKSeF2PersonPermissionSubjectDetailsType;
    procedure SetPersonByFpNoId(
      AValue: TKSeF2PersonByFingerprintWithoutIdentifierDetails);
    procedure SetPersonByFpWithId(
      AValue: TKSeF2PersonByFingerprintWithIdentifierDetails);
    procedure SetPersonById(AValue: TKSeF2PersonDetails);
    procedure SetSubjectDetailsType(
      AValue: TKSeF2PersonPermissionSubjectDetailsType);
  protected
    procedure LoadObject; override;
  published
    property SubjectDetailsType: TKSeF2PersonPermissionSubjectDetailsType read GetSubjectDetailsType write SetSubjectDetailsType;
    property PersonById: TKSeF2PersonDetails read FPersonById write SetPersonById;
    property PersonByFpWithId: TKSeF2PersonByFingerprintWithIdentifierDetails read FPersonByFpWithId write SetPersonByFpWithId;
    property PersonByFpNoId: TKSeF2PersonByFingerprintWithoutIdentifierDetails read FPersonByFpNoId write SetPersonByFpNoId;
  end;

  TKSeF2PersonPermissionType = (pptCredentialsManage, pptCredentialsRead,
    pptInvoiceWrite, pptInvoiceRead, pptIntrospection, pptSubunitManage,
    pptEnforcementOperations);

  TKSeF2PersonPermissionTypes = set of TKSeF2PersonPermissionType;

  { TKSeF2PersonPermissionsGrantRequest }

  TKSeF2PersonPermissionsGrantRequest = class(TKSeF2Request)
  private
    FSubjectDetails: TKSeF2PersonPermissionSubjectDetails;
    FSubjectIdentifier: TKSeF2PersonPermissionsSubjectIdentifier;
    function GetDescription: UTF8String;
    function GetPermissions: TKSeF2PersonPermissionTypes;
    procedure SetDescription(AValue: UTF8String);
    procedure SetPermissions(AValue: TKSeF2PersonPermissionTypes);
    procedure SetSubjectDetails(AValue: TKSeF2PersonPermissionSubjectDetails);
    procedure SetSubjectIdentifier(
      AValue: TKSeF2PersonPermissionsSubjectIdentifier);
  protected
    procedure LoadObject; override;
  published
    property SubjectIdentifier: TKSeF2PersonPermissionsSubjectIdentifier read FSubjectIdentifier write SetSubjectIdentifier;
    property Permissions: TKSeF2PersonPermissionTypes read GetPermissions write SetPermissions;
    property Description: UTF8String read GetDescription write SetDescription;
    property SubjectDetails: TKSeF2PersonPermissionSubjectDetails read FSubjectDetails write SetSubjectDetails;
  end;

  { TKSeF2PermissionsOperationResponse }

  TKSeF2PermissionsOperationResponse = class(TKSeF2Response)
  private
    function GetReferenceNumber: UTF8String;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
  end;

  TKSeF2EntityPermissionsSubjectIdentifierType = (epsiNip);

  { TKSeF2EntityPermissionsSubjectIdentifier }

  TKSeF2EntityPermissionsSubjectIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2EntityPermissionsSubjectIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2EntityPermissionsSubjectIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EntityPermissionsSubjectIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2EntityPermissionType = (eptInvoiceWrite, eptInvoiceRead);

  TKSeF2EntityPermission = class(TKSeF2Object)
  private
    function GetCanDelegate: Boolean;
    function GetType: TKSeF2EntityPermissionType;
    procedure SetCanDelegate(AValue: Boolean);
    procedure SetType(AValue: TKSeF2EntityPermissionType);
  published
    property Type_: TKSeF2EntityPermissionType read GetType write SetType;
    property CanDelegate: Boolean read GetCanDelegate write SetCanDelegate;
  end;


  { TKSeF2EntityPermissionArray }

  TKSeF2EntityPermissionArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2EntityPermission;
  public
    property Items[AIndex: Integer]: TKSeF2EntityPermission read GetItem; default;
  end;

  { TKSeF2EntityDetails }

  TKSeF2EntityDetails = class(TKSeF2Object)
  private
    function GetFullName: UTF8String;
    procedure SetFullName(AValue: UTF8String);
  published
    property FullName: UTF8String read GetFullName write SetFullName;
  end;

  { TKSeF2EntityPermissionsGrantRequest }

  TKSeF2EntityPermissionsGrantRequest = class(TKSeF2Request)
  private
    FPermissions: TKSeF2EntityPermissionArray;
    FSubjectDetails: TKSeF2EntityDetails;
    FSubjectIdentifier: TKSeF2EntityPermissionsSubjectIdentifier;
    function GetDescription: UTF8String;
    procedure SetDescription(AValue: UTF8String);
    procedure SetPermissions(AValue: TKSeF2EntityPermissionArray);
    procedure SetSubjectDetails(AValue: TKSeF2EntityDetails);
    procedure SetSubjectIdentifier(
      AValue: TKSeF2EntityPermissionsSubjectIdentifier);
  protected
    procedure LoadObject; override;
  published
    property SubjectIdentifier: TKSeF2EntityPermissionsSubjectIdentifier read FSubjectIdentifier write SetSubjectIdentifier;
    property Permissions: TKSeF2EntityPermissionArray read FPermissions write SetPermissions;
    property Description: UTF8String read GetDescription write SetDescription;
    property SubjectDetails: TKSeF2EntityDetails read FSubjectDetails write SetSubjectDetails;
  end;

  TKSeF2EntityAuthorizationPermissionsSubjectIdentifierType = (eapsiNip, eapsiPeppolId);

  { TKSeF2EntityAuthorizationPermissionsSubjectIdentifier }

  TKSeF2EntityAuthorizationPermissionsSubjectIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2EntityAuthorizationPermissionsSubjectIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(
      AValue: TKSeF2EntityAuthorizationPermissionsSubjectIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EntityAuthorizationPermissionsSubjectIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2EntityAuthorizationPermissionType = (eaptSelfInvoicing, eaptRRInvoicing,
    eaptTaxRepresentative, eaptPefInvoicing);

  { TKSeF2EntityAuthorizationPermissionsGrantRequest }

  TKSeF2EntityAuthorizationPermissionsGrantRequest = class(TKSeF2Request)
  private
    FSubjectDetails: TKSeF2EntityDetails;
    FSubjectIdentifier: TKSeF2EntityAuthorizationPermissionsSubjectIdentifier;
    function GetDescription: UTF8String;
    function GetPermission: TKSeF2EntityAuthorizationPermissionType;
    procedure SetDescription(AValue: UTF8String);
    procedure SetPermission(AValue: TKSeF2EntityAuthorizationPermissionType);
    procedure SetSubjectDetails(AValue: TKSeF2EntityDetails);
    procedure SetSubjectIdentifier(
      AValue: TKSeF2EntityAuthorizationPermissionsSubjectIdentifier);
  protected
    procedure LoadObject; override;
  published
    property SubjectIdentifier: TKSeF2EntityAuthorizationPermissionsSubjectIdentifier read FSubjectIdentifier write SetSubjectIdentifier;
    property Permission: TKSeF2EntityAuthorizationPermissionType read GetPermission write SetPermission;
    property Description: UTF8String read GetDescription write SetDescription;
    property SubjectDetails: TKSeF2EntityDetails read FSubjectDetails write SetSubjectDetails;
  end;

  TKSeF2IndirectPermissionsSubjectIdentifierType = (ipsiNip, ipsiPesel, ipsiFingerprint);

  { TKSeF2IndirectPermissionsSubjectIdentifier }

  TKSeF2IndirectPermissionsSubjectIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2IndirectPermissionsSubjectIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2IndirectPermissionsSubjectIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2IndirectPermissionsSubjectIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2IndirectPermissionsTargetIdentifierType = (iptiNip, iptiAllPartners, iptiInternalId);

  { TKSeF2IndirectPermissionsTargetIdentifier }

  TKSeF2IndirectPermissionsTargetIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2IndirectPermissionsTargetIdentifierType;
    function GetValue: String;
    procedure SetType(AValue: TKSeF2IndirectPermissionsTargetIdentifierType);
    procedure SetValue(AValue: String);
  published
    property Type_: TKSeF2IndirectPermissionsTargetIdentifierType read GetType write SetType;
    property Value: String read GetValue write SetValue;
  end;

  TKSeF2IndirectPermissionType = (iptInvoiceRead, iptInvoiceWrite);

  TKSeF2IndirectPermissionTypes = set of TKSeF2IndirectPermissionType;

  { TKSeF2IndirectPermissionsGrantRequest }

  TKSeF2IndirectPermissionsGrantRequest = class(TKSeF2Request)
  private
    FSubjectDetails: TKSeF2PersonPermissionSubjectDetails;
    FSubjectIdentifier: TKSeF2IndirectPermissionsSubjectIdentifier;
    FTargetIdentifier: TKSeF2IndirectPermissionsTargetIdentifier;
    function GetDescription: UTF8String;
    function GetPermissions: TKSeF2IndirectPermissionTypes;
    procedure SetDescription(AValue: UTF8String);
    procedure SetPermissions(AValue: TKSeF2IndirectPermissionTypes);
    procedure SetSubjectDetails(AValue: TKSeF2PersonPermissionSubjectDetails);
    procedure SetSubjectIdentifier(
      AValue: TKSeF2IndirectPermissionsSubjectIdentifier);
    procedure SetTargetIdentifier(
      AValue: TKSeF2IndirectPermissionsTargetIdentifier);
  protected
    procedure LoadObject; override;
  published
    property SubjectIdentifier: TKSeF2IndirectPermissionsSubjectIdentifier read FSubjectIdentifier write SetSubjectIdentifier;
    property TargetIdentifier: TKSeF2IndirectPermissionsTargetIdentifier read FTargetIdentifier write SetTargetIdentifier;
    property Permissions: TKSeF2IndirectPermissionTypes read GetPermissions write SetPermissions;
    property Description: UTF8String read GetDescription write SetDescription;
    property SubjectDetails: TKSeF2PersonPermissionSubjectDetails read FSubjectDetails write SetSubjectDetails;
  end;

  TKSeF2SubunitPermissionsSubjectIdentifierType = (spsiNip, spsiPesel, spsiFingerprint);

  { TKSeF2SubunitPermissionsSubjectIdentifier }

  TKSeF2SubunitPermissionsSubjectIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2SubunitPermissionsSubjectIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2SubunitPermissionsSubjectIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2SubunitPermissionsSubjectIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2SubunitPermissionsContextIdentifierType = (spciInternalId, spciNip);

  { TKSeF2SubunitPermissionsContextIdentifier }

  TKSeF2SubunitPermissionsContextIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2SubunitPermissionsContextIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2SubunitPermissionsContextIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2SubunitPermissionsContextIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  { TKSeF2SubunitPermissionsGrantRequest }

  TKSeF2SubunitPermissionsGrantRequest = class(TKSeF2Request)
  private
    FContextIdentifier: TKSeF2SubunitPermissionsContextIdentifier;
    FSubjectDetails: TKSeF2PersonPermissionSubjectDetails;
    FSubjectIdentifier: TKSeF2SubunitPermissionsSubjectIdentifier;
    function GetDescription: UTF8String;
    function GetSubunitName: UTF8String;
    procedure SetContextIdentifier(
      AValue: TKSeF2SubunitPermissionsContextIdentifier);
    procedure SetDescription(AValue: UTF8String);
    procedure SetSubjectDetails(AValue: TKSeF2PersonPermissionSubjectDetails);
    procedure SetSubjectIdentifier(
      AValue: TKSeF2SubunitPermissionsSubjectIdentifier);
    procedure SetSubunitName(AValue: UTF8String);
  protected
    procedure LoadObject; override;
  published
    property SubjectIdentifier: TKSeF2SubunitPermissionsSubjectIdentifier read FSubjectIdentifier write SetSubjectIdentifier;
    property ContextIdentifier: TKSeF2SubunitPermissionsContextIdentifier read FContextIdentifier write SetContextIdentifier;
    property Description: UTF8String read GetDescription write SetDescription;
    property SubunitName: UTF8String read GetSubunitName write SetSubunitName;
    property SubjectDetails: TKSeF2PersonPermissionSubjectDetails read FSubjectDetails write SetSubjectDetails;
  end;

  TKSeF2EuEntityAdministrationPermissionsSubjectIdentifierType = (eeapsFingerprint);

  { TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier }

  TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier = class(TKSeF2Object)
  private

      function GetType: TKSeF2EuEntityAdministrationPermissionsSubjectIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(
      AValue: TKSeF2EuEntityAdministrationPermissionsSubjectIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EuEntityAdministrationPermissionsSubjectIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2EuEntityAdministrationPermissionsContextIdentifierType = (eeapcNipVatUe);

  { TKSeF2EuEntityAdministrationPermissionsContextIdentifier }

  TKSeF2EuEntityAdministrationPermissionsContextIdentifier = class(TKSeF2Object)
  private

      function GetType: TKSeF2EuEntityAdministrationPermissionsContextIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(
      AValue: TKSeF2EuEntityAdministrationPermissionsContextIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EuEntityAdministrationPermissionsContextIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  { TKSeF2EntityByFingerprintDetails }

  TKSeF2EntityByFingerprintDetails = class(TKSeF2Object)
  private
    function GetAddress: UTF8String;
    function GetFullName: UTF8String;
    procedure SetAddress(AValue: UTF8String);
    procedure SetFullName(AValue: UTF8String);
  published
    property FullName: UTF8String read GetFullName write SetFullName;
    property Address: UTF8String read GetAddress write SetAddress;
  end;

  TKSeF2EuEntityPermissionSubjectDetailsType = (eepsdPersonByFingerprintWithIdentifier,
    eepsdPersonByFingerprintWithoutIdentifier, eepsdEntityByFingerprint);

  { TKSeF2EuEntityPermissionSubjectDetails }

  TKSeF2EuEntityPermissionSubjectDetails = class(TKSeF2Object)
  private
    FEntityByFp: TKSeF2EntityByFingerprintDetails;
    FPersonByFpNoId: TKSeF2PersonByFingerprintWithoutIdentifierDetails;
    FPersonByFpWithId: TKSeF2PersonByFingerprintWithIdentifierDetails;
    function GetSubjectDetailsType: TKSeF2EuEntityPermissionSubjectDetailsType;
    procedure SetEntityByFp(AValue: TKSeF2EntityByFingerprintDetails);
    procedure SetPersonByFpNoId(
      AValue: TKSeF2PersonByFingerprintWithoutIdentifierDetails);
    procedure SetPersonByFpWithId(
      AValue: TKSeF2PersonByFingerprintWithIdentifierDetails);
    procedure SetSubjectDetailsType(
      AValue: TKSeF2EuEntityPermissionSubjectDetailsType);
  protected
    procedure LoadObject; override;
  published
    property SubjectDetailsType: TKSeF2EuEntityPermissionSubjectDetailsType read GetSubjectDetailsType write SetSubjectDetailsType;
    property PersonByFpWithId: TKSeF2PersonByFingerprintWithIdentifierDetails read FPersonByFpWithId write SetPersonByFpWithId;
    property PersonByFpNoId: TKSeF2PersonByFingerprintWithoutIdentifierDetails read FPersonByFpNoId write SetPersonByFpNoId;
    property EntityByFp: TKSeF2EntityByFingerprintDetails read FEntityByFp write SetEntityByFp;
  end;

  { TKSeF2EuEntityDetails }

  TKSeF2EuEntityDetails = class(TKSeF2Object)
  private
    function GetAddress: UTF8String;
    function GetFullName: UTF8String;
    procedure SetAddress(AValue: UTF8String);
    procedure SetFullName(AValue: UTF8String);
  published
    property FullName: UTF8String read GetFullName write SetFullName;
    property Address: UTF8String read GetAddress write SetAddress;
  end;

  { TKSeF2EuEntityAdministrationPermissionsGrantRequest }

  TKSeF2EuEntityAdministrationPermissionsGrantRequest = class(TKSeF2Request)
  private
    FContextIdentifier: TKSeF2EuEntityAdministrationPermissionsContextIdentifier;
    FEuEntityDetails: TKSeF2EuEntityDetails;
    FSubjectDetails: TKSeF2EuEntityPermissionSubjectDetails;
    FSubjectIdentifier: TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier;
    function GetDescription: UTF8String;
    function GetEuEntityName: UTF8String;
    procedure SetContextIdentifier(
      AValue: TKSeF2EuEntityAdministrationPermissionsContextIdentifier);
    procedure SetDescription(AValue: UTF8String);
    procedure SetEuEntityDetails(AValue: TKSeF2EuEntityDetails);
    procedure SetEuEntityName(AValue: UTF8String);
    procedure SetSubjectDetails(AValue: TKSeF2EuEntityPermissionSubjectDetails);
    procedure SetSubjectIdentifier(
      AValue: TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier);
  protected
    procedure LoadObject; override;
  published
    property SubjectIdentifier: TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier read FSubjectIdentifier write SetSubjectIdentifier;
    property ContextIdentifier: TKSeF2EuEntityAdministrationPermissionsContextIdentifier read FContextIdentifier write SetContextIdentifier;
    property Description: UTF8String read GetDescription write SetDescription;
    property EuEntityName: UTF8String read GetEuEntityName write SetEuEntityName;
    property SubjectDetails: TKSeF2EuEntityPermissionSubjectDetails read FSubjectDetails write SetSubjectDetails;
    property EuEntityDetails: TKSeF2EuEntityDetails read FEuEntityDetails write SetEuEntityDetails;
  end;

  TKSeF2EuEntityPermissionsSubjectIdentifierType = (eepsiFingerprint);

  { TKSeF2EuEntityPermissionsSubjectIdentifier }

  TKSeF2EuEntityPermissionsSubjectIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2EuEntityPermissionsSubjectIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2EuEntityPermissionsSubjectIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EuEntityPermissionsSubjectIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2EuEntityPermissionType = (eeptInvoiceWrite, eeptInvoiceRead);

  TKSeF2EuEntityPermissionTypes = set of TKSeF2EuEntityPermissionType;

  { TKSeF2EuEntityPermissionsGrantRequest }

  TKSeF2EuEntityPermissionsGrantRequest = class(TKSeF2Request)
  private
    FSubjectDetails: TKSeF2EuEntityPermissionSubjectDetails;
    FSubjectIdentifier: TKSeF2EuEntityPermissionsSubjectIdentifier;
    function GetDescription: UTF8String;
    function GetPermissions: TKSeF2EuEntityPermissionTypes;
    procedure SetDescription(AValue: UTF8String);
    procedure SetPermissions(AValue: TKSeF2EuEntityPermissionTypes);
    procedure SetSubjectDetails(AValue: TKSeF2EuEntityPermissionSubjectDetails);
    procedure SetSubjectIdentifier(
      AValue: TKSeF2EuEntityPermissionsSubjectIdentifier);
  protected
    procedure LoadObject; override;
  published
    property SubjectIdentifier: TKSeF2EuEntityPermissionsSubjectIdentifier read FSubjectIdentifier write SetSubjectIdentifier;
    property Permissions: TKSeF2EuEntityPermissionTypes read GetPermissions write SetPermissions;
    property Description: UTF8String read GetDescription write SetDescription;
    property SubjectDetails: TKSeF2EuEntityPermissionSubjectDetails read FSubjectDetails write SetSubjectDetails;
  end;

  { TKSeF2PermissionsOperationStatusResponse }

  TKSeF2PermissionsOperationStatusResponse = class(TKSeF2Response)
  private
    FStatus: TKSeF2StatusInfo;
  protected
    procedure LoadObject; override;
  published
    property Status: TKSeF2StatusInfo read FStatus;
  end;

  { TKSeF2CheckAttachmentPermissionStatusResponse }

  TKSeF2CheckAttachmentPermissionStatusResponse = class(TKSeF2Response)
  private
    function GetIsAttachmentAllowed: Boolean;
    function GetRevokedDate: TDateTime;
    function GetRevokedDateRaw: UTF8String;
  published
    property IsAttachmentAllowed: Boolean read GetIsAttachmentAllowed;
    property RevokedDate: TDateTime read GetRevokedDate;
    property RevokedDateRaw: UTF8String read GetRevokedDateRaw;
  end;

  TKSeF2PersonalPermissionsContextIdentifierType = (ppiNip, ppiInternalId);

  { TKSeF2PersonalPermissionsContextIdentifier }

  TKSeF2PersonalPermissionsContextIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2PersonalPermissionsContextIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2PersonalPermissionsContextIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2PersonalPermissionsContextIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2PersonalPermissionsTargetIdentifierType = (pptNip, pptAllPartners, pptInternalId);

  { TKSeF2PersonalPermissionsTargetIdentifier }

  TKSeF2PersonalPermissionsTargetIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2PersonalPermissionsTargetIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2PersonalPermissionsTargetIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2PersonalPermissionsTargetIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2PersonalPermissionType = (ppCredentialsManage, ppCredentialsRead,
    ppInvoiceWrite, ppInvoiceRead, ppIntrospection, ppSubunitManage,
    ppEnforcementOperations, ppVatUeManage);

  TKSeF2PersonalPermissionTypes = set of TKSeF2PersonalPermissionType;

  TKSeF2PermissionState = (psNone, psActive, psInactive);

  { TKSeF2PersonalPermissionsQueryRequest }

  TKSeF2PersonalPermissionsQueryRequest = class(TKSeF2Request)
  private
    FContextIdentifier: TKSeF2PersonalPermissionsContextIdentifier;
    FTargetIdentifier: TKSeF2PersonalPermissionsTargetIdentifier;
    function GetPermissionState: TKSeF2PermissionState;
    function GetPermissionTypes: TKSeF2PersonalPermissionTypes;
    procedure SetContextIdentifier(
      AValue: TKSeF2PersonalPermissionsContextIdentifier);
    procedure SetPermissionState(AValue: TKSeF2PermissionState);
    procedure SetPermissionTypes(AValue: TKSeF2PersonalPermissionTypes);
    procedure SetTargetIdentifier(
      AValue: TKSeF2PersonalPermissionsTargetIdentifier);
  protected
    procedure LoadObject; override;
  published
    property ContextIdentifier: TKSeF2PersonalPermissionsContextIdentifier read FContextIdentifier write SetContextIdentifier;
    property TargetIdentifier: TKSeF2PersonalPermissionsTargetIdentifier read FTargetIdentifier write SetTargetIdentifier;
    property PermissionTypes: TKSeF2PersonalPermissionTypes read GetPermissionTypes write SetPermissionTypes;
    property PermissionState: TKSeF2PermissionState read GetPermissionState write SetPermissionState;
  end;

  TKSeF2PersonPermissionsAuthorizedIdentifierType = (ppaiNip, ppaiPesel, ppaiFingerprint);

  { TKSeF2PersonPermissionsAuthorizedIdentifier }

  TKSeF2PersonPermissionsAuthorizedIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2PersonPermissionsAuthorizedIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2PersonPermissionsAuthorizedIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2PersonPermissionsAuthorizedIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2PersonPermissionsContextIdentifierType = (ppciNip, ppciInternalId);

  { TKSeF2PersonPermissionsContextIdentifier }

  TKSeF2PersonPermissionsContextIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2PersonPermissionsContextIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2PersonPermissionsContextIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2PersonPermissionsContextIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2PersonPermissionsTargetIdentifierType = (pptiNip, pptiAllPartners, pptiInternalId);

  { TKSeF2PersonPermissionsTargetIdentifier }

  TKSeF2PersonPermissionsTargetIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2PersonPermissionsTargetIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2PersonPermissionsTargetIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2PersonPermissionsTargetIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2PersonPermissionsAuthorIdentifierType = (ppauiNip, ppauiPesel,
    ppauiFingerprint, ppaiSystem);

  { TKSeF2PersonPermissionsAuthorIdentifier }

  TKSeF2PersonPermissionsAuthorIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2PersonPermissionsAuthorIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2PersonPermissionsAuthorIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2PersonPermissionsAuthorIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2PersonSubjectDetailsType = (psdPersonByIdentifier,
    psdPersonByFingerprintWithIdentifier, psdPersonByFingerprintWithoutIdentifier);

  { TKSeF2PermissionsSubjectPersonDetails }

  TKSeF2PermissionsSubjectPersonDetails = class(TKSeF2Object)
  private
    FIdDocument: TKSeF2IdDocument;
    FPersonIdentifier: TKSeF2PersonIdentifier;
    function GetBirthDate: TDate;
    function GetBirthDateRaw: UTF8String;
    function GetFirstName: UTF8String;
    function GetLastName: UTF8String;
    function GetSubjectDetailsType: TKSeF2PersonSubjectDetailsType;
  protected
    procedure LoadObject; override;
  published
    property SubjectDetailsType: TKSeF2PersonSubjectDetailsType read GetSubjectDetailsType;
    property FirstName: UTF8String read GetFirstName;
    property LastName: UTF8String read GetLastName;
    property PersonIdentifier: TKSeF2PersonIdentifier read FPersonIdentifier;
    property BirthDate: TDate read GetBirthDate;
    property BirthDateRaw: UTF8String read GetBirthDateRaw;
    property IdDocument: TKSeF2IdDocument read FIdDocument;
  end;

  TKSeF2PersonPermissionScope = (ppsCredentialsManage, ppsCredentialsRead,
    ppsInvoiceWrite, ppsInvoiceRead, ppsIntrospection, ppsSubunitManage,
    ppsEnforcementOperations);

  TKSeF2PersonalPermission = class(TKSeF2Object)
  private
    FAuthorIdentifier: TKSeF2PersonPermissionsAuthorIdentifier;
    FAuthorizedIdentifier: TKSeF2PersonPermissionsAuthorizedIdentifier;
    FContextIdentifier: TKSeF2PersonPermissionsContextIdentifier;
    FSubjectEntityDetails: TKSeF2PermissionsSubjectPersonDetails;
    FSubjectPersonDetails: TKSeF2PermissionsSubjectPersonDetails;
    FTargetIdentifier: TKSeF2PersonPermissionsTargetIdentifier;
    function GetCanDelegate: Boolean;
    function GetDescription: UTF8String;
    function GetId: UTF8String;
    function GetPermissionScope: TKSeF2PersonPermissionScope;
    function GetPermissionState: TKSeF2PermissionState;
    function GetStartDate: TDateTime;
    function GetStartDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property Id: UTF8String read GetId;
    property AuthorizedIdentifier: TKSeF2PersonPermissionsAuthorizedIdentifier read FAuthorizedIdentifier;
    property ContextIdentifier: TKSeF2PersonPermissionsContextIdentifier read FContextIdentifier;
    property TargetIdentifier: TKSeF2PersonPermissionsTargetIdentifier read FTargetIdentifier;
    property AuthorIdentifier: TKSeF2PersonPermissionsAuthorIdentifier read FAuthorIdentifier;
    property PermissionScope: TKSeF2PersonPermissionScope read GetPermissionScope;
    property Description: UTF8String read GetDescription;
    property SubjectPersonDetails: TKSeF2PermissionsSubjectPersonDetails read FSubjectPersonDetails;
    property SubjectEntityDetails: TKSeF2PermissionsSubjectPersonDetails read FSubjectEntityDetails;
    property PermissionState: TKSeF2PermissionState read GetPermissionState;
    property StartDate: TDateTime read GetStartDate;
    property StartDateRaw: UTF8String read GetStartDateRaw;
    property CanDelegate: Boolean read GetCanDelegate;
  end;

  { TKSeF2PersonalPermissionArray }

  TKSeF2PersonalPermissionArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2PersonalPermission;
  public
    property Items[AIndex: Integer]: TKSeF2PersonalPermission read GetItem; default;
  end;

  { TKSeF2QueryPersonalPermissionsResponse }

  TKSeF2QueryPersonalPermissionsResponse = class(TKSeF2Response)
  private
    FPermissions: TKSeF2PersonalPermissionArray;
    function GetHasMore: Boolean;
  protected
    procedure LoadObject; override;
  published
    property Permissions: TKSeF2PersonalPermissionArray read FPermissions;
    property HasMore: Boolean read GetHasMore;
  end;

  TKSeF2PersonPermissionsQueryType = (ppqPermissionsInCurrentContext,
    ppqPermissionsGrantedInCurrentContext);

  { TKSeF2PersonPermissionsQueryRequest }

  TKSeF2PersonPermissionsQueryRequest = class(TKSeF2Request)
  private
    FAuthorIdentifier: TKSeF2PersonPermissionsAuthorIdentifier;
    FAuthorizedIdentifier: TKSeF2PersonPermissionsAuthorizedIdentifier;
    FContextIdentifier: TKSeF2PersonPermissionsContextIdentifier;
    FTargetIdentifier: TKSeF2PersonPermissionsTargetIdentifier;
    function GetPermissionState: TKSeF2PermissionState;
    function GetPermissionTypes: TKSeF2PersonPermissionTypes;
    function GetQueryType: TKSeF2PersonPermissionsQueryType;
    procedure SetAuthorIdentifier(
      AValue: TKSeF2PersonPermissionsAuthorIdentifier);
    procedure SetAuthorizedIdentifier(
      AValue: TKSeF2PersonPermissionsAuthorizedIdentifier);
    procedure SetContextIdentifier(
      AValue: TKSeF2PersonPermissionsContextIdentifier);
    procedure SetPermissionState(AValue: TKSeF2PermissionState);
    procedure SetPermissionTypes(AValue: TKSeF2PersonPermissionTypes);
    procedure SetQueryType(AValue: TKSeF2PersonPermissionsQueryType);
    procedure SetTargetIdentifier(
      AValue: TKSeF2PersonPermissionsTargetIdentifier);
  protected
    procedure LoadObject; override;
  published
    property AuthorIdentifier: TKSeF2PersonPermissionsAuthorIdentifier read FAuthorIdentifier write SetAuthorIdentifier;
    property AuthorizedIdentifier: TKSeF2PersonPermissionsAuthorizedIdentifier read FAuthorizedIdentifier write SetAuthorizedIdentifier;
    property ContextIdentifier: TKSeF2PersonPermissionsContextIdentifier read FContextIdentifier write SetContextIdentifier;
    property TargetIdentifier: TKSeF2PersonPermissionsTargetIdentifier read FTargetIdentifier write SetTargetIdentifier;
    property PermissionTypes: TKSeF2PersonPermissionTypes read GetPermissionTypes write SetPermissionTypes;
    property PermissionState: TKSeF2PermissionState read GetPermissionState write SetPermissionState;
    property QueryType: TKSeF2PersonPermissionsQueryType read GetQueryType write SetQueryType;
  end;

  TKSeF2EntitySubjectDetailsType = (esdEntityByIdentifier, esdEntityByFingerprint);

  { TKSeF2PermissionsSubjectEntityDetails }

  TKSeF2PermissionsSubjectEntityDetails = class(TKSeF2Object)
  private
    function GetAddress: UTF8String;
    function GetFullName: UTF8String;
    function GetSubjectDetailsType: TKSeF2EntitySubjectDetailsType;
  published
    property SubjectDetailsType: TKSeF2EntitySubjectDetailsType read GetSubjectDetailsType;
    property FullName: UTF8String read GetFullName;
    property Address: UTF8String read GetAddress;
  end;

  TKSeF2PersonPermission = class(TKSeF2Object)
  private
    FAuthorIdentifier: TKSeF2PersonPermissionsAuthorIdentifier;
    FAuthorizedIdentifier: TKSeF2PersonPermissionsAuthorizedIdentifier;
    FContextIdentifier: TKSeF2PersonPermissionsContextIdentifier;
    FSubjectEntityDetails: TKSeF2PermissionsSubjectEntityDetails;
    FSubjectPersonDetails: TKSeF2PermissionsSubjectPersonDetails;
    FTargetIdentifier: TKSeF2PersonPermissionsTargetIdentifier;
    function GetCanDelegate: Boolean;
    function GetDescription: UTF8String;
    function GetId: UTF8String;
    function GetPermissionScope: TKSeF2PersonPermissionScope;
    function GetPermissionState: TKSeF2PermissionState;
    function GetStartDate: TDateTime;
    function GetStartDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property Id: UTF8String read GetId;
    property AuthorizedIdentifier: TKSeF2PersonPermissionsAuthorizedIdentifier read FAuthorizedIdentifier;
    property ContextIdentifier: TKSeF2PersonPermissionsContextIdentifier read FContextIdentifier;
    property TargetIdentifier: TKSeF2PersonPermissionsTargetIdentifier read FTargetIdentifier;
    property AuthorIdentifier: TKSeF2PersonPermissionsAuthorIdentifier read FAuthorIdentifier;
    property PermissionScope: TKSeF2PersonPermissionScope read GetPermissionScope;
    property Description: UTF8String read GetDescription;
    property SubjectPersonDetails: TKSeF2PermissionsSubjectPersonDetails read FSubjectPersonDetails;
    property SubjectEntityDetails: TKSeF2PermissionsSubjectEntityDetails read FSubjectEntityDetails;
    property PermissionState: TKSeF2PermissionState read GetPermissionState;
    property StartDate: TDateTime read GetStartDate;
    property StartDateRaw: UTF8String read GetStartDateRaw;
    property CanDelegate: Boolean read GetCanDelegate;
  end;

  { TKSeF2PersonPermissionArray }

  TKSeF2PersonPermissionArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2PersonPermission;
  public
    property Items[AIndex: Integer]: TKSeF2PersonPermission read GetItem; default;
  end;

  { TKSeF2QueryPersonPermissionsResponse }

  TKSeF2QueryPersonPermissionsResponse = class(TKSeF2Response)
  private
    FPermissions: TKSeF2PersonPermissionArray;
    function GetHasMore: Boolean;
  protected
    procedure LoadObject; override;
  published
    property Permissions: TKSeF2PersonPermissionArray read FPermissions;
    property HasMore: Boolean read GetHasMore;
  end;

  TKSeF2SubunitPermissionsSubunitIdentifierType = (supsiInternalId, supsiNip);

  { TKSeF2SubunitPermissionsSubunitIdentifier }

  TKSeF2SubunitPermissionsSubunitIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2SubunitPermissionsSubunitIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2SubunitPermissionsSubunitIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2SubunitPermissionsSubunitIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  { TKSeF2SubunitPermissionsQueryRequest }

  TKSeF2SubunitPermissionsQueryRequest = class(TKSeF2Request)
  private
    FSubunitIdentifier: TKSeF2SubunitPermissionsSubunitIdentifier;
    procedure SetSubunitIdentifier(
      AValue: TKSeF2SubunitPermissionsSubunitIdentifier);
  protected
    procedure LoadObject; override;
  published
    property SubunitIdentifier: TKSeF2SubunitPermissionsSubunitIdentifier read FSubunitIdentifier write SetSubunitIdentifier;
  end;

  { TKSeF2SubunitPermissionsAuthorizedIdentifier }

  TKSeF2SubunitPermissionsAuthorizedIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2SubunitPermissionsSubjectIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2SubunitPermissionsSubjectIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2SubunitPermissionsSubjectIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2SubunitPermissionsAuthorIdentifierType = (spaiNip, spaiPesel, spaiFingerprint);

  { TKSeF2SubunitPermissionsAuthorIdentifier }

  TKSeF2SubunitPermissionsAuthorIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2SubunitPermissionsAuthorIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2SubunitPermissionsAuthorIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2SubunitPermissionsAuthorIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2SubunitPermissionScope = (spsCredentialsManage);

  TKSeF2SubunitPermission = class(TKSeF2Object)
  private
    FAuthorIdentifier: TKSeF2SubunitPermissionsAuthorIdentifier;
    FAuthorizedIdentifier: TKSeF2SubunitPermissionsAuthorizedIdentifier;
    FSubjectPersonDetails: TKSeF2PermissionsSubjectPersonDetails;
    FSubunitIdentifier: TKSeF2SubunitPermissionsSubunitIdentifier;
    function GetDescription: UTF8String;
    function GetId: UTF8String;
    function GetPermissionScope: TKSeF2SubunitPermissionScope;
    function GetStartDate: TDateTime;
    function GetStartDateRaw: UTF8String;
    function GetSubunitName: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property Id: UTF8String read GetId;
    property AuthorizedIdentifier: TKSeF2SubunitPermissionsAuthorizedIdentifier read FAuthorizedIdentifier;
    property SubunitIdentifier: TKSeF2SubunitPermissionsSubunitIdentifier read FSubunitIdentifier;
    property AuthorIdentifier: TKSeF2SubunitPermissionsAuthorIdentifier read FAuthorIdentifier;
    property PermissionScope: TKSeF2SubunitPermissionScope read GetPermissionScope;
    property Description: UTF8String read GetDescription;
    property SubjectPersonDetails: TKSeF2PermissionsSubjectPersonDetails read FSubjectPersonDetails;
    property SubunitName: UTF8String read GetSubunitName;
    property StartDate: TDateTime read GetStartDate;
    property StartDateRaw: UTF8String read GetStartDateRaw;
  end;

  { TKSeF2SubunitPermissionArray }

  TKSeF2SubunitPermissionArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2SubunitPermission;
  public
    property Items[AIndex: Integer]: TKSeF2SubunitPermission read GetItem; default;
  end;

  { TKSeF2QuerySubunitPermissionsResponse }

  TKSeF2QuerySubunitPermissionsResponse = class(TKSeF2Response)
  private
    FPermissions: TKSeF2SubunitPermissionArray;
    function GetHasMore: Boolean;
  protected
    procedure LoadObject; override;
  published
    property Permissions: TKSeF2SubunitPermissionArray read FPermissions;
    property HasMore: Boolean read GetHasMore;
  end;

  TKSeF2EntityRolesParentEntityIdentifierType = (erpeiNip);

  { TKSeF2EntityRolesParentEntityIdentifier }

  TKSeF2EntityRolesParentEntityIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2EntityRolesParentEntityIdentifierType;
    function GetValue: String;
    procedure SetType(AValue: TKSeF2EntityRolesParentEntityIdentifierType);
    procedure SetValue(AValue: String);
  published
    property Type_: TKSeF2EntityRolesParentEntityIdentifierType read GetType write SetType;
    property Value: String read GetValue write SetValue;
  end;

  TKSeF2EntityRoleType = (erCourtBailiff, erEnforcementAuthority,
    erLocalGovernmentUnit, erLocalGovernmentSubUnit, erVatGroupUnit,
    erVatGroupSubUnit);

  TKSeF2EntityRole = class(TKSeF2Object)
  private
    FParentEntityIdentifier: TKSeF2EntityRolesParentEntityIdentifier;
    function GetDescription: UTF8String;
    function GetRole: TKSeF2EntityRoleType;
    function GetStartDate: TDateTime;
    function GetStartDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property ParentEntityIdentifier: TKSeF2EntityRolesParentEntityIdentifier read FParentEntityIdentifier;
    property Role: TKSeF2EntityRoleType read GetRole;
    property Description: UTF8String read GetDescription;
    property StartDate: TDateTime read GetStartDate;
    property StartDateRaw: UTF8String read GetStartDateRaw;
  end;

  { TKSeF2EntityRoleArray }

  TKSeF2EntityRoleArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2EntityRole;
  public
    property Items[AIndex: Integer]: TKSeF2EntityRole read GetItem; default;
  end;

  { TKSeF2QueryEntityRolesResponse }

  TKSeF2QueryEntityRolesResponse = class(TKSeF2Response)
  private
    FRoles: TKSeF2EntityRoleArray;
    function GetHasMore: Boolean;
  protected
    procedure LoadObject; override;
  published
    property Roles: TKSeF2EntityRoleArray read FRoles;
    property HasMore: Boolean read GetHasMore;
  end;

  TKSeF2EntityPermissionsSubordinateEntityIdentifierType = (epseiNip);

  { TKSeF2EntityPermissionsSubordinateEntityIdentifier }

  TKSeF2EntityPermissionsSubordinateEntityIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2EntityPermissionsSubordinateEntityIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(
      AValue: TKSeF2EntityPermissionsSubordinateEntityIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EntityPermissionsSubordinateEntityIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  { TKSeF2SubordinateEntityRolesQueryRequest }

  TKSeF2SubordinateEntityRolesQueryRequest = class(TKSeF2Request)
  private
    FSubordinateEntityIdentifier: TKSeF2EntityPermissionsSubordinateEntityIdentifier;
    procedure SetSubordinateEntityIdentifier(
      AValue: TKSeF2EntityPermissionsSubordinateEntityIdentifier);
  protected
    procedure LoadObject; override;
  published
    property SubordinateEntityIdentifier: TKSeF2EntityPermissionsSubordinateEntityIdentifier read FSubordinateEntityIdentifier write SetSubordinateEntityIdentifier;
  end;

  TKSeF2SubordinateRoleSubordinateEntityIdentifierType = (sseiNip);

  { TKSeF2SubordinateRoleSubordinateEntityIdentifier }

  TKSeF2SubordinateRoleSubordinateEntityIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2SubordinateRoleSubordinateEntityIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(
      AValue: TKSeF2SubordinateRoleSubordinateEntityIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2SubordinateRoleSubordinateEntityIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2SubordinateEntityRoleType = (serLocalGovernmentSubUnit, serVatGroupSubUnit);

  TKSeF2SubordinateEntityRole = class(TKSeF2Object)
  private
    FSubordinateEntityIdentifier: TKSeF2SubordinateRoleSubordinateEntityIdentifier;
    function GetDescription: UTF8String;
    function GetRole: TKSeF2SubordinateEntityRoleType;
    function GetStartDate: TDateTime;
    function GetStartDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property SubordinateEntityIdentifier: TKSeF2SubordinateRoleSubordinateEntityIdentifier read FSubordinateEntityIdentifier;
    property Role: TKSeF2SubordinateEntityRoleType read GetRole;
    property Description: UTF8String read GetDescription;
    property StartDate: TDateTime read GetStartDate;
    property StartDateRaw: UTF8String read GetStartDateRaw;
  end;

  { TKSeF2SubordinateEntityRoleArray }

  TKSeF2SubordinateEntityRoleArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2SubordinateEntityRole;
  public
    property Items[AIndex: Integer]: TKSeF2SubordinateEntityRole read GetItem; default;
  end;

  { TKSeF2QuerySubordinateEntityRolesResponse }

  TKSeF2QuerySubordinateEntityRolesResponse = class(TKSeF2Response)
  private
    FRoles: TKSeF2SubordinateEntityRoleArray;
    function GetHasMore: Boolean;
  protected
    procedure LoadObject; override;
  published
    property Roles: TKSeF2SubordinateEntityRoleArray read FRoles;
    property HasMore: Boolean read GetHasMore;
  end;

  TKSeF2EntityAuthorizationsAuthorizingEntityIdentifierType = (eaaeiNip);

  { TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier }

  TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(
      AValue: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2EntityAuthorizationsAuthorizedEntityIdentifierType = (eaaeitNip, eaaeitPeppolId);

  { TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier }

  TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(
      AValue: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2QueryType = (qtGranted, qtReceived);

  TKSeF2InvoicePermissionType = (ipSelfInvoicing, ipTaxRepresentative,
    ipRRInvoicing, ipPefInvoicing);

  TKSeF2InvoicePermissionTypes = set of TKSeF2InvoicePermissionType;

  { TKSeF2EntityAuthorizationPermissionsQueryRequest }

  TKSeF2EntityAuthorizationPermissionsQueryRequest = class(TKSeF2Request)
  private
    FAuthorizedIdentifier: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier;
    FAuthorizingIdentifier: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier;
    function GetPermissionTypes: TKSeF2InvoicePermissionTypes;
    function GetQueryType: TKSeF2QueryType;
    procedure SetAuthorizedIdentifier(
      AValue: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier);
    procedure SetAuthorizingIdentifier(
      AValue: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier);
    procedure SetPermissionTypes(AValue: TKSeF2InvoicePermissionTypes);
    procedure SetQueryType(AValue: TKSeF2QueryType);
  protected
    procedure LoadObject; override;
  published
    property AuthorizingIdentifier: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier read FAuthorizingIdentifier write SetAuthorizingIdentifier;
    property AuthorizedIdentifier: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier read FAuthorizedIdentifier write SetAuthorizedIdentifier;
    property QueryType: TKSeF2QueryType read GetQueryType write SetQueryType;
    property PermissionTypes: TKSeF2InvoicePermissionTypes read GetPermissionTypes write SetPermissionTypes;
  end;

  TKSeF2EntityAuthorizationsAuthorIdentifierType = (eaaiNip, eaaiPesel, eaaiFingerprint);

  { TKSeF2EntityAuthorizationsAuthorIdentifier }

  TKSeF2EntityAuthorizationsAuthorIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2EntityAuthorizationsAuthorIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2EntityAuthorizationsAuthorIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EntityAuthorizationsAuthorIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2EntitySubjectByIdentifierDetailsType = (esbidEntityByIdentifier);

  { TKSeF2TKSeF2PermissionsSubjectEntityByIdentifierDetails }

  { TKSeF2PermissionsSubjectEntityByIdentifierDetails }

  TKSeF2PermissionsSubjectEntityByIdentifierDetails = class(TKSeF2Object)
  private
    function GetFullName: UTF8String;
    function GetSubjectDetailsType: TKSeF2EntitySubjectByIdentifierDetailsType;
  published
    property SubjectDetailsType: TKSeF2EntitySubjectByIdentifierDetailsType read GetSubjectDetailsType;
    property FullName: UTF8String read GetFullName;
  end;

  { TKSeF2EntityAuthorizationGrant }

  TKSeF2EntityAuthorizationGrant = class(TKSeF2Object)
  private
    FAuthorIdentifier: TKSeF2EntityAuthorizationsAuthorIdentifier;
    FAuthorizedEntityIdentifier: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier;
    FAuthorizingEntityIdentifier: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier;
    FSubjectEntityDetails: TKSeF2PermissionsSubjectEntityByIdentifierDetails;
    function GetAuthorizationScope: TKSeF2InvoicePermissionType;
    function GetDescription: UTF8String;
    function GetId: UTF8String;
    function GetStartDate: TDateTime;
    function GetStartDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property Id: UTF8String read GetId;
    property AuthorIdentifier: TKSeF2EntityAuthorizationsAuthorIdentifier read FAuthorIdentifier;
    property AuthorizedEntityIdentifier: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier read FAuthorizedEntityIdentifier;
    property AuthorizingEntityIdentifier: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier read FAuthorizingEntityIdentifier;
    property AuthorizationScope: TKSeF2InvoicePermissionType read GetAuthorizationScope;
    property Description: UTF8String read GetDescription;
    property SubjectEntityDetails: TKSeF2PermissionsSubjectEntityByIdentifierDetails read FSubjectEntityDetails;
    property StartDate: TDateTime read GetStartDate;
    property StartDateRaw: UTF8String read GetStartDateRaw;
  end;

  { TKSeF2EntityAuthorizationGrantArray }

  TKSeF2EntityAuthorizationGrantArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2EntityAuthorizationGrant;
  public
    property Items[AIndex: Integer]: TKSeF2EntityAuthorizationGrant read GetItem; default;
  end;

  { TKSeF2QueryEntityAuthorizationPermissionsResponse }

  TKSeF2QueryEntityAuthorizationPermissionsResponse = class(TKSeF2Response)
  private
    FAuthorizationGrants: TKSeF2EntityAuthorizationGrantArray;
    function GetHasMore: Boolean;
  protected
    procedure LoadObject; override;
  published
    property AuthorizationGrants: TKSeF2EntityAuthorizationGrantArray read FAuthorizationGrants;
    property HasMore: Boolean read GetHasMore;
  end;

  TKSeF2EuEntityPermissionsQueryPermissionType = (eepqpVatUeManage,
    eepqpInvoiceWrite, eepqpInvoiceRead, eepqpIntrospection);

  TKSeF2EuEntityPermissionsQueryPermissionTypes = set of TKSeF2EuEntityPermissionsQueryPermissionType;

  { TKSeF2EuEntityPermissionsQueryRequest }

  TKSeF2EuEntityPermissionsQueryRequest = class(TKSeF2Request)
  private
    function GetAuthorizedFingerprintIdentifier: UTF8String;
    function GetPermissionTypes: TKSeF2EuEntityPermissionsQueryPermissionTypes;
    function GetVatUeIdentifier: UTF8String;
    procedure SetAuthorizedFingerprintIdentifier(AValue: UTF8String);
    procedure SetPermissionTypes(
      AValue: TKSeF2EuEntityPermissionsQueryPermissionTypes);
    procedure SetVatUeIdentifier(AValue: UTF8String);
  published
    property VatUeIdentifier: UTF8String read GetVatUeIdentifier write SetVatUeIdentifier;
    property AuthorizedFingerprintIdentifier: UTF8String read GetAuthorizedFingerprintIdentifier write SetAuthorizedFingerprintIdentifier;
    property PermissionTypes: TKSeF2EuEntityPermissionsQueryPermissionTypes read GetPermissionTypes write SetPermissionTypes;
  end;

  TKSeF2EuEntityPermissionsAuthorIdentifierType = (eepaiNip, eepaiPesel,
    eepaiFingerprint);

  { TKSeF2EuEntityPermissionsAuthorIdentifier }

  TKSeF2EuEntityPermissionsAuthorIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2EuEntityPermissionsAuthorIdentifierType;
    function GetValue: UTF8String;
    procedure SetType(AValue: TKSeF2EuEntityPermissionsAuthorIdentifierType);
    procedure SetValue(AValue: UTF8String);
  published
    property Type_: TKSeF2EuEntityPermissionsAuthorIdentifierType read GetType write SetType;
    property Value: UTF8String read GetValue write SetValue;
  end;

  TKSeF2PersonSubjectByFingerprintDetailsType = (
    psbfdPersonByFingerprintWithIdentifier,
    psbfdPersonByFingerprintWithoutIdentifier);

  { TKSeF2PermissionsSubjectPersonByFingerprintDetails }

  TKSeF2PermissionsSubjectPersonByFingerprintDetails = class(TKSeF2Object)
  private
    FIdDocument: TKSeF2IdDocument;
    FPersonIdentifier: TKSeF2PersonIdentifier;
    function GetBirthDate: TDate;
    function GetBirthDateRaw: UTF8String;
    function GetFirstName: UTF8String;
    function GetLastName: UTF8String;
    function GetSubjectDetailsType: TKSeF2PersonSubjectByFingerprintDetailsType;
  protected
    procedure LoadObject; override;
  published
    property SubjectDetailsType: TKSeF2PersonSubjectByFingerprintDetailsType read GetSubjectDetailsType;
    property FirstName: UTF8String read GetFirstName;
    property LastName: UTF8String read GetLastName;
    property PersonIdentifier: TKSeF2PersonIdentifier read FPersonIdentifier;
    property BirthDate: TDate read GetBirthDate;
    property BirthDateRaw: UTF8String read GetBirthDateRaw;
    property IdDocument: TKSeF2IdDocument read FIdDocument;
  end;

  TKSeF2EntitySubjectByFingerprintDetailsType = (esbfdEntityByFingerprint);

  { TKSeF2PermissionsSubjectEntityByFingerprintDetails }

  TKSeF2PermissionsSubjectEntityByFingerprintDetails = class(TKSeF2Object)
  private
    function GetAddress: UTF8String;
    function GetFullName: UTF8String;
    function GetSubjectDetailsType: TKSeF2EntitySubjectByFingerprintDetailsType;
  published
    property SubjectDetailsType: TKSeF2EntitySubjectByFingerprintDetailsType read GetSubjectDetailsType;
    property FullName: UTF8String read GetFullName;
    property Address: UTF8String read GetAddress;
  end;

  { TKSeF2PermissionsEuEntityDetails }

  TKSeF2PermissionsEuEntityDetails = class(TKSeF2Object)
  private
    function GetAddress: UTF8String;
    function GetFullName: UTF8String;
  published
    property FullName: UTF8String read GetFullName;
    property Address: UTF8String read GetAddress;
  end;

  TKSeF2EuEntityPermission = class(TKSeF2Object)
  private
    FAuthorIdentifier: TKSeF2EuEntityPermissionsAuthorIdentifier;
    FEuEntityDetails: TKSeF2PermissionsEuEntityDetails;
    FSubjectEntityDetails: TKSeF2PermissionsSubjectEntityByFingerprintDetails;
    FSubjectPersonDetails: TKSeF2PermissionsSubjectPersonByFingerprintDetails;
    function GetAuthorizedFingerprintIdentifier: UTF8String;
    function GetDescription: UTF8String;
    function GetEuEntityName: UTF8String;
    function GetId: UTF8String;
    function GetPermissionScope: TKSeF2EuEntityPermissionsQueryPermissionType;
    function GetStartDate: TDateTime;
    function GetStartDateRaw: UTF8String;
    function GetVatUeIdentifier: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property Id: UTF8String read GetId;
    property AuthorIdentifier: TKSeF2EuEntityPermissionsAuthorIdentifier read FAuthorIdentifier;
    property VatUeIdentifier: UTF8String read GetVatUeIdentifier;
    property EuEntityName: UTF8String read GetEuEntityName;
    property AuthorizedFingerprintIdentifier: UTF8String read GetAuthorizedFingerprintIdentifier;
    property PermissionScope: TKSeF2EuEntityPermissionsQueryPermissionType read GetPermissionScope;
    property Description: UTF8String read GetDescription;
    property SubjectPersonDetails: TKSeF2PermissionsSubjectPersonByFingerprintDetails read FSubjectPersonDetails;
    property SubjectEntityDetails: TKSeF2PermissionsSubjectEntityByFingerprintDetails read FSubjectEntityDetails;
    property EuEntityDetails: TKSeF2PermissionsEuEntityDetails read FEuEntityDetails;
    property StartDate: TDateTime read GetStartDate;
    property StartDateRaw: UTF8String read GetStartDateRaw;
  end;

  { TKSeF2EuEntityPermissionArray }

  TKSeF2EuEntityPermissionArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2EuEntityPermission;
  public
    property Items[AIndex: Integer]: TKSeF2EuEntityPermission read GetItem; default;
  end;

  { TKSeF2QueryEuEntityPermissionsResponse }

  TKSeF2QueryEuEntityPermissionsResponse = class(TKSeF2Response)
  private
    FPermissions: TKSeF2EuEntityPermissionArray;
    function GetHasMore: Boolean;
  protected
    procedure LoadObject; override;
  published
    property Permissions: TKSeF2EuEntityPermissionArray read FPermissions;
    property HasMore: Boolean read GetHasMore;
  end;

  { TKSeF2CertificateLimit }

  TKSeF2CertificateLimit = class(TKSeF2Object)
  private
    function GetLimit: Integer;
    function GetRemaining: Integer;
  published
    property Remaining: Integer read GetRemaining;
    property Limit: Integer read GetLimit;
  end;

  { TKSeF2CertificateLimitsResponse }

  TKSeF2CertificateLimitsResponse = class(TKSeF2Response)
  private
    FCertificate: TKSeF2CertificateLimit;
    FEnrollment: TKSeF2CertificateLimit;
    function GetCanRequest: Boolean;
  protected
    procedure LoadObject; override;
  published
    property CanRequest: Boolean read GetCanRequest;
    property Enrollment: TKSeF2CertificateLimit read FEnrollment;
    property Certificate: TKSeF2CertificateLimit read FCertificate;
  end;

  { TKSeF2CertificateEnrollmentDataResponse }

  TKSeF2CertificateEnrollmentDataResponse = class(TKSeF2Response)
  private
    function GetCommonName: UTF8String;
    function GetCountryName: UTF8String;
    function GetGivenName: UTF8String;
    function GetOrganizationIdentifier: UTF8String;
    function GetOrganizationName: UTF8String;
    function GetSerialNumber: UTF8String;
    function GetSurname: UTF8String;
    function GetUniqueIdentifier: UTF8String;
  published
    property CommonName: UTF8String read GetCommonName;
    property CountryName: UTF8String read GetCountryName;
    property GivenName: UTF8String read GetGivenName;
    property Surname: UTF8String read GetSurname;
    property SerialNumber: UTF8String read GetSerialNumber;
    property UniqueIdentifier: UTF8String read GetUniqueIdentifier;
    property OrganizationName: UTF8String read GetOrganizationName;
    property OrganizationIdentifier: UTF8String read GetOrganizationIdentifier;
  end;

  TKSeF2KsefCertificateType = (kcUnspecified, kcAuthentication, kcOffline);

  { TKSeF2EnrollCertificateRequest }

  TKSeF2EnrollCertificateRequest = class(TKSeF2Request)
  private
    function GetCertificateName: UTF8String;
    function GetCertificateType: TKSeF2KsefCertificateType;
    function GetCsr: UTF8String;
    function GetValidFrom: TDateTime;
    procedure SetCertificateName(AValue: UTF8String);
    procedure SetCertificateType(AValue: TKSeF2KsefCertificateType);
    procedure SetCsr(AValue: UTF8String);
    procedure SetValidFrom(AValue: TDateTime);
  published
    property CertificateName: UTF8String read GetCertificateName write SetCertificateName;
    property CertificateType: TKSeF2KsefCertificateType read GetCertificateType write SetCertificateType;
    property Csr: UTF8String read GetCsr write SetCsr;
    property ValidFrom: TDateTime read GetValidFrom write SetValidFrom;
  end;

  { TKSeF2EnrollCertificateResponse }

  TKSeF2EnrollCertificateResponse = class(TKSeF2Response)
  private
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property Timestamp: TDateTime read GetTimestamp;
    property TimestampRaw: UTF8String read GetTimestampRaw;
  end;

  { TKSeF2CertificateEnrollmentStatusResponse }

  TKSeF2CertificateEnrollmentStatusResponse = class(TKSeF2Response)
  private
    FStatus: TKSeF2StatusInfo;
    function GetCertificateSerialNumber: UTF8String;
    function GetRequestDate: TDateTime;
    function GetRequestDateRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property RequestDate: TDateTime read GetRequestDate;
    property RequestDateRaw: UTF8String read GetRequestDateRaw;
    property Status: TKSeF2StatusInfo read FStatus;
    property CertificateSerialNumber: UTF8String read GetCertificateSerialNumber;
  end;

  { TKSeF2RetrieveCertificatesRequest }

  TKSeF2RetrieveCertificatesRequest = class(TKSeF2Request)
  private
    function GetCertificateSerialNumbersStr: UTF8String;
    procedure SetCertificateSerialNumbersStr(AValue: UTF8String);
  published
    property CertificateSerialNumbersStr: UTF8String read GetCertificateSerialNumbersStr write SetCertificateSerialNumbersStr;
  end;

  { TKSeF2RetrieveCertificatesListItem }

  TKSeF2RetrieveCertificatesListItem = class(TKSeF2Object)
  private
    function GetCertificate: UTF8String;
    function GetCertificateName: UTF8String;
    function GetCertificateSerialNumber: UTF8String;
    function GetCertificateType: TKSeF2KsefCertificateType;
  published
    property Certificate: UTF8String read GetCertificate;
    property CertificateName: UTF8String read GetCertificateName;
    property CertificateSerialNumber: UTF8String read GetCertificateSerialNumber;
    property CertificateType: TKSeF2KsefCertificateType read GetCertificateType;
  end;

  { TKSeF2RetrieveCertificatesListItemArray }

  TKSeF2RetrieveCertificatesListItemArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2RetrieveCertificatesListItem;
  public
    property Items[AIndex: Integer]: TKSeF2RetrieveCertificatesListItem read GetItem; default;
  end;

  { TKSeF2RetrieveCertificatesResponse }

  TKSeF2RetrieveCertificatesResponse = class(TKSeF2Response)
  private
    FCertificates: TKSeF2RetrieveCertificatesListItemArray;
  protected
    procedure LoadObject; override;
  published
    property Certificates: TKSeF2RetrieveCertificatesListItemArray read FCertificates;
  end;

  TKSeF2CertificateRevocationReason = (crrUnspecified, crrSuperseded,
    crrKeyCompromise);

  { TKSeF2RevokeCertificateRequest }

  TKSeF2RevokeCertificateRequest = class(TKSeF2Request)
  private
    function GetRevocationReason: TKSeF2CertificateRevocationReason;
    procedure SetRevocationReason(AValue: TKSeF2CertificateRevocationReason);
  published
    property RevocationReason: TKSeF2CertificateRevocationReason read GetRevocationReason write SetRevocationReason;
  end;

  TKSeF2CertificateListItemStatus = (csUnspecified, csActive, csBlocked,
    csRevoked, csExpired);

  { TKSeF2QueryCertificatesRequest }

  TKSeF2QueryCertificatesRequest = class(TKSeF2Request)
  private
    function GetCertificateSerialNumber: UTF8String;
    function GetExpiresAfter: TDateTime;
    function GetName: UTF8String;
    function GetStatus: TKSeF2CertificateListItemStatus;
    function GetType: TKSeF2KsefCertificateType;
    procedure SetCertificateSerialNumber(AValue: UTF8String);
    procedure SetExpiresAfter(AValue: TDateTime);
    procedure SetName(AValue: UTF8String);
    procedure SetStatus(AValue: TKSeF2CertificateListItemStatus);
    procedure SetType(AValue: TKSeF2KsefCertificateType);
  published
    property CertificateSerialNumber: UTF8String read GetCertificateSerialNumber write SetCertificateSerialNumber;
    property Name: UTF8String read GetName write SetName;
    property Type_: TKSeF2KsefCertificateType read GetType write SetType;
    property Status: TKSeF2CertificateListItemStatus read GetStatus write SetStatus;
    property ExpiresAfter: TDateTime read GetExpiresAfter write SetExpiresAfter;
  end;

  TKSeF2CertificateSubjectIdentifierType = (csiNip, csiPesel, csiFingerprint);

  { TKSeF2CertificateSubjectIdentifier }

  TKSeF2CertificateSubjectIdentifier = class(TKSeF2Object)
  private
    function GetType: TKSeF2CertificateSubjectIdentifierType;
    function GetValue: String;
  published
    property Type_: TKSeF2CertificateSubjectIdentifierType read GetType;
    property Value: String read GetValue;
  end;

  { TKSeF2CertificateListItem }

  TKSeF2CertificateListItem = class(TKSeF2Object)
  private
    FSubjectIdentifier: TKSeF2CertificateSubjectIdentifier;
    function GetCertificateSerialNumber: UTF8String;
    function GetCommonName: UTF8String;
    function GetLastUseDate: TDateTime;
    function GetLastUseDateRaw: UTF8String;
    function GetName: UTF8String;
    function GetRequestDate: TDateTime;
    function GetRequestDateRaw: UTF8String;
    function GetStatus: TKSeF2CertificateListItemStatus;
    function GetType: TKSeF2KsefCertificateType;
    function GetValidFrom: TDateTime;
    function GetValidFromRaw: UTF8String;
    function GetValidTo: TDateTime;
    function GetValidToRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property CertificateSerialNumber: UTF8String read GetCertificateSerialNumber;
    property Name: UTF8String read GetName;
    property Type_: TKSeF2KsefCertificateType read GetType;
    property CommonName: UTF8String read GetCommonName;
    property Status: TKSeF2CertificateListItemStatus read GetStatus;
    property SubjectIdentifier: TKSeF2CertificateSubjectIdentifier read FSubjectIdentifier;
    property ValidFrom: TDateTime read GetValidFrom;
    property ValidFromRaw: UTF8String read GetValidFromRaw;
    property ValidTo: TDateTime read GetValidTo;
    property ValidToRaw: UTF8String read GetValidToRaw;
    property LastUseDate: TDateTime read GetLastUseDate;
    property LastUseDateRaw: UTF8String read GetLastUseDateRaw;
    property RequestDate: TDateTime read GetRequestDate;
    property RequestDateRaw: UTF8String read GetRequestDateRaw;
  end;

  { TKSeF2CertificateListItemArray }

  TKSeF2CertificateListItemArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2CertificateListItem;
  public
    property Items[AIndex: Integer]: TKSeF2CertificateListItem read GetItem; default;
  end;

  { TKSeF2QueryCertificatesResponse }

  TKSeF2QueryCertificatesResponse = class(TKSeF2Response)
  private
    FCertificates: TKSeF2CertificateListItemArray;
    function GetHasMore: Boolean;
  protected
    procedure LoadObject; override;
  published
    property Certificates: TKSeF2CertificateListItemArray read FCertificates;
    property HasMore: Boolean read GetHasMore;
  end;

  { TKSeF2OnlineSessionEffectiveContextLimits }

  TKSeF2OnlineSessionEffectiveContextLimits = class(TKSeF2Object)
  private
    function GetMaxInvoices: Integer;
    function GetMaxInvoiceSizeInMB: Integer;
    function GetMaxInvoiceWithAttachmentSizeInMB: Integer;
  published
    property MaxInvoiceSizeInMB: Integer read GetMaxInvoiceSizeInMB;
    property MaxInvoiceWithAttachmentSizeInMB: Integer read GetMaxInvoiceWithAttachmentSizeInMB;
    property MaxInvoices: Integer read GetMaxInvoices;
  end;

  { TKSeF2BatchSessionEffectiveContextLimits }

  TKSeF2BatchSessionEffectiveContextLimits = class(TKSeF2Object)
  private
    function GetMaxInvoices: Integer;
    function GetMaxInvoiceSizeInMB: Integer;
    function GetMaxInvoiceWithAttachmentSizeInMB: Integer;
  published
    property MaxInvoiceSizeInMB: Integer read GetMaxInvoiceSizeInMB;
    property MaxInvoiceWithAttachmentSizeInMB: Integer read GetMaxInvoiceWithAttachmentSizeInMB;
    property MaxInvoices: Integer read GetMaxInvoices;
  end;

  { TKSeF2EffectiveContextLimits }

  TKSeF2EffectiveContextLimits = class(TKSeF2Response)
  private
    FBatchSession: TKSeF2BatchSessionEffectiveContextLimits;
    FOnlineSession: TKSeF2OnlineSessionEffectiveContextLimits;
  protected
    procedure LoadObject; override;
  published
    property OnlineSession: TKSeF2OnlineSessionEffectiveContextLimits read FOnlineSession;
    property BatchSession: TKSeF2BatchSessionEffectiveContextLimits read FBatchSession;
  end;

  { TKSeF2EnrollmentEffectiveSubjectLimits }

  TKSeF2EnrollmentEffectiveSubjectLimits = class(TKSeF2Object)
  private
    function GetMaxEnrollments: Integer;
  published
    property MaxEnrollments: Integer read GetMaxEnrollments;
  end;

  { TKSeF2CertificateEffectiveSubjectLimits }

  TKSeF2CertificateEffectiveSubjectLimits = class(TKSeF2Object)
  private
    function GetMaxCertificates: Integer;
  published
    property MaxCertificates: Integer read GetMaxCertificates;
  end;

  { TKSeF2EffectiveSubjectLimits }

  TKSeF2EffectiveSubjectLimits = class(TKSeF2Response)
  private
    FCertificate: TKSeF2CertificateEffectiveSubjectLimits;
    FEnrollment: TKSeF2EnrollmentEffectiveSubjectLimits;
  protected
    procedure LoadObject; override;
  published
    property Enrollment: TKSeF2EnrollmentEffectiveSubjectLimits read FEnrollment;
    property Certificate: TKSeF2CertificateEffectiveSubjectLimits read FCertificate;
  end;

  { TKSeF2EffectiveApiRateLimitValues }

  TKSeF2EffectiveApiRateLimitValues = class(TKSeF2Object)
  private
    function GetPerHour: Integer;
    function GetPerMinute: Integer;
    function GetPerSecond: Integer;
  published
    property PerSecond: Integer read GetPerSecond;
    property PerMinute: Integer read GetPerMinute;
    property PerHour: Integer read GetPerHour;
  end;

  { TKSeF2EffectiveApiRateLimits }

  TKSeF2EffectiveApiRateLimits = class(TKSeF2Response)
  private
    FBatchSession: TKSeF2EffectiveApiRateLimitValues;
    FInvoiceDownload: TKSeF2EffectiveApiRateLimitValues;
    FInvoiceExport: TKSeF2EffectiveApiRateLimitValues;
    FInvoiceExportStatus: TKSeF2EffectiveApiRateLimitValues;
    FInvoiceMetadata: TKSeF2EffectiveApiRateLimitValues;
    FInvoiceSend: TKSeF2EffectiveApiRateLimitValues;
    FInvoiceStatus: TKSeF2EffectiveApiRateLimitValues;
    FOnlineSession: TKSeF2EffectiveApiRateLimitValues;
    FOther: TKSeF2EffectiveApiRateLimitValues;
    FSessionInvoiceList: TKSeF2EffectiveApiRateLimitValues;
    FSessionList: TKSeF2EffectiveApiRateLimitValues;
    FSessionMisc: TKSeF2EffectiveApiRateLimitValues;
  protected
    procedure LoadObject; override;
  published
    property OnlineSession: TKSeF2EffectiveApiRateLimitValues read FOnlineSession;
    property BatchSession: TKSeF2EffectiveApiRateLimitValues read FBatchSession;
    property InvoiceSend: TKSeF2EffectiveApiRateLimitValues read FInvoiceSend;
    property InvoiceStatus: TKSeF2EffectiveApiRateLimitValues read FInvoiceStatus;
    property SessionList: TKSeF2EffectiveApiRateLimitValues read FSessionList;
    property SessionInvoiceList: TKSeF2EffectiveApiRateLimitValues read FSessionInvoiceList;
    property SessionMisc: TKSeF2EffectiveApiRateLimitValues read FSessionMisc;
    property InvoiceMetadata: TKSeF2EffectiveApiRateLimitValues read FInvoiceMetadata;
    property InvoiceExport: TKSeF2EffectiveApiRateLimitValues read FInvoiceExport;
    property InvoiceExportStatus: TKSeF2EffectiveApiRateLimitValues read FInvoiceExportStatus;
    property InvoiceDownload: TKSeF2EffectiveApiRateLimitValues read FInvoiceDownload;
    property Other: TKSeF2EffectiveApiRateLimitValues read FOther;
  end;

  { TKSeF2PeppolProvider }

  TKSeF2PeppolProvider = class(TKSeF2Object)
  private
    function GetDateCreated: TDateTime;
    function GetDateCreatedRaw: UTF8String;
    function GetId: UTF8String;
    function GetName: UTF8String;
  published
    property Id: UTF8String read GetId;
    property Name: UTF8String read GetName;
    property DateCreated: TDateTime read GetDateCreated;
    property DateCreatedRaw: UTF8String read GetDateCreatedRaw;
  end;

  { TKSeF2PeppolProviderArray }

  TKSeF2PeppolProviderArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2PeppolProvider;
  public
    property Items[AIndex: Integer]: TKSeF2PeppolProvider read GetItem; default;
  end;

  { TKSeF2QueryPeppolProvidersResponse }

  TKSeF2QueryPeppolProvidersResponse = class(TKSeF2Response)
  private
    FPeppolProviders: TKSeF2PeppolProviderArray;
    function GetHasMore: Boolean;
  protected
    procedure LoadObject; override;
  published
    property PeppolProviders: TKSeF2PeppolProviderArray read FPeppolProviders;
    property HasMore: Boolean read GetHasMore;
  end;

procedure lgoRegister;

implementation

uses
  LibGovPl4Backend;

procedure lgoRegister;
begin
  lgoRegisterClasses([
    TKSeF2AuthenticationChallengeResponse,
    TKSeF2TokenInfo,
    TKSeF2AuthenticationInitResponse,
    TKSeF2StatusInfo,
    TKSeF2AuthenticationOperationStatusResponse,
    TKSeF2AuthenticationTokensResponse,
    TKSeF2AuthenticationTokenRefreshResponse,
    TKSeF2AuthenticationListItem,
    TKSeF2AuthenticationList,
    TKSeF2AuthenticationListResponse,
    TKSeF2PublicKeyCertificate,
    TKSeF2PublicKeyCertificateArray,
    TKSeF2PublicKeyCertificateResponse,
    TKSeF2FormCode,
    TKSeF2EncryptionInfo,
    TKSeF2OpenOnlineSessionRequest,
    TKSeF2OpenOnlineSessionResponse,
    TKSeF2SendInvoiceRequest,
    TKSeF2SendInvoiceResponse,
    TKSeF2BatchFilePartInfo,
    TKSeF2BatchFilePartInfoArray,
    TKSeF2BatchFileInfo,
    TKSeF2OpenBatchSessionRequest,
    TKSeF2KeyValuePair,
    TKSeF2KeyValuePairs,
    TKSeF2PartUploadRequest,
    TKSeF2PartUploadRequestArray,
    TKSeF2OpenBatchSessionResponse,
    TKSeF2SessionsQueryResponseItem,
    TKSeF2SessionsQueryResponseArray,
    TKSeF2SessionsQueryResponse,
    TKSeF2UpoPageResponse,
    TKSeF2UpoPageResponseArray,
    TKSeF2UpoResponse,
    TKSeF2SessionStatusResponse,
    TKSeF2InvoiceStatusInfo,
    TKSeF2SessionInvoiceStatusResponse,
    TKSeF2SessionInvoiceStatusResponseArray,
    TKSeF2SessionInvoicesResponse,
    TKSeF2InvoiceQueryDateRange,
    TKSeF2InvoiceQueryAmount,
    TKSeF2InvoiceQueryBuyerIdentifier,
    TKSeF2InvoiceQueryFilters,
    TKSeF2InvoiceMetadataSeller,
    TKSeF2InvoiceMetadataBuyerIdentifier,
    TKSeF2InvoiceMetadataBuyer,
    TKSeF2InvoiceMetadataThirdSubjectIdentifier,
    TKSeF2InvoiceMetadataThirdSubject,
    TKSeF2InvoiceMetadataThirdSubjectArray,
    TKSeF2InvoiceMetadataAuthorizedSubject,
    TKSeF2InvoiceMetadata,
    TKSeF2InvoiceMetadataArray,
    TKSeF2QueryInvoicesMetadataResponse,
    TKSeF2InvoiceExportRequest,
    TKSeF2ExportInvoicesResponse,
    TKSeF2InvoicePackagePart,
    TKSeF2InvoicePackagePartArray,
    TKSeF2InvoicePackage,
    TKSeF2InvoiceExportStatusResponse,
    TKSeF2GenerateTokenRequest,
    TKSeF2GenerateTokenResponse,
    TKSeF2TokenAuthorIdentifierTypeIdentifier,
    TKSeF2TokenContextIdentifierTypeIdentifier,
    TKSeF2QueryTokensResponseItem,
    TKSeF2QueryTokensResponseArray,
    TKSeF2QueryTokensResponse,
    TKSeF2TokenStatusResponse,
    TKSeF2Subunit,
    TKSeF2SubunitArray,
    TKSeF2SubjectCreateRequest,
    TKSeF2PersonCreateRequest
    ]);
  lgoRegisterExceptionClass(EKSeF2ExceptionResponseBase);
  lgoRegisterExceptionClass(EKSeF2ExceptionResponse);
  lgoRegisterExceptionClass(EKSeF2Forbidden);
  lgoRegisterExceptionClass(EKSeF2Unauthorized);
  lgoRegisterExceptionClass(EKSeF2NotFound);
end;

{ EKSeF2ExceptionResponseBase }

procedure EKSeF2ExceptionResponseBase.LoadObject(AException: LGP_EXCEPTION);
var
  S: LGP_OBJECT;
begin
  inherited LoadObject(AException);
  S := nil;
  if AException <> nil then
  begin
    lgoCheckResult(lgpObject_GetIntegerProp(AException, 'ResponseCode', FResponseCode), False);
    if lgoCheckResult(lgpObject_GetStringProp(AException, 'RawData', S), False) then
      FRawData := lgoGetString(S);
  end;
end;

procedure EKSeF2ExceptionResponse.LoadObject(AException: LGP_EXCEPTION);
var
  S, O: LGP_OBJECT;
  I, Cnt: Integer;
begin
  inherited LoadObject(AException);
  if AException <> nil then
  begin
    S := nil;
    O := nil;
    Cnt := 0;
    if lgoCheckResult(lgpObject_GetStringProp(AException, 'ServiceCtx', S), False) then
      FServiceCtx := lgoGetString(S);
    if lgoCheckResult(lgpObject_GetStringProp(AException, 'ServiceCode', S), False) then
      FServiceCode := lgoGetString(S);
    if lgoCheckResult(lgpObject_GetStringProp(AException, 'ServiceName', S), False) then
      FServiceName := lgoGetString(S);
    lgoCheckResult(lgpObject_GetDoubleProp(AException, 'Timestamp', FTimestamp), False);
    if lgoCheckResult(lgpObject_GetStringProp(AException, 'ReferenceNumber', S), False) then
      FReferenceNumber := lgoGetString(S);
    if lgoCheckResult(lgpObject_GetObjectProp(AException, 'ExceptionDetailList', S), False)
      and lgoCheckResult(lgpListObject_GetCount(S, Cnt), False)
      and (Cnt > 0) then
    begin
      SetLength(FExceptionDetailList, Cnt);
      for I := 0 to Cnt - 1 do
      begin
        if lgoCheckResult(lgpListObject_GetItem(S, I, O), False) then
        begin
          lgoCheckResult(lgpObject_GetIntegerProp(O, 'ExceptionCode', FExceptionDetailList[I].ExceptionCode), False);
          if lgoCheckResult(lgpObject_GetStringProp(O, 'ExceptionDescription', S), False) then
            FExceptionDetailList[I].ExceptionDescription := lgoGetString(S);
          if lgoCheckResult(lgpObject_GetStringProp(O, 'ExceptionDetails', S), False) then
            FExceptionDetailList[I].ExceptionDetails := lgoGetString(S);
        end;
      end;
    end;
  end;
end;

{ TKSeF2Object }

procedure TKSeF2Object.CreateExtObject(AClassName: UTF8String);
begin
  ExtObject := lgpKSeF2_CreateKSeFClass(LGP_PCHAR(AClassName));
  if ExtObject = nil then
    raise EClassNotFound.Create('Nie znaleziono klasy: ' + AClassName);
end;

procedure TKSeF2Object.LoadObject;
begin

end;

constructor TKSeF2Object.Create(AOwner: TKSeF2Object; AClassName: UTF8String);
begin
  FObjects := {$IFDEF FPC}TFPList{$ELSE}TList{$ENDIF}.Create;
  if Assigned(AOwner) then
    AOwner.InsertObject(Self);
  if AClassName = '' then
    AClassName := ClassName;
  CreateExtObject(AClassName);
end;

constructor TKSeF2Object.Create(AOwner: TKSeF2Object; AExtObject: LGP_OBJECT);
begin
  FObjects := {$IFDEF FPC}TFPList{$ELSE}TList{$ENDIF}.Create;
  if Assigned(AOwner) then
    AOwner.InsertObject(Self);
  ExtObject := AExtObject;
end;

procedure TKSeF2Object.AfterConstruction;
begin
  inherited AfterConstruction;
  if ExtObject <> nil then
  begin
    LoadObject;
    lgoCheckResult(lgpKSeF2_KSeFClassSetExt(ExtObject, Self));
  end;
end;

destructor TKSeF2Object.Destroy;
var
  I: Integer;
begin
  if Assigned(FOwner) then
    FOwner.RemoveObject(Self);
  for I := FObjects.Count - 1 downto 0 do
    TObject(FObjects[I]).Free;
  FObjects.Free;
  inherited Destroy;
end;

procedure TKSeF2Object.InsertObject(AObject: TKSeF2Object);
begin
  if AObject.FOwner = Self then
    Exit;
  if AObject.FOwner <> nil then
    AObject.FOwner.RemoveObject(AObject);
  if FObjects.IndexOf(AObject) < 0 then
    FObjects.Add(AObject);
  AObject.FOwner := Self;
end;

procedure TKSeF2Object.RemoveObject(AObject: TKSeF2Object);
begin
  if AObject.FOwner = Self then
  begin
    FObjects.Remove(AObject);
    AObject.FOwner := nil;
  end;
end;

{ TKSeF2Array }

function TKSeF2Array.GetOwnObjects: Boolean;
var
  I: LGP_INT32;
begin
  I := 0;
  lgoCheckResult(lgpListObject_GetOwnsObjects(ExtObject, I));
  Result := I <> 0;
end;

procedure TKSeF2Array.SetOwnObjects(AValue: Boolean);
begin
  lgoCheckResult(lgpListObject_SetOwnsObjects(ExtObject, Integer(AValue)));
end;

function TKSeF2Array.GetItem(AIndex: Integer): TKSeF2Object;
var
  O: LGP_OBJECT;
begin
  O := nil;
  if ((AIndex < FList.Count) and (FList[AIndex] = nil)) or (FList.Count <= AIndex) then
  begin
    lgoCheckResult(lgpListObject_GetItem(ExtObject, AIndex, O));
    if O <> nil then
    begin
      Result := GetItemClass(O).Create(Self, O);
      if FList.Count <= AIndex then
        FList.Count := AIndex + 1;
      FList[AIndex] := Result;
    end
    else
      Result := nil;
  end
  else
    Result := TKSeF2Object(FList[AIndex]);
end;

class function TKSeF2Array.GetItemClass(AObject: LGP_OBJECT): TKSeF2ObjectClass;
begin
  Result := TKSeF2ObjectClass(lgoFindClass(lgoClassName(AObject)));
end;

constructor TKSeF2Array.Create(AOwner: TKSeF2Object; AClassName: UTF8String);
begin
  inherited Create(AOwner, AClassName);
  FList := TList.Create;
end;

constructor TKSeF2Array.Create(AOwner: TKSeF2Object; AExtObject: LGP_OBJECT);
begin
  inherited Create(AOwner, AExtObject);
  FList := TList.Create;
end;

destructor TKSeF2Array.Destroy;
var
  I: Integer;
  O: LGP_OBJECT;
begin
  OwnObjects := False;
  O := nil;
  for I := 0 to Count - 1 do
    if (I < FList.Count) and (FList[I] <> nil) then
      TKSeF2Object(FList[I]).Free
    else
    begin
      lgoCheckResult(lgpListObject_GetItem(ExtObject, I, O));
      if O <> nil then
        lgoCheckResult(lgpObject_Free(O));
    end;
  FList.Free;
  inherited Destroy;
end;

function TKSeF2Array.Count: Integer;
begin
  Result := 0;
  lgoCheckResult(lgpListObject_GetCount(ExtObject, Result));
end;

function TKSeF2Array.Add(AObject: TKSeF2Object): Integer;
begin
  lgoCheckResult(lgpListObject_Add(ExtObject, AObject.ExtObject, Result));
end;

procedure TKSeF2Array.Delete(AIndex: Integer);
begin
  lgoCheckResult(lgpListObject_Delete(ExtObject, AIndex));
end;

{ TKSeF2Request }

function TKSeF2Request.GetAsJSONString: UTF8String;
begin
  Result := GetStringProp('AsJSONString');
end;

{ TKSeF2Response }

function TKSeF2Response.GetRawResponse: UTF8String;
begin
  Result := GetStringProp('RawResponse');
end;

{ TKSeF2AuthenticationChallengeResponse }

function TKSeF2AuthenticationChallengeResponse.GetChallenge: UTF8String;
begin
  Result := GetStringProp('Challenge');
end;

function TKSeF2AuthenticationChallengeResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeF2AuthenticationChallengeResponse.GetTimestampMs: Int64;
begin
  Result := GetInt64Prop('TimestampMs');
end;

function TKSeF2AuthenticationChallengeResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

{ TKSeF2TokenInfo }

function TKSeF2TokenInfo.GetToken: UTF8String;
begin
  Result := GetStringProp('Token');
end;

function TKSeF2TokenInfo.GetValidUntil: TDateTime;
begin
  Result := GetDoubleProp('ValidUntil');
end;

function TKSeF2TokenInfo.GetValidUntilRaw: UTF8String;
begin
  Result := GetStringProp('ValidUntilRaw');
end;

{ TKSeF2AuthenticationInitResponse }

function TKSeF2AuthenticationInitResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

procedure TKSeF2AuthenticationInitResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthenticationToken');
  if O <> nil then
    FAuthenticationToken := TKSeF2TokenInfo.Create(Self, O);
end;

{ TKSeF2StatusInfo }

function TKSeF2StatusInfo.GetCode: Integer;
begin
  Result := GetIntegerProp('Code');
end;

function TKSeF2StatusInfo.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2StatusInfo.GetDetails: UTF8String;
begin
  Result := GetStringProp('DetailsStr');
end;

{ TKSeF2AuthenticationOperationStatusResponse }

function TKSeF2AuthenticationOperationStatusResponse.GetAuthenticationMethod: UTF8String;
begin
  Result := GetStringProp('AuthenticationMethod');
end;

function TKSeF2AuthenticationOperationStatusResponse.GetIsTokenRedeemed: Boolean;
begin
  Result := GetBooleanProp('IsTokenRedeemed');
end;

function TKSeF2AuthenticationOperationStatusResponse.GetLastTokenRefreshDate: TDateTime;
begin
  Result := GetDoubleProp('LastTokenRefreshDate');
end;

function TKSeF2AuthenticationOperationStatusResponse.GetLastTokenRefreshDateRaw: UTF8String;
begin
  Result := GetStringProp('LastTokenRefreshDateRaw');
end;

function TKSeF2AuthenticationOperationStatusResponse.GetRefreshTokenValidUntil: TDateTime;
begin
  Result := GetDoubleProp('RefreshTokenValidUntil');
end;

function TKSeF2AuthenticationOperationStatusResponse.GetRefreshTokenValidUntilRaw: UTF8String;
begin
  Result := GetStringProp('RefreshTokenValidUntilRaw');
end;

function TKSeF2AuthenticationOperationStatusResponse.GetStartDate: TDateTime;
begin
  Result := GetDoubleProp('StartDate');
end;

function TKSeF2AuthenticationOperationStatusResponse.GetStartDateRaw: UTF8String;
begin
  Result := GetStringProp('StartDateRaw');
end;

procedure TKSeF2AuthenticationOperationStatusResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Status');
  if O <> nil then
    FStatus := TKSeF2StatusInfo.Create(Self, O);
end;

{ TKSeF2AuthenticationTokensResponse }

procedure TKSeF2AuthenticationTokensResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AccessToken');
  if O <> nil then
    FAccessToken := TKSeF2TokenInfo.Create(Self, O);
  O := GetObjectProp('RefreshToken');
  if O <> nil then
    FRefreshToken := TKSeF2TokenInfo.Create(Self, O);
end;

{ TKSeF2AuthenticationTokenRefreshResponse }

procedure TKSeF2AuthenticationTokenRefreshResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AccessToken');
  if O <> nil then
    FAccessToken := TKSeF2TokenInfo.Create(Self, O);
end;

{ TKSeF2AuthenticationListItem }

function TKSeF2AuthenticationListItem.GetAuthenticationMethod: UTF8String;
begin
  Result := GetStringProp('AuthenticationMethod');
end;

function TKSeF2AuthenticationListItem.GetIsCurrent: Boolean;
begin
  Result := GetBooleanProp('IsCurrent');
end;

function TKSeF2AuthenticationListItem.GetIsTokenRedeemed: Boolean;
begin
  Result := GetBooleanProp('IsTokenRedeemed');
end;

function TKSeF2AuthenticationListItem.GetLastTokenRefreshDate: TDateTime;
begin
  Result := GetDoubleProp('LastTokenRefreshDate');
end;

function TKSeF2AuthenticationListItem.GetLastTokenRefreshDateRaw: UTF8String;
begin
  Result := GetStringProp('LastTokenRefreshDateRaw');
end;

function TKSeF2AuthenticationListItem.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeF2AuthenticationListItem.GetRefreshTokenValidUntil: TDateTime;
begin
  Result := GetDoubleProp('RefreshTokenValidUntil');
end;

function TKSeF2AuthenticationListItem.GetRefreshTokenValidUntilRaw: UTF8String;
begin
  Result := GetStringProp('RefreshTokenValidUntilRaw');
end;

function TKSeF2AuthenticationListItem.GetStartDate: TDateTime;
begin
  Result := GetDoubleProp('StartDate');
end;

function TKSeF2AuthenticationListItem.GetStartDateRaw: UTF8String;
begin
  Result := GetStringProp('StartDateRaw');
end;

procedure TKSeF2AuthenticationListItem.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Status');
  if O <> nil then
    FStatus := TKSeF2StatusInfo.Create(Self, O);
end;

function TKSeF2AuthenticationList.GetItem(AIndex: Integer
  ): TKSeF2AuthenticationListItem;
begin
  Result := TKSeF2AuthenticationListItem(inherited GetItem(AIndex));
end;

{ TKSeF2AuthenticationListResponse }

function TKSeF2AuthenticationListResponse.GetContinuationToken: UTF8String;
begin
  Result := GetStringProp('ContinuationToken');
end;

procedure TKSeF2AuthenticationListResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Items');
  if O <> nil then
    FItems := TKSeF2AuthenticationList.Create(Self, O);
end;

{ TKSeF2PublicKeyCertificate }

function TKSeF2PublicKeyCertificate.GetCertificate: UTF8String;
begin
  Result := GetStringProp('Certificate');
end;

function TKSeF2PublicKeyCertificate.GetUsage: TKSeF2KeyUsage;
begin
  Result := [];
  Int32ToSet(GetIntegerProp('UsageInt'), Ord(High(TKSeF2KeyUsageType)), SizeOf(Result), @Result);
end;

function TKSeF2PublicKeyCertificate.GetValidFrom: TDateTime;
begin
  Result := GetDoubleProp('ValidFrom');
end;

function TKSeF2PublicKeyCertificate.GetValidFromRaw: UTF8String;
begin
  Result := GetStringProp('ValidFromRaw');
end;

function TKSeF2PublicKeyCertificate.GetValidTo: TDateTime;
begin
  Result := GetDoubleProp('ValidTo');
end;

function TKSeF2PublicKeyCertificate.GetValidToRaw: UTF8String;
begin
  Result := GetStringProp('ValidToRaw');
end;

{ TKSeF2PublicKeyCertificateArray }

function TKSeF2PublicKeyCertificateArray.GetItem(AIndex: Integer): TKSeF2PublicKeyCertificate;
begin
  Result := TKSeF2PublicKeyCertificate(inherited GetItem(AIndex));
end;

{ TKSeF2PublicKeyCertificateResponse }

procedure TKSeF2PublicKeyCertificateResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Items');
  if O <> nil then
    FItems := TKSeF2PublicKeyCertificateArray.Create(Self, O);
end;

{ TKSeF2FormCode }

function TKSeF2FormCode.GetSchemaVersion: UTF8String;
begin
  Result := GetStringProp('SchemaVersion');
end;

function TKSeF2FormCode.GetSystemCode: UTF8String;
begin
  Result := GetStringProp('SystemCode');
end;

function TKSeF2FormCode.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2FormCode.SetSchemaVersion(AValue: UTF8String);
begin
  SetStringProp('SchemaVersion', AValue);
end;

procedure TKSeF2FormCode.SetSystemCode(AValue: UTF8String);
begin
  SetStringProp('SystemCode', AValue);
end;

procedure TKSeF2FormCode.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2EncryptionInfo }

function TKSeF2EncryptionInfo.GetEncryptedSymmetricKeyBase64: UTF8String;
begin
  Result := GetStringProp('EncryptedSymmetricKeyBase64');
end;

function TKSeF2EncryptionInfo.GetInitializationVectorBase64: UTF8String;
begin
  Result := GetStringProp('InitializationVectorBase64');
end;

procedure TKSeF2EncryptionInfo.SetEncryptedSymmetricKeyBase64(AValue: UTF8String);
begin
  SetStringProp('EncryptedSymmetricKeyBase64', AValue);
end;

procedure TKSeF2EncryptionInfo.SetInitializationVectorBase64(AValue: UTF8String);
begin
  SetStringProp('InitializationVectorBase64', AValue);
end;

{ TKSeF2OpenOnlineSessionRequest }

procedure TKSeF2OpenOnlineSessionRequest.SetEncryption(
  AValue: TKSeF2EncryptionInfo);
begin
  if FEncryption = AValue then Exit;
  if Assigned(FEncryption) and (FEncryption.Owner = Self) then
    FEncryption.Free;
  SetObjectProp('Encryption', AValue.ExtObject);
  FEncryption := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2OpenOnlineSessionRequest.SetFormCode(AValue: TKSeF2FormCode);
begin
  if FFormCode = AValue then Exit;
  if Assigned(FFormCode) and (FFormCode.Owner = Self) then
    FFormCode.Free;
  SetObjectProp('FormCode', AValue.ExtObject);
  FFormCode := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2OpenOnlineSessionRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Encryption');
  if O <> nil then
    FEncryption := TKSeF2EncryptionInfo.Create(Self, O);
  O := GetObjectProp('FormCode');
  if O <> nil then
    FFormCode := TKSeF2FormCode.Create(Self, O);
end;

{ TKSeF2OpenOnlineSessionResponse }

function TKSeF2OpenOnlineSessionResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeF2OpenOnlineSessionResponse.GetValidUntil: TDateTime;
begin
  Result := GetDoubleProp('ValidUntil');
end;

function TKSeF2OpenOnlineSessionResponse.GetValidUntilRaw: UTF8String;
begin
  Result := GetStringProp('ValidUntilRaw');
end;

{ TKSeF2SendInvoiceRequest }

function TKSeF2SendInvoiceRequest.GetEncryptedInvoiceContent: UTF8String;
begin
  Result := GetStringProp('EncryptedInvoiceContent');
end;

function TKSeF2SendInvoiceRequest.GetEncryptedInvoiceHash: UTF8String;
begin
  Result := GetStringProp('EncryptedInvoiceHash');
end;

function TKSeF2SendInvoiceRequest.GetEncryptedInvoiceSize: Int64;
begin
  Result := GetInt64Prop('EncryptedInvoiceSize');
end;

function TKSeF2SendInvoiceRequest.GetHashOfCorrectedInvoice: UTF8String;
begin
  Result := GetStringProp('HashOfCorrectedInvoice');
end;

function TKSeF2SendInvoiceRequest.GetInvoiceHash: UTF8String;
begin
  Result := GetStringProp('InvoiceHash');
end;

function TKSeF2SendInvoiceRequest.GetInvoiceSize: Int64;
begin
  Result := GetInt64Prop('InvoiceSize');
end;

function TKSeF2SendInvoiceRequest.GetOfflineMode: Boolean;
begin
  Result := GetBooleanProp('OfflineMode');
end;

procedure TKSeF2SendInvoiceRequest.SetEncryptedInvoiceContent(AValue: UTF8String);
begin
  SetStringProp('EncryptedInvoiceContent', AValue);
end;

procedure TKSeF2SendInvoiceRequest.SetEncryptedInvoiceHash(AValue: UTF8String);
begin
  SetStringProp('EncryptedInvoiceHash', AValue);
end;

procedure TKSeF2SendInvoiceRequest.SetEncryptedInvoiceSize(AValue: Int64);
begin
  SetInt64Prop('EncryptedInvoiceSize', AValue);
end;

procedure TKSeF2SendInvoiceRequest.SetHashOfCorrectedInvoice(AValue: UTF8String
  );
begin
  SetStringProp('HashOfCorrectedInvoice', AValue);
end;

procedure TKSeF2SendInvoiceRequest.SetInvoiceHash(AValue: UTF8String);
begin
  SetStringProp('InvoiceHash', AValue);
end;

procedure TKSeF2SendInvoiceRequest.SetInvoiceSize(AValue: Int64);
begin
  SetInt64Prop('InvoiceSize', AValue);
end;

procedure TKSeF2SendInvoiceRequest.SetOfflineMode(AValue: Boolean);
begin
  SetBooleanProp('OfflineMode', AValue);
end;

{ TKSeF2SendInvoiceResponse }

function TKSeF2SendInvoiceResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

procedure TKSeF2SendInvoiceResponse.SetReferenceNumber(AValue: UTF8String);
begin
  SetStringProp('ReferenceNumber', AValue);
end;

{ TKSeF2BatchFilePartInfo }

function TKSeF2BatchFilePartInfo.GetFileHash: UTF8String;
begin
  Result := GetStringProp('FileHash');
end;

function TKSeF2BatchFilePartInfo.GetFileSize: Int64;
begin
  Result := GetInt64Prop('FileSize');
end;

function TKSeF2BatchFilePartInfo.GetOrdinalNumber: Integer;
begin
  Result := GetIntegerProp('OrdinalNumber');
end;

procedure TKSeF2BatchFilePartInfo.SetFileHash(AValue: UTF8String);
begin
  SetStringProp('FileHash', AValue);
end;

procedure TKSeF2BatchFilePartInfo.SetFileSize(AValue: Int64);
begin
  SetInt64Prop('FileSize', AValue);
end;

procedure TKSeF2BatchFilePartInfo.SetOrdinalNumber(AValue: Integer);
begin
  SetIntegerProp('OrdinalNumber', AValue);
end;

{ TKSeF2BatchFilePartInfoArray }

function TKSeF2BatchFilePartInfoArray.GetItem(AIndex: Integer
  ): TKSeF2BatchFilePartInfo;
begin
  Result := TKSeF2BatchFilePartInfo(inherited GetItem(AIndex));
end;

{ TKSeF2BatchFileInfo }

function TKSeF2BatchFileInfo.GetFileHash: UTF8String;
begin
  Result := GetStringProp('FileHash');
end;

function TKSeF2BatchFileInfo.GetFileSize: Int64;
begin
  Result := GetInt64Prop('FileSize');
end;

procedure TKSeF2BatchFileInfo.SetFileHash(AValue: UTF8String);
begin
  SetStringProp('FileHash', AValue);
end;

procedure TKSeF2BatchFileInfo.SetFileParts(AValue: TKSeF2BatchFilePartInfoArray
  );
begin
  if FFileParts = AValue then Exit;
  FFileParts := AValue;
end;

procedure TKSeF2BatchFileInfo.SetFileSize(AValue: Int64);
begin
  SetInt64Prop('FileSize', AValue);
end;

procedure TKSeF2BatchFileInfo.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('FileParts');
  if O <> nil then
    FFileParts := TKSeF2BatchFilePartInfoArray.Create(Self, O);
end;

{ TKSeF2OpenBatchSessionRequest }

function TKSeF2OpenBatchSessionRequest.GetOfflineMode: Boolean;
begin
  Result := GetBooleanProp('OfflineMode');
end;

procedure TKSeF2OpenBatchSessionRequest.SetBatchFile(AValue: TKSeF2BatchFileInfo
  );
begin
  if FBatchFile = AValue then Exit;
  if Assigned(FBatchFile) and (FBatchFile.Owner = Self) then
    FBatchFile.Free;
  SetObjectProp('BatchFile', AValue.ExtObject);
  FBatchFile := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2OpenBatchSessionRequest.SetEncryption(
  AValue: TKSeF2EncryptionInfo);
begin
  if FEncryption = AValue then Exit;
  if Assigned(FEncryption) and (FEncryption.Owner = Self) then
    FEncryption.Free;
  SetObjectProp('Encryption', AValue.ExtObject);
  FEncryption := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2OpenBatchSessionRequest.SetFormCode(AValue: TKSeF2FormCode);
begin
  if FFormCode = AValue then Exit;
  if Assigned(FFormCode) and (FFormCode.Owner = Self) then
    FFormCode.Free;
  SetObjectProp('FormCode', AValue.ExtObject);
  FFormCode := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2OpenBatchSessionRequest.SetOfflineMode(AValue: Boolean);
begin
  SetBooleanProp('OfflineMode', AValue);
end;

procedure TKSeF2OpenBatchSessionRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('FormCode');
  if O <> nil then
    FFormCode := TKSeF2FormCode.Create(Self, O);
  O := GetObjectProp('BatchFile');
  if O <> nil then
    FBatchFile := TKSeF2BatchFileInfo.Create(Self, O);
  O := GetObjectProp('Encryption');
  if O <> nil then
    FEncryption := TKSeF2EncryptionInfo.Create(Self, O);
end;

{ TKSeF2Header }

function TKSeF2KeyValuePair.GetKey: UTF8String;
begin
  Result := GetStringProp('Key');
end;

function TKSeF2KeyValuePair.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

{ TKSeF2Headers }

function TKSeF2KeyValuePairs.GetItem(AIndex: Integer): TKSeF2KeyValuePair;
begin
  Result := TKSeF2KeyValuePair(inherited GetItem(AIndex));
end;

{ TKSeF2PartUploadRequest }

function TKSeF2PartUploadRequest.GetMethod: UTF8String;
begin
  Result := GetStringProp('Method');
end;

function TKSeF2PartUploadRequest.GetOrdinalNumber: Integer;
begin
  Result := GetIntegerProp('OrdinalNumber');
end;

function TKSeF2PartUploadRequest.GetUrl: UTF8String;
begin
  Result := GetStringProp('Url');
end;

procedure TKSeF2PartUploadRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Headers');
  if O <> nil then
    FHeaders := TKSeF2KeyValuePairs.Create(Self, O);
end;

{ TKSeF2PartUploadRequestArray }

function TKSeF2PartUploadRequestArray.GetItem(AIndex: Integer
  ): TKSeF2PartUploadRequest;
begin
  Result := TKSeF2PartUploadRequest(inherited GetItem(AIndex));
end;

{ TKSeF2OpenBatchSessionResponse }

function TKSeF2OpenBatchSessionResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

procedure TKSeF2OpenBatchSessionResponse.SetReferenceNumber(AValue: UTF8String);
begin
  SetStringProp('ReferenceNumber', AValue);
end;

procedure TKSeF2OpenBatchSessionResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('PartUploadRequests');
  if O <> nil then
    FPartUploadRequests := TKSeF2PartUploadRequestArray.Create(Self, O);
end;

{ TKSeF2SessionsQueryResponseItem }

function TKSeF2SessionsQueryResponseItem.GetDateCreated: TDateTime;
begin
  Result := GetDoubleProp('DateCreated');
end;

function TKSeF2SessionsQueryResponseItem.GetDateCreatedRaw: UTF8String;
begin
  Result := GetStringProp('DateCreatedRaw');
end;

function TKSeF2SessionsQueryResponseItem.GetDateUpdated: TDateTime;
begin
  Result := GetDoubleProp('DateUpdated');
end;

function TKSeF2SessionsQueryResponseItem.GetDateUpdatedRaw: UTF8String;
begin
  Result := GetStringProp('DateUpdatedRaw');
end;

function TKSeF2SessionsQueryResponseItem.GetFailedInvoiceCount: Integer;
begin
  Result := GetIntegerProp('FailedInvoiceCount');
end;

function TKSeF2SessionsQueryResponseItem.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeF2SessionsQueryResponseItem.GetSuccessfulInvoiceCount: Integer;
begin
  Result := GetIntegerProp('SuccessfulInvoiceCount');
end;

function TKSeF2SessionsQueryResponseItem.GetTotalInvoiceCount: Integer;
begin
  Result := GetIntegerProp('TotalInvoiceCount');
end;

function TKSeF2SessionsQueryResponseItem.GetValidUntil: TDateTime;
begin
  Result := GetDoubleProp('ValidUntil');
end;

function TKSeF2SessionsQueryResponseItem.GetValidUntilRaw: UTF8String;
begin
  Result := GetStringProp('ValidUntilRaw');
end;

procedure TKSeF2SessionsQueryResponseItem.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Status');
  if O <> nil then
    FStatus := TKSeF2StatusInfo.Create(Self, O);
end;

{ TKSeF2SessionsQueryResponseArray }

function TKSeF2SessionsQueryResponseArray.GetItem(AIndex: Integer
  ): TKSeF2SessionsQueryResponseItem;
begin
  Result := TKSeF2SessionsQueryResponseItem(inherited GetItem(AIndex));
end;

function TKSeF2SessionsQueryResponse.GetContinuationToken: UTF8String;
begin
  Result := GetStringProp('ContinuationToken');
end;

procedure TKSeF2SessionsQueryResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Sessions');
  if O <> nil then
    FSessions := TKSeF2SessionsQueryResponseArray.Create(Self, O);
end;

{ TKSeF2UpoPageResponse }

function TKSeF2UpoPageResponse.GetDownloadUrl: UTF8String;
begin
  Result := GetStringProp('DownloadUrl');
end;

function TKSeF2UpoPageResponse.GetDownloadUrlExpirationDate: TDateTime;
begin
  Result := GetDoubleProp('DownloadUrlExpirationDate');
end;

function TKSeF2UpoPageResponse.GetDownloadUrlExpirationDateRaw: UTF8String;
begin
  Result := GetStringProp('DownloadUrlExpirationDateRaw');
end;

function TKSeF2UpoPageResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

{ TKSeF2UpoPageResponseArray }

function TKSeF2UpoPageResponseArray.GetItem(AIndex: Integer
  ): TKSeF2UpoPageResponse;
begin
  Result := TKSeF2UpoPageResponse(inherited GetItem(AIndex));
end;

{ TKSeF2UpoResponse }

procedure TKSeF2UpoResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Pages');
  if O <> nil then
    FPages := TKSeF2UpoPageResponseArray.Create(Self, O);
end;

{ TKSeF2SessionStatusResponse }

function TKSeF2SessionStatusResponse.GetFailedInvoiceCount: Integer;
begin
  Result := GetIntegerProp('FailedInvoiceCount');
end;

function TKSeF2SessionStatusResponse.GetDateCreated: TDateTime;
begin
  Result := GetDoubleProp('DateCreated');
end;

function TKSeF2SessionStatusResponse.GetDateCreatedRaw: UTF8String;
begin
  Result := GetStringProp('DateCreatedRaw');
end;

function TKSeF2SessionStatusResponse.GetDateUpdated: TDateTime;
begin
  Result := GetDoubleProp('DateUpdated');
end;

function TKSeF2SessionStatusResponse.GetDateUpdatedRaw: UTF8String;
begin
  Result := GetStringProp('DateUpdatedRaw');
end;

function TKSeF2SessionStatusResponse.GetInvoiceCount: Integer;
begin
  Result := GetIntegerProp('InvoiceCount');
end;

function TKSeF2SessionStatusResponse.GetSuccessfulInvoiceCount: Integer;
begin
  Result := GetIntegerProp('SuccessfulInvoiceCount');
end;

function TKSeF2SessionStatusResponse.GetValidUntil: TDateTime;
begin
  Result := GetDoubleProp('ValidUntil');
end;

function TKSeF2SessionStatusResponse.GetValidUntilRaw: UTF8String;
begin
  Result := GetStringProp('ValidUntilRaw');
end;

procedure TKSeF2SessionStatusResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Status');
  if O <> nil then
    FStatus := TKSeF2StatusInfo.Create(Self, O);
  O := GetObjectProp('Upo');
  if O <> nil then
    FUpo := TKSeF2UpoResponse.Create(Self, O);
end;

{ TKSeF2InvoiceStatusInfo }

procedure TKSeF2InvoiceStatusInfo.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Extensions');
  if O <> nil then
    FExtensions := TKSeF2KeyValuePairs.Create(Self, O);
end;

{ TKSeF2SessionInvoiceStatusResponse }

function TKSeF2SessionInvoiceStatusResponse.GetAcquisitionDate: TDateTime;
begin
  Result := GetDoubleProp('AcquisitionDate');
end;

function TKSeF2SessionInvoiceStatusResponse.GetAcquisitionDateRaw: UTF8String;
begin
  Result := GetStringProp('AcquisitionDateRaw');
end;

function TKSeF2SessionInvoiceStatusResponse.GetInvoiceFileName: UTF8String;
begin
  Result := GetStringProp('InvoiceFileName');
end;

function TKSeF2SessionInvoiceStatusResponse.GetInvoiceHash: UTF8String;
begin
  Result := GetStringProp('InvoiceHash');
end;

function TKSeF2SessionInvoiceStatusResponse.GetInvoiceNumber: UTF8String;
begin
  Result := GetStringProp('InvoiceNumber');
end;

function TKSeF2SessionInvoiceStatusResponse.GetInvoicingDate: TDateTime;
begin
  Result := GetDoubleProp('InvoicingDate');
end;

function TKSeF2SessionInvoiceStatusResponse.GetInvoicingDateRaw: UTF8String;
begin
  Result := GetStringProp('InvoicingDateRaw');
end;

function TKSeF2SessionInvoiceStatusResponse.GetInvoicingMode: TKSeF2InvoicingMode;
begin
  Result := TKSeF2InvoicingMode(GetIntegerProp('InvoicingMode'));
end;

function TKSeF2SessionInvoiceStatusResponse.GetKsefNumber: UTF8String;
begin
  Result := GetStringProp('KsefNumber');
end;

function TKSeF2SessionInvoiceStatusResponse.GetOrdinalNumber: Integer;
begin
  Result := GetIntegerProp('OrdinalNumber');
end;

function TKSeF2SessionInvoiceStatusResponse.GetPermanentStorageDate: TDateTime;
begin
  Result := GetDoubleProp('PermanentStorageDate');
end;

function TKSeF2SessionInvoiceStatusResponse.GetPermanentStorageDateRaw: UTF8String;
begin
  Result := GetStringProp('PermanentStorageDateRaw');
end;

function TKSeF2SessionInvoiceStatusResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeF2SessionInvoiceStatusResponse.GetUpoDownloadUrl: UTF8String;
begin
  Result := GetStringProp('UpoDownloadUrl');
end;

function TKSeF2SessionInvoiceStatusResponse.GetUpoDownloadUrlExpirationDate: TDateTime;
begin
  Result := GetDoubleProp('UpoDownloadUrlExpirationDate');
end;

function TKSeF2SessionInvoiceStatusResponse.GetUpoDownloadUrlExpirationDateRaw: UTF8String;
begin
  Result := GetStringProp('UpoDownloadUrlExpirationDateRaw');
end;

procedure TKSeF2SessionInvoiceStatusResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Status');
  if O <> nil then
    FStatus := TKSeF2InvoiceStatusInfo.Create(Self, O);
end;

{ TKSeF2SessionInvoiceStatusResponseArray }

function TKSeF2SessionInvoiceStatusResponseArray.GetItem(AIndex: Integer
  ): TKSeF2SessionInvoiceStatusResponse;
begin
  Result := TKSeF2SessionInvoiceStatusResponse(inherited GetItem(AIndex));
end;

{ TKSeF2SessionInvoicesResponse }

function TKSeF2SessionInvoicesResponse.GetContinuationToken: UTF8String;
begin
  Result := GetStringProp('ContinuationToken');
end;

procedure TKSeF2SessionInvoicesResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Invoices');
  if O <> nil then
    FInvoices := TKSeF2SessionInvoiceStatusResponseArray.Create(Self, O);
end;

{ TKSeF2InvoiceQueryDateRange }

function TKSeF2InvoiceQueryDateRange.GetDateType: TKSeF2InvoiceQueryDateType;
begin
  Result := TKSeF2InvoiceQueryDateType(GetIntegerProp('DateType'));
end;

function TKSeF2InvoiceQueryDateRange.GetFrom: TDateTime;
begin
  Result := GetDoubleProp('From');
end;

function TKSeF2InvoiceQueryDateRange.GetRestrictToPermanentStorageHwmDate: Boolean;
begin
  Result := GetBooleanProp('RestrictToPermanentStorageHwmDate');
end;

function TKSeF2InvoiceQueryDateRange.GetTo: TDateTime;
begin
  Result := GetDoubleProp('To');
end;

procedure TKSeF2InvoiceQueryDateRange.SetDateType(
  AValue: TKSeF2InvoiceQueryDateType);
begin
  SetIntegerProp('DateType', Ord(AValue));
end;

procedure TKSeF2InvoiceQueryDateRange.SetFrom(AValue: TDateTime);
begin
  SetDoubleProp('From', AValue);
end;

procedure TKSeF2InvoiceQueryDateRange.SetRestrictToPermanentStorageHwmDate(
  AValue: Boolean);
begin
  SetBooleanProp('RestrictToPermanentStorageHwmDate', AValue);
end;

procedure TKSeF2InvoiceQueryDateRange.SetTo(AValue: TDateTime);
begin
  SetDoubleProp('To', AValue);
end;

{ TKSeF2InvoiceQueryAmount }

function TKSeF2InvoiceQueryAmount.GetFrom: Double;
begin
  Result := GetDoubleProp('From');
end;

function TKSeF2InvoiceQueryAmount.GetTo: Double;
begin
  Result := GetDoubleProp('To');
end;

function TKSeF2InvoiceQueryAmount.GetType: TKSeF2AmountType;
begin
  Result := TKSeF2AmountType(GetIntegerProp('Type'));
end;

procedure TKSeF2InvoiceQueryAmount.SetFrom(AValue: Double);
begin
  SetDoubleProp('From', AValue);
end;

procedure TKSeF2InvoiceQueryAmount.SetTo(AValue: Double);
begin
  SetDoubleProp('To', AValue);
end;

procedure TKSeF2InvoiceQueryAmount.SetType(AValue: TKSeF2AmountType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

{ TKSeF2InvoiceQueryBuyerIdentifier }

function TKSeF2InvoiceQueryBuyerIdentifier.GetType: TKSeF2BuyerIdentifierType;
begin
  Result := TKSeF2BuyerIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2InvoiceQueryBuyerIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2InvoiceQueryBuyerIdentifier.SetType(
  AValue: TKSeF2BuyerIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2InvoiceQueryBuyerIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2InvoiceQueryFilters }

function TKSeF2InvoiceQueryFilters.GetCurrencyCodes: UTF8String;
begin
  Result := GetStringProp('CurrencyCodesStr');
end;

function TKSeF2InvoiceQueryFilters.GetFormType: TKSeF2InvoiceQueryFormType;
begin
  Result := TKSeF2InvoiceQueryFormType(GetIntegerProp('FormType'));
end;

function TKSeF2InvoiceQueryFilters.GetHasAttachment: TKSeF2NullableBoolean;
begin
  Result := TKSeF2NullableBoolean(GetIntegerProp('HasAttachment'));
end;

function TKSeF2InvoiceQueryFilters.GetInvoiceNumber: UTF8String;
begin
  Result := GetStringProp('InvoiceNumber');
end;

function TKSeF2InvoiceQueryFilters.GetInvoiceTypes: TKSeF2InvoiceTypes;
begin
  Result := [];
  Int32ToSet(GetIntegerProp('InvoiceTypesInt'), Ord(High(TKSeF2InvoiceType)), SizeOf(Result), @Result);
end;

function TKSeF2InvoiceQueryFilters.GetInvoicingMode: TKSeF2InvoicingMode;
begin
  Result := TKSeF2InvoicingMode(GetIntegerProp('InvoicingMode'));
end;

function TKSeF2InvoiceQueryFilters.GetIsSelfInvoicing: TKSeF2NullableBoolean;
begin
  Result := TKSeF2NullableBoolean(GetIntegerProp('IsSelfInvoicing'));
end;

function TKSeF2InvoiceQueryFilters.GetKsefNumber: UTF8String;
begin
  Result := GetStringProp('KsefNumber');
end;

function TKSeF2InvoiceQueryFilters.GetSellerNip: UTF8String;
begin
  Result := GetStringProp('SellerNip');
end;

function TKSeF2InvoiceQueryFilters.GetSubjectType: TKSeF2InvoiceQuerySubjectType;
begin
  Result := TKSeF2InvoiceQuerySubjectType(GetIntegerProp('SubjectType'));
end;

procedure TKSeF2InvoiceQueryFilters.SetAmount(AValue: TKSeF2InvoiceQueryAmount);
begin
  if FAmount = AValue then Exit;
  if Assigned(FAmount) and (FAmount.Owner = Self) then
    FAmount.Free;
  SetObjectProp('Amount', AValue.ExtObject);
  FAmount := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2InvoiceQueryFilters.SetBuyerIdentifier(
  AValue: TKSeF2InvoiceQueryBuyerIdentifier);
begin
  if FBuyerIdentifier = AValue then Exit;
  if Assigned(FBuyerIdentifier) and (FBuyerIdentifier.Owner = Self) then
    FBuyerIdentifier.Free;
  SetObjectProp('BuyerIdentifier', AValue.ExtObject);
  FBuyerIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2InvoiceQueryFilters.SetCurrencyCodes(AValue: UTF8String);
begin
  SetStringProp('CurrencyCodesStr', AValue);
end;

procedure TKSeF2InvoiceQueryFilters.SetDateRange(
  AValue: TKSeF2InvoiceQueryDateRange);
begin
  if FDateRange = AValue then Exit;
  if Assigned(FDateRange) and (FDateRange.Owner = Self) then
    FDateRange.Free;
  SetObjectProp('DateRange', AValue.ExtObject);
  FDateRange := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2InvoiceQueryFilters.SetFormType(
  AValue: TKSeF2InvoiceQueryFormType);
begin
  SetIntegerProp('FormType', Ord(AValue));
end;

procedure TKSeF2InvoiceQueryFilters.SetHasAttachment(
  AValue: TKSeF2NullableBoolean);
begin
  SetIntegerProp('HasAttachment', Ord(AValue));
end;

procedure TKSeF2InvoiceQueryFilters.SetInvoiceNumber(AValue: UTF8String);
begin
  SetStringProp('InvoiceNumber', AValue);
end;

procedure TKSeF2InvoiceQueryFilters.SetInvoiceTypes(AValue: TKSeF2InvoiceTypes);
begin
  SetIntegerProp('InvoiceTypesInt', SetToInt32(@AValue, Ord(High(TKSeF2InvoiceType)), SizeOf(AValue)));
end;

procedure TKSeF2InvoiceQueryFilters.SetInvoicingMode(AValue: TKSeF2InvoicingMode);
begin
  SetIntegerProp('InvoicingMode', Ord(AValue));
end;

procedure TKSeF2InvoiceQueryFilters.SetIsSelfInvoicing(
  AValue: TKSeF2NullableBoolean);
begin
  SetIntegerProp('IsSelfInvoicing', Ord(AValue));
end;

procedure TKSeF2InvoiceQueryFilters.SetKsefNumber(AValue: UTF8String);
begin
  SetStringProp('KsefNumber', AValue);
end;

procedure TKSeF2InvoiceQueryFilters.SetSellerNip(AValue: UTF8String);
begin
  SetStringProp('SellerNip', AValue);
end;

procedure TKSeF2InvoiceQueryFilters.SetSubjectType(
  AValue: TKSeF2InvoiceQuerySubjectType);
begin
  SetIntegerProp('SubjectType', Ord(AValue));
end;

procedure TKSeF2InvoiceQueryFilters.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('DateRange');
  if O <> nil then
    FDateRange := TKSeF2InvoiceQueryDateRange.Create(Self, O);
  O := GetObjectProp('Amount');
  if O <> nil then
    FAmount := TKSeF2InvoiceQueryAmount.Create(Self, O);
  O := GetObjectProp('BuyerIdentifier');
  if O <> nil then
    FBuyerIdentifier := TKSeF2InvoiceQueryBuyerIdentifier.Create(Self, O);
end;

{ TKSeF2InvoiceMetadataSeller }

function TKSeF2InvoiceMetadataSeller.GetName: UTF8String;
begin
  Result := GetStringProp('Name');
end;

function TKSeF2InvoiceMetadataSeller.GetNip: UTF8String;
begin
  Result := GetStringProp('Nip');
end;

{ TKSeF2InvoiceMetadataBuyerIdentifier }

function TKSeF2InvoiceMetadataBuyerIdentifier.GetType: TKSeF2BuyerIdentifierType;
begin
  Result := TKSeF2BuyerIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2InvoiceMetadataBuyerIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

function TKSeF2InvoiceMetadataBuyer.GetName: UTF8String;
begin
  Result := GetStringProp('Name');
end;

procedure TKSeF2InvoiceMetadataBuyer.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Identifier');
  if O <> nil then
    FIdentifier := TKSeF2InvoiceMetadataBuyerIdentifier.Create(Self, O);
end;

{ TKSeF2InvoiceMetadataThirdSubjectIdentifier }

function TKSeF2InvoiceMetadataThirdSubjectIdentifier.GetType: TKSeF2ThirdSubjectIdentifierType;
begin
  Result := TKSeF2ThirdSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2InvoiceMetadataThirdSubjectIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

function TKSeF2InvoiceMetadataThirdSubject.GetName: UTF8String;
begin
  Result := GetStringProp('Name');
end;

function TKSeF2InvoiceMetadataThirdSubject.GetRole: Integer;
begin
  Result := GetIntegerProp('Role');
end;

procedure TKSeF2InvoiceMetadataThirdSubject.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Identifier');
  if O <> nil then
    FIdentifier := TKSeF2InvoiceMetadataThirdSubjectIdentifier.Create(Self, O);
end;

{ TKSeF2InvoiceMetadataThirdSubjectArray }

function TKSeF2InvoiceMetadataThirdSubjectArray.GetItem(AIndex: Integer
  ): TKSeF2InvoiceMetadataThirdSubject;
begin
  Result := TKSeF2InvoiceMetadataThirdSubject(inherited GetItem(AIndex));
end;

{ TKSeF2InvoiceMetadataAuthorizedSubject }

function TKSeF2InvoiceMetadataAuthorizedSubject.GetName: UTF8String;
begin
  Result := GetStringProp('Name');
end;

function TKSeF2InvoiceMetadataAuthorizedSubject.GetNip: UTF8String;
begin
  Result := GetStringProp('Nip');
end;

function TKSeF2InvoiceMetadataAuthorizedSubject.GetRole: Integer;
begin
  Result := GetIntegerProp('Role');
end;

function TKSeF2InvoiceMetadata.GetAcquisitionDate: TDateTime;
begin
  Result := GetDoubleProp('AcquisitionDate');
end;

function TKSeF2InvoiceMetadata.GetAcquisitionDateRaw: UTF8String;
begin
  Result := GetStringProp('AcquisitionDateRaw');
end;

function TKSeF2InvoiceMetadata.GetCurrency: UTF8String;
begin
  Result := GetStringProp('Currency');
end;

function TKSeF2InvoiceMetadata.GetGrossAmount: Double;
begin
  Result := GetDoubleProp('GrossAmount');
end;

function TKSeF2InvoiceMetadata.GetHasAttachment: Boolean;
begin
  Result := GetBooleanProp('HasAttachment');
end;

function TKSeF2InvoiceMetadata.GetHashOfCorrectedInvoice: UTF8String;
begin
  Result := GetStringProp('HashOfCorrectedInvoice');
end;

function TKSeF2InvoiceMetadata.GetInvoiceHash: UTF8String;
begin
  Result := GetStringProp('InvoiceHash');
end;

function TKSeF2InvoiceMetadata.GetInvoiceNumber: UTF8String;
begin
  Result := GetStringProp('InvoiceNumber');
end;

function TKSeF2InvoiceMetadata.GetInvoiceType: TKSeF2InvoiceType;
begin
  Result := TKSeF2InvoiceType(GetIntegerProp('InvoiceType'));
end;

function TKSeF2InvoiceMetadata.GetInvoicingDate: TDateTime;
begin
  Result := GetDoubleProp('InvoicingDate');
end;

function TKSeF2InvoiceMetadata.GetInvoicingDateRaw: UTF8String;
begin
  Result := GetStringProp('InvoicingDateRaw');
end;

function TKSeF2InvoiceMetadata.GetInvoicingMode: TKSeF2InvoicingMode;
begin
  Result := TKSeF2InvoicingMode(GetIntegerProp('InvoicingMode'));
end;

function TKSeF2InvoiceMetadata.GetIsSelfInvoicing: Boolean;
begin
  Result := GetBooleanProp('IsSelfInvoicing');
end;

function TKSeF2InvoiceMetadata.GetIssueDate: TDateTime;
begin
  Result := GetDoubleProp('IssueDate');
end;

function TKSeF2InvoiceMetadata.GetIssueDateRaw: UTF8String;
begin
  Result := GetStringProp('IssueDateRaw');
end;

function TKSeF2InvoiceMetadata.GetKsefNumber: UTF8String;
begin
  Result := GetStringProp('KsefNumber');
end;

function TKSeF2InvoiceMetadata.GetNetAmount: Double;
begin
  Result := GetDoubleProp('NetAmount');
end;

function TKSeF2InvoiceMetadata.GetPermanentStorageDate: TDateTime;
begin
  Result := GetDoubleProp('PermanentStorageDate');
end;

function TKSeF2InvoiceMetadata.GetPermanentStorageDateRaw: UTF8String;
begin
  Result := GetStringProp('PermanentStorageDateRaw');
end;

function TKSeF2InvoiceMetadata.GetVatAmount: Double;
begin
  Result := GetDoubleProp('VatAmount');
end;

procedure TKSeF2InvoiceMetadata.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Seller');
  if O <> nil then
    FSeller := TKSeF2InvoiceMetadataSeller.Create(Self, O);
  O := GetObjectProp('Buyer');
  if O <> nil then
    FBuyer := TKSeF2InvoiceMetadataBuyer.Create(Self, O);
  O := GetObjectProp('FormCode');
  if O <> nil then
    FFormCode := TKSeF2FormCode.Create(Self, O);
  O := GetObjectProp('ThirdSubjects');
  if O <> nil then
    FThirdSubjects := TKSeF2InvoiceMetadataThirdSubjectArray.Create(Self, O);
  O := GetObjectProp('AuthorizedSubject');
  if O <> nil then
    FAuthorizedSubject := TKSeF2InvoiceMetadataAuthorizedSubject.Create(Self, O);
end;

{ TKSeF2InvoiceMetadataArray }

function TKSeF2InvoiceMetadataArray.GetItem(AIndex: Integer
  ): TKSeF2InvoiceMetadata;
begin
  Result := TKSeF2InvoiceMetadata(inherited GetItem(AIndex));
end;

{ TKSeF2QueryInvoicesMetadataResponse }

function TKSeF2QueryInvoicesMetadataResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

function TKSeF2QueryInvoicesMetadataResponse.GetIsTruncated: Boolean;
begin
  Result := GetBooleanProp('IsTruncated');
end;

function TKSeF2QueryInvoicesMetadataResponse.GetPermanentStorageHwmDate: TDateTime;
begin
  Result := GetDoubleProp('PermanentStorageHwmDate');
end;

function TKSeF2QueryInvoicesMetadataResponse.GetPermanentStorageHwmDateRaw: UTF8String;
begin
  Result := GetStringProp('PermanentStorageHwmDateRaw');
end;

procedure TKSeF2QueryInvoicesMetadataResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Invoices');
  if O <> nil then
    FInvoices := TKSeF2InvoiceMetadataArray.Create(Self, O);
end;

{ TKSeF2InvoiceExportRequest }

procedure TKSeF2InvoiceExportRequest.SetEncryption(AValue: TKSeF2EncryptionInfo
  );
begin
  if FEncryption = AValue then Exit;
  if Assigned(FEncryption) and (FEncryption.Owner = Self) then
    FEncryption.Free;
  SetObjectProp('Encryption', AValue.ExtObject);
  FEncryption := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2InvoiceExportRequest.SetFilters(
  AValue: TKSeF2InvoiceQueryFilters);
begin
  if FFilters = AValue then Exit;
  if Assigned(FFilters) and (FFilters.Owner = Self) then
    FFilters.Free;
  SetObjectProp('Filters', AValue.ExtObject);
  FFilters := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2InvoiceExportRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Encryption');
  if O <> nil then
    FEncryption := TKSeF2EncryptionInfo.Create(Self, O);
  O := GetObjectProp('Filters');
  if O <> nil then
    FFilters := TKSeF2InvoiceQueryFilters.Create(Self, O);
end;

{ TKSeF2ExportInvoicesResponse }

function TKSeF2ExportInvoicesResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

{ TKSeF2InvoicePackagePart }

function TKSeF2InvoicePackagePart.GetEncryptedPartHash: UTF8String;
begin
  Result := GetStringProp('EncryptedPartHash');
end;

function TKSeF2InvoicePackagePart.GetEncryptedPartSize: Int64;
begin
  Result := GetInt64Prop('EncryptedPartSize');
end;

function TKSeF2InvoicePackagePart.GetExpirationDate: TDateTime;
begin
  Result := GetDoubleProp('ExpirationDate');
end;

function TKSeF2InvoicePackagePart.GetExpirationDateRaw: UTF8String;
begin
  Result := GetStringProp('ExpirationDateRaw');
end;

function TKSeF2InvoicePackagePart.GetMethod: UTF8String;
begin
  Result := GetStringProp('Method');
end;

function TKSeF2InvoicePackagePart.GetOrdinalNumber: Integer;
begin
  Result := GetIntegerProp('OrdinalNumber');
end;

function TKSeF2InvoicePackagePart.GetPartHash: UTF8String;
begin
  Result := GetStringProp('PartHash');
end;

function TKSeF2InvoicePackagePart.GetPartName: UTF8String;
begin
  Result := GetStringProp('PartName');
end;

function TKSeF2InvoicePackagePart.GetPartSize: Int64;
begin
  Result := GetInt64Prop('PartSize');
end;

function TKSeF2InvoicePackagePart.GetPermanentStorageHwmDate: TDateTime;
begin
  Result := GetDoubleProp('PermanentStorageHwmDate');
end;

function TKSeF2InvoicePackagePart.GetPermanentStorageHwmDateRaw: UTF8String;
begin
  Result := GetStringProp('PermanentStorageHwmDateRaw');
end;

function TKSeF2InvoicePackagePart.GetUrl: UTF8String;
begin
  Result := GetStringProp('Url');
end;

{ TKSeF2InvoicePackagePartArray }

function TKSeF2InvoicePackagePartArray.GetItem(AIndex: Integer
  ): TKSeF2InvoicePackagePart;
begin
  Result := TKSeF2InvoicePackagePart(inherited GetItem(AIndex));
end;

function TKSeF2InvoicePackage.GetInvoiceCount: Int64;
begin
  Result := GetInt64Prop('InvoiceCount');
end;

function TKSeF2InvoicePackage.GetIsTruncated: Boolean;
begin
  Result := GetBooleanProp('IsTruncated');
end;

function TKSeF2InvoicePackage.GetLastInvoicingDate: TDateTime;
begin
  Result := GetDoubleProp('LastInvoicingDate');
end;

function TKSeF2InvoicePackage.GetLastInvoicingDateRaw: UTF8String;
begin
  Result := GetStringProp('LastInvoicingDateRaw');
end;

function TKSeF2InvoicePackage.GetLastIssueDate: TDate;
begin
  Result := GetDoubleProp('LastIssueDate');
end;

function TKSeF2InvoicePackage.GetLastIssueDateRaw: UTF8String;
begin
  Result := GetStringProp('LastIssueDateRaw');
end;

function TKSeF2InvoicePackage.GetLastPermanentStorageDate: TDateTime;
begin
  Result := GetDoubleProp('LastPermanentStorageDate');
end;

function TKSeF2InvoicePackage.GetLastPermanentStorageDateRaw: UTF8String;
begin
  Result := GetStringProp('LastPermanentStorageDateRaw');
end;

function TKSeF2InvoicePackage.GetSize: Int64;
begin
  Result := GetInt64Prop('Size');
end;

procedure TKSeF2InvoicePackage.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Parts');
  if O <> nil then
    FParts := TKSeF2InvoicePackagePartArray.Create(Self, O);
end;

{ TKSeF2InvoiceExportStatusResponse }

function TKSeF2InvoiceExportStatusResponse.GetCompletedDate: TDateTime;
begin
  Result := GetDoubleProp('CompletedDate');
end;

function TKSeF2InvoiceExportStatusResponse.GetCompletedDateRaw: UTF8String;
begin
  Result := GetStringProp('CompletedDateRaw');
end;

function TKSeF2InvoiceExportStatusResponse.GetPackageExpirationDate: TDateTime;
begin
  Result := GetDoubleProp('PackageExpirationDate');
end;

function TKSeF2InvoiceExportStatusResponse.GetPackageExpirationDateRaw: UTF8String;
begin
  Result := GetStringProp('PackageExpirationDateRaw');
end;

procedure TKSeF2InvoiceExportStatusResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Status');
  if O <> nil then
    FStatus := TKSeF2StatusInfo.Create(Self, O);
  O := GetObjectProp('Package');
  if O <> nil then
    FPackage := TKSeF2InvoicePackage.Create(Self, O);
end;

{ TKSeF2GenerateTokenRequest }

function TKSeF2GenerateTokenRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2GenerateTokenRequest.GetPermissions: TKSeF2TokenPermissions;
begin
  Int32ToSet(GetIntegerProp('PermissionsInt'), Ord(High(TKSeF2TokenPermissionType)), SizeOf(Result), @Result);
end;

procedure TKSeF2GenerateTokenRequest.SetDescription(AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2GenerateTokenRequest.SetPermissions(
  AValue: TKSeF2TokenPermissions);
begin
  SetIntegerProp('PermissionsInt', SetToInt32(@AValue, Ord(High(TKSeF2TokenPermissionType)), SizeOf(AValue)));
end;

{ TKSeF2GenerateTokenResponse }

function TKSeF2GenerateTokenResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeF2GenerateTokenResponse.GetToken: UTF8String;
begin
  Result := GetStringProp('Token');
end;

{ TKSeF2TokenAuthorIdentifierTypeIdentifier }

function TKSeF2TokenAuthorIdentifierTypeIdentifier.GetType: TKSeF2TokenAuthorIdentifierType;
begin
  Result := TKSeF2TokenAuthorIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2TokenAuthorIdentifierTypeIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

{ TKSeF2TokenContextIdentifierTypeIdentifier }

function TKSeF2TokenContextIdentifierTypeIdentifier.GetType: TKSeF2TokenContextIdentifierType;
begin
  Result := TKSeF2TokenContextIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2TokenContextIdentifierTypeIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

{ TKSeF2QueryTokensResponseItem }

function TKSeF2QueryTokensResponseItem.GetDateCreated: TDateTime;
begin
  Result := GetDoubleProp('DateCreated');
end;

function TKSeF2QueryTokensResponseItem.GetDateCreatedRaw: UTF8String;
begin
  Result := GetStringProp('DateCreatedRaw');
end;

function TKSeF2QueryTokensResponseItem.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2QueryTokensResponseItem.GetLastUseDate: TDateTime;
begin
  Result := GetDoubleProp('LastUseDate');
end;

function TKSeF2QueryTokensResponseItem.GetLastUseDateRaw: UTF8String;
begin
  Result := GetStringProp('LastUseDateRaw');
end;

function TKSeF2QueryTokensResponseItem.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeF2QueryTokensResponseItem.GetRequestedPermissions: TKSeF2TokenPermissions;
begin
  Int32ToSet(GetIntegerProp('RequestedPermissionsInt'), Ord(High(TKSeF2TokenPermissionType)), SizeOf(Result), @Result);
end;

function TKSeF2QueryTokensResponseItem.GetStatus: TKSeF2AuthenticationTokenStatus;
begin
  Result := TKSeF2AuthenticationTokenStatus(GetIntegerProp('Status'));
end;

function TKSeF2QueryTokensResponseItem.GetStatusDetails: UTF8String;
begin
  Result := GetStringProp('StatusDetails');
end;

procedure TKSeF2QueryTokensResponseItem.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorIdentifier');
  if O <> nil then
    FAuthorIdentifier := TKSeF2TokenAuthorIdentifierTypeIdentifier.Create(Self, O);
  O := GetObjectProp('ContextIdentifier');
  if O <> nil then
    FContextIdentifier := TKSeF2TokenContextIdentifierTypeIdentifier.Create(Self, O);
end;

{ TKSeF2QueryTokensResponseArray }

function TKSeF2QueryTokensResponseArray.GetItem(AIndex: Integer
  ): TKSeF2QueryTokensResponseItem;
begin
  Result := TKSeF2QueryTokensResponseItem(inherited GetItem(AIndex));
end;

function TKSeF2QueryTokensResponse.GetContinuationToken: UTF8String;
begin
  Result := GetStringProp('ContinuationToken');
end;

procedure TKSeF2QueryTokensResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Tokens');
  if O <> nil then
    FTokens := TKSeF2QueryTokensResponseArray.Create(Self, O);
end;

{ TKSeF2TokenStatusResponse }

function TKSeF2TokenStatusResponse.GetDateCreated: TDateTime;
begin
  Result := GetDoubleProp('DateCreated');
end;

function TKSeF2TokenStatusResponse.GetDateCreatedRaw: UTF8String;
begin
  Result := GetStringProp('DateCreatedRaw');
end;

function TKSeF2TokenStatusResponse.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2TokenStatusResponse.GetLastUseDate: TDateTime;
begin
  Result := GetDoubleProp('LastUseDate');
end;

function TKSeF2TokenStatusResponse.GetLastUseDateRaw: UTF8String;
begin
  Result := GetStringProp('LastUseDateRaw');
end;

function TKSeF2TokenStatusResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeF2TokenStatusResponse.GetRequestedPermissions: TKSeF2TokenPermissions;
begin
  Int32ToSet(GetIntegerProp('RequestedPermissionsInt'), Ord(High(TKSeF2TokenPermissionType)), SizeOf(Result), @Result);
end;

function TKSeF2TokenStatusResponse.GetStatus: TKSeF2AuthenticationTokenStatus;
begin
  Result := TKSeF2AuthenticationTokenStatus(GetIntegerProp('Status'));
end;

function TKSeF2TokenStatusResponse.GetStatusDetails: UTF8String;
begin
  Result := GetStringProp('StatusDetailsStr');
end;

procedure TKSeF2TokenStatusResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorIdentifier');
  if O <> nil then
    FAuthorIdentifier := TKSeF2TokenAuthorIdentifierTypeIdentifier.Create(Self, O);
  O := GetObjectProp('ContextIdentifier');
  if O <> nil then
    FContextIdentifier := TKSeF2TokenContextIdentifierTypeIdentifier.Create(Self, O);
end;

{ TKSeF2Subunit }

function TKSeF2Subunit.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2Subunit.GetSubjectNip: UTF8String;
begin
  Result := GetStringProp('SubjectNip');
end;

procedure TKSeF2Subunit.SetDescription(AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2Subunit.SetSubjectNip(AValue: UTF8String);
begin
  SetStringProp('SubjectNip', AValue);
end;

{ TKSeF2SubunitArray }

function TKSeF2SubunitArray.GetItem(AIndex: Integer): TKSeF2Subunit;
begin
  Result := TKSeF2Subunit(inherited GetItem(AIndex));
end;

{ TKSeF2SubjectCreateRequest }

function TKSeF2SubjectCreateRequest.GetCreatedDate: TDateTime;
begin
  Result := GetDoubleProp('CreatedDate');
end;

function TKSeF2SubjectCreateRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2SubjectCreateRequest.GetSubjectNip: UTF8String;
begin
  Result := GetStringProp('SubjectNip');
end;

function TKSeF2SubjectCreateRequest.GetSubjectType: TKSeF2SubjectType;
begin
  Result := TKSeF2SubjectType(GetIntegerProp('SubjectType'));
end;

procedure TKSeF2SubjectCreateRequest.SetCreatedDate(AValue: TDateTime);
begin
  SetDoubleProp('CreatedDate', AValue);
end;

procedure TKSeF2SubjectCreateRequest.SetDescription(AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2SubjectCreateRequest.SetSubjectNip(AValue: UTF8String);
begin
  SetStringProp('SubjectNip', AValue);
end;

procedure TKSeF2SubjectCreateRequest.SetSubjectType(AValue: TKSeF2SubjectType);
begin
  SetIntegerProp('SubjectType', Ord(AValue));
end;

procedure TKSeF2SubjectCreateRequest.SetSubunits(AValue: TKSeF2SubunitArray);
begin
  if AValue = FSubunits then Exit;
  if Assigned(FSubunits) and (FSubunits.Owner = Self) then
    FSubunits.Free;
  SetObjectProp('Subunits', AValue.ExtObject);
  FSubunits := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2SubjectCreateRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Subunits');
  if O <> nil then
    FSubunits := TKSeF2SubunitArray.Create(Self, O);
end;

{ TKSeF2PersonCreateRequest }

function TKSeF2PersonCreateRequest.GetCreatedDate: TDateTime;
begin
  Result := GetDoubleProp('CreatedDate');
end;

function TKSeF2PersonCreateRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2PersonCreateRequest.GetIsBailiff: Boolean;
begin
  Result := GetBooleanProp('IsBailiff');
end;

function TKSeF2PersonCreateRequest.GetNip: UTF8String;
begin
  Result := GetStringProp('Nip');
end;

function TKSeF2PersonCreateRequest.GetPesel: UTF8String;
begin
  Result := GetStringProp('Pesel');
end;

procedure TKSeF2PersonCreateRequest.SetCreatedDate(AValue: TDateTime);
begin
  SetDoubleProp('CreatedDate', AValue);
end;

procedure TKSeF2PersonCreateRequest.SetDescription(AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2PersonCreateRequest.SetIsBailiff(AValue: Boolean);
begin
  SetBooleanProp('IsBailiff', AValue);
end;

procedure TKSeF2PersonCreateRequest.SetNip(AValue: UTF8String);
begin
  SetStringProp('Nip', AValue);
end;

procedure TKSeF2PersonCreateRequest.SetPesel(AValue: UTF8String);
begin
  SetStringProp('Pesel', AValue);
end;

{ TKSeF2PersonPermissionsSubjectIdentifier }

function TKSeF2PersonPermissionsSubjectIdentifier.GetType: TKSeF2PersonPermissionsSubjectIdentifierType;
begin
  Result := TKSeF2PersonPermissionsSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2PersonPermissionsSubjectIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2PersonPermissionsSubjectIdentifier.SetType(
  AValue: TKSeF2PersonPermissionsSubjectIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2PersonPermissionsSubjectIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2PersonDetails }

function TKSeF2PersonDetails.GetFirstName: UTF8String;
begin
  Result := GetStringProp('FirstName');
end;

function TKSeF2PersonDetails.GetLastName: UTF8String;
begin
  Result := GetStringProp('LastName');
end;

procedure TKSeF2PersonDetails.SetFirstName(AValue: UTF8String);
begin
  SetStringProp('FirstName', AValue);
end;

procedure TKSeF2PersonDetails.SetLastName(AValue: UTF8String);
begin
  SetStringProp('LastName', AValue);
end;

{ TKSeF2PersonIdentifier }

function TKSeF2PersonIdentifier.GetType: TKSeF2PersonIdentifierType;
begin
  Result := TKSeF2PersonIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2PersonIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2PersonIdentifier.SetType(AValue: TKSeF2PersonIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2PersonIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2IdDocument }

function TKSeF2IdDocument.GetCountry: UTF8String;
begin
  Result := GetStringProp('Country');
end;

function TKSeF2IdDocument.GetNumber: UTF8String;
begin
  Result := GetStringProp('Number');
end;

function TKSeF2IdDocument.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

procedure TKSeF2IdDocument.SetCountry(AValue: UTF8String);
begin
  SetStringProp('Country', AValue);
end;

procedure TKSeF2IdDocument.SetNumber(AValue: UTF8String);
begin
  SetStringProp('Number', AValue);
end;

procedure TKSeF2IdDocument.SetType(AValue: UTF8String);
begin
  SetStringProp('Type', AValue);
end;

{ TKSeF2PersonByFingerprintWithIdentifierDetails }

procedure TKSeF2PersonByFingerprintWithIdentifierDetails.SetIdentifier(
  AValue: TKSeF2PersonIdentifier);
begin
  if FIdentifier = AValue then Exit;
  if Assigned(FIdentifier) and (FIdentifier.Owner = Self) then
    FIdentifier.Free;
  SetObjectProp('Identifier', AValue.ExtObject);
  FIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonByFingerprintWithIdentifierDetails.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Identifier');
  if O <> nil then
    FIdentifier := TKSeF2PersonIdentifier.Create(Self, O);
end;

{ TKSeF2PersonByFingerprintWithoutIdentifierDetails }

procedure TKSeF2PersonByFingerprintWithoutIdentifierDetails.SetIdDocument(
  AValue: TKSeF2IdDocument);
begin
  if FIdDocument = AValue then Exit;
  if Assigned(FIdDocument) and (FIdDocument.Owner = Self) then
    FIdDocument.Free;
  SetObjectProp('IdDocument', AValue.ExtObject);
  FIdDocument := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

function TKSeF2PersonByFingerprintWithoutIdentifierDetails.GetBirthDate: TDate;
begin
  Result := GetDoubleProp('BirthDate');
end;

procedure TKSeF2PersonByFingerprintWithoutIdentifierDetails.SetBirthDate(
  AValue: TDate);
begin
  SetDoubleProp('BirthDate', AValue);
end;

procedure TKSeF2PersonByFingerprintWithoutIdentifierDetails.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('IdDocument');
  if O <> nil then
    FIdDocument := TKSeF2IdDocument.Create(Self, O);
end;

{ TKSeF2PersonPermissionSubjectDetails }

function TKSeF2PersonPermissionSubjectDetails.GetSubjectDetailsType: TKSeF2PersonPermissionSubjectDetailsType;
begin
  Result := TKSeF2PersonPermissionSubjectDetailsType(GetIntegerProp('SubjectDetailsType'));
end;

procedure TKSeF2PersonPermissionSubjectDetails.SetPersonByFpNoId(
  AValue: TKSeF2PersonByFingerprintWithoutIdentifierDetails);
begin
  if FPersonByFpNoId = AValue then Exit;
  if Assigned(FPersonByFpNoId) and (FPersonByFpNoId.Owner = Self) then
    FPersonByFpNoId.Free;
  SetObjectProp('PersonByFpNoId', AValue.ExtObject);
  FPersonByFpNoId := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonPermissionSubjectDetails.SetPersonByFpWithId(
  AValue: TKSeF2PersonByFingerprintWithIdentifierDetails);
begin
  if FPersonByFpWithId = AValue then Exit;
  if Assigned(FPersonByFpWithId) and (FPersonByFpWithId.Owner = Self) then
    FPersonByFpWithId.Free;
  SetObjectProp('PersonByFpWithId', AValue.ExtObject);
  FPersonByFpWithId := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonPermissionSubjectDetails.SetPersonById(
  AValue: TKSeF2PersonDetails);
begin
  if FPersonById = AValue then Exit;
  if Assigned(FPersonById) and (FPersonById.Owner = Self) then
    FPersonById.Free;
  SetObjectProp('PersonById', AValue.ExtObject);
  FPersonById := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonPermissionSubjectDetails.SetSubjectDetailsType(
  AValue: TKSeF2PersonPermissionSubjectDetailsType);
begin
  SetIntegerProp('SubjectDetailsType', Ord(AValue));
end;

procedure TKSeF2PersonPermissionSubjectDetails.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('PersonById');
  if O <> nil then
    FPersonById := TKSeF2PersonDetails.Create(Self, O);
  O := GetObjectProp('PersonByFpWithId');
  if O <> nil then
    FPersonByFpWithId := TKSeF2PersonByFingerprintWithIdentifierDetails.Create(Self, O);
  O := GetObjectProp('PersonByFpNoId');
  if O <> nil then
    FPersonByFpNoId := TKSeF2PersonByFingerprintWithoutIdentifierDetails.Create(Self, O);
end;

{ TKSeF2PersonPermissionsGrantRequest }

function TKSeF2PersonPermissionsGrantRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2PersonPermissionsGrantRequest.GetPermissions: TKSeF2PersonPermissionTypes;
begin
  Result := [];
  Int32ToSet(GetIntegerProp('Permissions'), Ord(High(TKSeF2PersonPermissionType)), SizeOf(Result), @Result);
end;

procedure TKSeF2PersonPermissionsGrantRequest.SetDescription(AValue: UTF8String
  );
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2PersonPermissionsGrantRequest.SetPermissions(
  AValue: TKSeF2PersonPermissionTypes);
begin
  SetIntegerProp('Permissions', SetToInt32(@AValue, Ord(High(TKSeF2PersonPermissionType)), SizeOf(AValue)));
end;

procedure TKSeF2PersonPermissionsGrantRequest.SetSubjectDetails(
  AValue: TKSeF2PersonPermissionSubjectDetails);
begin
  if FSubjectDetails = AValue then Exit;
  if Assigned(FSubjectDetails) and (FSubjectDetails.Owner = Self) then
    FSubjectDetails.Free;
  SetObjectProp('SubjectDetails', AValue.ExtObject);
  FSubjectDetails := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonPermissionsGrantRequest.SetSubjectIdentifier(
  AValue: TKSeF2PersonPermissionsSubjectIdentifier);
begin
  if FSubjectIdentifier = AValue then Exit;
  if Assigned(FSubjectIdentifier) and (FSubjectIdentifier.Owner = Self) then
    FSubjectIdentifier.Free;
  SetObjectProp('SubjectIdentifier', AValue.ExtObject);
  FSubjectIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonPermissionsGrantRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubjectIdentifier');
  if O <> nil then
    FSubjectIdentifier := TKSeF2PersonPermissionsSubjectIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectDetails');
  if O <> nil then
    FSubjectDetails := TKSeF2PersonPermissionSubjectDetails.Create(Self, O);
end;

{ TKSeF2PermissionsOperationResponse }

function TKSeF2PermissionsOperationResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

{ TKSeF2EntityPermissionsSubjectIdentifier }

function TKSeF2EntityPermissionsSubjectIdentifier.GetType: TKSeF2EntityPermissionsSubjectIdentifierType;
begin
  Result := TKSeF2EntityPermissionsSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EntityPermissionsSubjectIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EntityPermissionsSubjectIdentifier.SetType(
  AValue: TKSeF2EntityPermissionsSubjectIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EntityPermissionsSubjectIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

function TKSeF2EntityPermission.GetCanDelegate: Boolean;
begin
  Result := GetBooleanProp('CanDelegate');
end;

function TKSeF2EntityPermission.GetType: TKSeF2EntityPermissionType;
begin
  Result := TKSeF2EntityPermissionType(GetIntegerProp('Type'));
end;

procedure TKSeF2EntityPermission.SetCanDelegate(AValue: Boolean);
begin
  SetBooleanProp('Value', AValue);
end;

procedure TKSeF2EntityPermission.SetType(AValue: TKSeF2EntityPermissionType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

{ TKSeF2EntityPermissionArray }

function TKSeF2EntityPermissionArray.GetItem(AIndex: Integer
  ): TKSeF2EntityPermission;
begin
  Result := TKSeF2EntityPermission(inherited GetItem(AIndex));
end;

{ TKSeF2EntityDetails }

function TKSeF2EntityDetails.GetFullName: UTF8String;
begin
  Result := GetStringProp('FullName');
end;

procedure TKSeF2EntityDetails.SetFullName(AValue: UTF8String);
begin
  SetStringProp('FullName', AValue);
end;

{ TKSeF2EntityPermissionsGrantRequest }

function TKSeF2EntityPermissionsGrantRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

procedure TKSeF2EntityPermissionsGrantRequest.SetDescription(AValue: UTF8String
  );
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2EntityPermissionsGrantRequest.SetPermissions(
  AValue: TKSeF2EntityPermissionArray);
begin
  if FPermissions = AValue then Exit;
  if Assigned(FPermissions) and (FPermissions.Owner = Self) then
    FPermissions.Free;
  SetObjectProp('Permissions', AValue.ExtObject);
  FPermissions := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EntityPermissionsGrantRequest.SetSubjectDetails(
  AValue: TKSeF2EntityDetails);
begin
  if FSubjectDetails = AValue then Exit;
  if Assigned(FSubjectDetails) and (FSubjectDetails.Owner = Self) then
    FSubjectDetails.Free;
  SetObjectProp('SubjectDetails', AValue.ExtObject);
  FSubjectDetails := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EntityPermissionsGrantRequest.SetSubjectIdentifier(
  AValue: TKSeF2EntityPermissionsSubjectIdentifier);
begin
  if FSubjectIdentifier = AValue then Exit;
  if Assigned(FSubjectIdentifier) and (FSubjectIdentifier.Owner = Self) then
    FSubjectIdentifier.Free;
  SetObjectProp('SubjectIdentifier', AValue.ExtObject);
  FSubjectIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EntityPermissionsGrantRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubjectIdentifier');
  if O <> nil then
    FSubjectIdentifier := TKSeF2EntityPermissionsSubjectIdentifier.Create(Self, O);
  O := GetObjectProp('Permissions');
  if O <> nil then
    FPermissions := TKSeF2EntityPermissionArray.Create(Self, O);
  O := GetObjectProp('SubjectDetails');
  if O <> nil then
    FSubjectDetails := TKSeF2EntityDetails.Create(Self, O);
end;

{ TKSeF2EntityAuthorizationPermissionsSubjectIdentifier }

function TKSeF2EntityAuthorizationPermissionsSubjectIdentifier.GetType: TKSeF2EntityAuthorizationPermissionsSubjectIdentifierType;
begin
  Result := TKSeF2EntityAuthorizationPermissionsSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EntityAuthorizationPermissionsSubjectIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EntityAuthorizationPermissionsSubjectIdentifier.SetType(
  AValue: TKSeF2EntityAuthorizationPermissionsSubjectIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EntityAuthorizationPermissionsSubjectIdentifier.SetValue(
  AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2EntityAuthorizationPermissionsGrantRequest }

function TKSeF2EntityAuthorizationPermissionsGrantRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2EntityAuthorizationPermissionsGrantRequest.GetPermission: TKSeF2EntityAuthorizationPermissionType;
begin
  Result := TKSeF2EntityAuthorizationPermissionType(GetIntegerProp('Permission'));
end;

procedure TKSeF2EntityAuthorizationPermissionsGrantRequest.SetDescription(
  AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2EntityAuthorizationPermissionsGrantRequest.SetPermission(
  AValue: TKSeF2EntityAuthorizationPermissionType);
begin
  SetIntegerProp('Permission', Ord(AValue));
end;

procedure TKSeF2EntityAuthorizationPermissionsGrantRequest.SetSubjectDetails(
  AValue: TKSeF2EntityDetails);
begin
  if FSubjectDetails = AValue then Exit;
  if Assigned(FSubjectDetails) and (FSubjectDetails.Owner = Self) then
    FSubjectDetails.Free;
  SetObjectProp('SubjectDetails', AValue.ExtObject);
  FSubjectDetails := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EntityAuthorizationPermissionsGrantRequest.SetSubjectIdentifier(
  AValue: TKSeF2EntityAuthorizationPermissionsSubjectIdentifier);
begin
  if FSubjectIdentifier = AValue then Exit;
  if Assigned(FSubjectIdentifier) and (FSubjectIdentifier.Owner = Self) then
    FSubjectIdentifier.Free;
  SetObjectProp('SubjectIdentifier', AValue.ExtObject);
  FSubjectIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EntityAuthorizationPermissionsGrantRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubjectIdentifier');
  if O <> nil then
    FSubjectIdentifier := TKSeF2EntityAuthorizationPermissionsSubjectIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectDetails');
  if O <> nil then
    FSubjectDetails := TKSeF2EntityDetails.Create(Self, O);
end;

{ TKSeF2IndirectPermissionsSubjectIdentifier }

function TKSeF2IndirectPermissionsSubjectIdentifier.GetType: TKSeF2IndirectPermissionsSubjectIdentifierType;
begin
  Result := TKSeF2IndirectPermissionsSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2IndirectPermissionsSubjectIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2IndirectPermissionsSubjectIdentifier.SetType(
  AValue: TKSeF2IndirectPermissionsSubjectIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2IndirectPermissionsSubjectIdentifier.SetValue(AValue: UTF8String
  );
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2IndirectPermissionsTargetIdentifier }

function TKSeF2IndirectPermissionsTargetIdentifier.GetType: TKSeF2IndirectPermissionsTargetIdentifierType;
begin
  Result := TKSeF2IndirectPermissionsTargetIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2IndirectPermissionsTargetIdentifier.GetValue: String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2IndirectPermissionsTargetIdentifier.SetType(
  AValue: TKSeF2IndirectPermissionsTargetIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2IndirectPermissionsTargetIdentifier.SetValue(AValue: String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2IndirectPermissionsGrantRequest }

function TKSeF2IndirectPermissionsGrantRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2IndirectPermissionsGrantRequest.GetPermissions: TKSeF2IndirectPermissionTypes;
begin
  Result := [];
  Int32ToSet(GetIntegerProp('Permissions'), Ord(High(TKSeF2IndirectPermissionType)), SizeOf(Result), @Result);
end;

procedure TKSeF2IndirectPermissionsGrantRequest.SetDescription(
  AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2IndirectPermissionsGrantRequest.SetPermissions(
  AValue: TKSeF2IndirectPermissionTypes);
begin
  SetIntegerProp('Permissions', SetToInt32(@AValue, Ord(High(TKSeF2IndirectPermissionTypes)), SizeOf(AValue)));
end;

procedure TKSeF2IndirectPermissionsGrantRequest.SetSubjectDetails(
  AValue: TKSeF2PersonPermissionSubjectDetails);
begin
  if FSubjectDetails = AValue then Exit;
  if Assigned(FSubjectDetails) and (FSubjectDetails.Owner = Self) then
    FSubjectDetails.Free;
  SetObjectProp('SubjectDetails', AValue.ExtObject);
  FSubjectDetails := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2IndirectPermissionsGrantRequest.SetSubjectIdentifier(
  AValue: TKSeF2IndirectPermissionsSubjectIdentifier);
begin
  if FSubjectIdentifier = AValue then Exit;
  if Assigned(FSubjectIdentifier) and (FSubjectIdentifier.Owner = Self) then
    FSubjectIdentifier.Free;
  SetObjectProp('SubjectIdentifier', AValue.ExtObject);
  FSubjectIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2IndirectPermissionsGrantRequest.SetTargetIdentifier(
  AValue: TKSeF2IndirectPermissionsTargetIdentifier);
begin
  if FTargetIdentifier = AValue then Exit;
  if Assigned(FTargetIdentifier) and (FTargetIdentifier.Owner = Self) then
    FTargetIdentifier.Free;
  SetObjectProp('TargetIdentifier', AValue.ExtObject);
  FTargetIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2IndirectPermissionsGrantRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubjectIdentifier');
  if O <> nil then
    FSubjectIdentifier := TKSeF2IndirectPermissionsSubjectIdentifier.Create(Self, O);
  O := GetObjectProp('TargetIdentifier');
  if O <> nil then
    FTargetIdentifier := TKSeF2IndirectPermissionsTargetIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectDetails');
  if O <> nil then
    FSubjectDetails := TKSeF2PersonPermissionSubjectDetails.Create(Self, O);
end;

{ TKSeF2SubunitPermissionsSubjectIdentifier }

function TKSeF2SubunitPermissionsSubjectIdentifier.GetType: TKSeF2SubunitPermissionsSubjectIdentifierType;
begin
  Result := TKSeF2SubunitPermissionsSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2SubunitPermissionsSubjectIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2SubunitPermissionsSubjectIdentifier.SetType(
  AValue: TKSeF2SubunitPermissionsSubjectIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2SubunitPermissionsSubjectIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2SubunitPermissionsContextIdentifier }

function TKSeF2SubunitPermissionsContextIdentifier.GetType: TKSeF2SubunitPermissionsContextIdentifierType;
begin
  Result := TKSeF2SubunitPermissionsContextIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2SubunitPermissionsContextIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2SubunitPermissionsContextIdentifier.SetType(
  AValue: TKSeF2SubunitPermissionsContextIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2SubunitPermissionsContextIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2SubunitPermissionsGrantRequest }

function TKSeF2SubunitPermissionsGrantRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2SubunitPermissionsGrantRequest.GetSubunitName: UTF8String;
begin
  Result := GetStringProp('SubunitName');
end;

procedure TKSeF2SubunitPermissionsGrantRequest.SetContextIdentifier(
  AValue: TKSeF2SubunitPermissionsContextIdentifier);
begin
  if FContextIdentifier = AValue then Exit;
  if Assigned(FContextIdentifier) and (FContextIdentifier.Owner = Self) then
    FContextIdentifier.Free;
  SetObjectProp('ContextIdentifier', AValue.ExtObject);
  FContextIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2SubunitPermissionsGrantRequest.SetDescription(AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2SubunitPermissionsGrantRequest.SetSubjectDetails(
  AValue: TKSeF2PersonPermissionSubjectDetails);
begin
  if FSubjectDetails = AValue then Exit;
  if Assigned(FSubjectDetails) and (FSubjectDetails.Owner = Self) then
    FSubjectDetails.Free;
  SetObjectProp('SubjectDetails', AValue.ExtObject);
  FSubjectDetails := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2SubunitPermissionsGrantRequest.SetSubjectIdentifier(
  AValue: TKSeF2SubunitPermissionsSubjectIdentifier);
begin
  if FSubjectIdentifier = AValue then Exit;
  if Assigned(FSubjectIdentifier) and (FSubjectIdentifier.Owner = Self) then
    FSubjectIdentifier.Free;
  SetObjectProp('SubjectIdentifier', AValue.ExtObject);
  FSubjectIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2SubunitPermissionsGrantRequest.SetSubunitName(AValue: UTF8String);
begin
  SetStringProp('SubunitName', AValue);
end;

procedure TKSeF2SubunitPermissionsGrantRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubjectIdentifier');
  if O <> nil then
    FSubjectIdentifier := TKSeF2SubunitPermissionsSubjectIdentifier.Create(Self, O);
  O := GetObjectProp('ContextIdentifier');
  if O <> nil then
    FContextIdentifier := TKSeF2SubunitPermissionsContextIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectDetails');
  if O <> nil then
    FSubjectDetails := TKSeF2PersonPermissionSubjectDetails.Create(Self, O);
end;

{ TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier }

function TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier.GetType: TKSeF2EuEntityAdministrationPermissionsSubjectIdentifierType;
begin
  Result := TKSeF2EuEntityAdministrationPermissionsSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier.SetType(
  AValue: TKSeF2EuEntityAdministrationPermissionsSubjectIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier.SetValue(
  AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2EuEntityAdministrationPermissionsContextIdentifier }

function TKSeF2EuEntityAdministrationPermissionsContextIdentifier.GetType: TKSeF2EuEntityAdministrationPermissionsContextIdentifierType;
begin
  Result := TKSeF2EuEntityAdministrationPermissionsContextIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EuEntityAdministrationPermissionsContextIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EuEntityAdministrationPermissionsContextIdentifier.SetType(
  AValue: TKSeF2EuEntityAdministrationPermissionsContextIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EuEntityAdministrationPermissionsContextIdentifier.SetValue(
  AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2EntityByFingerprintDetails }

function TKSeF2EntityByFingerprintDetails.GetAddress: UTF8String;
begin
  Result := GetStringProp('Address');
end;

function TKSeF2EntityByFingerprintDetails.GetFullName: UTF8String;
begin
  Result := GetStringProp('FullName');
end;

procedure TKSeF2EntityByFingerprintDetails.SetAddress(AValue: UTF8String);
begin
  SetStringProp('Address', AValue);
end;

procedure TKSeF2EntityByFingerprintDetails.SetFullName(AValue: UTF8String);
begin
  SetStringProp('FullName', AValue);
end;

{ TKSeF2EuEntityPermissionSubjectDetails }

function TKSeF2EuEntityPermissionSubjectDetails.GetSubjectDetailsType: TKSeF2EuEntityPermissionSubjectDetailsType;
begin
  Result := TKSeF2EuEntityPermissionSubjectDetailsType(GetIntegerProp('SubjectDetailsType'));
end;

procedure TKSeF2EuEntityPermissionSubjectDetails.SetEntityByFp(
  AValue: TKSeF2EntityByFingerprintDetails);
begin
  if FEntityByFp = AValue then Exit;
  if Assigned(FEntityByFp) and (FEntityByFp.Owner = Self) then
    FEntityByFp.Free;
  SetObjectProp('EntityByFp', AValue.ExtObject);
  FEntityByFp := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EuEntityPermissionSubjectDetails.SetPersonByFpNoId(
  AValue: TKSeF2PersonByFingerprintWithoutIdentifierDetails);
begin
  if FPersonByFpNoId = AValue then Exit;
  if Assigned(FPersonByFpNoId) and (FPersonByFpNoId.Owner = Self) then
    FPersonByFpNoId.Free;
  SetObjectProp('PersonByFpNoId', AValue.ExtObject);
  FPersonByFpNoId := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EuEntityPermissionSubjectDetails.SetPersonByFpWithId(
  AValue: TKSeF2PersonByFingerprintWithIdentifierDetails);
begin
  if FPersonByFpWithId = AValue then Exit;
  if Assigned(FPersonByFpWithId) and (FPersonByFpWithId.Owner = Self) then
    FPersonByFpWithId.Free;
  SetObjectProp('PersonByFpWithId', AValue.ExtObject);
  FPersonByFpWithId := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EuEntityPermissionSubjectDetails.SetSubjectDetailsType(
  AValue: TKSeF2EuEntityPermissionSubjectDetailsType);
begin
  SetIntegerProp('SubjectDetailsType', Ord(AValue));
end;

procedure TKSeF2EuEntityPermissionSubjectDetails.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('PersonByFpWithId');
  if O <> nil then
    FPersonByFpWithId := TKSeF2PersonByFingerprintWithIdentifierDetails.Create(Self, O);
  O := GetObjectProp('ContextIdentifier');
  if O <> nil then
    FPersonByFpNoId := TKSeF2PersonByFingerprintWithoutIdentifierDetails.Create(Self, O);
  O := GetObjectProp('EntityByFp');
  if O <> nil then
    FEntityByFp := TKSeF2EntityByFingerprintDetails.Create(Self, O);
end;

{ TKSeF2EuEntityDetails }

function TKSeF2EuEntityDetails.GetAddress: UTF8String;
begin
  Result := GetStringProp('Address');
end;

function TKSeF2EuEntityDetails.GetFullName: UTF8String;
begin
  Result := GetStringProp('FullName');
end;

procedure TKSeF2EuEntityDetails.SetAddress(AValue: UTF8String);
begin
  SetStringProp('Address', AValue);
end;

procedure TKSeF2EuEntityDetails.SetFullName(AValue: UTF8String);
begin
  SetStringProp('FullName', AValue);
end;

{ TKSeF2EuEntityAdministrationPermissionsGrantRequest }

function TKSeF2EuEntityAdministrationPermissionsGrantRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2EuEntityAdministrationPermissionsGrantRequest.GetEuEntityName: UTF8String;
begin
  Result := GetStringProp('EuEntityName');
end;

procedure TKSeF2EuEntityAdministrationPermissionsGrantRequest.SetContextIdentifier
  (AValue: TKSeF2EuEntityAdministrationPermissionsContextIdentifier);
begin
  if FContextIdentifier = AValue then Exit;
  if Assigned(FContextIdentifier) and (FContextIdentifier.Owner = Self) then
    FContextIdentifier.Free;
  SetObjectProp('ContextIdentifier', AValue.ExtObject);
  FContextIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EuEntityAdministrationPermissionsGrantRequest.SetDescription(
  AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2EuEntityAdministrationPermissionsGrantRequest.SetEuEntityDetails
  (AValue: TKSeF2EuEntityDetails);
begin
  if FEuEntityDetails = AValue then Exit;
  if Assigned(FEuEntityDetails) and (FEuEntityDetails.Owner = Self) then
    FEuEntityDetails.Free;
  SetObjectProp('EuEntityDetails', AValue.ExtObject);
  FEuEntityDetails := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EuEntityAdministrationPermissionsGrantRequest.SetEuEntityName(
  AValue: UTF8String);
begin
  SetStringProp('EuEntityName', AValue);
end;

procedure TKSeF2EuEntityAdministrationPermissionsGrantRequest.SetSubjectDetails(
  AValue: TKSeF2EuEntityPermissionSubjectDetails);
begin
  if FSubjectDetails = AValue then Exit;
  if Assigned(FSubjectDetails) and (FSubjectDetails.Owner = Self) then
    FSubjectDetails.Free;
  SetObjectProp('SubjectDetails', AValue.ExtObject);
  FSubjectDetails := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EuEntityAdministrationPermissionsGrantRequest.SetSubjectIdentifier
  (AValue: TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier);
begin
  if FSubjectIdentifier = AValue then Exit;
  if Assigned(FSubjectIdentifier) and (FSubjectIdentifier.Owner = Self) then
    FSubjectIdentifier.Free;
  SetObjectProp('SubjectIdentifier', AValue.ExtObject);
  FSubjectIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EuEntityAdministrationPermissionsGrantRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubjectIdentifier');
  if O <> nil then
    FSubjectIdentifier := TKSeF2EuEntityAdministrationPermissionsSubjectIdentifier.Create(Self, O);
  O := GetObjectProp('ContextIdentifier');
  if O <> nil then
    FContextIdentifier := TKSeF2EuEntityAdministrationPermissionsContextIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectDetails');
  if O <> nil then
    FSubjectDetails := TKSeF2EuEntityPermissionSubjectDetails.Create(Self, O);
  O := GetObjectProp('EuEntityDetails');
  if O <> nil then
    FEuEntityDetails := TKSeF2EuEntityDetails.Create(Self, O);
end;

{ TKSeF2EuEntityPermissionsSubjectIdentifier }

function TKSeF2EuEntityPermissionsSubjectIdentifier.GetType: TKSeF2EuEntityPermissionsSubjectIdentifierType;
begin
  Result := TKSeF2EuEntityPermissionsSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EuEntityPermissionsSubjectIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EuEntityPermissionsSubjectIdentifier.SetType(
  AValue: TKSeF2EuEntityPermissionsSubjectIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EuEntityPermissionsSubjectIdentifier.SetValue(AValue: UTF8String
  );
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2EuEntityPermissionsGrantRequest }

function TKSeF2EuEntityPermissionsGrantRequest.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2EuEntityPermissionsGrantRequest.GetPermissions: TKSeF2EuEntityPermissionTypes;
begin
  Result := [];
  Int32ToSet(GetIntegerProp('Permissions'), Ord(High(TKSeF2EuEntityPermissionType)), SizeOf(Result), @Result);
end;

procedure TKSeF2EuEntityPermissionsGrantRequest.SetDescription(
  AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeF2EuEntityPermissionsGrantRequest.SetPermissions(
  AValue: TKSeF2EuEntityPermissionTypes);
begin
  SetIntegerProp('Permissions', SetToInt32(@AValue, Ord(High(TKSeF2EuEntityPermissionType)), SizeOf(AValue)));
end;

procedure TKSeF2EuEntityPermissionsGrantRequest.SetSubjectDetails(
  AValue: TKSeF2EuEntityPermissionSubjectDetails);
begin
  if FSubjectDetails = AValue then Exit;
  if Assigned(FSubjectDetails) and (FSubjectDetails.Owner = Self) then
    FSubjectDetails.Free;
  SetObjectProp('SubjectDetails', AValue.ExtObject);
  FSubjectDetails := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EuEntityPermissionsGrantRequest.SetSubjectIdentifier(
  AValue: TKSeF2EuEntityPermissionsSubjectIdentifier);
begin
  if FSubjectIdentifier = AValue then Exit;
  if Assigned(FSubjectIdentifier) and (FSubjectIdentifier.Owner = Self) then
    FSubjectIdentifier.Free;
  SetObjectProp('SubjectIdentifier', AValue.ExtObject);
  FSubjectIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EuEntityPermissionsGrantRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubjectIdentifier');
  if O <> nil then
    FSubjectIdentifier := TKSeF2EuEntityPermissionsSubjectIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectDetails');
  if O <> nil then
    FSubjectDetails := TKSeF2EuEntityPermissionSubjectDetails.Create(Self, O);
end;

{ TKSeF2PermissionsOperationStatusResponse }

procedure TKSeF2PermissionsOperationStatusResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Status');
  if O <> nil then
    FStatus := TKSeF2StatusInfo.Create(Self, O);
end;

{ TKSeF2CheckAttachmentPermissionStatusResponse }

function TKSeF2CheckAttachmentPermissionStatusResponse.GetIsAttachmentAllowed: Boolean;
begin
  Result := GetBooleanProp('IsAttachmentAllowed');
end;

function TKSeF2CheckAttachmentPermissionStatusResponse.GetRevokedDate: TDateTime;
begin
  Result := GetDoubleProp('RevokedDate');
end;

function TKSeF2CheckAttachmentPermissionStatusResponse.GetRevokedDateRaw: UTF8String;
begin
  Result := GetStringProp('RevokedDateRaw');
end;

{ TKSeF2PersonalPermissionsContextIdentifier }

function TKSeF2PersonalPermissionsContextIdentifier.GetType: TKSeF2PersonalPermissionsContextIdentifierType;
begin
  Result := TKSeF2PersonalPermissionsContextIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2PersonalPermissionsContextIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2PersonalPermissionsContextIdentifier.SetType(
  AValue: TKSeF2PersonalPermissionsContextIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2PersonalPermissionsContextIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2PersonalPermissionsTargetIdentifier }

function TKSeF2PersonalPermissionsTargetIdentifier.GetType: TKSeF2PersonalPermissionsTargetIdentifierType;
begin
  Result := TKSeF2PersonalPermissionsTargetIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2PersonalPermissionsTargetIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2PersonalPermissionsTargetIdentifier.SetType(
  AValue: TKSeF2PersonalPermissionsTargetIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2PersonalPermissionsTargetIdentifier.SetValue(AValue: UTF8String
  );
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2PersonalPermissionsQueryRequest }

function TKSeF2PersonalPermissionsQueryRequest.GetPermissionState: TKSeF2PermissionState;
begin
  Result := TKSeF2PermissionState(GetIntegerProp('PermissionState'));
end;

function TKSeF2PersonalPermissionsQueryRequest.GetPermissionTypes: TKSeF2PersonalPermissionTypes;
begin
  Result := [];
  Int32ToSet(GetIntegerProp('PermissionTypes'), Ord(High(TKSeF2PersonalPermissionType)), SizeOf(Result), @Result);
end;

procedure TKSeF2PersonalPermissionsQueryRequest.SetContextIdentifier(
  AValue: TKSeF2PersonalPermissionsContextIdentifier);
begin
  if FContextIdentifier = AValue then Exit;
  if Assigned(FContextIdentifier) and (FContextIdentifier.Owner = Self) then
    FContextIdentifier.Free;
  SetObjectProp('ContextIdentifier', AValue.ExtObject);
  FContextIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonalPermissionsQueryRequest.SetPermissionState(
  AValue: TKSeF2PermissionState);
begin
  SetIntegerProp('PermissionState', Ord(AValue));
end;

procedure TKSeF2PersonalPermissionsQueryRequest.SetPermissionTypes(
  AValue: TKSeF2PersonalPermissionTypes);
begin
  SetIntegerProp('PermissionTypes', SetToInt32(@AValue, Ord(High(TKSeF2PersonalPermissionType)), SizeOf(AValue)));
end;

procedure TKSeF2PersonalPermissionsQueryRequest.SetTargetIdentifier(
  AValue: TKSeF2PersonalPermissionsTargetIdentifier);
begin
  if FTargetIdentifier = AValue then Exit;
  if Assigned(FTargetIdentifier) and (FTargetIdentifier.Owner = Self) then
    FTargetIdentifier.Free;
  SetObjectProp('TargetIdentifier', AValue.ExtObject);
  FTargetIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonalPermissionsQueryRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('ContextIdentifier');
  if O <> nil then
    FContextIdentifier := TKSeF2PersonalPermissionsContextIdentifier.Create(Self, O);
  O := GetObjectProp('TargetIdentifier');
  if O <> nil then
    FTargetIdentifier := TKSeF2PersonalPermissionsTargetIdentifier.Create(Self, O);
end;

{ TKSeF2PersonPermissionsAuthorizedIdentifier }

function TKSeF2PersonPermissionsAuthorizedIdentifier.GetType: TKSeF2PersonPermissionsAuthorizedIdentifierType;
begin
  Result := TKSeF2PersonPermissionsAuthorizedIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2PersonPermissionsAuthorizedIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2PersonPermissionsAuthorizedIdentifier.SetType(
  AValue: TKSeF2PersonPermissionsAuthorizedIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2PersonPermissionsAuthorizedIdentifier.SetValue(
  AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2PersonPermissionsContextIdentifier }

function TKSeF2PersonPermissionsContextIdentifier.GetType: TKSeF2PersonPermissionsContextIdentifierType;
begin
  Result := TKSeF2PersonPermissionsContextIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2PersonPermissionsContextIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2PersonPermissionsContextIdentifier.SetType(
  AValue: TKSeF2PersonPermissionsContextIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2PersonPermissionsContextIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2PersonPermissionsTargetIdentifier }

function TKSeF2PersonPermissionsTargetIdentifier.GetType: TKSeF2PersonPermissionsTargetIdentifierType;
begin
  Result := TKSeF2PersonPermissionsTargetIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2PersonPermissionsTargetIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2PersonPermissionsTargetIdentifier.SetType(
  AValue: TKSeF2PersonPermissionsTargetIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2PersonPermissionsTargetIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2PersonPermissionsAuthorIdentifier }

function TKSeF2PersonPermissionsAuthorIdentifier.GetType: TKSeF2PersonPermissionsAuthorIdentifierType;
begin
  Result := TKSeF2PersonPermissionsAuthorIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2PersonPermissionsAuthorIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2PersonPermissionsAuthorIdentifier.SetType(
  AValue: TKSeF2PersonPermissionsAuthorIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2PersonPermissionsAuthorIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2PermissionsSubjectPersonDetails }

function TKSeF2PermissionsSubjectPersonDetails.GetBirthDate: TDate;
begin
  Result := GetDoubleProp('BirthDate');
end;

function TKSeF2PermissionsSubjectPersonDetails.GetBirthDateRaw: UTF8String;
begin
  Result := GetStringProp('BirthDateRaw');
end;

function TKSeF2PermissionsSubjectPersonDetails.GetFirstName: UTF8String;
begin
  Result := GetStringProp('FirstName');
end;

function TKSeF2PermissionsSubjectPersonDetails.GetLastName: UTF8String;
begin
  Result := GetStringProp('LastName');
end;

function TKSeF2PermissionsSubjectPersonDetails.GetSubjectDetailsType: TKSeF2PersonSubjectDetailsType;
begin
  Result := TKSeF2PersonSubjectDetailsType(GetIntegerProp('SubjectDetailsType'));
end;

procedure TKSeF2PermissionsSubjectPersonDetails.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('PersonIdentifier');
  if O <> nil then
    FPersonIdentifier := TKSeF2PersonIdentifier.Create(Self, O);
  O := GetObjectProp('IdDocument');
  if O <> nil then
    FIdDocument := TKSeF2IdDocument.Create(Self, O);
end;

function TKSeF2PersonalPermission.GetCanDelegate: Boolean;
begin
  Result := GetBooleanProp('CanDelegate');
end;

function TKSeF2PersonalPermission.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2PersonalPermission.GetId: UTF8String;
begin
  Result := GetStringProp('Id');
end;

function TKSeF2PersonalPermission.GetPermissionScope: TKSeF2PersonPermissionScope;
begin
  Result := TKSeF2PersonPermissionScope(GetIntegerProp('PermissionScope'));
end;

function TKSeF2PersonalPermission.GetPermissionState: TKSeF2PermissionState;
begin
  Result := TKSeF2PermissionState(GetIntegerProp('PermissionState'));
end;

function TKSeF2PersonalPermission.GetStartDate: TDateTime;
begin
  Result := GetDoubleProp('StartDate');
end;

function TKSeF2PersonalPermission.GetStartDateRaw: UTF8String;
begin
  Result := GetStringProp('StartDateRaw');
end;

procedure TKSeF2PersonalPermission.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorizedIdentifier');
  if O <> nil then
    FAuthorizedIdentifier := TKSeF2PersonPermissionsAuthorizedIdentifier.Create(Self, O);
  O := GetObjectProp('ContextIdentifier');
  if O <> nil then
    FContextIdentifier := TKSeF2PersonPermissionsContextIdentifier.Create(Self, O);
  O := GetObjectProp('TargetIdentifier');
  if O <> nil then
    FTargetIdentifier := TKSeF2PersonPermissionsTargetIdentifier.Create(Self, O);
  O := GetObjectProp('AuthorIdentifier');
  if O <> nil then
    FAuthorIdentifier := TKSeF2PersonPermissionsAuthorIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectPersonDetails');
  if O <> nil then
    FSubjectPersonDetails := TKSeF2PermissionsSubjectPersonDetails.Create(Self, O);
  O := GetObjectProp('SubjectEntityDetails');
  if O <> nil then
    FSubjectEntityDetails := TKSeF2PermissionsSubjectPersonDetails.Create(Self, O);
end;

{ TKSeF2PersonalPermissionArray }

function TKSeF2PersonalPermissionArray.GetItem(AIndex: Integer
  ): TKSeF2PersonalPermission;
begin
  Result := TKSeF2PersonalPermission(inherited GetItem(AIndex));
end;

{ TKSeF2QueryPersonalPermissionsResponse }

function TKSeF2QueryPersonalPermissionsResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

procedure TKSeF2QueryPersonalPermissionsResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Permissions');
  if O <> nil then
    FPermissions := TKSeF2PersonalPermissionArray.Create(Self, O);
end;

{ TKSeF2PersonPermissionsQueryRequest }

function TKSeF2PersonPermissionsQueryRequest.GetPermissionState: TKSeF2PermissionState;
begin
  Result := TKSeF2PermissionState(GetIntegerProp('PermissionState'));
end;

function TKSeF2PersonPermissionsQueryRequest.GetPermissionTypes: TKSeF2PersonPermissionTypes;
begin
  Result := [];
  Int32ToSet(GetIntegerProp('PermissionTypes'), Ord(High(TKSeF2PersonPermissionType)), SizeOf(Result), @Result);
end;

function TKSeF2PersonPermissionsQueryRequest.GetQueryType: TKSeF2PersonPermissionsQueryType;
begin
  Result := TKSeF2PersonPermissionsQueryType(GetIntegerProp('QueryType'));
end;

procedure TKSeF2PersonPermissionsQueryRequest.SetAuthorIdentifier(
  AValue: TKSeF2PersonPermissionsAuthorIdentifier);
begin
  if FAuthorIdentifier = AValue then Exit;
  if Assigned(FAuthorIdentifier) and (FAuthorIdentifier.Owner = Self) then
    FAuthorIdentifier.Free;
  SetObjectProp('AuthorIdentifier', AValue.ExtObject);
  FAuthorIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonPermissionsQueryRequest.SetAuthorizedIdentifier(
  AValue: TKSeF2PersonPermissionsAuthorizedIdentifier);
begin
  if FAuthorizedIdentifier = AValue then Exit;
  if Assigned(FAuthorizedIdentifier) and (FAuthorizedIdentifier.Owner = Self) then
    FAuthorizedIdentifier.Free;
  SetObjectProp('AuthorizedIdentifier', AValue.ExtObject);
  FAuthorizedIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonPermissionsQueryRequest.SetContextIdentifier(
  AValue: TKSeF2PersonPermissionsContextIdentifier);
begin
  if FContextIdentifier = AValue then Exit;
  if Assigned(FContextIdentifier) and (FContextIdentifier.Owner = Self) then
    FContextIdentifier.Free;
  SetObjectProp('ContextIdentifier', AValue.ExtObject);
  FContextIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonPermissionsQueryRequest.SetPermissionState(
  AValue: TKSeF2PermissionState);
begin
  SetIntegerProp('PermissionState', Ord(AValue));
end;

procedure TKSeF2PersonPermissionsQueryRequest.SetPermissionTypes(
  AValue: TKSeF2PersonPermissionTypes);
begin
  SetIntegerProp('Permissions', SetToInt32(@AValue, Ord(High(TKSeF2IndirectPermissionTypes)), SizeOf(AValue)));
end;

procedure TKSeF2PersonPermissionsQueryRequest.SetQueryType(
  AValue: TKSeF2PersonPermissionsQueryType);
begin
  SetIntegerProp('QueryType', Ord(AValue));
end;

procedure TKSeF2PersonPermissionsQueryRequest.SetTargetIdentifier(
  AValue: TKSeF2PersonPermissionsTargetIdentifier);
begin
  if FTargetIdentifier = AValue then Exit;
  if Assigned(FTargetIdentifier) and (FTargetIdentifier.Owner = Self) then
    FTargetIdentifier.Free;
  SetObjectProp('TargetIdentifier', AValue.ExtObject);
  FTargetIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2PersonPermissionsQueryRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorIdentifier');
  if O <> nil then
    FAuthorIdentifier := TKSeF2PersonPermissionsAuthorIdentifier.Create(Self, O);
  O := GetObjectProp('AuthorizedIdentifier');
  if O <> nil then
    FAuthorizedIdentifier := TKSeF2PersonPermissionsAuthorizedIdentifier.Create(Self, O);
  O := GetObjectProp('ContextIdentifier');
  if O <> nil then
    FContextIdentifier := TKSeF2PersonPermissionsContextIdentifier.Create(Self, O);
  O := GetObjectProp('TargetIdentifier');
  if O <> nil then
    FTargetIdentifier := TKSeF2PersonPermissionsTargetIdentifier.Create(Self, O);
end;

{ TKSeF2PermissionsSubjectEntityDetails }

function TKSeF2PermissionsSubjectEntityDetails.GetAddress: UTF8String;
begin
  Result := GetStringProp('Address');
end;

function TKSeF2PermissionsSubjectEntityDetails.GetFullName: UTF8String;
begin
  Result := GetStringProp('FullName');
end;

function TKSeF2PermissionsSubjectEntityDetails.GetSubjectDetailsType: TKSeF2EntitySubjectDetailsType;
begin
  Result := TKSeF2EntitySubjectDetailsType(GetIntegerProp('SubjectDetailsType'));
end;

function TKSeF2PersonPermission.GetCanDelegate: Boolean;
begin
  Result := GetBooleanProp('CanDelegate');
end;

function TKSeF2PersonPermission.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2PersonPermission.GetId: UTF8String;
begin
  Result := GetStringProp('Id');
end;

function TKSeF2PersonPermission.GetPermissionScope: TKSeF2PersonPermissionScope;
begin
  Result := TKSeF2PersonPermissionScope(GetIntegerProp('PermissionScope'));
end;

function TKSeF2PersonPermission.GetPermissionState: TKSeF2PermissionState;
begin
  Result := TKSeF2PermissionState(GetIntegerProp('PermissionState'));
end;

function TKSeF2PersonPermission.GetStartDate: TDateTime;
begin
  Result := GetDoubleProp('StartDate');
end;

function TKSeF2PersonPermission.GetStartDateRaw: UTF8String;
begin
  Result := GetStringProp('StartDateRaw');
end;

procedure TKSeF2PersonPermission.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorizedIdentifier');
  if O <> nil then
    FAuthorizedIdentifier := TKSeF2PersonPermissionsAuthorizedIdentifier.Create(Self, O);
  O := GetObjectProp('ContextIdentifier');
  if O <> nil then
    FContextIdentifier := TKSeF2PersonPermissionsContextIdentifier.Create(Self, O);
  O := GetObjectProp('TargetIdentifier');
  if O <> nil then
    FTargetIdentifier := TKSeF2PersonPermissionsTargetIdentifier.Create(Self, O);
  O := GetObjectProp('AuthorIdentifier');
  if O <> nil then
    FAuthorIdentifier := TKSeF2PersonPermissionsAuthorIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectPersonDetails');
  if O <> nil then
    FSubjectPersonDetails := TKSeF2PermissionsSubjectPersonDetails.Create(Self, O);
  O := GetObjectProp('SubjectEntityDetails');
  if O <> nil then
    FSubjectEntityDetails := TKSeF2PermissionsSubjectEntityDetails.Create(Self, O);
end;

{ TKSeF2PersonPermissionArray }

function TKSeF2PersonPermissionArray.GetItem(AIndex: Integer
  ): TKSeF2PersonPermission;
begin
  Result := TKSeF2PersonPermission(inherited GetItem(AIndex));
end;

{ TKSeF2QueryPersonPermissionsResponse }

function TKSeF2QueryPersonPermissionsResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

procedure TKSeF2QueryPersonPermissionsResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Permissions');
  if O <> nil then
    FPermissions := TKSeF2PersonPermissionArray.Create(Self, O);
end;

{ TKSeF2SubunitPermissionsSubunitIdentifier }

function TKSeF2SubunitPermissionsSubunitIdentifier.GetType: TKSeF2SubunitPermissionsSubunitIdentifierType;
begin
  Result := TKSeF2SubunitPermissionsSubunitIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2SubunitPermissionsSubunitIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2SubunitPermissionsSubunitIdentifier.SetType(
  AValue: TKSeF2SubunitPermissionsSubunitIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2SubunitPermissionsSubunitIdentifier.SetValue(AValue: UTF8String
  );
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2SubunitPermissionsQueryRequest }

procedure TKSeF2SubunitPermissionsQueryRequest.SetSubunitIdentifier(
  AValue: TKSeF2SubunitPermissionsSubunitIdentifier);
begin
  if FSubunitIdentifier = AValue then Exit;
  if Assigned(FSubunitIdentifier) and (FSubunitIdentifier.Owner = Self) then
    FSubunitIdentifier.Free;
  SetObjectProp('SubunitIdentifier', AValue.ExtObject);
  FSubunitIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2SubunitPermissionsQueryRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubunitIdentifier');
  if O <> nil then
    FSubunitIdentifier := TKSeF2SubunitPermissionsSubunitIdentifier.Create(Self, O);
end;

{ TKSeF2SubunitPermissionsAuthorizedIdentifier }

function TKSeF2SubunitPermissionsAuthorizedIdentifier.GetType: TKSeF2SubunitPermissionsSubjectIdentifierType;
begin
  Result := TKSeF2SubunitPermissionsSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2SubunitPermissionsAuthorizedIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2SubunitPermissionsAuthorizedIdentifier.SetType(
  AValue: TKSeF2SubunitPermissionsSubjectIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2SubunitPermissionsAuthorizedIdentifier.SetValue(
  AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2SubunitPermissionsAuthorIdentifier }

function TKSeF2SubunitPermissionsAuthorIdentifier.GetType: TKSeF2SubunitPermissionsAuthorIdentifierType;
begin
  Result := TKSeF2SubunitPermissionsAuthorIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2SubunitPermissionsAuthorIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2SubunitPermissionsAuthorIdentifier.SetType(
  AValue: TKSeF2SubunitPermissionsAuthorIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2SubunitPermissionsAuthorIdentifier.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

function TKSeF2SubunitPermission.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2SubunitPermission.GetId: UTF8String;
begin
  Result := GetStringProp('Id');
end;

function TKSeF2SubunitPermission.GetPermissionScope: TKSeF2SubunitPermissionScope;
begin
  Result := TKSeF2SubunitPermissionScope(GetIntegerProp('PermissionScope'));
end;

function TKSeF2SubunitPermission.GetStartDate: TDateTime;
begin
  Result := GetDoubleProp('StartDate');
end;

function TKSeF2SubunitPermission.GetStartDateRaw: UTF8String;
begin
  Result := GetStringProp('StartDateRaw');
end;

function TKSeF2SubunitPermission.GetSubunitName: UTF8String;
begin
  Result := GetStringProp('SubunitName');
end;

procedure TKSeF2SubunitPermission.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorizedIdentifier');
  if O <> nil then
    FAuthorizedIdentifier := TKSeF2SubunitPermissionsAuthorizedIdentifier.Create(Self, O);
  O := GetObjectProp('SubunitIdentifier');
  if O <> nil then
    FSubunitIdentifier := TKSeF2SubunitPermissionsSubunitIdentifier.Create(Self, O);
  O := GetObjectProp('AuthorIdentifier');
  if O <> nil then
    FAuthorIdentifier := TKSeF2SubunitPermissionsAuthorIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectPersonDetails');
  if O <> nil then
    FSubjectPersonDetails := TKSeF2PermissionsSubjectPersonDetails.Create(Self, O);
end;

{ TKSeF2SubunitPermissionArray }

function TKSeF2SubunitPermissionArray.GetItem(AIndex: Integer
  ): TKSeF2SubunitPermission;
begin
  Result := TKSeF2SubunitPermission(inherited GetItem(AIndex));
end;

{ TKSeF2QuerySubunitPermissionsResponse }

function TKSeF2QuerySubunitPermissionsResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

procedure TKSeF2QuerySubunitPermissionsResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Permissions');
  if O <> nil then
    FPermissions := TKSeF2SubunitPermissionArray.Create(Self, O);
end;

{ TKSeF2EntityRolesParentEntityIdentifier }

function TKSeF2EntityRolesParentEntityIdentifier.GetType: TKSeF2EntityRolesParentEntityIdentifierType;
begin
  Result := TKSeF2EntityRolesParentEntityIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EntityRolesParentEntityIdentifier.GetValue: String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EntityRolesParentEntityIdentifier.SetType(
  AValue: TKSeF2EntityRolesParentEntityIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EntityRolesParentEntityIdentifier.SetValue(AValue: String);
begin
  SetStringProp('Value', AValue);
end;

function TKSeF2EntityRole.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2EntityRole.GetRole: TKSeF2EntityRoleType;
begin
  Result := TKSeF2EntityRoleType(GetIntegerProp('Role'));
end;

function TKSeF2EntityRole.GetStartDate: TDateTime;
begin
  Result := GetDoubleProp('StartDate');
end;

function TKSeF2EntityRole.GetStartDateRaw: UTF8String;
begin
  Result := GetStringProp('StartDateRaw');
end;

procedure TKSeF2EntityRole.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('ParentEntityIdentifier');
  if O <> nil then
    FParentEntityIdentifier := TKSeF2EntityRolesParentEntityIdentifier.Create(Self, O);
end;

{ TKSeF2EntityRoleArray }

function TKSeF2EntityRoleArray.GetItem(AIndex: Integer): TKSeF2EntityRole;
begin
  Result := TKSeF2EntityRole(inherited GetItem(AIndex));
end;

{ TKSeF2QueryEntityRolesResponse }

function TKSeF2QueryEntityRolesResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

procedure TKSeF2QueryEntityRolesResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Roles');
  if O <> nil then
    FRoles := TKSeF2EntityRoleArray.Create(Self, O);
end;

{ TKSeF2EntityPermissionsSubordinateEntityIdentifier }

function TKSeF2EntityPermissionsSubordinateEntityIdentifier.GetType: TKSeF2EntityPermissionsSubordinateEntityIdentifierType;
begin
  Result := TKSeF2EntityPermissionsSubordinateEntityIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EntityPermissionsSubordinateEntityIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EntityPermissionsSubordinateEntityIdentifier.SetType(
  AValue: TKSeF2EntityPermissionsSubordinateEntityIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EntityPermissionsSubordinateEntityIdentifier.SetValue(
  AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2SubordinateEntityRolesQueryRequest }

procedure TKSeF2SubordinateEntityRolesQueryRequest.SetSubordinateEntityIdentifier
  (AValue: TKSeF2EntityPermissionsSubordinateEntityIdentifier);
begin
  if FSubordinateEntityIdentifier = AValue then Exit;
  if Assigned(FSubordinateEntityIdentifier) and (FSubordinateEntityIdentifier.Owner = Self) then
    FSubordinateEntityIdentifier.Free;
  SetObjectProp('SubordinateEntityIdentifier', AValue.ExtObject);
  FSubordinateEntityIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2SubordinateEntityRolesQueryRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubordinateEntityIdentifier');
  if O <> nil then
    FSubordinateEntityIdentifier := TKSeF2EntityPermissionsSubordinateEntityIdentifier.Create(Self, O);
end;

{ TKSeF2SubordinateRoleSubordinateEntityIdentifier }

function TKSeF2SubordinateRoleSubordinateEntityIdentifier.GetType: TKSeF2SubordinateRoleSubordinateEntityIdentifierType;
begin
  Result := TKSeF2SubordinateRoleSubordinateEntityIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2SubordinateRoleSubordinateEntityIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2SubordinateRoleSubordinateEntityIdentifier.SetType(
  AValue: TKSeF2SubordinateRoleSubordinateEntityIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2SubordinateRoleSubordinateEntityIdentifier.SetValue(
  AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

function TKSeF2SubordinateEntityRole.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2SubordinateEntityRole.GetRole: TKSeF2SubordinateEntityRoleType;
begin
  Result := TKSeF2SubordinateEntityRoleType(GetIntegerProp('Role'));
end;

function TKSeF2SubordinateEntityRole.GetStartDate: TDateTime;
begin
  Result := GetDoubleProp('StartDate');
end;

function TKSeF2SubordinateEntityRole.GetStartDateRaw: UTF8String;
begin
  Result := GetStringProp('StartDateRaw');
end;

procedure TKSeF2SubordinateEntityRole.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubordinateEntityIdentifier');
  if O <> nil then
    FSubordinateEntityIdentifier := TKSeF2SubordinateRoleSubordinateEntityIdentifier.Create(Self, O);
end;

{ TKSeF2SubordinateEntityRoleArray }

function TKSeF2SubordinateEntityRoleArray.GetItem(AIndex: Integer
  ): TKSeF2SubordinateEntityRole;
begin
  Result := TKSeF2SubordinateEntityRole(inherited GetItem(AIndex));
end;

{ TKSeF2QuerySubordinateEntityRolesResponse }

function TKSeF2QuerySubordinateEntityRolesResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

procedure TKSeF2QuerySubordinateEntityRolesResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Roles');
  if O <> nil then
    FRoles := TKSeF2SubordinateEntityRoleArray.Create(Self, O);
end;

{ TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier }

function TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier.GetType: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifierType;
begin
  Result := TKSeF2EntityAuthorizationsAuthorizingEntityIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier.SetType(
  AValue: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier.SetValue(
  AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier }

function TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier.GetType: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifierType;
begin
  Result := TKSeF2EntityAuthorizationsAuthorizedEntityIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier.SetType(
  AValue: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier.SetValue(
  AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2EntityAuthorizationPermissionsQueryRequest }

function TKSeF2EntityAuthorizationPermissionsQueryRequest.GetPermissionTypes: TKSeF2InvoicePermissionTypes;
begin
  Result := [];
  Int32ToSet(GetIntegerProp('PermissionTypes'), Ord(High(TKSeF2InvoicePermissionType)), SizeOf(Result), @Result);
end;

function TKSeF2EntityAuthorizationPermissionsQueryRequest.GetQueryType: TKSeF2QueryType;
begin
  Result := TKSeF2QueryType(GetIntegerProp('QueryType'));
end;

procedure TKSeF2EntityAuthorizationPermissionsQueryRequest.SetAuthorizedIdentifier
  (AValue: TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier);
begin
  if FAuthorizedIdentifier = AValue then Exit;
  if Assigned(FAuthorizedIdentifier) and (FAuthorizedIdentifier.Owner = Self) then
    FAuthorizedIdentifier.Free;
  SetObjectProp('AuthorizedIdentifier', AValue.ExtObject);
  FAuthorizedIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EntityAuthorizationPermissionsQueryRequest.SetAuthorizingIdentifier
  (AValue: TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier);
begin
  if FAuthorizingIdentifier = AValue then Exit;
  if Assigned(FAuthorizingIdentifier) and (FAuthorizingIdentifier.Owner = Self) then
    FAuthorizingIdentifier.Free;
  SetObjectProp('AuthorizingIdentifier', AValue.ExtObject);
  FAuthorizingIdentifier := AValue;
  if Assigned(AValue) and (AValue.Owner = nil) then
    InsertObject(AValue);
end;

procedure TKSeF2EntityAuthorizationPermissionsQueryRequest.SetPermissionTypes(
  AValue: TKSeF2InvoicePermissionTypes);
begin
  SetIntegerProp('PermissionTypes', SetToInt32(@AValue, Ord(High(TKSeF2InvoicePermissionType)), SizeOf(AValue)));
end;

procedure TKSeF2EntityAuthorizationPermissionsQueryRequest.SetQueryType(
  AValue: TKSeF2QueryType);
begin
  SetIntegerProp('QueryType', Ord(AValue));
end;

procedure TKSeF2EntityAuthorizationPermissionsQueryRequest.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorizingIdentifier');
  if O <> nil then
    FAuthorizingIdentifier := TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier.Create(Self, O);
  O := GetObjectProp('AuthorizedIdentifier');
  if O <> nil then
    FAuthorizedIdentifier := TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier.Create(Self, O);
end;

{ TKSeF2EntityAuthorizationsAuthorIdentifier }

function TKSeF2EntityAuthorizationsAuthorIdentifier.GetType: TKSeF2EntityAuthorizationsAuthorIdentifierType;
begin
  Result := TKSeF2EntityAuthorizationsAuthorIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EntityAuthorizationsAuthorIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EntityAuthorizationsAuthorIdentifier.SetType(
  AValue: TKSeF2EntityAuthorizationsAuthorIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EntityAuthorizationsAuthorIdentifier.SetValue(AValue: UTF8String
  );
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2PermissionsSubjectEntityByIdentifierDetails }

function TKSeF2PermissionsSubjectEntityByIdentifierDetails.GetFullName: UTF8String;
begin
  Result := GetStringProp('FullName');
end;

function TKSeF2PermissionsSubjectEntityByIdentifierDetails.GetSubjectDetailsType: TKSeF2EntitySubjectByIdentifierDetailsType;
begin
  Result := TKSeF2EntitySubjectByIdentifierDetailsType(GetIntegerProp('SubjectDetailsType'));
end;

{ TKSeF2EntityAuthorizationGrant }

function TKSeF2EntityAuthorizationGrant.GetAuthorizationScope: TKSeF2InvoicePermissionType;
begin
  Result := TKSeF2InvoicePermissionType(GetIntegerProp('AuthorizationScope'));
end;

function TKSeF2EntityAuthorizationGrant.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2EntityAuthorizationGrant.GetId: UTF8String;
begin
  Result := GetStringProp('Id');
end;

function TKSeF2EntityAuthorizationGrant.GetStartDate: TDateTime;
begin
  Result := GetDoubleProp('StartDate');
end;

function TKSeF2EntityAuthorizationGrant.GetStartDateRaw: UTF8String;
begin
  Result := GetStringProp('StartDateRaw');
end;

procedure TKSeF2EntityAuthorizationGrant.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorIdentifier');
  if O <> nil then
    FAuthorIdentifier := TKSeF2EntityAuthorizationsAuthorIdentifier.Create(Self, O);
  O := GetObjectProp('AuthorizedEntityIdentifier');
  if O <> nil then
    FAuthorizedEntityIdentifier := TKSeF2EntityAuthorizationsAuthorizedEntityIdentifier.Create(Self, O);
  O := GetObjectProp('AuthorizingEntityIdentifier');
  if O <> nil then
    FAuthorizingEntityIdentifier := TKSeF2EntityAuthorizationsAuthorizingEntityIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectEntityDetails');
  if O <> nil then
    FSubjectEntityDetails := TKSeF2PermissionsSubjectEntityByIdentifierDetails.Create(Self, O);
end;

{ TKSeF2EntityAuthorizationGrantArray }

function TKSeF2EntityAuthorizationGrantArray.GetItem(AIndex: Integer
  ): TKSeF2EntityAuthorizationGrant;
begin
  Result := TKSeF2EntityAuthorizationGrant(inherited GetItem(AIndex));
end;

{ TKSeF2QueryEntityAuthorizationPermissionsResponse }

function TKSeF2QueryEntityAuthorizationPermissionsResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

procedure TKSeF2QueryEntityAuthorizationPermissionsResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorizationGrants');
  if O <> nil then
    FAuthorizationGrants := TKSeF2EntityAuthorizationGrantArray.Create(Self, O);
end;

{ TKSeF2EuEntityPermissionsQueryRequest }

function TKSeF2EuEntityPermissionsQueryRequest.GetAuthorizedFingerprintIdentifier: UTF8String;
begin
  Result := GetStringProp('AuthorizedFingerprintIdentifier');
end;

function TKSeF2EuEntityPermissionsQueryRequest.GetPermissionTypes: TKSeF2EuEntityPermissionsQueryPermissionTypes;
begin
  Result := [];
  Int32ToSet(GetIntegerProp('PermissionTypes'), Ord(High(TKSeF2EuEntityPermissionsQueryPermissionType)), SizeOf(Result), @Result);
end;

function TKSeF2EuEntityPermissionsQueryRequest.GetVatUeIdentifier: UTF8String;
begin
  Result := GetStringProp('VatUeIdentifier');
end;

procedure TKSeF2EuEntityPermissionsQueryRequest.SetAuthorizedFingerprintIdentifier
  (AValue: UTF8String);
begin
  SetStringProp('AuthorizedFingerprintIdentifier', AValue);
end;

procedure TKSeF2EuEntityPermissionsQueryRequest.SetPermissionTypes(
  AValue: TKSeF2EuEntityPermissionsQueryPermissionTypes);
begin
  SetIntegerProp('PermissionTypes', SetToInt32(@AValue, Ord(High(TKSeF2EuEntityPermissionsQueryPermissionType)), SizeOf(AValue)));
end;

procedure TKSeF2EuEntityPermissionsQueryRequest.SetVatUeIdentifier(
  AValue: UTF8String);
begin
  SetStringProp('VatUeIdentifier', AValue);
end;

{ TKSeF2EuEntityPermissionsAuthorIdentifier }

function TKSeF2EuEntityPermissionsAuthorIdentifier.GetType: TKSeF2EuEntityPermissionsAuthorIdentifierType;
begin
  Result := TKSeF2EuEntityPermissionsAuthorIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2EuEntityPermissionsAuthorIdentifier.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeF2EuEntityPermissionsAuthorIdentifier.SetType(
  AValue: TKSeF2EuEntityPermissionsAuthorIdentifierType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

procedure TKSeF2EuEntityPermissionsAuthorIdentifier.SetValue(AValue: UTF8String
  );
begin
  SetStringProp('Value', AValue);
end;

{ TKSeF2PermissionsSubjectPersonByFingerprintDetails }

function TKSeF2PermissionsSubjectPersonByFingerprintDetails.GetBirthDate: TDate;
begin
  Result := GetDoubleProp('BirthDate');
end;

function TKSeF2PermissionsSubjectPersonByFingerprintDetails.GetBirthDateRaw: UTF8String;
begin
  Result := GetStringProp('BirthDateRaw');
end;

function TKSeF2PermissionsSubjectPersonByFingerprintDetails.GetFirstName: UTF8String;
begin
  Result := GetStringProp('FirstName');
end;

function TKSeF2PermissionsSubjectPersonByFingerprintDetails.GetLastName: UTF8String;
begin
  Result := GetStringProp('LastName');
end;

function TKSeF2PermissionsSubjectPersonByFingerprintDetails.GetSubjectDetailsType: TKSeF2PersonSubjectByFingerprintDetailsType;
begin
  Result := TKSeF2PersonSubjectByFingerprintDetailsType(GetIntegerProp('SubjectDetailsType'));
end;

procedure TKSeF2PermissionsSubjectPersonByFingerprintDetails.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('PersonIdentifier');
  if O <> nil then
    FPersonIdentifier := TKSeF2PersonIdentifier.Create(Self, O);
  O := GetObjectProp('IdDocument');
  if O <> nil then
    FIdDocument := TKSeF2IdDocument.Create(Self, O);
end;

{ TKSeF2PermissionsSubjectEntityByFingerprintDetails }

function TKSeF2PermissionsSubjectEntityByFingerprintDetails.GetAddress: UTF8String;
begin
  Result := GetStringProp('Address');
end;

function TKSeF2PermissionsSubjectEntityByFingerprintDetails.GetFullName: UTF8String;
begin
  Result := GetStringProp('FullName');
end;

function TKSeF2PermissionsSubjectEntityByFingerprintDetails.GetSubjectDetailsType: TKSeF2EntitySubjectByFingerprintDetailsType;
begin
  Result := TKSeF2EntitySubjectByFingerprintDetailsType(GetIntegerProp('SubjectDetailsType'));
end;

{ TKSeF2PermissionsEuEntityDetails }

function TKSeF2PermissionsEuEntityDetails.GetAddress: UTF8String;
begin
  Result := GetStringProp('Address');
end;

function TKSeF2PermissionsEuEntityDetails.GetFullName: UTF8String;
begin
  Result := GetStringProp('FullName');
end;

function TKSeF2EuEntityPermission.GetAuthorizedFingerprintIdentifier: UTF8String;
begin
  Result := GetStringProp('AuthorizedFingerprintIdentifier');
end;

function TKSeF2EuEntityPermission.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeF2EuEntityPermission.GetEuEntityName: UTF8String;
begin
  Result := GetStringProp('EuEntityName');
end;

function TKSeF2EuEntityPermission.GetId: UTF8String;
begin
  Result := GetStringProp('Id');
end;

function TKSeF2EuEntityPermission.GetPermissionScope: TKSeF2EuEntityPermissionsQueryPermissionType;
begin
  Result := TKSeF2EuEntityPermissionsQueryPermissionType(GetIntegerProp('PermissionScope'));
end;

function TKSeF2EuEntityPermission.GetStartDate: TDateTime;
begin
  Result := GetDoubleProp('StartDate');
end;

function TKSeF2EuEntityPermission.GetStartDateRaw: UTF8String;
begin
  Result := GetStringProp('StartDateRaw');
end;

function TKSeF2EuEntityPermission.GetVatUeIdentifier: UTF8String;
begin
  Result := GetStringProp('VatUeIdentifier');
end;

procedure TKSeF2EuEntityPermission.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('AuthorIdentifier');
  if O <> nil then
    FAuthorIdentifier := TKSeF2EuEntityPermissionsAuthorIdentifier.Create(Self, O);
  O := GetObjectProp('SubjectPersonDetails');
  if O <> nil then
    FSubjectPersonDetails := TKSeF2PermissionsSubjectPersonByFingerprintDetails.Create(Self, O);
  O := GetObjectProp('SubjectEntityDetails');
  if O <> nil then
    FSubjectEntityDetails := TKSeF2PermissionsSubjectEntityByFingerprintDetails.Create(Self, O);
  O := GetObjectProp('EuEntityDetails');
  if O <> nil then
    FEuEntityDetails := TKSeF2PermissionsEuEntityDetails.Create(Self, O);
end;

{ TKSeF2EuEntityPermissionArray }

function TKSeF2EuEntityPermissionArray.GetItem(AIndex: Integer
  ): TKSeF2EuEntityPermission;
begin
  Result := TKSeF2EuEntityPermission(inherited GetItem(AIndex));
end;

{ TKSeF2QueryEuEntityPermissionsResponse }

function TKSeF2QueryEuEntityPermissionsResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

procedure TKSeF2QueryEuEntityPermissionsResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Permissions');
  if O <> nil then
    FPermissions := TKSeF2EuEntityPermissionArray.Create(Self, O);
end;

{ TKSeF2CertificateLimit }

function TKSeF2CertificateLimit.GetLimit: Integer;
begin
  Result := GetIntegerProp('Limit');
end;

function TKSeF2CertificateLimit.GetRemaining: Integer;
begin
  Result := GetIntegerProp('Remaining');
end;

{ TKSeF2CertificateLimitsResponse }

function TKSeF2CertificateLimitsResponse.GetCanRequest: Boolean;
begin
  Result := GetBooleanProp('CanRequest');
end;

procedure TKSeF2CertificateLimitsResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Enrollment');
  if O <> nil then
    FEnrollment := TKSeF2CertificateLimit.Create(Self, O);
  O := GetObjectProp('Certificate');
  if O <> nil then
    FCertificate := TKSeF2CertificateLimit.Create(Self, O);
end;

{ TKSeF2CertificateEnrollmentDataResponse }

function TKSeF2CertificateEnrollmentDataResponse.GetCommonName: UTF8String;
begin
  Result := GetStringProp('CommonName');
end;

function TKSeF2CertificateEnrollmentDataResponse.GetCountryName: UTF8String;
begin
  Result := GetStringProp('CountryName');
end;

function TKSeF2CertificateEnrollmentDataResponse.GetGivenName: UTF8String;
begin
  Result := GetStringProp('GivenName');
end;

function TKSeF2CertificateEnrollmentDataResponse.GetOrganizationIdentifier: UTF8String;
begin
  Result := GetStringProp('OrganizationIdentifier');
end;

function TKSeF2CertificateEnrollmentDataResponse.GetOrganizationName: UTF8String;
begin
  Result := GetStringProp('OrganizationName');
end;

function TKSeF2CertificateEnrollmentDataResponse.GetSerialNumber: UTF8String;
begin
  Result := GetStringProp('SerialNumber');
end;

function TKSeF2CertificateEnrollmentDataResponse.GetSurname: UTF8String;
begin
  Result := GetStringProp('Surname');
end;

function TKSeF2CertificateEnrollmentDataResponse.GetUniqueIdentifier: UTF8String;
begin
  Result := GetStringProp('UniqueIdentifier');
end;

{ TKSeF2EnrollCertificateRequest }

function TKSeF2EnrollCertificateRequest.GetCertificateName: UTF8String;
begin
  Result := GetStringProp('CertificateName');
end;

function TKSeF2EnrollCertificateRequest.GetCertificateType: TKSeF2KsefCertificateType;
begin
  Result := TKSeF2KsefCertificateType(GetIntegerProp('CertificateType'));
end;

function TKSeF2EnrollCertificateRequest.GetCsr: UTF8String;
begin
  Result := GetStringProp('Csr');
end;

function TKSeF2EnrollCertificateRequest.GetValidFrom: TDateTime;
begin
  Result := GetDoubleProp('ValidFrom');
end;

procedure TKSeF2EnrollCertificateRequest.SetCertificateName(AValue: UTF8String);
begin
  SetStringProp('CertificateName', AValue);
end;

procedure TKSeF2EnrollCertificateRequest.SetCertificateType(
  AValue: TKSeF2KsefCertificateType);
begin
  SetIntegerProp('CertificateType', Ord(AValue));
end;

procedure TKSeF2EnrollCertificateRequest.SetCsr(AValue: UTF8String);
begin
  SetStringProp('Csr', AValue);
end;

procedure TKSeF2EnrollCertificateRequest.SetValidFrom(AValue: TDateTime);
begin
  SetDoubleProp('ValidFrom', AValue);
end;

{ TKSeF2EnrollCertificateResponse }

function TKSeF2EnrollCertificateResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeF2EnrollCertificateResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeF2EnrollCertificateResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

{ TKSeF2CertificateEnrollmentStatusResponse }

function TKSeF2CertificateEnrollmentStatusResponse.GetCertificateSerialNumber: UTF8String;
begin
  Result := GetStringProp('CertificateSerialNumber');
end;

function TKSeF2CertificateEnrollmentStatusResponse.GetRequestDate: TDateTime;
begin
  Result := GetDoubleProp('RequestDate');
end;

function TKSeF2CertificateEnrollmentStatusResponse.GetRequestDateRaw: UTF8String;
begin
  Result := GetStringProp('RequestDateRaw');
end;

procedure TKSeF2CertificateEnrollmentStatusResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Status');
  if O <> nil then
    FStatus := TKSeF2StatusInfo.Create(Self, O);
end;

{ TKSeF2RetrieveCertificatesRequest }

function TKSeF2RetrieveCertificatesRequest.GetCertificateSerialNumbersStr: UTF8String;
begin
  Result := GetStringProp('CertificateSerialNumbersStr');
end;

procedure TKSeF2RetrieveCertificatesRequest.SetCertificateSerialNumbersStr(
  AValue: UTF8String);
begin
  SetStringProp('CertificateSerialNumbersStr', AValue);
end;

{ TKSeF2RetrieveCertificatesListItem }

function TKSeF2RetrieveCertificatesListItem.GetCertificate: UTF8String;
begin
  Result := GetStringProp('Certificate');
end;

function TKSeF2RetrieveCertificatesListItem.GetCertificateName: UTF8String;
begin
  Result := GetStringProp('CertificateName');
end;

function TKSeF2RetrieveCertificatesListItem.GetCertificateSerialNumber: UTF8String;
begin
  Result := GetStringProp('CertificateSerialNumber');
end;

function TKSeF2RetrieveCertificatesListItem.GetCertificateType: TKSeF2KsefCertificateType;
begin
  Result := TKSeF2KsefCertificateType(GetIntegerProp('CertificateType'));
end;

{ TKSeF2RetrieveCertificatesListItemArray }

function TKSeF2RetrieveCertificatesListItemArray.GetItem(AIndex: Integer
  ): TKSeF2RetrieveCertificatesListItem;
begin
  Result := TKSeF2RetrieveCertificatesListItem(inherited GetItem(AIndex));
end;

{ TKSeF2RetrieveCertificatesResponse }

procedure TKSeF2RetrieveCertificatesResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Certificates');
  if O <> nil then
    FCertificates := TKSeF2RetrieveCertificatesListItemArray.Create(Self, O);
end;

{ TKSeF2RevokeCertificateRequest }

function TKSeF2RevokeCertificateRequest.GetRevocationReason: TKSeF2CertificateRevocationReason;
begin
  Result := TKSeF2CertificateRevocationReason(GetIntegerProp('RevocationReason'));
end;

procedure TKSeF2RevokeCertificateRequest.SetRevocationReason(
  AValue: TKSeF2CertificateRevocationReason);
begin
  SetIntegerProp('RevocationReason', Ord(AValue));
end;

{ TKSeF2QueryCertificatesRequest }

function TKSeF2QueryCertificatesRequest.GetCertificateSerialNumber: UTF8String;
begin
  Result := GetStringProp('CertificateSerialNumber');
end;

function TKSeF2QueryCertificatesRequest.GetExpiresAfter: TDateTime;
begin
  Result := GetDoubleProp('ExpiresAfter');
end;

function TKSeF2QueryCertificatesRequest.GetName: UTF8String;
begin
  Result := GetStringProp('Name');
end;

function TKSeF2QueryCertificatesRequest.GetStatus: TKSeF2CertificateListItemStatus;
begin
  Result := TKSeF2CertificateListItemStatus(GetIntegerProp('Status'));
end;

function TKSeF2QueryCertificatesRequest.GetType: TKSeF2KsefCertificateType;
begin
  Result := TKSeF2KsefCertificateType(GetIntegerProp('Type'));
end;

procedure TKSeF2QueryCertificatesRequest.SetCertificateSerialNumber(
  AValue: UTF8String);
begin
  SetStringProp('CertificateSerialNumber', AValue);
end;

procedure TKSeF2QueryCertificatesRequest.SetExpiresAfter(AValue: TDateTime);
begin
  SetDoubleProp('ExpiresAfter', AValue);
end;

procedure TKSeF2QueryCertificatesRequest.SetName(AValue: UTF8String);
begin
  SetStringProp('Name', AValue);
end;

procedure TKSeF2QueryCertificatesRequest.SetStatus(
  AValue: TKSeF2CertificateListItemStatus);
begin
  SetIntegerProp('Status', Ord(AValue));
end;

procedure TKSeF2QueryCertificatesRequest.SetType(
  AValue: TKSeF2KsefCertificateType);
begin
  SetIntegerProp('Type', Ord(AValue));
end;

{ TKSeF2CertificateSubjectIdentifier }

function TKSeF2CertificateSubjectIdentifier.GetType: TKSeF2CertificateSubjectIdentifierType;
begin
  Result := TKSeF2CertificateSubjectIdentifierType(GetIntegerProp('Type'));
end;

function TKSeF2CertificateSubjectIdentifier.GetValue: String;
begin
  Result := GetStringProp('Value');
end;

{ TKSeF2CertificateListItem }

function TKSeF2CertificateListItem.GetCertificateSerialNumber: UTF8String;
begin
  Result := GetStringProp('CertificateSerialNumber');
end;

function TKSeF2CertificateListItem.GetCommonName: UTF8String;
begin
  Result := GetStringProp('CommonName');
end;

function TKSeF2CertificateListItem.GetLastUseDate: TDateTime;
begin
  Result := GetDoubleProp('LastUseDate');
end;

function TKSeF2CertificateListItem.GetLastUseDateRaw: UTF8String;
begin
  Result := GetStringProp('LastUseDateRaw');
end;

function TKSeF2CertificateListItem.GetName: UTF8String;
begin
  Result := GetStringProp('Name');
end;

function TKSeF2CertificateListItem.GetRequestDate: TDateTime;
begin
  Result := GetDoubleProp('RequestDate');
end;

function TKSeF2CertificateListItem.GetRequestDateRaw: UTF8String;
begin
  Result := GetStringProp('RequestDateRaw');
end;

function TKSeF2CertificateListItem.GetStatus: TKSeF2CertificateListItemStatus;
begin
  Result := TKSeF2CertificateListItemStatus(GetIntegerProp('Status'));
end;

function TKSeF2CertificateListItem.GetType: TKSeF2KsefCertificateType;
begin
  Result := TKSeF2KsefCertificateType(GetIntegerProp('Type'));
end;

function TKSeF2CertificateListItem.GetValidFrom: TDateTime;
begin
  Result := GetDoubleProp('ValidFrom');
end;

function TKSeF2CertificateListItem.GetValidFromRaw: UTF8String;
begin
  Result := GetStringProp('ValidFromRaw');
end;

function TKSeF2CertificateListItem.GetValidTo: TDateTime;
begin
  Result := GetDoubleProp('ValidTo');
end;

function TKSeF2CertificateListItem.GetValidToRaw: UTF8String;
begin
  Result := GetStringProp('ValidToRaw');
end;

procedure TKSeF2CertificateListItem.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('SubjectIdentifier');
  if O <> nil then
    FSubjectIdentifier := TKSeF2CertificateSubjectIdentifier.Create(Self, O);
end;

{ TKSeF2CertificateListItemArray }

function TKSeF2CertificateListItemArray.GetItem(AIndex: Integer
  ): TKSeF2CertificateListItem;
begin
  Result := TKSeF2CertificateListItem(inherited GetItem(AIndex));
end;

{ TKSeF2QueryCertificatesResponse }

function TKSeF2QueryCertificatesResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

procedure TKSeF2QueryCertificatesResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Certificates');
  if O <> nil then
    FCertificates := TKSeF2CertificateListItemArray.Create(Self, O);
end;

{ TKSeF2OnlineSessionEffectiveContextLimits }

function TKSeF2OnlineSessionEffectiveContextLimits.GetMaxInvoices: Integer;
begin
  Result := GetIntegerProp('MaxInvoices');
end;

function TKSeF2OnlineSessionEffectiveContextLimits.GetMaxInvoiceSizeInMB: Integer;
begin
  Result := GetIntegerProp('MaxInvoiceSizeInMB');
end;

function TKSeF2OnlineSessionEffectiveContextLimits.GetMaxInvoiceWithAttachmentSizeInMB: Integer;
begin
  Result := GetIntegerProp('MaxInvoiceWithAttachmentSizeInMB');
end;

{ TKSeF2BatchSessionEffectiveContextLimits }

function TKSeF2BatchSessionEffectiveContextLimits.GetMaxInvoices: Integer;
begin
  Result := GetIntegerProp('MaxInvoices');
end;

function TKSeF2BatchSessionEffectiveContextLimits.GetMaxInvoiceSizeInMB: Integer;
begin
  Result := GetIntegerProp('MaxInvoiceSizeInMB');
end;

function TKSeF2BatchSessionEffectiveContextLimits.GetMaxInvoiceWithAttachmentSizeInMB: Integer;
begin
  Result := GetIntegerProp('MaxInvoiceWithAttachmentSizeInMB');
end;

{ TKSeF2EffectiveContextLimits }

procedure TKSeF2EffectiveContextLimits.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('OnlineSession');
  if O <> nil then
    FOnlineSession := TKSeF2OnlineSessionEffectiveContextLimits.Create(Self, O);
  O := GetObjectProp('BatchSession');
  if O <> nil then
    FBatchSession := TKSeF2BatchSessionEffectiveContextLimits.Create(Self, O);
end;

{ TKSeF2EnrollmentEffectiveSubjectLimits }

function TKSeF2EnrollmentEffectiveSubjectLimits.GetMaxEnrollments: Integer;
begin
  Result := GetIntegerProp('MaxEnrollments');
end;

{ TKSeF2CertificateEffectiveSubjectLimits }

function TKSeF2CertificateEffectiveSubjectLimits.GetMaxCertificates: Integer;
begin
  Result := GetIntegerProp('MaxCertificates');
end;

{ TKSeF2EffectiveSubjectLimits }

procedure TKSeF2EffectiveSubjectLimits.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Enrollment');
  if O <> nil then
    FEnrollment := TKSeF2EnrollmentEffectiveSubjectLimits.Create(Self, O);
  O := GetObjectProp('Certificate');
  if O <> nil then
    FCertificate := TKSeF2CertificateEffectiveSubjectLimits.Create(Self, O);
end;

{ TKSeF2EffectiveApiRateLimitValues }

function TKSeF2EffectiveApiRateLimitValues.GetPerHour: Integer;
begin
  Result := GetIntegerProp('PerHour');
end;

function TKSeF2EffectiveApiRateLimitValues.GetPerMinute: Integer;
begin
  Result := GetIntegerProp('PerMinute');
end;

function TKSeF2EffectiveApiRateLimitValues.GetPerSecond: Integer;
begin
  Result := GetIntegerProp('PerSecond');
end;

{ TKSeF2EffectiveApiRateLimits }

procedure TKSeF2EffectiveApiRateLimits.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('OnlineSession');
  if O <> nil then
    FOnlineSession := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('BatchSession');
  if O <> nil then
    FBatchSession := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('InvoiceSend');
  if O <> nil then
    FInvoiceSend := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('InvoiceStatus');
  if O <> nil then
    FInvoiceStatus := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('SessionList');
  if O <> nil then
    FSessionList := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('SessionInvoiceList');
  if O <> nil then
    FSessionInvoiceList := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('SessionMisc');
  if O <> nil then
    FSessionMisc := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('InvoiceMetadata');
  if O <> nil then
    FInvoiceMetadata := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('InvoiceExport');
  if O <> nil then
    FInvoiceExport := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('InvoiceExportStatus');
  if O <> nil then
    FInvoiceExportStatus := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('InvoiceDownload');
  if O <> nil then
    FInvoiceDownload := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
  O := GetObjectProp('Other');
  if O <> nil then
    FOther := TKSeF2EffectiveApiRateLimitValues.Create(Self, O);
end;

{ TKSeF2PeppolProvider }

function TKSeF2PeppolProvider.GetDateCreated: TDateTime;
begin
  Result := GetDoubleProp('DateCreated');
end;

function TKSeF2PeppolProvider.GetDateCreatedRaw: UTF8String;
begin
  Result := GetStringProp('DateCreatedRaw');
end;

function TKSeF2PeppolProvider.GetId: UTF8String;
begin
  Result := GetStringProp('Id');
end;

function TKSeF2PeppolProvider.GetName: UTF8String;
begin
  Result := GetStringProp('Name');
end;

{ TKSeF2PeppolProviderArray }

function TKSeF2PeppolProviderArray.GetItem(AIndex: Integer
  ): TKSeF2PeppolProvider;
begin
  Result := TKSeF2PeppolProvider(inherited GetItem(AIndex));
end;

{ TKSeF2QueryPeppolProvidersResponse }

function TKSeF2QueryPeppolProvidersResponse.GetHasMore: Boolean;
begin
  Result := GetBooleanProp('HasMore');
end;

procedure TKSeF2QueryPeppolProvidersResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('PeppolProviders');
  if O <> nil then
    FPeppolProviders := TKSeF2PeppolProviderArray.Create(Self, O);
end;

initialization
  lgoRegister;

end.
