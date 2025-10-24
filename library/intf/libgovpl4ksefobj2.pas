{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4KSeFObj2;

{$ifdef fpc}
{$mode Delphi}
{$endif}

// W Delphi 7 nie mozna uzywac slowa kluczowego jako identyfikator
{$ifdef VER150}
{$define LGP_ESCPASKEYWORDS}
{$endif}

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
    FObjects: TFPList;
  protected
    procedure CreateExtObject(AClassName: UTF8String);
    procedure LoadObject; virtual;
  public
    constructor Create(AOwner: TKSeF2Object; AClassName: UTF8String = ''); virtual; overload;
    constructor Create(AOwner: TKSeF2Object; AExtObject: LGP_OBJECT); virtual; overload;
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
    constructor Create(AOwner: TKSeF2Object; AClassName: UTF8String = ''); override; overload;
    constructor Create(AOwner: TKSeF2Object; AExtObject: LGP_OBJECT); override; overload;
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
    function GetTimestampRaw: UTF8String;
  published
    property Challenge: UTF8String read GetChallenge;
    property Timestamp: TDateTime read GetTimestamp;
    property TimestampRaw: UTF8String read GetTimestampRaw;
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
    property Items[AIndex: Integer]: TKSeF2AuthenticationListItem read GetItem;
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
    property Items[AIndex: Integer]: TKSeF2PublicKeyCertificate read GetItem;
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
    function GetFileName: UTF8String;
    function GetFileSize: Int64;
    function GetOrdinalNumber: Integer;
    procedure SetFileHash(AValue: UTF8String);
    procedure SetFileName(AValue: UTF8String);
    procedure SetFileSize(AValue: Int64);
    procedure SetOrdinalNumber(AValue: Integer);
  published
    property OrdinalNumber: Integer read GetOrdinalNumber write SetOrdinalNumber;
    property FileName: UTF8String read GetFileName write SetFileName;
    property FileSize: Int64 read GetFileSize write SetFileSize;
    property FileHash: UTF8String read GetFileHash write SetFileHash;
  end;

  { TKSeF2BatchFilePartInfoArray }

  TKSeF2BatchFilePartInfoArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2BatchFilePartInfo;
  public
    property Items[AIndex: Integer]: TKSeF2BatchFilePartInfo read GetItem;
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

  { TKSeF2Header }

  TKSeF2Header = class(TKSeF2Object)
  private
    function GetKey: UTF8String;
    function GetValue: UTF8String;
  published
    property Key: UTF8String read GetKey;
    property Value: UTF8String read GetValue;
  end;

  { TKSeF2Headers }

  TKSeF2Headers = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2Header;
  public
    property Items[AIndex: Integer]: TKSeF2Header read GetItem;
  end;

  { TKSeF2PartUploadRequest }

  TKSeF2PartUploadRequest = class(TKSeF2Object)
  private
    FHeaders: TKSeF2Headers;
    function GetMethod: UTF8String;
    function GetOrdinalNumber: Integer;
    function GetUrl: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property OrdinalNumber: Integer read GetOrdinalNumber;
    property Method: UTF8String read GetMethod;
    property Url: UTF8String read GetUrl;
    property Headers: TKSeF2Headers read FHeaders;
  end;

  { TKSeF2PartUploadRequestArray }

  TKSeF2PartUploadRequestArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2PartUploadRequest;
  public
    property Items[AIndex: Integer]: TKSeF2PartUploadRequest read GetItem;
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
    property Items[AIndex: Integer]: TKSeF2SessionsQueryResponseItem read GetItem;
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
    function GetReferenceNumber: UTF8String;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property DownloadUrl: UTF8String read GetDownloadUrl;
  end;

  { TKSeF2UpoPageResponseArray }

  TKSeF2UpoPageResponseArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2UpoPageResponse;
  public
    property Items[AIndex: Integer]: TKSeF2UpoPageResponse read GetItem;
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
    function GetFailedInvoiceCount: Integer;
    function GetInvoiceCount: Integer;
    function GetSuccessfulInvoiceCount: Integer;
    function GetValidUntil: TDateTime;
    function GetValidUntilRaw: UTF8String;
  protected
    procedure LoadObject; override;
  published
    property Status: TKSeF2StatusInfo read FStatus;
    property ValidUntil: TDateTime read GetValidUntil;
    property ValidUntilRaw: UTF8String read GetValidUntilRaw;
    property Upo: TKSeF2UpoResponse read FUpo;
    property InvoiceCount: Integer read GetInvoiceCount;
    property SuccessfulInvoiceCount: Integer read GetSuccessfulInvoiceCount;
    property FailedInvoiceCount: Integer read GetFailedInvoiceCount;
  end;

  { TKSeF2SessionInvoiceStatusResponse }

  TKSeF2SessionInvoiceStatusResponse = class(TKSeF2Response)
  private
    FStatus: TKSeF2StatusInfo;
    function GetAcquisitionDate: TDateTime;
    function GetAcquisitionDateRaw: UTF8String;
    function GetInvoiceFileName: UTF8String;
    function GetInvoiceHash: UTF8String;
    function GetInvoiceNumber: UTF8String;
    function GetInvoicingDate: TDateTime;
    function GetInvoicingDateRaw: UTF8String;
    function GetKsefNumber: UTF8String;
    function GetOrdinalNumber: Integer;
    function GetPermanentStorageDate: TDateTime;
    function GetPermanentStorageDateRaw: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetUpoDownloadUrl: UTF8String;
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
    property Status: TKSeF2StatusInfo read FStatus;
  end;

  { TKSeF2SessionInvoiceStatusResponseArray }

  TKSeF2SessionInvoiceStatusResponseArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2SessionInvoiceStatusResponse;
  public
    property Items[AIndex: Integer]: TKSeF2SessionInvoiceStatusResponse read GetItem;
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
    function GetTo: TDateTime;
    procedure SetDateType(AValue: TKSeF2InvoiceQueryDateType);
    procedure SetFrom(AValue: TDateTime);
    procedure SetTo(AValue: TDateTime);
  published
    property DateType: TKSeF2InvoiceQueryDateType read GetDateType write SetDateType;
    property From: TDateTime read GetFrom write SetFrom;
    property To_: TDateTime read GetTo write SetTo;
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

  TKSeF2InvoicingMode = (imNotDefined, imOnline, imOffline);

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
    property Items[AIndex: Integer]: TKSeF2InvoiceMetadataThirdSubject read GetItem;
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
    property Items[AIndex: Integer]: TKSeF2InvoiceMetadata read GetItem;
  end;

  { TKSeF2QueryInvoicesMetadataResponse }

  TKSeF2QueryInvoicesMetadataResponse = class(TKSeF2Response)
  private
    FInvoices: TKSeF2InvoiceMetadataArray;
    function GetHasMore: Boolean;
    function GetIsTruncated: Boolean;
  protected
    procedure LoadObject; override;
  published
    property HasMore: Boolean read GetHasMore;
    property IsTruncated: Boolean read GetIsTruncated;
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
    function GetOperationReferenceNumber: UTF8String;
  published
    property OperationReferenceNumber: UTF8String read GetOperationReferenceNumber;
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
  end;

  { TKSeF2InvoicePackagePartArray }

  TKSeF2InvoicePackagePartArray = class(TKSeF2Array)
  protected
    function GetItem(AIndex: Integer): TKSeF2InvoicePackagePart;
  public
    property Items[AIndex: Integer]: TKSeF2InvoicePackagePart read GetItem;
  end;

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
  protected
    procedure LoadObject; override;
  published
    property Status: TKSeF2StatusInfo read FStatus;
    property CompletedDate: TDateTime read GetCompletedDate;
    property CompletedDateRaw: UTF8String read GetCompletedDateRaw;
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
    property Items[AIndex: Integer]: TKSeF2QueryTokensResponseItem read GetItem;
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
    property Items[AIndex: Integer]: TKSeF2Subunit read GetItem;
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
    TKSeF2Header,
    TKSeF2Headers,
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
          if lgoCheckResult(lgpObject_GetStringProp(AException, 'ExceptionDescription', S), False) then
            FExceptionDetailList[I].ExceptionDescription := lgoGetString(S);
          if lgoCheckResult(lgpObject_GetStringProp(AException, 'ExceptionDetails', S), False) then
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
  FObjects := TFPList.Create;
  if Assigned(AOwner) then
    AOwner.InsertObject(Self);
  if AClassName = '' then
    AClassName := ClassName;
  CreateExtObject(AClassName);
end;

constructor TKSeF2Object.Create(AOwner: TKSeF2Object; AExtObject: LGP_OBJECT);
begin
  FObjects := TFPList.Create;
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

function TKSeF2BatchFilePartInfo.GetFileName: UTF8String;
begin
  Result := GetStringProp('FileName');
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

procedure TKSeF2BatchFilePartInfo.SetFileName(AValue: UTF8String);
begin
  SetStringProp('FileName', AValue);
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

function TKSeF2Header.GetKey: UTF8String;
begin
  Result := GetStringProp('Key');
end;

function TKSeF2Header.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

{ TKSeF2Headers }

function TKSeF2Headers.GetItem(AIndex: Integer): TKSeF2Header;
begin
  Result := TKSeF2Header(inherited GetItem(AIndex));
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
    FHeaders := TKSeF2Headers.Create(Self, O);
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

procedure TKSeF2SessionInvoiceStatusResponse.LoadObject;
var
  O: LGP_OBJECT;
begin
  inherited LoadObject;
  O := GetObjectProp('Status');
  if O <> nil then
    FStatus := TKSeF2StatusInfo.Create(Self, O);
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
  Int32ToSet(GetIntegerProp('InvoiceTypes'), Ord(High(TKSeF2InvoiceType)), SizeOf(Result), @Result);
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

function TKSeF2ExportInvoicesResponse.GetOperationReferenceNumber: UTF8String;
begin
  Result := GetStringProp('OperationReferenceNumber');
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
  Int32ToSet(GetIntegerProp('RequestedPermissions'), Ord(High(TKSeF2TokenPermissionType)), SizeOf(Result), @Result);
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

initialization
  lgoRegister;

end.
