{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4KSeFObj;

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

  { Rodzaj autoryzacji certyfikatu kwalifikowanego }
  TlgoKSeFCertificateAuthType = (
    { Numer seryjny }
    catSerialNumber,
    { Odcisk palca }
    catFingerprint);

  { Kod formularza FA }
  TlgoKSeFFormCode = (kfcCustom, kfcFA1, kfcFA2);

  { Podstawowa klasa wyjątku przy obsłudze KSeF }
  EKSeFException = class(ElgoException);

  TKSeFExceptionDetail = record
    ExceptionCode: Integer;
    ExceptionDescription: UTF8String;
  end;

  TKSeFExceptionDetailList = array of TKSeFExceptionDetail;

  { EKSeFExceptionResponse }

  { Klasa wjątku zawierająca informacje zwracane przez serwery KSeF }
  EKSeFExceptionResponse = class(EKSeFException)
  private
    FExceptionDetailList: TKSeFExceptionDetailList;
    FRawData: UTF8String;
    FReferenceNumber: UTF8String;
    FResponseCode: Integer;
    FServiceCode: UTF8String;
    FServiceCtx: UTF8String;
    FServiceName: UTF8String;
    FTimestamp: TDateTime;
  protected
    procedure LoadObject(AException: LGP_EXCEPTION); override;
  public
    property ResponseCode: Integer read FResponseCode;
    property RawData: UTF8String read FRawData;
    property ServiceCtx: UTF8String read FServiceCtx;
    property ServiceCode: UTF8String read FServiceCode;
    property ServiceName: UTF8String read FServiceName;
    property Timestamp: TDateTime read FTimestamp;
    property ReferenceNumber: UTF8String read FReferenceNumber;
    property ExceptionDetailList: TKSeFExceptionDetailList read FExceptionDetailList;
  end;

  { Wyjątek zgłaszany w przypadku próby pobrania nieistniejącego dokumentu }
  EKSeFNotFoundException = class(EKSeFException);

  { TKSeFObject }

  {$M+}
  { Podstawa obiektów żądań i odpowiedzi KSeF }
  TKSeFObject = class(TlgoCreatableObject)
  protected
    procedure CreateExtObject(AClassName: UTF8String);
  public
    constructor Create;  overload; virtual;
    constructor Create(AClassName: UTF8String); overload; override;
  end;
  {$M-}

  TKSeFObjectClass = class of TKSeFObject;

  { TKSeFArray }

  { Podstawa list obiektów KSeF }
  TKSeFArray = class(TKSeFObject)
  private
    FList: TList;
    function GetOwnObjects: Boolean;
    procedure SetOwnObjects(AValue: Boolean);
  protected
    function GetItem(AIndex: Integer): TKSeFObject;
    class function GetItemClass(AObject: LGP_OBJECT): TKSeFObjectClass; virtual;
  public
    constructor Create(AClassName: UTF8String); overload; override;
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
    function Count: Integer;
    procedure Delete(AIndex: Integer);
    property Items[AIndex: Integer]: TKSeFObject read GetItem;
    property OwnObjects: Boolean read GetOwnObjects write SetOwnObjects;
  end;

  { TKSeFRequest }

  { Podstawa żądania KSeF }
  TKSeFRequest = class(TKSeFObject)
  private
    function GetAsJSONString: UTF8String;
  published
    property AsJSONString: UTF8String read GetAsJSONString;
  end;

  { TKSeFResponse }

  { Podstawa odpowiedzi serwera KSeF }
  TKSeFResponse = class(TKSeFObject)
  private
    function GetRawResponse: UTF8String;
  published
    property RawResponse: UTF8String read GetRawResponse;
  end;

  { TKSeFSubjectIdentifierBy }

  TKSeFSubjectIdentifierBy = class(TKSeFObject)
  private
    function GetType: UTF8String;
  public
    class function CreateFromObject(O: LGP_OBJECT): TKSeFSubjectIdentifierBy;
  published
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType;
  end;

  { TKSeFSubjectIdentifierByCompany }

  TKSeFSubjectIdentifierByCompany = class(TKSeFSubjectIdentifierBy)
  private
    function GetIdentifier: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
  published
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
  end;

  { TKSeFSubjectIdentifierInternal }

  TKSeFSubjectIdentifierInternal = class(TKSeFSubjectIdentifierBy)
  private
    function GetIdentifier: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
  published
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
  end;

  { TKSeFSubjectCompleteName }

  TKSeFSubjectCompleteName = class(TKSeFObject)
  private
    function GetFullName: String;
  published
    property FullName: String read GetFullName;
  end;

  { TKSeFSubjectName }

  TKSeFSubjectName = class(TKSeFObject)
  private
    function GetTradeName: UTF8String;
    function GetType: UTF8String;
    procedure SetTradeName(AValue: UTF8String);
  public
    class function CreateFromObject(O: LGP_OBJECT): TKSeFSubjectName;
  published
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType;
    property TradeName: UTF8String read GetTradeName write SetTradeName;
  end;

  { TKSeFSubjectFullName }

  TKSeFSubjectFullName = class(TKSeFSubjectName)
  private
    function GetFullName: UTF8String;
    procedure SetFullName(AValue: UTF8String);
  published
    property FullName: UTF8String read GetFullName write SetFullName;
  end;

  { TKSeFSubjectPersonName }

  TKSeFSubjectPersonName = class(TKSeFSubjectName)
  private
    function GetFirstName: UTF8String;
    function GetSurname: UTF8String;
    procedure SetFirstName(AValue: UTF8String);
    procedure SetSurname(AValue: UTF8String);
  published
    property FirstName: UTF8String read GetFirstName write SetFirstName;
    property Surname: UTF8String read GetSurname write SetSurname;
  end;

  TKSeFSubjectNone = class(TKSeFSubjectName)
  end;

  { TKSeFCredentialsIdentifierResponse }

  TKSeFCredentialsIdentifierResponse = class(TKSeFObject)
  private
    function GetIdentifier: UTF8String;
    function GetType: UTF8String;
  published
    property Identifier: UTF8String read GetIdentifier;
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType;
  end;

  TKSeFRoleType = (krt_owner, krt_introspection, krt_invoice_read, krt_invoice_write,
    krt_payment_confirmation_write, krt_credentials_read, krt_credentials_manage,
    krt_self_invoicing, krt_tax_representative, krt_enforcement_operations, krt_court_bailiff,
    krt_enforcement_authority, krt_subunit_manage, krt_local_government_unit,
    krt_local_government_sub_unit, krt_vat_group_unit, krt_vat_group_sub_unit);

  { TKSeFCredentialsRoleResponseBase }

  TKSeFCredentialsRoleResponseBase = class(TKSeFObject)
  private
    function GetRoleDescription: UTF8String;
    function GetRoleType: TKSeFRoleType;
    function GetRoleTypeRaw: UTF8String;
    function GetStartTimestamp: TDateTime;
    function GetStartTimestampRaw: UTF8String;
    function GetType: UTF8String;
  published
    property RoleDescription: UTF8String read GetRoleDescription;
    property StartTimestamp: TDateTime read GetStartTimestamp;
    property StartTimestampRaw: UTF8String read GetStartTimestampRaw;
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType;
    property RoleType: TKSeFRoleType read GetRoleType;
    property RoleTypeRaw: UTF8String read GetRoleTypeRaw;
  end;

  { TKSeFCredentialsRoleResponseGrantedForInstitution }

  TKSeFCredentialsRoleResponseGrantedForInstitution = class(TKSeFCredentialsRoleResponseBase)
  end;

  TKSeFCredentialsAssignmentType = (kca_system, kca_user);

  { TKSeFCredentialsRoleResponseStandardDetails }

  TKSeFCredentialsRoleResponseStandardDetails = class(TKSeFCredentialsRoleResponseBase)
  private
    FRoleAssigningAuthorIdentifier: TKSeFCredentialsIdentifierResponse;
    function GetCredentialsAssignmentType: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property CredentialsAssignmentTypeRaw: UTF8String read GetCredentialsAssignmentType;
    property RoleAssigningAuthorIdentifier: TKSeFCredentialsIdentifierResponse read FRoleAssigningAuthorIdentifier;
  end;

  { TKSeFCredentialsRoleResponseStandardPlain }

  TKSeFCredentialsRoleResponseStandardPlain = class(TKSeFCredentialsRoleResponseBase)
  end;

  { TKSeFCredentialsRoleResponseToken }

  TKSeFCredentialsRoleResponseToken = class(TKSeFCredentialsRoleResponseBase)
  end;

  { TKSeFCredentialsRoleResponseStandardContextDetails }

  TKSeFCredentialsRoleResponseStandardContextDetails = class(TKSeFCredentialsRoleResponseBase)
  private
    FContextIdentifier: TKSeFCredentialsIdentifierResponse;
    FSourceIdentifier: TKSeFCredentialsIdentifierResponse;
    FTargetIdentifier: TKSeFCredentialsIdentifierResponse;
    function GetCredentialsAssignmentType: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property ContextIdentifier: TKSeFCredentialsIdentifierResponse read FContextIdentifier write FContextIdentifier;
    property CredentialsAssignmentTypeRaw: UTF8String read GetCredentialsAssignmentType;
    property SourceIdentifier: TKSeFCredentialsIdentifierResponse read FSourceIdentifier write FSourceIdentifier;
    property TargetIdentifier: TKSeFCredentialsIdentifierResponse read FTargetIdentifier write FTargetIdentifier;
  end;

  { TKSeFCredentialsRoleResponseBaseArray }

  TKSeFCredentialsRoleResponseBaseArray = class(TKSeFArray)
  protected
    function GetItem(AIndex: Integer): TKSeFCredentialsRoleResponseBase;
  public
    //class function GetItemClass(AObject: LGP_OBJECT): TKSeFObjectClass; override;
    property Items[AIndex: Integer]: TKSeFCredentialsRoleResponseBase read GetItem;
  end;

  { TKSeFSessionContext }

  TKSeFSessionContext = class(TKSeFObject)
  private
    FContextIdentifier: TKSeFSubjectIdentifierBy;
    FContextName: TKSeFSubjectCompleteName;
    FCredentialsRoleList: TKSeFCredentialsRoleResponseBaseArray;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property ContextIdentifier: TKSeFSubjectIdentifierBy read FContextIdentifier;
    property ContextName: TKSeFSubjectCompleteName read FContextName;
    property CredentialsRoleList: TKSeFCredentialsRoleResponseBaseArray read FCredentialsRoleList;
  end;

  { TKSeFInitialisedSession }

  TKSeFInitialisedSession = class(TKSeFObject)
  private
    FContext: TKSeFSessionContext;
    function GetToken: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property Token: UTF8String read GetToken;
    property Context: TKSeFSessionContext read FContext;
  end;

  { TKSeFInitSessionResponse }

  TKSeFInitSessionResponse = class(TKSeFResponse)
  private
    FSessionToken: TKSeFInitialisedSession;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property Timestamp: TDateTime read GetTimestamp;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property SessionToken: TKSeFInitialisedSession read FSessionToken;
  end;

  { TKSeFSessionInvoiceStatus }

  TKSeFSessionInvoiceStatus = class(TKSeFObject)
  private
    function GetAcquisitionTimestamp: TDateTime;
    function GetAcquisitionTimestampRaw: UTF8String;
    function GetElementReferenceNumber: UTF8String;
    function GetInvoiceNumber: UTF8String;
    function GetKsefReferenceNumber: UTF8String;
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
  published
    property AcquisitionTimestampRaw: UTF8String read GetAcquisitionTimestampRaw;
    property AcquisitionTimestamp: TDateTime read GetAcquisitionTimestamp;
    property ElementReferenceNumber: UTF8String read GetElementReferenceNumber;
    property InvoiceNumber: UTF8String read GetInvoiceNumber;
    property KsefReferenceNumber: UTF8String read GetKsefReferenceNumber;
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
  end;

  { TKSeFTKSeFSessionInvoiceStatusArray }

  TKSeFSessionInvoiceStatusArray = class(TKSeFArray)
  protected
    function GetItem(AIndex: Integer): TKSeFSessionInvoiceStatus;
  public
    //class function GetItemClass(AObject: LGP_OBJECT): TKSeFObjectClass; override;
    property Items[AIndex: Integer]: TKSeFSessionInvoiceStatus read GetItem;
  end;

  { TKSeFSessionStatusResponse }

  TKSeFSessionStatusResponse = class(TKSeFResponse)
  private
    FInvoiceStatusList: TKSeFSessionInvoiceStatusArray;
    function GetCreationTimestamp: TDateTime;
    function GetCreationTimestampRaw: UTF8String;
    function GetEntityType: UTF8String;
    function GetLastUpdateTimestamp: TDateTime;
    function GetLastUpdateTimestampRaw: UTF8String;
    function GetNumberOfElements: Integer;
    function GetPageOffset: Integer;
    function GetPageSize: Integer;
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property CreationTimestamp: TDateTime read GetCreationTimestamp;
    property CreationTimestampRaw: UTF8String read GetCreationTimestampRaw;
    property EntityType: UTF8String read GetEntityType;
    property InvoiceStatusList: TKSeFSessionInvoiceStatusArray read FInvoiceStatusList write FInvoiceStatusList;
    property LastUpdateTimestamp: TDateTime read GetLastUpdateTimestamp;
    property LastUpdateTimestampRaw: UTF8String read GetLastUpdateTimestampRaw;
    property NumberOfElements: Integer read GetNumberOfElements;
    property PageOffset: Integer read GetPageOffset;
    property PageSize: Integer read GetPageSize;
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFTerminateSessionResponse }

  TKSeFTerminateSessionResponse = class(TKSeFResponse)
  private
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFInternalIdentifierGeneratedResponse }

  TKSeFInternalIdentifierGeneratedResponse = class(TKSeFResponse)
  private
    function GetInternalIdentifier: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property InternalIdentifier: UTF8String read GetInternalIdentifier;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFCredentialsIdentifierRequest }

  TKSeFCredentialsIdentifierRequest = class(TKSeFObject)
  private
    function GetIdentifier: UTF8String;
    function GetType: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
    procedure SetType(AValue: UTF8String);
  published
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType write SetType;
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
  end;

  { TKSeFQueryCriteriaCredentials }

  TKSeFQueryCriteriaCredentials = class(TKSeFObject)
  private
    function GetType: UTF8String;
    procedure SetType(AValue: UTF8String);
  published
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType write SetType;
  end;

  { TKSeFQueryCriteriaCredentialsAll }

  TKSeFQueryCriteriaCredentialsAll = class(TKSeFQueryCriteriaCredentials)
  private
    function GetQueryCredentialsScopeResultTypeRaw: UTF8String;
    function GetQueryCredentialsTypeResultTypeRaw: UTF8String;
    procedure SetQueryCredentialsScopeResultTypeRaw(AValue: UTF8String);
    procedure SetQueryCredentialsTypeResultTypeRaw(AValue: UTF8String);
  published
    property QueryCredentialsScopeResultTypeRaw: UTF8String read GetQueryCredentialsScopeResultTypeRaw write SetQueryCredentialsScopeResultTypeRaw;
    property QueryCredentialsTypeResultTypeRaw: UTF8String read GetQueryCredentialsTypeResultTypeRaw write SetQueryCredentialsTypeResultTypeRaw;
  end;

  { TKSeFQueryCriteriaCredentialsId }

  TKSeFQueryCriteriaCredentialsId = class(TKSeFQueryCriteriaCredentials)
  private
    FCredentialsIdentifier: TKSeFCredentialsIdentifierRequest;
    function GetQueryCredentialsScopeResultTypeRaw: UTF8String;
    function GetQueryCredentialsTypeResultTypeRaw: UTF8String;
    procedure SetCredentialsIdentifier(AValue: TKSeFCredentialsIdentifierRequest
      );
    procedure SetQueryCredentialsScopeResultTypeRaw(AValue: UTF8String);
    procedure SetQueryCredentialsTypeResultTypeRaw(AValue: UTF8String);
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property CredentialsIdentifier: TKSeFCredentialsIdentifierRequest read FCredentialsIdentifier write SetCredentialsIdentifier;
    property QueryCredentialsScopeResultTypeRaw: UTF8String read GetQueryCredentialsScopeResultTypeRaw write SetQueryCredentialsScopeResultTypeRaw;
    property QueryCredentialsTypeResultTypeRaw: UTF8String read GetQueryCredentialsTypeResultTypeRaw write SetQueryCredentialsTypeResultTypeRaw;
  end;

  { TKSeFQuerySyncCredentialsRequest }

  TKSeFQuerySyncCredentialsRequest = class(TKSeFRequest)
  private
    FQueryCriteria: TKSeFQueryCriteriaCredentials;
    procedure SetQueryCriteria(AValue: TKSeFQueryCriteriaCredentials);
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property QueryCriteria: TKSeFQueryCriteriaCredentials read FQueryCriteria write SetQueryCriteria;
  end;

  { TKSeFCredentialsBaseTypeObject }

  TKSeFCredentialsBaseTypeObject = class(TKSeFObject)
  private
    FCredentialsRoleList: TKSeFCredentialsRoleResponseBaseArray;
    FIdentifier: TKSeFCredentialsIdentifierResponse;
    function GetType: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); override;
    destructor Destroy; override;
    class function CreateFromObject(O: LGP_OBJECT): TKSeFCredentialsBaseTypeObject;
  published
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType;
    property CredentialsRoleList: TKSeFCredentialsRoleResponseBaseArray read FCredentialsRoleList;
    property Identifier: TKSeFCredentialsIdentifierResponse read FIdentifier write FIdentifier;
  end;

  TKSeFCredentialsContext = class(TKSeFCredentialsBaseTypeObject)
  end;

  { TKSeFCredentialsPlain }

  TKSeFCredentialsPlain = class(TKSeFCredentialsBaseTypeObject)
  private
    FCredentialsRole: TKSeFCredentialsRoleResponseStandardPlain;
  public
    constructor Create(AObject: LGP_OBJECT); override;
    destructor Destroy; override;
  published
    property CredentialsRole: TKSeFCredentialsRoleResponseStandardPlain read FCredentialsRole;
  end;

  { TKSeFCredentialsToken }

  TKSeFCredentialsToken = class(TKSeFCredentialsBaseTypeObject)
  private
    FParent: TKSeFCredentialsPlain;
    function GetDescription: UTF8String;
    function GetLastUseTimestamp: TDateTime;
    function GetLastUseTimestampRaw: UTF8String;
    function GetRegistrationTimestamp: TDateTime;
    function GetRegistrationTimestampRaw: UTF8String;
    function GetStatus: Integer;
  public
    constructor Create(AObject: LGP_OBJECT); override;
    destructor Destroy; override;
  published
    property Description: UTF8String read GetDescription;
    property LastUseTimestamp: TDateTime read GetLastUseTimestamp;
    property LastUseTimestampRaw: UTF8String read GetLastUseTimestampRaw;
    property Parent: TKSeFCredentialsPlain read FParent;
    property RegistrationTimestamp: TDateTime read GetRegistrationTimestamp;
    property RegistrationTimestampRaw: UTF8String read GetRegistrationTimestampRaw;
    property Status: Integer read GetStatus;
  end;

  { TKSeFCredentialsParent }

  TKSeFCredentialsParent = class(TKSeFCredentialsBaseTypeObject)
  private
    FCredentialsRole: TKSeFCredentialsRoleResponseStandardPlain;
  public
    constructor Create(AObject: LGP_OBJECT); override;
    destructor Destroy; override;
  published
    property CredentialsRole: TKSeFCredentialsRoleResponseStandardPlain read FCredentialsRole;
  end;

  { TKSeFCredentialsBaseTypeObjectArray }

  TKSeFCredentialsBaseTypeObjectArray = class(TKSeFArray)
  private
    function GetItem(AIndex: Integer): TKSeFCredentialsBaseTypeObject;
  public
    property Items[AIndex: Integer]: TKSeFCredentialsBaseTypeObject read GetItem;
  end;

  { TKSeFQuerySyncCredentialsResponse }

  TKSeFQuerySyncCredentialsResponse = class(TKSeFResponse)
  private
    FCredentialsList: TKSeFCredentialsBaseTypeObjectArray;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property CredentialsList: TKSeFCredentialsBaseTypeObjectArray read FCredentialsList;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property Timestamp: TDateTime read GetTimestamp;
    property TimestampRaw: UTF8String read GetTimestampRaw;
  end;

  { TKSeFSendInvoiceResponse }

  TKSeFSendInvoiceResponse = class(TKSeFResponse)
  private
    function GetElementReferenceNumber: UTF8String;
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property ElementReferenceNumber: UTF8String read GetElementReferenceNumber;
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFInvoiceStatus }

  TKSeFInvoiceStatus = class(TKSeFObject)
  private
    function GetAcquisitionTimestamp: TDateTime;
    function GetAcquisitionTimestampRaw: UTF8String;
    function GetInvoiceNumber: UTF8String;
    function GetKsefReferenceNumber: UTF8String;
  published
    property AcquisitionTimestampRaw: UTF8String read GetAcquisitionTimestampRaw;
    property AcquisitionTimestamp: TDateTime read GetAcquisitionTimestamp;
    property InvoiceNumber: UTF8String read GetInvoiceNumber;
    property KsefReferenceNumber: UTF8String read GetKsefReferenceNumber;
  end;

  { TKSeFStatusInvoiceResponse }

  TKSeFStatusInvoiceResponse = class(TKSeFResponse)
  private
    FInvoiceStatus: TKSeFInvoiceStatus;
    function GetElementReferenceNumber: UTF8String;
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property ElementReferenceNumber: UTF8String read GetElementReferenceNumber;
    property InvoiceStatus: TKSeFInvoiceStatus read FInvoiceStatus write FInvoiceStatus;
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFHideInvoiceRequestType }

  TKSeFHideInvoiceRequestType = class(TKSeFObject)
  private
    function GetHidingReason: UTF8String;
    function GetKsefReferenceNumber: UTF8String;
    procedure SetHidingReason(AValue: UTF8String);
    procedure SetKsefReferenceNumber(AValue: UTF8String);
  published
    property HidingReason: UTF8String read GetHidingReason write SetHidingReason;
    property KsefReferenceNumber: UTF8String read GetKsefReferenceNumber write SetKsefReferenceNumber;
  end;

  TKSeFHideInvoiceRequest = class(TKSeFRequest)
  private
    FInvoiceHideRequest: TKSeFHideInvoiceRequestType;
    procedure SetInvoiceHideRequest(AValue: TKSeFHideInvoiceRequestType);
  public
    destructor Destroy; override;
  published
    property InvoiceHideRequest: TKSeFHideInvoiceRequestType read FInvoiceHideRequest write SetInvoiceHideRequest;
  end;

  { TKSeFShowInvoiceRequestType }

  TKSeFShowInvoiceRequestType = class(TKSeFObject)
  private
    function GetHidingCancelationReason: UTF8String;
    function GetKsefReferenceNumber: UTF8String;
    procedure SetHidingCancelationReason(AValue: UTF8String);
    procedure SetKsefReferenceNumber(AValue: UTF8String);
  published
    property HidingCancelationReason: UTF8String read GetHidingCancelationReason write SetHidingCancelationReason;
    property KsefReferenceNumber: UTF8String read GetKsefReferenceNumber write SetKsefReferenceNumber;
  end;

  TKSeFShowInvoiceRequest = class(TKSeFRequest)
  private
    FInvoiceHideCancelationRequest: TKSeFShowInvoiceRequestType;
    procedure SetInvoiceHideCancelationRequest(
      AValue: TKSeFShowInvoiceRequestType);
  public
    destructor Destroy; override;
  published
    property InvoiceHideCancelationRequest: TKSeFShowInvoiceRequestType read FInvoiceHideCancelationRequest write SetInvoiceHideCancelationRequest;
  end;

  { TKSeFVisibilityInvoiceResponse }

  TKSeFVisibilityInvoiceResponse = class(TKSeFResponse)
  private
    function GetCancelationReason: UTF8String;
    function GetCancelationTimestamp: TDateTime;
    function GetCancelationTimestampRaw: UTF8String;
    function GetCanceled: Boolean;
    function GetHidingReason: UTF8String;
    function GetHidingTimestamp: TDateTime;
    function GetHidingTimestampRaw: UTF8String;
    function GetKsefReferenceNumber: UTF8String;
  published
    property CancelationReason: UTF8String read GetCancelationReason;
    property CancelationTimestamp: TDateTime read GetCancelationTimestamp;
    property CancelationTimestampRaw: UTF8String read GetCancelationTimestampRaw;
    property Canceled: Boolean read GetCanceled;
    property HidingReason: UTF8String read GetHidingReason;
    property HidingTimestamp: TDateTime read GetHidingTimestamp;
    property HidingTimestampRaw: UTF8String read GetHidingTimestampRaw;
    property KsefReferenceNumber: UTF8String read GetKsefReferenceNumber;
  end;

  TKSeFSubjectType = (stSubject1, stSubject2, stSubject3, stSubjectAuthorized);
  TKSeFInvoiceType = (itVAT, itKOR, itZAL, itROZ, itUPR, itKOR_ZAL, itKOR_ROZ);
  TKSeFInvoiceTypes = set of TKSeFInvoiceType;

  { TKSeFSubjectBy }

  TKSeFSubjectBy = class(TKSeFObject)
  private
    FIssuedByIdentifier: TKSeFSubjectIdentifierBy;
    FIssuedByName: TKSeFSubjectName;
    function GetIssuedByIdentifier: TKSeFSubjectIdentifierBy;
    function GetIssuedByName: TKSeFSubjectName;
    procedure SetIssuedByIdentifier(AValue: TKSeFSubjectIdentifierBy);
    procedure SetIssuedByName(AValue: TKSeFSubjectName);
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property IssuedByIdentifier: TKSeFSubjectIdentifierBy read GetIssuedByIdentifier write SetIssuedByIdentifier;
    property IssuedByName: TKSeFSubjectName read GetIssuedByName write SetIssuedByName;
  end;

  { TKSeFSubjectIdentifierTo }

  TKSeFSubjectIdentifierTo = class(TKSeFObject)
  private
    function GetType: UTF8String;
    procedure SetType(AValue: UTF8String);
  public
    class function CreateFromObject(O: LGP_OBJECT): TKSeFSubjectIdentifierTo;
  published
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType write SetType;
  end;

  TKSeFSubjectIdentifierToNone = class(TKSeFSubjectIdentifierTo)
  end;

  { TKSeFSubjectIdentifierToCompany }

  TKSeFSubjectIdentifierToCompany = class(TKSeFSubjectIdentifierTo)
  private
    function GetIdentifier: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
  published
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
  end;

  { TKSeFSubjectIdentifierToOther }

  TKSeFSubjectIdentifierToOther = class(TKSeFSubjectIdentifierTo)
  private
    function GetIdentifier: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
  published
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
  end;

  { TKSeFSubjectIdentifierToVatUe }

  TKSeFSubjectIdentifierToVatUe = class(TKSeFSubjectIdentifierTo)
  private
    function GetIdentifier: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
  published
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
  end;

  { TKSeFSubjectTo }

  TKSeFSubjectTo = class(TKSeFObject)
  private
    FIssuedToIdentifier: TKSeFSubjectIdentifierTo;
    FIssuedToName: TKSeFSubjectName;
    function GetIssuedToIdentifier: TKSeFSubjectIdentifierTo;
    function GetIssuedToName: TKSeFSubjectName;
    procedure SetIssuedToIdentifier(AValue: TKSeFSubjectIdentifierTo);
    procedure SetIssuedToName(AValue: TKSeFSubjectName);
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property IssuedToIdentifier: TKSeFSubjectIdentifierTo read GetIssuedToIdentifier write SetIssuedToIdentifier;
    property IssuedToName: TKSeFSubjectName read GetIssuedToName write SetIssuedToName;
  end;

  { TKSeFQueryCriteriaInvoice }

  TKSeFQueryCriteriaInvoice = class(TKSeFRequest)
  private
    function GetHidingDateFrom: TDateTime;
    function GetHidingDateTo: TDateTime;
    function GetIsHidden: Boolean;
    function GetSubjectType: TKSeFSubjectType;
    procedure SetHidingDateFrom(AValue: TDateTime);
    procedure SetHidingDateTo(AValue: TDateTime);
    procedure SetIsHidden(AValue: Boolean);
    procedure SetSubjectType(AValue: TKSeFSubjectType);
  published
    property SubjectType: TKSeFSubjectType read GetSubjectType write SetSubjectType;
    property HidingDateFrom: TDateTime read GetHidingDateFrom write SetHidingDateFrom;
    property HidingDateTo: TDateTime read GetHidingDateTo write SetHidingDateTo;
    property IsHidden: Boolean read GetIsHidden write SetIsHidden;
  end;

  TKSeFAmountType = (kat_none, kat_brutto, kat_netto, kat_vat);

  { TKSeFQueryCriteriaInvoiceDetail }

  TKSeFQueryCriteriaInvoiceDetail = class(TKSeFQueryCriteriaInvoice)
  private
    FSubjectBy: TKSeFSubjectBy;
    FSubjectTo: TKSeFSubjectTo;
    function GetAmountFrom: Currency;
    function GetAmountTo: Currency;
    function GetAmountType: TKSeFAmountType;
    function GetCurrencyCodes: TStringArray;
    function GetCurrencyCodesStr: UTF8String;
    function GetFaP17Annotation: Boolean;
    function GetInvoiceNumber: UTF8String;
    function GetInvoiceTypes: TKSeFInvoiceTypes;
    function GetInvoicingDateFrom: TDateTime;
    function GetInvoicingDateTo: TDateTime;
    function GetKsefReferenceNumber: UTF8String;
    procedure SetAmountFrom(AValue: Currency);
    procedure SetAmountTo(AValue: Currency);
    procedure SetAmountType(AValue: TKSeFAmountType);
    procedure SetCurrencyCodes(AValue: TStringArray);
    procedure SetCurrencyCodesStr(AValue: UTF8String);
    procedure SetFaP17Annotation(AValue: Boolean);
    procedure SetInvoiceNumber(AValue: UTF8String);
    procedure SetInvoiceTypes(AValue: TKSeFInvoiceTypes);
    procedure SetInvoicingDateFrom(AValue: TDateTime);
    procedure SetInvoicingDateTo(AValue: TDateTime);
    procedure SetKsefReferenceNumber(AValue: UTF8String);
    procedure SetSubjectBy(AValue: TKSeFSubjectBy);
    procedure SetSubjectTo(AValue: TKSeFSubjectTo);
  public
    destructor Destroy; override;
  published
    property AmountFrom: Currency read GetAmountFrom write SetAmountFrom;
    property AmountTo: Currency read GetAmountTo write SetAmountTo;
    property AmountType: TKSeFAmountType read GetAmountType write SetAmountType;
    property CurrencyCodes: TStringArray read GetCurrencyCodes write SetCurrencyCodes;
    property CurrencyCodesStr: UTF8String read GetCurrencyCodesStr write SetCurrencyCodesStr;
    property FaP17Annotation: Boolean read GetFaP17Annotation write SetFaP17Annotation;
    property InvoiceNumber: UTF8String read GetInvoiceNumber write SetInvoiceNumber;
    property InvoiceTypes: TKSeFInvoiceTypes read GetInvoiceTypes write SetInvoiceTypes;
    property InvoicingDateFrom: TDateTime read GetInvoicingDateFrom write SetInvoicingDateFrom;
    property InvoicingDateTo: TDateTime read GetInvoicingDateTo write SetInvoicingDateTo;
    property KsefReferenceNumber: UTF8String read GetKsefReferenceNumber write SetKsefReferenceNumber;
    property SubjectBy: TKSeFSubjectBy read FSubjectBy write SetSubjectBy;
    property SubjectTo: TKSeFSubjectTo read FSubjectTo write SetSubjectTo;
  end;

  { TKSeFQueryCriteriaInvoiceIncremental }

  TKSeFQueryCriteriaInvoiceIncremental = class(TKSeFQueryCriteriaInvoice)
  private
    function GetAcquisitionTimestampThresholdFrom: TDateTime;
    function GetAcquisitionTimestampThresholdTo: TDateTime;
    procedure SetAcquisitionTimestampThresholdFrom(AValue: TDateTime);
    procedure SetAcquisitionTimestampThresholdTo(AValue: TDateTime);
  published
    property AcquisitionTimestampThresholdFrom: TDateTime read GetAcquisitionTimestampThresholdFrom write SetAcquisitionTimestampThresholdFrom;
    property AcquisitionTimestampThresholdTo: TDateTime read GetAcquisitionTimestampThresholdTo write SetAcquisitionTimestampThresholdTo;
  end;

  { TKSeFQueryCriteriaInvoiceRange }

  TKSeFQueryCriteriaInvoiceRange = class(TKSeFQueryCriteriaInvoice)
  private
    function GetInvoicingDateFrom: TDateTime;
    function GetInvoicingDateTo: TDateTime;
    procedure SetInvoicingDateFrom(AValue: TDateTime);
    procedure SetInvoicingDateTo(AValue: TDateTime);
  published
    property InvoicingDateFrom: TDateTime read GetInvoicingDateFrom write SetInvoicingDateFrom;
    property InvoicingDateTo: TDateTime read GetInvoicingDateTo write SetInvoicingDateTo;
  end;

  { TKSeFQueryInvoiceRequest }

  TKSeFQueryInvoiceRequest = class(TKSeFRequest)
  private
    FQueryCriteria: TKSeFQueryCriteriaInvoice;
    procedure SetQueryCriteria(AValue: TKSeFQueryCriteriaInvoice);
  public
    constructor Create(AQueryCriteria: TKSeFQueryCriteriaInvoice); overload;
    destructor Destroy; override;
  published
    property QueryCriteria: TKSeFQueryCriteriaInvoice read FQueryCriteria write SetQueryCriteria;
  end;

  { TKSeFSubjectIdentifierOtherTo }

  TKSeFSubjectIdentifierOtherTo = class(TKSeFObject)
  private
    function GetType: UTF8String;
  public
    class function CreateFromObject(O: LGP_OBJECT): TKSeFSubjectIdentifierOtherTo;
  published
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType;
  end;

  { TKSeFSubjectIdentifierOtherToInternal }

  TKSeFSubjectIdentifierOtherToInternal = class(TKSeFSubjectIdentifierOtherTo)
  private
    function GetIdentifier: UTF8String;
  published
    property Identifier: UTF8String read GetIdentifier;
  end;

  TKSeFSubjectIdentifierOtherToNone = class(TKSeFSubjectIdentifierOtherTo)
  end;

  { TKSeFSubjectIdentifierOtherToNrId }

  TKSeFSubjectIdentifierOtherToNrId = class(TKSeFSubjectIdentifierOtherTo)
  private
    function GetIdentifier: UTF8String;
  published
    property Identifier: UTF8String read GetIdentifier;
  end;

  { TKSeFSubjectIdentifierOtherToCompany }

  TKSeFSubjectIdentifierOtherToCompany = class(TKSeFSubjectIdentifierOtherTo)
  private
    function GetIdentifier: UTF8String;
  published
    property Identifier: UTF8String read GetIdentifier;
  end;

  { TKSeFSubjectIdentifierOtherToVatUe }

  TKSeFSubjectIdentifierOtherToVatUe = class(TKSeFSubjectIdentifierOtherTo)
  private
    function GetIdentifier: UTF8String;
  published
    property Identifier: UTF8String read GetIdentifier;
  end;

  TKSeFSubjectOtherType = (factor, recipient, original_subject, additional_purchaser, invoice_issuer, payer, other);

  { TKSeFSubjectOther }

  TKSeFSubjectOther = class(TKSeFObject)
  private
    FIssuedToIdentifier: TKSeFSubjectIdentifierOtherTo;
    FIssuedToName: TKSeFSubjectName;
    function GetSubjectOtherType: TKSeFSubjectOtherType;
    function GetSubjectOtherTypeRaw: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property IssuedToIdentifier: TKSeFSubjectIdentifierOtherTo read FIssuedToIdentifier;
    property IssuedToName: TKSeFSubjectName read FIssuedToName;
    property SubjectOtherType: TKSeFSubjectOtherType read GetSubjectOtherType;
    property SubjectOtherTypeRaw: UTF8String read GetSubjectOtherTypeRaw;
  end;

  { TKSeFSubjectOtherArray }

  TKSeFSubjectOtherArray = class(TKSeFArray)
  protected
    function GetItem(AIndex: Integer): TKSeFSubjectOther;
  public
    property Items[AIndex: Integer]: TKSeFSubjectOther read GetItem;
  end;

  TKSeFSubjectAuthorizedType = (enforcement_authority, court_bailiff, tax_representative);

  { TKSeFSubjectAuthorized }

  TKSeFSubjectAuthorized = class(TKSeFObject)
  private
    FIssuedToIdentifier: TKSeFSubjectIdentifierTo;
    FIssuedToName: TKSeFSubjectName;
    function GetSubjectAuthorizedType: TKSeFSubjectAuthorizedType;
    function GetSubjectAuthorizedTypeRaw: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property IssuedToIdentifier: TKSeFSubjectIdentifierTo read FIssuedToIdentifier;
    property IssuedToName: TKSeFSubjectName read FIssuedToName;
    property SubjectAuthorizedType: TKSeFSubjectAuthorizedType read GetSubjectAuthorizedType;
    property SubjectAuthorizedTypeRaw: UTF8String read GetSubjectAuthorizedTypeRaw;
  end;

  { TKSeFSubjectAuthorizedArray }

  TKSeFSubjectAuthorizedArray = class(TKSeFArray)
  protected
    function GetItem(AIndex: Integer): TKSeFSubjectAuthorized;
  public
    property Items[AIndex: Integer]: TKSeFSubjectAuthorized read GetItem;
  end;

  { TKSeFSubjectToArray }

  TKSeFSubjectToArray = class(TKSeFArray)
  protected
    function GetItem(AIndex: Integer): TKSeFSubjectTo;
  public
    property Items[AIndex: Integer]: TKSeFSubjectTo read GetItem;
  end;

  { TKSeFHashSHA }

  TKSeFHashSHA = class(TKSeFObject)
  private
    function GetAlgorithm: UTF8String;
    function GetEncoding: UTF8String;
    function GetValue: UTF8String;
    procedure SetAlgorithm(AValue: UTF8String);
    procedure SetEncoding(AValue: UTF8String);
    procedure SetValue(AValue: UTF8String);
  published
    property Algorithm: UTF8String read GetAlgorithm write SetAlgorithm;
    property Encoding: UTF8String read GetEncoding write SetEncoding;
    property Value: UTF8String read GetValue write SetValue;
  end;

  { TKSeFFileUnlimitedHash }

  TKSeFFileUnlimitedHash = class(TKSeFObject)
  private
    FHashSHA: TKSeFHashSHA;
    function GetFileSize: Integer;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property FileSize: Integer read GetFileSize;
    property HashSHA: TKSeFHashSHA read FHashSHA;
  end;

  { TKSeFInvoiceHeader }

  TKSeFInvoiceHeader = class(TKSeFObject)
  private
    FInvoiceHash: TKSeFFileUnlimitedHash;
    FSubjectBy: TKSeFSubjectBy;
    FSubjectByK: TKSeFSubjectBy;
    FSubjectsAuthorizedList: TKSeFSubjectAuthorizedArray;
    FSubjectsOtherList: TKSeFSubjectOtherArray;
    FSubjectTo: TKSeFSubjectTo;
    FSubjectToKList: TKSeFSubjectToArray;
    function GetAcquisitionTimestamp: TDateTime;
    function GetAcquisitionTimestampRaw: UTF8String;
    function GetCurrency: UTF8String;
    function GetFaP17Annotation: Boolean;
    function GetGross: UTF8String;
    function GetHidden: Boolean;
    function GetHidingTime: TDateTime;
    function GetHidingTimeRaw: UTF8String;
    function GetInvoiceReferenceNumber: UTF8String;
    function GetInvoiceType: TKSeFInvoiceType;
    function GetInvoiceTypeRaw: UTF8String;
    function GetInvoicingDate: TDateTime;
    function GetInvoicingDateRaw: UTF8String;
    function GetKsefReferenceNumber: UTF8String;
    function GetNet: UTF8String;
    function GetSchemaVersion: UTF8String;
    function GetVat: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property AcquisitionTimestamp: TDateTime read GetAcquisitionTimestamp;
    property AcquisitionTimestampRaw: UTF8String read GetAcquisitionTimestampRaw;
    property Currency: UTF8String read GetCurrency;
    property FaP17Annotation: Boolean read GetFaP17Annotation;
    property Gross: UTF8String read GetGross;
    property Hidden: Boolean read GetHidden;
    property HidingTime: TDateTime read GetHidingTime;
    property HidingTimeRaw: UTF8String read GetHidingTimeRaw;
    property InvoiceHash: TKSeFFileUnlimitedHash read FInvoiceHash;
    property InvoiceReferenceNumber: UTF8String read GetInvoiceReferenceNumber;
    property InvoiceTypeRaw: UTF8String read GetInvoiceTypeRaw;
    property InvoiceType: TKSeFInvoiceType read GetInvoiceType;
    property InvoicingDate: TDateTime read GetInvoicingDate;
    property InvoicingDateRaw: UTF8String read GetInvoicingDateRaw;
    property KsefReferenceNumber: UTF8String read GetKsefReferenceNumber;
    property Net: UTF8String read GetNet;
    property SchemaVersion: UTF8String read GetSchemaVersion;
    property SubjectBy: TKSeFSubjectBy read FSubjectBy;
    property SubjectByK: TKSeFSubjectBy read FSubjectByK;
    property SubjectTo: TKSeFSubjectTo read FSubjectTo;
    property SubjectToKList: TKSeFSubjectToArray read FSubjectToKList;
    property SubjectsAuthorizedList: TKSeFSubjectAuthorizedArray read FSubjectsAuthorizedList;
    property SubjectsOtherList: TKSeFSubjectOtherArray read FSubjectsOtherList;
    property Vat: UTF8String read GetVat;
  end;

  { TKSeFInvoiceHeaderArray }

  TKSeFInvoiceHeaderArray = class(TKSeFArray)
  protected
    function GetItem(AIndex: Integer): TKSeFInvoiceHeader;
  public
    property Items[AIndex: Integer]: TKSeFInvoiceHeader read GetItem;
  end;

  { TKSeFQueryInvoiceSyncResponse }

  TKSeFQueryInvoiceSyncResponse = class(TKSeFResponse)
  private
    FInvoiceHeaderList: TKSeFInvoiceHeaderArray;
    function GetNumberOfElements: Integer;
    function GetPageOffset: Integer;
    function GetPageSize: Integer;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property InvoiceHeaderList: TKSeFInvoiceHeaderArray read FInvoiceHeaderList;
    property NumberOfElements: Integer read GetNumberOfElements;
    property PageOffset: Integer read GetPageOffset;
    property PageSize: Integer read GetPageSize;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFQueryInvoiceAsyncInitResponse }

  TKSeFQueryInvoiceAsyncInitResponse = class(TKSeFResponse)
  private
    function GetElementReferenceNumber: UTF8String;
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property ElementReferenceNumber: UTF8String read GetElementReferenceNumber;
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFInvoiceDivisionPlainPart }

  TKSeFInvoiceDivisionPlainPart = class(TKSeFObject)
  private
    FPlainPartHash: TKSeFFileUnlimitedHash;
    function GetPartExpiration: TDateTime;
    function GetPartExpirationRaw: UTF8String;
    function GetPartName: UTF8String;
    function GetPartNumber: Integer;
    function GetPartRangeFrom: TDateTime;
    function GetPartRangeFromRaw: UTF8String;
    function GetPartRangeTo: TDateTime;
    function GetPartRangeToRaw: UTF8String;
    function GetPartReferenceNumber: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property PartExpirationRaw: UTF8String read GetPartExpirationRaw;
    property PartExpiration: TDateTime read GetPartExpiration;
    property PartName: UTF8String read GetPartName;
    property PartNumber: Integer read GetPartNumber;
    property PartRangeFromRaw: UTF8String read GetPartRangeFromRaw;
    property PartRangeFrom: TDateTime read GetPartRangeFrom;
    property PartRangeToRaw: UTF8String read GetPartRangeToRaw;
    property PartRangeTo: TDateTime read GetPartRangeTo;
    property PartReferenceNumber: UTF8String read GetPartReferenceNumber;
    property PlainPartHash: TKSeFFileUnlimitedHash read FPlainPartHash;
  end;

  { TKSeFInvoiceDivisionPlainPartArray }

  TKSeFInvoiceDivisionPlainPartArray = class(TKSeFArray)
  protected
    function GetItem(AIndex: Integer): TKSeFInvoiceDivisionPlainPart;
  public
    property Items[AIndex: Integer]: TKSeFInvoiceDivisionPlainPart read GetItem;
  end;

  { TKSeFQueryInvoiceAsyncStatusResponse }

  TKSeFQueryInvoiceAsyncStatusResponse = class(TKSeFResponse)
  private
    FPartList: TKSeFInvoiceDivisionPlainPartArray;
    function GetElementReferenceNumber: UTF8String;
    function GetNumberOfElements: Int64;
    function GetNumberOfParts: Integer;
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property ElementReferenceNumber: UTF8String read GetElementReferenceNumber;
    property NumberOfElements: Int64 read GetNumberOfElements;
    property NumberOfParts: Integer read GetNumberOfParts;
    property PartList: TKSeFInvoiceDivisionPlainPartArray read FPartList;
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFGetPaymentIdentifierReferenceNumbersResponse }

  TKSeFGetPaymentIdentifierReferenceNumbersResponse = class(TKSeFResponse)
  private
    function GetKsefReferenceNumberList: TStringArray;
    function GetNumberOfElements: Integer;
    function GetPageOffset: Integer;
    function GetPageSize: Integer;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property KsefReferenceNumberList: TStringArray read GetKsefReferenceNumberList;
    property NumberOfElements: Integer read GetNumberOfElements;
    property PageOffset: Integer read GetPageOffset;
    property PageSize: Integer read GetPageSize;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFRequestPaymentIdentifierResponse }

  TKSeFRequestPaymentIdentifierResponse = class(TKSeFResponse)
  private
    function GetPaymentIdentifier: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property PaymentIdentifier: UTF8String read GetPaymentIdentifier;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
  end;

  { TKSeFInvoiceQueryDetails }

  TKSeFInvoiceQueryDetails = class(TKSeFObject)
  private
    FSubjectTo: TKSeFSubjectTo;
    function GetDueValue: Currency;
    function GetInvoiceOryginalNumber: UTF8String;
    procedure SetDueValue(AValue: Currency);
    procedure SetInvoiceOryginalNumber(AValue: UTF8String);
    procedure SetSubjectTo(AValue: TKSeFSubjectTo);
  public
    destructor Destroy; override;
  published
    property DueValue: Currency read GetDueValue write SetDueValue;
    property InvoiceOryginalNumber: UTF8String read GetInvoiceOryginalNumber write SetInvoiceOryginalNumber;
    property SubjectTo: TKSeFSubjectTo read FSubjectTo write SetSubjectTo;
  end;

  { TKSeFInvoiceRequestKSeF }

  TKSeFInvoiceRequestKSeF = class(TKSeFRequest)
  private
    FInvoiceDetails: TKSeFInvoiceQueryDetails;
    function GetKsefReferenceNumber: UTF8String;
    procedure SetInvoiceDetails(AValue: TKSeFInvoiceQueryDetails);
    procedure SetKsefReferenceNumber(AValue: UTF8String);
  public
    destructor Destroy; override;
  published
    property InvoiceDetails: TKSeFInvoiceQueryDetails read FInvoiceDetails write SetInvoiceDetails;
    property KsefReferenceNumber: UTF8String read GetKsefReferenceNumber write SetKsefReferenceNumber;
  end;

  { TKSeFStatusResponse }

  TKSeFStatusResponse = class(TKSeFResponse)
  private
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
    function GetUpo: UTF8String;
  published
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property TimestampRaw: UTF8String read GetTimestampRaw;
    property Timestamp: TDateTime read GetTimestamp;
    property Upo: UTF8String read GetUpo;
  end;

  { TKSeFAnonymousSubjectIdentifierTo }

  TKSeFAnonymousSubjectIdentifierTo = class(TKSeFObject)
  private
    function GetType: UTF8String;
  published
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType;
  end;

  { TKSeFAnonymousSubjectIdentifierToNone }

  TKSeFAnonymousSubjectIdentifierToNone = class(TKSeFAnonymousSubjectIdentifierTo)
  end;

  { TKSeFAnonymousSubjectIdentifierToCompany }

  TKSeFAnonymousSubjectIdentifierToCompany = class(TKSeFAnonymousSubjectIdentifierTo)
  private
    function GetIdentifier: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
  published
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
  end;

  { TKSeFAnonymousSubjectIdentifierToOtherTax }

  TKSeFAnonymousSubjectIdentifierToOtherTax = class(TKSeFAnonymousSubjectIdentifierTo)
  private
    function GetIdentifier: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
  published
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
  end;

  { TKSeFInvoiceDownloadRequest }

  TKSeFInvoiceDownloadRequest = class(TKSeFRequest)
  private
    FHashSHA: TKSeFHashSHA;
    FSubjectTo: TKSeFAnonymousSubjectIdentifierTo;
    function GetDueValue: Currency;
    function GetInvoiceNumber: UTF8String;
    procedure SetDueValue(AValue: Currency);
    procedure SetHashSHA(AValue: TKSeFHashSHA);
    procedure SetInvoiceNumber(AValue: UTF8String);
    procedure SetSubjectTo(AValue: TKSeFAnonymousSubjectIdentifierTo);
  public
    destructor Destroy; override;
  published
    property DueValue: Currency read GetDueValue write SetDueValue;
    property HashSHA: TKSeFHashSHA read FHashSHA write SetHashSHA;
    property InvoiceNumber: UTF8String read GetInvoiceNumber write SetInvoiceNumber;
    property SubjectTo: TKSeFAnonymousSubjectIdentifierTo read FSubjectTo write SetSubjectTo;
  end;

  { TKSeFInvoiceVerificationRequest }

  TKSeFInvoiceVerificationRequest = class(TKSeFRequest)
  private
    FHashSHA: TKSeFHashSHA;
    procedure SetHashSHA(AValue: TKSeFHashSHA);
  public
    destructor Destroy; override;
  published
    property HashSHA: TKSeFHashSHA read FHashSHA  write SetHashSHA;
  end;

  { TKSeFInvoiceVerificationResponse }

  TKSeFInvoiceVerificationResponse = class(TKSeFResponse)
  private
    FSubjectBy: TKSeFSubjectIdentifierBy;
    function GetAcquisitionTimestamp: TDateTime;
    function GetAcquisitionTimestampRaw: UTF8String;
    function GetHash: UTF8String;
    function GetInvoiceType: TKSeFInvoiceType;
    function GetKsefReferenceNumber: UTF8String;
    function GetSchemaVersion: UTF8String;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property AcquisitionTimestamp: TDateTime read GetAcquisitionTimestamp;
    property AcquisitionTimestampRaw: UTF8String read GetAcquisitionTimestampRaw;
    property Hash: UTF8String read GetHash;
    property InvoiceType: TKSeFInvoiceType read GetInvoiceType;
    property KsefReferenceNumber: UTF8String read GetKsefReferenceNumber;
    property SchemaVersion: UTF8String read GetSchemaVersion;
    property SubjectBy: TKSeFSubjectIdentifierBy read FSubjectBy;
  end;

  { TKSeFCredentialsIdentifierRequestInstitutional }

  TKSeFCredentialsIdentifierRequestInstitutional = class(TKSeFObject)
  private
    function GetIdentifier: UTF8String;
    function GetType: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
    procedure SetType(AValue: UTF8String);
  published
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType write SetType;
  end;

  { TKSeFCredentialsIdentifierRequestInternal }

  TKSeFCredentialsIdentifierRequestInternal = class(TKSeFCredentialsIdentifierRequestInstitutional)
  end;

  { TKSeFCredentialsIdentifierRequestInstitutionalNip }

  TKSeFCredentialsIdentifierRequestInstitutionalNip = class(TKSeFCredentialsIdentifierRequestInstitutional)
  end;

  { TKSeFCredentialsIdentifierRequestIndividual }

  TKSeFCredentialsIdentifierRequestIndividual = class(TKSeFObject)
  private
    function GetIdentifier: UTF8String;
    function GetType: UTF8String;
    procedure SetIdentifier(AValue: UTF8String);
    procedure SetType(AValue: UTF8String);
  published
    property Identifier: UTF8String read GetIdentifier write SetIdentifier;
    property {$ifdef LGP_ESCPASKEYWORDS}_Type{$else}&Type{$endif}: UTF8String read GetType write SetType;
  end;

  { TKSeFCredentialsIdentifierRequestIndividualCertificateFingerprint }

  TKSeFCredentialsIdentifierRequestIndividualCertificateFingerprint = class(TKSeFCredentialsIdentifierRequestIndividual)
  end;

  { TKSeFCredentialsIdentifierRequestIndividualNip }

  TKSeFCredentialsIdentifierRequestIndividualNip = class(TKSeFCredentialsIdentifierRequestIndividual)
  end;

  { TKSeFCredentialsIdentifierRequestIndividualPesel }

  TKSeFCredentialsIdentifierRequestIndividualPesel = class(TKSeFCredentialsIdentifierRequestIndividual)
  end;

  { TKSeFCredentialsRoleRequestContextDescribed }

  TKSeFCredentialsRoleRequestContextDescribed = class(TKSeFObject)
  private
    function GetRoleDescription: UTF8String;
    function GetRoleType: UTF8String;
    procedure SetRoleDescription(AValue: UTF8String);
    procedure SetRoleType(AValue: UTF8String);
  published
    property RoleDescription: UTF8String read GetRoleDescription write SetRoleDescription;
    property RoleType: UTF8String read GetRoleType write SetRoleType;
  end;

  { TKSeFGrantContextCredentialsRequestType }

  TKSeFGrantContextCredentialsRequestType = class(TKSeFObject)
  private
    FContextIdentifier: TKSeFCredentialsIdentifierRequestInstitutional;
    FCredentialsIdentifier: TKSeFCredentialsIdentifierRequestIndividual;
    FCredentialsRole: TKSeFCredentialsRoleRequestContextDescribed;
    procedure SetContextIdentifier(
      AValue: TKSeFCredentialsIdentifierRequestInstitutional);
    procedure SetCredentialsIdentifier(
      AValue: TKSeFCredentialsIdentifierRequestIndividual);
    procedure SetCredentialsRole(
      AValue: TKSeFCredentialsRoleRequestContextDescribed);
  public
    destructor Destroy; override;
  published
    property ContextIdentifier: TKSeFCredentialsIdentifierRequestInstitutional read FContextIdentifier write SetContextIdentifier;
    property CredentialsIdentifier: TKSeFCredentialsIdentifierRequestIndividual read FCredentialsIdentifier write SetCredentialsIdentifier;
    property CredentialsRole: TKSeFCredentialsRoleRequestContextDescribed read FCredentialsRole write SetCredentialsRole;
  end;

  TKSeFGrantContextCredentialsRequest = class(TKSeFRequest)
  private
    FGrantContextCredentials: TKSeFGrantContextCredentialsRequestType;
    procedure SetGrantContextCredentials(
      AValue: TKSeFGrantContextCredentialsRequestType);
  public
    destructor Destroy; override;
  published
    property GrantContextCredentials: TKSeFGrantContextCredentialsRequestType read FGrantContextCredentials write SetGrantContextCredentials;
  end;

  { TKSeFStatusCredentialsResponse }

  TKSeFStatusCredentialsResponse = class(TKSeFResponse)
  private
    function GetElementReferenceNumber: UTF8String;
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property ElementReferenceNumber: UTF8String read GetElementReferenceNumber;
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property Timestamp: TDateTime read GetTimestamp;
    property TimestampRaw: UTF8String read GetTimestampRaw;
  end;

  { TKSeFCredentialsRoleRequestContextBase }

  TKSeFCredentialsRoleRequestContextBase = class(TKSeFObject)
  private
    function GetRoleType: UTF8String;
    procedure SetRoleType(AValue: UTF8String);
  published
    property RoleType: UTF8String read GetRoleType write SetRoleType;
  end;

  { TKSeFRevokeContextCredentialsRequestType }

  TKSeFRevokeContextCredentialsRequestType = class(TKSeFObject)
  private
    FContextIdentifier: TKSeFCredentialsIdentifierRequestInstitutional;
    FCredentialsIdentifier: TKSeFCredentialsIdentifierRequestIndividual;
    FCredentialsRole: TKSeFCredentialsRoleRequestContextBase;
    procedure SetContextIdentifier(
      AValue: TKSeFCredentialsIdentifierRequestInstitutional);
    procedure SetCredentialsIdentifier(
      AValue: TKSeFCredentialsIdentifierRequestIndividual);
    procedure SetCredentialsRole(AValue: TKSeFCredentialsRoleRequestContextBase
      );
  public
    destructor Destroy; override;
  published
    property ContextIdentifier: TKSeFCredentialsIdentifierRequestInstitutional read FContextIdentifier write SetContextIdentifier;
    property CredentialsIdentifier: TKSeFCredentialsIdentifierRequestIndividual read FCredentialsIdentifier write SetCredentialsIdentifier;
    property CredentialsRole: TKSeFCredentialsRoleRequestContextBase read FCredentialsRole write SetCredentialsRole;
  end;

  TKSeFRevokeContextCredentialsRequest = class(TKSeFRequest)
  private
    FRevokeContextCredentials: TKSeFRevokeContextCredentialsRequestType;
    procedure SetRevokeContextCredentials(
      AValue: TKSeFRevokeContextCredentialsRequestType);
  public
    destructor Destroy; override;
  published
    property RevokeContextCredentials: 	TKSeFRevokeContextCredentialsRequestType read FRevokeContextCredentials write SetRevokeContextCredentials;
  end;

  { TKSeFCredentialsRoleRequestToken }

  TKSeFCredentialsRoleRequestToken = class(TKSeFObject)
  private
    function GetRoleDescription: UTF8String;
    function GetRoleType: UTF8String;
    procedure SetRoleDescription(AValue: UTF8String);
    procedure SetRoleType(AValue: UTF8String);
  published
    property RoleDescription: UTF8String read GetRoleDescription write SetRoleDescription;
    property RoleType: UTF8String read GetRoleType write SetRoleType;
  end;

  { TKSeFCredentialsRoleRequestTokenArray }

  TKSeFCredentialsRoleRequestTokenArray = class(TKSeFArray)
  private
    function GetItem(AIndex: Integer): TKSeFCredentialsRoleRequestToken;
  public
    property Items[AIndex: Integer]: TKSeFCredentialsRoleRequestToken read GetItem;
  end;

  { TKSeFTKSeFGenerateTokenRequestType }

  { TKSeFGenerateTokenRequestType }

  TKSeFGenerateTokenRequestType = class(TKSeFObject)
  private
    FCredentialsRoleList: TKSeFCredentialsRoleRequestTokenArray;
    function GetDescription: UTF8String;
    procedure SetCredentialsRoleList(
      AValue: TKSeFCredentialsRoleRequestTokenArray);
    procedure SetDescription(AValue: UTF8String);
  public
    destructor Destroy; override;
  published
    property CredentialsRoleList: TKSeFCredentialsRoleRequestTokenArray read FCredentialsRoleList write SetCredentialsRoleList;
    property Description: UTF8String read GetDescription write SetDescription;
  end;

  { TKSeFGenerateTokenRequest }

  TKSeFGenerateTokenRequest = class(TKSeFRequest)
  private
    FGenerateToken: TKSeFGenerateTokenRequestType;
    procedure SetGenerateToken(AValue: TKSeFGenerateTokenRequestType);
  public
    destructor Destroy; override;
  published
    property GenerateToken: TKSeFGenerateTokenRequestType read FGenerateToken write SetGenerateToken;
  end;

  { TKSeFGenerateTokenResponse }

  TKSeFGenerateTokenResponse = class(TKSeFResponse)
  private
    function GetAuthorisationToken: UTF8String;
    function GetElementReferenceNumber: UTF8String;
    function GetProcessingCode: Integer;
    function GetProcessingDescription: UTF8String;
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property AuthorisationToken: UTF8String read GetAuthorisationToken;
    property ElementReferenceNumber: UTF8String read GetElementReferenceNumber;
    property ProcessingCode: Integer read GetProcessingCode;
    property ProcessingDescription: UTF8String read GetProcessingDescription;
    property ReferenceNumber: UTF8String read GetReferenceNumber;
    property Timestamp: TDateTime read GetTimestamp;
    property TimestampRaw: UTF8String read GetTimestampRaw;
  end;

  { TKSeFCredentialsRoleRequestStandardDescribed }

  TKSeFCredentialsRoleRequestStandardDescribed = class(TKSeFObject)
  private
    function GetRoleDescription: UTF8String;
    function GetRoleType: UTF8String;
    procedure SetRoleDescription(AValue: UTF8String);
    procedure SetRoleType(AValue: UTF8String);
  published
    property RoleDescription: UTF8String read GetRoleDescription write SetRoleDescription;
    property RoleType: UTF8String read GetRoleType write SetRoleType;
  end;

  { TKSeFCredentialsRoleRequestStandardDescribedArray }

  TKSeFCredentialsRoleRequestStandardDescribedArray = class(TKSeFArray)
  private
    function GetItem(AIndex: Integer): TKSeFCredentialsRoleRequestStandardDescribed;
  public
    property Items[AIndex: Integer]: TKSeFCredentialsRoleRequestStandardDescribed read GetItem;
  end;

  { TKSeFGrantCredentialsRequestType }

  TKSeFGrantCredentialsRequestType = class(TKSeFObject)
  private
    FCredentialsIdentifier: TKSeFCredentialsIdentifierRequest;
    FCredentialsRoleList: TKSeFCredentialsRoleRequestStandardDescribedArray;
    procedure SetCredentialsIdentifier(AValue: TKSeFCredentialsIdentifierRequest);
    procedure SetCredentialsRoleList(AValue: TKSeFCredentialsRoleRequestStandardDescribedArray);
  public
    destructor Destroy; override;
  published
    property CredentialsIdentifier: TKSeFCredentialsIdentifierRequest read FCredentialsIdentifier write SetCredentialsIdentifier;
    property CredentialsRoleList: TKSeFCredentialsRoleRequestStandardDescribedArray read FCredentialsRoleList write SetCredentialsRoleList;
  end;

  TKSeFGrantCredentialsRequest = class(TKSeFRequest)
  private
    FGrantCredentials: TKSeFGrantCredentialsRequestType;
    procedure SetGrantCredentials(AValue: TKSeFGrantCredentialsRequestType);
  public
    destructor Destroy; override;
  published
    property GrantCredentials: TKSeFGrantCredentialsRequestType read FGrantCredentials write SetGrantCredentials;
  end;

  { TKSeFCredentialsRoleRequestStandardBase }

  TKSeFCredentialsRoleRequestStandardBase = class(TKSeFObject)
  private
    function GetRoleType: UTF8String;
    procedure SetRoleType(AValue: UTF8String);
  published
    property RoleType: UTF8String read GetRoleType write SetRoleType;
  end;

  { TKSeFCredentialsRoleRequestStandardBaseArray }

  TKSeFCredentialsRoleRequestStandardBaseArray = class(TKSeFArray)
  private
    function GetItem(AIndex: Integer): TKSeFCredentialsRoleRequestStandardBase;
  public
    property Items[AIndex: Integer]: TKSeFCredentialsRoleRequestStandardBase read GetItem;
  end;

  { TKSeFRevokeCredentialsRequestType }

  TKSeFRevokeCredentialsRequestType = class(TKSeFObject)
  private
    FCredentialsIdentifier: TKSeFCredentialsIdentifierRequest;
    FCredentialsRoleList: TKSeFCredentialsRoleRequestStandardBaseArray;
    procedure SetCredentialsIdentifier(AValue: TKSeFCredentialsIdentifierRequest
      );
    procedure SetCredentialsRoleList(
      AValue: TKSeFCredentialsRoleRequestStandardBaseArray);
  public
    destructor Destroy; override;
  published
    property CredentialsIdentifier: TKSeFCredentialsIdentifierRequest read FCredentialsIdentifier write SetCredentialsIdentifier;
    property CredentialsRoleList: TKSeFCredentialsRoleRequestStandardBaseArray read FCredentialsRoleList write SetCredentialsRoleList;
  end;

  TKSeFRevokeCredentialsRequest = class(TKSeFRequest)
  private
    FRevokeCredentials: TKSeFRevokeCredentialsRequestType;
    procedure SetRevokeCredentials(AValue: TKSeFRevokeCredentialsRequestType);
  public
    destructor Destroy; override;
  published
    property RevokeCredentials: TKSeFRevokeCredentialsRequestType read FRevokeCredentials write SetRevokeCredentials;
  end;

  { TKSeFRevokeTokenRequestType }

  TKSeFRevokeTokenRequestType = class(TKSeFObject)
  private
    FSourceTokenIdentifier: TKSeFCredentialsIdentifierRequest;
    function GetTokenNumber: UTF8String;
    procedure SetSourceTokenIdentifier(AValue: TKSeFCredentialsIdentifierRequest
      );
    procedure SetTokenNumber(AValue: UTF8String);
  public
    destructor Destroy; override;
  published
    property SourceTokenIdentifier: TKSeFCredentialsIdentifierRequest read FSourceTokenIdentifier write SetSourceTokenIdentifier;
    property TokenNumber: UTF8String read GetTokenNumber write SetTokenNumber;
  end;

  TKSeFRevokeTokenRequest = class(TKSeFRequest)
  private
    FRevokeToken: TKSeFRevokeTokenRequestType;
    procedure SetRevokeToken(AValue: TKSeFRevokeTokenRequestType);
  public
    destructor Destroy; override;
  published
    property RevokeToken: TKSeFRevokeTokenRequestType read FRevokeToken write SetRevokeToken;
  end;

procedure lgoRegister;

implementation

procedure lgoRegister;
begin
  lgoRegisterClasses([
    TKSeFSubjectIdentifierBy,
    TKSeFSubjectIdentifierByCompany,
    TKSeFSubjectIdentifierInternal,
    TKSeFSubjectCompleteName,
    TKSeFSubjectName,
    TKSeFSubjectFullName,
    TKSeFSubjectPersonName,
    TKSeFSubjectNone,
    TKSeFCredentialsIdentifierResponse,
    TKSeFCredentialsRoleResponseBase,
    TKSeFCredentialsRoleResponseGrantedForInstitution,
    TKSeFCredentialsRoleResponseStandardDetails,
    TKSeFCredentialsRoleResponseStandardPlain,
    TKSeFCredentialsRoleResponseToken,
    TKSeFCredentialsRoleResponseStandardContextDetails,
    TKSeFCredentialsRoleResponseBaseArray,
    TKSeFSessionContext,
    TKSeFInitialisedSession,
    TKSeFInitSessionResponse,
    TKSeFSessionInvoiceStatus,
    TKSeFSessionInvoiceStatusArray,
    TKSeFSessionStatusResponse,
    TKSeFTerminateSessionResponse,
    TKSeFSendInvoiceResponse,
    TKSeFInvoiceStatus,
    TKSeFHideInvoiceRequestType,
    TKSeFHideInvoiceRequest,
    TKSeFStatusInvoiceResponse,
    TKSeFShowInvoiceRequestType,
    TKSeFShowInvoiceRequest,
    TKSeFVisibilityInvoiceResponse,
    TKSeFSubjectBy,
    TKSeFSubjectIdentifierTo,
    TKSeFSubjectIdentifierToNone,
    TKSeFSubjectIdentifierToCompany,
    TKSeFSubjectIdentifierToOther,
    TKSeFSubjectIdentifierToVatUe,
    TKSeFSubjectTo,
    TKSeFQueryCriteriaInvoice,
    TKSeFQueryCriteriaInvoiceDetail,
    TKSeFQueryCriteriaInvoiceIncremental,
    TKSeFQueryCriteriaInvoiceRange,
    TKSeFQueryInvoiceRequest,
    TKSeFHashSHA,
    TKSeFFileUnlimitedHash,
    TKSeFSubjectToArray,
    TKSeFSubjectAuthorized,
    TKSeFSubjectAuthorizedArray,
    TKSeFSubjectIdentifierOtherTo,
    TKSeFSubjectIdentifierOtherToInternal,
    TKSeFSubjectIdentifierOtherToNone,
    TKSeFSubjectIdentifierOtherToNrId,
    TKSeFSubjectIdentifierOtherToCompany,
    TKSeFSubjectIdentifierOtherToVatUe,
    TKSeFSubjectOther,
    TKSeFSubjectOtherArray,
    TKSeFInvoiceHeader,
    TKSeFInvoiceHeaderArray,
    TKSeFQueryInvoiceSyncResponse,
    TKSeFQueryInvoiceAsyncInitResponse,
    TKSeFInvoiceDivisionPlainPart,
    TKSeFInvoiceDivisionPlainPartArray,
    TKSeFQueryInvoiceAsyncStatusResponse,
    TKSeFInternalIdentifierGeneratedResponse,
    TKSeFCredentialsIdentifierRequest,
    TKSeFQueryCriteriaCredentials,
    TKSeFQueryCriteriaCredentialsAll,
    TKSeFQueryCriteriaCredentialsId,
    TKSeFQuerySyncCredentialsRequest,
    TKSeFCredentialsBaseTypeObject,
    TKSeFQuerySyncCredentialsResponse,
    TKSeFGetPaymentIdentifierReferenceNumbersResponse,
    TKSeFRequestPaymentIdentifierResponse,
    TKSeFInvoiceQueryDetails,
    TKSeFInvoiceRequestKSeF,
    TKSeFStatusResponse,
    TKSeFAnonymousSubjectIdentifierTo,
    TKSeFAnonymousSubjectIdentifierToNone,
    TKSeFAnonymousSubjectIdentifierToCompany,
    TKSeFAnonymousSubjectIdentifierToOtherTax,
    TKSeFInvoiceDownloadRequest,
    TKSeFInvoiceVerificationRequest,
    TKSeFInvoiceVerificationResponse,
    TKSeFCredentialsContext,
    TKSeFCredentialsPlain,
    TKSeFCredentialsToken,
    TKSeFCredentialsParent,
    TKSeFCredentialsBaseTypeObjectArray,
    TKSeFQuerySyncCredentialsResponse,
    TKSeFRevokeTokenRequestType,
    TKSeFRevokeTokenRequest,
    TKSeFCredentialsIdentifierRequestInstitutional,
    TKSeFCredentialsIdentifierRequestInternal,
    TKSeFCredentialsIdentifierRequestInstitutionalNip,
    TKSeFCredentialsIdentifierRequestIndividual,
    TKSeFCredentialsIdentifierRequestIndividualCertificateFingerprint,
    TKSeFCredentialsIdentifierRequestIndividualNip,
    TKSeFCredentialsIdentifierRequestIndividualPesel,
    TKSeFCredentialsRoleRequestContextDescribed,
    TKSeFGrantContextCredentialsRequestType,
    TKSeFGrantContextCredentialsRequest,
    TKSeFStatusCredentialsResponse,
    TKSeFCredentialsRoleRequestContextBase,
    TKSeFRevokeContextCredentialsRequestType,
    TKSeFRevokeContextCredentialsRequest,
    TKSeFCredentialsRoleRequestToken,
    TKSeFCredentialsRoleRequestTokenArray,
    TKSeFGenerateTokenRequestType,
    TKSeFGenerateTokenRequest,
    TKSeFGenerateTokenResponse,
    TKSeFCredentialsRoleRequestStandardDescribed,
    TKSeFCredentialsRoleRequestStandardDescribedArray,
    TKSeFGrantCredentialsRequestType,
    TKSeFGrantCredentialsRequest,
    TKSeFCredentialsRoleRequestStandardBase,
    TKSeFCredentialsRoleRequestStandardBaseArray,
    TKSeFRevokeCredentialsRequestType,
    TKSeFRevokeCredentialsRequest
    ]);
  lgoRegisterExceptionClass(EKSeFException);
  lgoRegisterExceptionClass(EKSeFExceptionResponse);
  lgoRegisterExceptionClass(EKSeFNotFoundException);
end;

function TKSeFStatusResponse.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFStatusResponse.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

function TKSeFStatusResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFStatusResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFStatusResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

function TKSeFStatusResponse.GetUpo: UTF8String;
begin
  Result := GetStringProp('Upo');
end;

{ TKSeFAnonymousSubjectIdentifierTo }

function TKSeFAnonymousSubjectIdentifierTo.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

{ TKSeFAnonymousSubjectIdentifierToCompany }

function TKSeFAnonymousSubjectIdentifierToCompany.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

procedure TKSeFAnonymousSubjectIdentifierToCompany.SetIdentifier(
  AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

{ TKSeFAnonymousSubjectIdentifierToOtherTax }

function TKSeFAnonymousSubjectIdentifierToOtherTax.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

procedure TKSeFAnonymousSubjectIdentifierToOtherTax.SetIdentifier(
  AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

{ TKSeFInvoiceDownloadRequest }

function TKSeFInvoiceDownloadRequest.GetDueValue: Currency;
begin
  Result := GetCurrencyProp('DueValue');
end;

function TKSeFInvoiceDownloadRequest.GetInvoiceNumber: UTF8String;
begin
  Result := GetStringProp('InvoiceNumber');
end;

procedure TKSeFInvoiceDownloadRequest.SetDueValue(AValue: Currency);
begin
  SetCurrencyProp('DueValue', AValue);
end;

procedure TKSeFInvoiceDownloadRequest.SetHashSHA(AValue: TKSeFHashSHA);
var
  O: LGP_OBJECT;
begin
  if FHashSHA = AValue then Exit;
  FHashSHA := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('HashSHA', O);
end;

procedure TKSeFInvoiceDownloadRequest.SetInvoiceNumber(AValue: UTF8String);
begin
  SetStringProp('InvoiceNumber', AValue);
end;

procedure TKSeFInvoiceDownloadRequest.SetSubjectTo(
  AValue: TKSeFAnonymousSubjectIdentifierTo);
var
  O: LGP_OBJECT;
begin
  if FSubjectTo = AValue then Exit;
  FSubjectTo := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('SubjectTo', O);
end;

destructor TKSeFInvoiceDownloadRequest.Destroy;
begin
  if Assigned(FHashSHA) then
  begin
    FHashSHA.Free;
    SetObjectProp('HashSHA', nil);
  end;
  if Assigned(FSubjectTo) then
  begin
    FSubjectTo.Free;
    SetObjectProp('SubjectTo', nil);
  end;
  inherited Destroy;
end;

{ TKSeFInvoiceVerificationRequest }

procedure TKSeFInvoiceVerificationRequest.SetHashSHA(AValue: TKSeFHashSHA);
var
  O: LGP_OBJECT;
begin
  if FHashSHA = AValue then Exit;
  FHashSHA := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('HashSHA', O);
end;

destructor TKSeFInvoiceVerificationRequest.Destroy;
begin
  if Assigned(FHashSHA) then
  begin
    FHashSHA.Free;
    SetObjectProp('HashSHA', nil);
  end;
  inherited Destroy;
end;

{ TKSeFInvoiceVerificationResponse }

function TKSeFInvoiceVerificationResponse.GetAcquisitionTimestamp: TDateTime;
begin
  Result := GetDoubleProp('AcquisitionTimestamp');
end;

function TKSeFInvoiceVerificationResponse.GetAcquisitionTimestampRaw: UTF8String;
begin
  Result := GetStringProp('AcquisitionTimestampRaw');
end;

function TKSeFInvoiceVerificationResponse.GetHash: UTF8String;
begin
  Result := GetStringProp('Hash');
end;

function TKSeFInvoiceVerificationResponse.GetInvoiceType: TKSeFInvoiceType;
begin
  Result := TKSeFInvoiceType(GetIntegerProp('InvoiceType'));
end;

function TKSeFInvoiceVerificationResponse.GetKsefReferenceNumber: UTF8String;
begin
  Result := GetStringProp('KsefReferenceNumber');
end;

function TKSeFInvoiceVerificationResponse.GetSchemaVersion: UTF8String;
begin
  Result := GetStringProp('SchemaVersion');
end;

constructor TKSeFInvoiceVerificationResponse.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
  S: UTF8String;
begin
  inherited;
  O := GetObjectProp('SubjectBy');
  S := UpperCase(lgoClassName(O));
  if O <> nil then
  begin
    if S = 'TKSEFSUBJECTIDENTIFIERBYCOMPANY' then
      FSubjectBy := TKSeFSubjectIdentifierByCompany.Create(O)
    else if S = 'TKSEFSUBJECTIDENTIFIERINTERNAL' then
      FSubjectBy := TKSeFSubjectIdentifierInternal.Create(O);
  end;
end;

destructor TKSeFInvoiceVerificationResponse.Destroy;
begin
  if Assigned(FSubjectBy) then
  begin
    FSubjectBy.Free;
    SetObjectProp('SubjectBy', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsIdentifierRequestInstitutional }

function TKSeFCredentialsIdentifierRequestInstitutional.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

function TKSeFCredentialsIdentifierRequestInstitutional.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

procedure TKSeFCredentialsIdentifierRequestInstitutional.SetIdentifier(
  AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

procedure TKSeFCredentialsIdentifierRequestInstitutional.SetType(
  AValue: UTF8String);
begin
  SetStringProp('Type', AValue);
end;

{ TKSeFCredentialsIdentifierRequestIndividual }

function TKSeFCredentialsIdentifierRequestIndividual.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

function TKSeFCredentialsIdentifierRequestIndividual.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

procedure TKSeFCredentialsIdentifierRequestIndividual.SetIdentifier(
  AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

procedure TKSeFCredentialsIdentifierRequestIndividual.SetType(AValue: UTF8String
  );
begin
  SetStringProp('Type', AValue);
end;

{ TKSeFCredentialsRoleRequestContextDescribed }

function TKSeFCredentialsRoleRequestContextDescribed.GetRoleDescription: UTF8String;
begin
  Result := GetStringProp('RoleDescription');
end;

function TKSeFCredentialsRoleRequestContextDescribed.GetRoleType: UTF8String;
begin
  Result := GetStringProp('RoleType');
end;

procedure TKSeFCredentialsRoleRequestContextDescribed.SetRoleDescription(
  AValue: UTF8String);
begin
  SetStringProp('RoleDescription', AValue);
end;

procedure TKSeFCredentialsRoleRequestContextDescribed.SetRoleType(
  AValue: UTF8String);
begin
  SetStringProp('RoleType', AValue);
end;

{ TKSeFGrantContextCredentialsRequestType }

procedure TKSeFGrantContextCredentialsRequestType.SetContextIdentifier(
  AValue: TKSeFCredentialsIdentifierRequestInstitutional);
var
  O: LGP_OBJECT;
begin
  if FContextIdentifier = AValue then Exit;
  FContextIdentifier := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('ContextIdentifier', O);
end;

procedure TKSeFGrantContextCredentialsRequestType.SetCredentialsIdentifier(
  AValue: TKSeFCredentialsIdentifierRequestIndividual);
var
  O: LGP_OBJECT;
begin
  if FCredentialsIdentifier = AValue then Exit;
  FCredentialsIdentifier := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('CredentialsIdentifier', O);
end;

procedure TKSeFGrantContextCredentialsRequestType.SetCredentialsRole(
  AValue: TKSeFCredentialsRoleRequestContextDescribed);
var
  O: LGP_OBJECT;
begin
  if FCredentialsRole = AValue then Exit;
  FCredentialsRole := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('CredentialsRole', O);
end;

destructor TKSeFGrantContextCredentialsRequestType.Destroy;
begin
  if Assigned(FContextIdentifier) then
  begin
    FContextIdentifier.Free;
    SetObjectProp('ContextIdentifier', nil);
  end;
  if Assigned(FCredentialsIdentifier) then
  begin
    FCredentialsIdentifier.Free;
    SetObjectProp('CredentialsIdentifier', nil);
  end;
  if Assigned(FCredentialsRole) then
  begin
    FCredentialsRole.Free;
    SetObjectProp('CredentialsRole', nil);
  end;
  inherited Destroy;
end;

procedure TKSeFGrantContextCredentialsRequest.SetGrantContextCredentials(
  AValue: TKSeFGrantContextCredentialsRequestType);
var
  O: LGP_OBJECT;
begin
  if FGrantContextCredentials = AValue then Exit;
  FGrantContextCredentials := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('GrantContextCredentials', O);
end;

destructor TKSeFGrantContextCredentialsRequest.Destroy;
begin
  if Assigned(FGrantContextCredentials) then
  begin
    FGrantContextCredentials.Free;
    SetObjectProp('GrantContextCredentials', nil);
  end;
  inherited Destroy;
end;

{ TKSeFStatusCredentialsResponse }

function TKSeFStatusCredentialsResponse.GetElementReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ElementReferenceNumber');
end;

function TKSeFStatusCredentialsResponse.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFStatusCredentialsResponse.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

function TKSeFStatusCredentialsResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFStatusCredentialsResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFStatusCredentialsResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

{ TKSeFCredentialsRoleRequestContextBase }

function TKSeFCredentialsRoleRequestContextBase.GetRoleType: UTF8String;
begin
  Result := GetStringProp('RoleType');
end;

procedure TKSeFCredentialsRoleRequestContextBase.SetRoleType(AValue: UTF8String
  );
begin
  SetStringProp('RoleType', AValue);
end;

{ TKSeFRevokeContextCredentialsRequestType }

procedure TKSeFRevokeContextCredentialsRequestType.SetContextIdentifier(
  AValue: TKSeFCredentialsIdentifierRequestInstitutional);
begin
  if FContextIdentifier = AValue then Exit;
  FContextIdentifier := AValue;
  SetObjectProp('ContextIdentifier', lgoExtObject(FContextIdentifier));
end;

procedure TKSeFRevokeContextCredentialsRequestType.SetCredentialsIdentifier(
  AValue: TKSeFCredentialsIdentifierRequestIndividual);
begin
  if FCredentialsIdentifier = AValue then Exit;
  FCredentialsIdentifier := AValue;
  SetObjectProp('CredentialsIdentifier', lgoExtObject(FCredentialsIdentifier));
end;

procedure TKSeFRevokeContextCredentialsRequestType.SetCredentialsRole(
  AValue: TKSeFCredentialsRoleRequestContextBase);
begin
  if FCredentialsRole = AValue then Exit;
  FCredentialsRole := AValue;
  SetObjectProp('CredentialsRole', lgoExtObject(FCredentialsRole));
end;

destructor TKSeFRevokeContextCredentialsRequestType.Destroy;
begin
  if Assigned(FContextIdentifier) then
  begin
    FContextIdentifier.Free;
    SetObjectProp('ContextIdentifier', nil);
  end;
  if Assigned(FCredentialsIdentifier) then
  begin
    FCredentialsIdentifier.Free;
    SetObjectProp('CredentialsIdentifier', nil);
  end;
  if Assigned(FCredentialsRole) then
  begin
    FCredentialsRole.Free;
    SetObjectProp('CredentialsRole', nil);
  end;
  inherited Destroy;
end;

procedure TKSeFRevokeContextCredentialsRequest.SetRevokeContextCredentials(
  AValue: TKSeFRevokeContextCredentialsRequestType);
begin
  if FRevokeContextCredentials = AValue then Exit;
  FRevokeContextCredentials := AValue;
  SetObjectProp('RevokeContextCredentials', lgoExtObject(FRevokeContextCredentials));
end;

destructor TKSeFRevokeContextCredentialsRequest.Destroy;
begin
  if Assigned(FRevokeContextCredentials) then
  begin
    FRevokeContextCredentials.Free;
    SetObjectProp('RevokeContextCredentials', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsRoleRequestToken }

function TKSeFCredentialsRoleRequestToken.GetRoleDescription: UTF8String;
begin
  Result := GetStringProp('RoleDescription');
end;

function TKSeFCredentialsRoleRequestToken.GetRoleType: UTF8String;
begin
  Result := GetStringProp('RoleType');
end;

procedure TKSeFCredentialsRoleRequestToken.SetRoleDescription(AValue: UTF8String
  );
begin
  SetStringProp('RoleDescription', AValue);
end;

procedure TKSeFCredentialsRoleRequestToken.SetRoleType(AValue: UTF8String);
begin
  SetStringProp('RoleType', AValue);
end;

{ TKSeFCredentialsRoleRequestTokenArray }

function TKSeFCredentialsRoleRequestTokenArray.GetItem(AIndex: Integer
  ): TKSeFCredentialsRoleRequestToken;
begin
  Result := TKSeFCredentialsRoleRequestToken(inherited GetItem(AIndex));
end;

{ TKSeFGenerateTokenRequestType }

function TKSeFGenerateTokenRequestType.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

procedure TKSeFGenerateTokenRequestType.SetCredentialsRoleList(
  AValue: TKSeFCredentialsRoleRequestTokenArray);
begin
  if FCredentialsRoleList = AValue then Exit;
  FCredentialsRoleList := AValue;
  SetObjectProp('CredentialsRoleList', lgoExtObject(FCredentialsRoleList));
end;

procedure TKSeFGenerateTokenRequestType.SetDescription(AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

destructor TKSeFGenerateTokenRequestType.Destroy;
begin
  if Assigned(FCredentialsRoleList) then
  begin
    FCredentialsRoleList.Free;
    SetObjectProp('CredentialsRoleList', nil);
  end;
  inherited Destroy;
end;

procedure TKSeFGenerateTokenRequest.SetGenerateToken(
  AValue: TKSeFGenerateTokenRequestType);
begin
  if FGenerateToken = AValue then Exit;
  FGenerateToken := AValue;
  SetObjectProp('GenerateToken', lgoExtObject(FGenerateToken));
end;

destructor TKSeFGenerateTokenRequest.Destroy;
begin
  if Assigned(FGenerateToken) then
  begin
    FGenerateToken.Free;
    SetObjectProp('GenerateToken', nil);
  end;
  inherited Destroy;
end;

{ TKSeFGenerateTokenResponse }

function TKSeFGenerateTokenResponse.GetAuthorisationToken: UTF8String;
begin
  Result := GetStringProp('AuthorisationToken');
end;

function TKSeFGenerateTokenResponse.GetElementReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ElementReferenceNumber');
end;

function TKSeFGenerateTokenResponse.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFGenerateTokenResponse.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

function TKSeFGenerateTokenResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFGenerateTokenResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFGenerateTokenResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

{ TKSeFCredentialsRoleRequestStandardDescribed }

function TKSeFCredentialsRoleRequestStandardDescribed.GetRoleDescription: UTF8String;
begin
  Result := GetStringProp('RoleDescription');
end;

function TKSeFCredentialsRoleRequestStandardDescribed.GetRoleType: UTF8String;
begin
  Result := GetStringProp('RoleType');
end;

procedure TKSeFCredentialsRoleRequestStandardDescribed.SetRoleDescription(
  AValue: UTF8String);
begin
  SetStringProp('Description', AValue);
end;

procedure TKSeFCredentialsRoleRequestStandardDescribed.SetRoleType(
  AValue: UTF8String);
begin
  SetStringProp('RoleType', AValue);
end;

{ TKSeFCredentialsRoleRequestStandardDescribedArray }

function TKSeFCredentialsRoleRequestStandardDescribedArray.GetItem(
  AIndex: Integer): TKSeFCredentialsRoleRequestStandardDescribed;
begin
  Result := TKSeFCredentialsRoleRequestStandardDescribed(inherited GetItem(AIndex));
end;

{ TKSeFGrantCredentialsRequestType }

procedure TKSeFGrantCredentialsRequestType.SetCredentialsIdentifier(
  AValue: TKSeFCredentialsIdentifierRequest);
begin
  if FCredentialsIdentifier = AValue then Exit;
  FCredentialsIdentifier := AValue;
  SetObjectProp('CredentialsIdentifier', lgoExtObject(FCredentialsIdentifier));
end;

procedure TKSeFGrantCredentialsRequestType.SetCredentialsRoleList(
  AValue: TKSeFCredentialsRoleRequestStandardDescribedArray);
begin
  if FCredentialsRoleList = AValue then Exit;
  FCredentialsRoleList := AValue;
  SetObjectProp('CredentialsRoleList', lgoExtObject(FCredentialsRoleList));
end;

destructor TKSeFGrantCredentialsRequestType.Destroy;
begin
  if Assigned(FCredentialsIdentifier) then
  begin
    FCredentialsIdentifier.Free;
    SetObjectProp('CredentialsIdentifier', nil);
  end;
  if Assigned(FCredentialsRoleList) then
  begin
    FCredentialsRoleList.Free;
    SetObjectProp('CredentialsRoleList', nil);
  end;
  inherited Destroy;
end;

procedure TKSeFGrantCredentialsRequest.SetGrantCredentials(
  AValue: TKSeFGrantCredentialsRequestType);
begin
  if FGrantCredentials = AValue then Exit;
  FGrantCredentials := AValue;
  SetObjectProp('GrantCredentials', lgoExtObject(AValue));
end;

destructor TKSeFGrantCredentialsRequest.Destroy;
begin
  if Assigned(FGrantCredentials) then
  begin
    FGrantCredentials.Free;
    SetObjectProp('GrantCredentials', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsRoleRequestStandardBase }

function TKSeFCredentialsRoleRequestStandardBase.GetRoleType: UTF8String;
begin
  Result := GetStringProp('RoleType');
end;

procedure TKSeFCredentialsRoleRequestStandardBase.SetRoleType(AValue: UTF8String
  );
begin
  SetStringProp('RoleType', AValue);
end;

{ TKSeFCredentialsRoleRequestStandardBaseArray }

function TKSeFCredentialsRoleRequestStandardBaseArray.GetItem(AIndex: Integer
  ): TKSeFCredentialsRoleRequestStandardBase;
begin
  Result := TKSeFCredentialsRoleRequestStandardBase(inherited GetItem(AIndex));
end;

{ TKSeFRevokeCredentialsRequestType }

procedure TKSeFRevokeCredentialsRequestType.SetCredentialsIdentifier(
  AValue: TKSeFCredentialsIdentifierRequest);
begin
  if FCredentialsIdentifier = AValue then Exit;
  FCredentialsIdentifier := AValue;
  SetObjectProp('CredentialsIdentifier', lgoExtObject(AValue));
end;

procedure TKSeFRevokeCredentialsRequestType.SetCredentialsRoleList(
  AValue: TKSeFCredentialsRoleRequestStandardBaseArray);
begin
  if FCredentialsRoleList = AValue then Exit;
  FCredentialsRoleList := AValue;
  SetObjectProp('CredentialsRoleList', lgoExtObject(AValue));
end;

destructor TKSeFRevokeCredentialsRequestType.Destroy;
begin
  if Assigned(FCredentialsIdentifier) then
  begin
    FCredentialsIdentifier.Free;
    SetObjectProp('CredentialsIdentifier', nil);
  end;
  if Assigned(FCredentialsRoleList) then
  begin
    FCredentialsRoleList.Free;
    SetObjectProp('CredentialsRoleList', nil);
  end;
  inherited Destroy;
end;

procedure TKSeFRevokeCredentialsRequest.SetRevokeCredentials(
  AValue: TKSeFRevokeCredentialsRequestType);
begin
  if FRevokeCredentials = AValue then Exit;
  FRevokeCredentials := AValue;
  SetObjectProp('RevokeCredentials', lgoExtObject(AValue));
end;

destructor TKSeFRevokeCredentialsRequest.Destroy;
begin
  if Assigned(FRevokeCredentials) then
  begin
    FRevokeCredentials.Free;
    SetObjectProp('RevokeCredentials', nil);
  end;
  inherited Destroy;
end;

{ TKSeFRevokeTokenRequestType }

function TKSeFRevokeTokenRequestType.GetTokenNumber: UTF8String;
begin
  Result := GetStringProp('TokenNumber');
end;

procedure TKSeFRevokeTokenRequestType.SetSourceTokenIdentifier(
  AValue: TKSeFCredentialsIdentifierRequest);
begin
  if FSourceTokenIdentifier = AValue then Exit;
  FSourceTokenIdentifier := AValue;
  SetObjectProp('SourceTokenIdentifier', lgoExtObject(AValue));
end;

procedure TKSeFRevokeTokenRequestType.SetTokenNumber(AValue: UTF8String);
begin
  SetStringProp('TokenNumber', AValue);
end;

destructor TKSeFRevokeTokenRequestType.Destroy;
begin
  if Assigned(FSourceTokenIdentifier) then
  begin
    FSourceTokenIdentifier.Free;
    SetObjectProp('SourceTokenIdentifier', nil);
  end;
  inherited Destroy;
end;

procedure TKSeFRevokeTokenRequest.SetRevokeToken(
  AValue: TKSeFRevokeTokenRequestType);
begin
  if FRevokeToken = AValue then Exit;
  FRevokeToken := AValue;
  SetObjectProp('RevokeToken', lgoExtObject(AValue));
end;

destructor TKSeFRevokeTokenRequest.Destroy;
begin
  if Assigned(FRevokeToken) then
  begin
    FRevokeToken.Free;
    SetObjectProp('RevokeToken', nil);
  end;
  inherited Destroy;
end;

function TKSeFInvoiceRequestKSeF.GetKsefReferenceNumber: UTF8String;
begin
  Result := GetStringProp('KsefReferenceNumber');
end;

procedure TKSeFInvoiceRequestKSeF.SetInvoiceDetails(
  AValue: TKSeFInvoiceQueryDetails);
var
  O: LGP_OBJECT;
begin
  if FInvoiceDetails = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  SetObjectProp('InvoiceDetails', O);
  FInvoiceDetails := AValue;
end;

procedure TKSeFInvoiceRequestKSeF.SetKsefReferenceNumber(AValue: UTF8String);
begin
  SetStringProp('KsefReferenceNumber', AValue);
end;

destructor TKSeFInvoiceRequestKSeF.Destroy;
begin
  if FInvoiceDetails <> nil then
  begin
    FInvoiceDetails.Free;
    SetObjectProp('InvoiceDetails', nil);
  end;
  inherited Destroy;
end;

function TKSeFInvoiceQueryDetails.GetDueValue: Currency;
begin
  Result := GetCurrencyProp('DueValue');
end;

function TKSeFInvoiceQueryDetails.GetInvoiceOryginalNumber: UTF8String;
begin
  Result := GetStringProp('InvoiceOryginalNumber');
end;

procedure TKSeFInvoiceQueryDetails.SetDueValue(AValue: Currency);
begin
  SetCurrencyProp('DueValue', AValue);
end;

procedure TKSeFInvoiceQueryDetails.SetInvoiceOryginalNumber(AValue: UTF8String);
begin
  SetStringProp('InvoiceOryginalNumber', AValue);
end;

procedure TKSeFInvoiceQueryDetails.SetSubjectTo(AValue: TKSeFSubjectTo);
var
  O: LGP_OBJECT;
begin
  if FSubjectTo = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  SetObjectProp('SubjectTo', O);
  FSubjectTo := AValue;
end;

destructor TKSeFInvoiceQueryDetails.Destroy;
begin
  if FSubjectTo <> nil then
  begin
    FSubjectTo.Free;
    SetObjectProp('SubjectTo', nil);
  end;
  inherited Destroy;
end;

{ EKSeFExceptionResponse }

procedure EKSeFExceptionResponse.LoadObject(AException: LGP_EXCEPTION);
var
  S, O: LGP_OBJECT;
  I, Cnt: Integer;
begin
  inherited LoadObject(AException);
  if AException <> nil then
  begin
    lgoCheckResult(lgpObject_GetIntegerProp(AException, 'ResponseCode', FResponseCode), False);
    if lgoCheckResult(lgpObject_GetStringProp(AException, 'RawData', S), False) then
      FRawData := lgoGetString(S);
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
      and lgoCheckResult(lgpListObject_GetCount(AException, Cnt), False)
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
        end;
      end;
    end;
  end;
end;

function TKSeFRequestPaymentIdentifierResponse.GetPaymentIdentifier: UTF8String;
begin
  Result := GetStringProp('PaymentIdentifier');
end;

function TKSeFRequestPaymentIdentifierResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFRequestPaymentIdentifierResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFRequestPaymentIdentifierResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

function TKSeFGetPaymentIdentifierReferenceNumbersResponse.GetKsefReferenceNumberList: TStringArray;
var
  SL: TStringList;
  I: Integer;
begin
  SL := TStringList.Create;
  SL.Delimiter := ';';
  SL.DelimitedText := GetStringProp('KsefReferenceNumberListStr');
  SetLength(Result, SL.Count);
  for I := 0 to SL.Count - 1 do
    Result[I] := SL[I];
  SL.Free;
end;

function TKSeFGetPaymentIdentifierReferenceNumbersResponse.GetNumberOfElements: Integer;
begin
  Result := GetIntegerProp('NumberOfElements');
end;

function TKSeFGetPaymentIdentifierReferenceNumbersResponse.GetPageOffset: Integer;
begin
  Result := GetIntegerProp('PageOffset');
end;

function TKSeFGetPaymentIdentifierReferenceNumbersResponse.GetPageSize: Integer;
begin
  Result := GetIntegerProp('PageSize');
end;

function TKSeFGetPaymentIdentifierReferenceNumbersResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFGetPaymentIdentifierReferenceNumbersResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFGetPaymentIdentifierReferenceNumbersResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

function TKSeFQueryInvoiceAsyncStatusResponse.GetElementReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ElementReferenceNumber');
end;

function TKSeFQueryInvoiceAsyncStatusResponse.GetNumberOfElements: Int64;
begin
  Result := GetInt64Prop('NumberOfElements');
end;

function TKSeFQueryInvoiceAsyncStatusResponse.GetNumberOfParts: Integer;
begin
  Result := GetIntegerProp('NumberOfParts');
end;

function TKSeFQueryInvoiceAsyncStatusResponse.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFQueryInvoiceAsyncStatusResponse.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

function TKSeFQueryInvoiceAsyncStatusResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFQueryInvoiceAsyncStatusResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFQueryInvoiceAsyncStatusResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

constructor TKSeFQueryInvoiceAsyncStatusResponse.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('PartList');
  if O <> nil then
    FPartList := TKSeFInvoiceDivisionPlainPartArray.Create(O);
end;

destructor TKSeFQueryInvoiceAsyncStatusResponse.Destroy;
begin
  if Assigned(FPartList) then
  begin
    FPartList.Free;
    SetObjectProp('PartList', nil);
  end;
  inherited Destroy;
end;

function TKSeFInvoiceDivisionPlainPart.GetPartExpiration: TDateTime;
begin
  Result := GetDoubleProp('PartExpiration');
end;

function TKSeFInvoiceDivisionPlainPart.GetPartExpirationRaw: UTF8String;
begin
  Result := GetStringProp('PartExpirationRaw');
end;

function TKSeFInvoiceDivisionPlainPart.GetPartName: UTF8String;
begin
  Result := GetStringProp('PartName');
end;

function TKSeFInvoiceDivisionPlainPart.GetPartNumber: Integer;
begin
  Result := GetIntegerProp('PartNumber');
end;

function TKSeFInvoiceDivisionPlainPart.GetPartRangeFrom: TDateTime;
begin
  Result := GetDoubleProp('PartRangeFrom');
end;

function TKSeFInvoiceDivisionPlainPart.GetPartRangeFromRaw: UTF8String;
begin
  Result := GetStringProp('PartRangeFromRaw');
end;

function TKSeFInvoiceDivisionPlainPart.GetPartRangeTo: TDateTime;
begin
  Result := GetDoubleProp('PartRangeTo');
end;

function TKSeFInvoiceDivisionPlainPart.GetPartRangeToRaw: UTF8String;
begin
  Result := GetStringProp('PartRangeToRaw');
end;

function TKSeFInvoiceDivisionPlainPart.GetPartReferenceNumber: UTF8String;
begin
  Result := GetStringProp('PartReferenceNumber');
end;

constructor TKSeFInvoiceDivisionPlainPart.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('PlainPartHash');
  if O <> nil then
    FPlainPartHash := TKSeFFileUnlimitedHash.Create(O);
end;

destructor TKSeFInvoiceDivisionPlainPart.Destroy;
begin
  if Assigned(FPlainPartHash) then
  begin
    FPlainPartHash.Free;
    SetObjectProp('PlainPartHash', nil);
  end;
  inherited Destroy;
end;

function TKSeFInvoiceDivisionPlainPartArray.GetItem(AIndex: Integer
  ): TKSeFInvoiceDivisionPlainPart;
begin
  Result := TKSeFInvoiceDivisionPlainPart(inherited GetItem(AIndex));
end;

function TKSeFQueryInvoiceAsyncInitResponse.GetElementReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ElementReferenceNumber');
end;

function TKSeFQueryInvoiceAsyncInitResponse.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFQueryInvoiceAsyncInitResponse.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

function TKSeFQueryInvoiceAsyncInitResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFQueryInvoiceAsyncInitResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFQueryInvoiceAsyncInitResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

function TKSeFRequest.GetAsJSONString: UTF8String;
begin
  Result := GetStringProp('AsJSONString');
end;

{ TKSeFSubjectToArray }

function TKSeFSubjectToArray.GetItem(AIndex: Integer): TKSeFSubjectTo;
begin
  Result := TKSeFSubjectTo(inherited GetItem(AIndex));
end;

{ TKSeFQueryInvoiceSyncResponse }

function TKSeFQueryInvoiceSyncResponse.GetNumberOfElements: Integer;
begin
  Result := GetIntegerProp('NumberOfElements');
end;

function TKSeFQueryInvoiceSyncResponse.GetPageOffset: Integer;
begin
  Result := GetIntegerProp('PageOffset');
end;

function TKSeFQueryInvoiceSyncResponse.GetPageSize: Integer;
begin
  Result := GetIntegerProp('PageSize');
end;

function TKSeFQueryInvoiceSyncResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFQueryInvoiceSyncResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFQueryInvoiceSyncResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

constructor TKSeFQueryInvoiceSyncResponse.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('InvoiceHeaderList');
  if O <> nil then
    FInvoiceHeaderList := TKSeFInvoiceHeaderArray.Create(O);
end;

destructor TKSeFQueryInvoiceSyncResponse.Destroy;
begin
  if Assigned(FInvoiceHeaderList) then
  begin
    FInvoiceHeaderList.Free;
    SetObjectProp('InvoiceHeaderList', nil);
  end;
  inherited Destroy;
end;

{ TKSeFInvoiceHeaderArray }

function TKSeFInvoiceHeaderArray.GetItem(AIndex: Integer): TKSeFInvoiceHeader;
begin
  Result := TKSeFInvoiceHeader(inherited GetItem(AIndex));
end;

{ TKSeFInvoiceHeader }

function TKSeFInvoiceHeader.GetAcquisitionTimestamp: TDateTime;
begin
  Result := GetDoubleProp('AcquisitionTimestamp');
end;

function TKSeFInvoiceHeader.GetAcquisitionTimestampRaw: UTF8String;
begin
  Result := GetStringProp('AcquisitionTimestampRaw');
end;

function TKSeFInvoiceHeader.GetCurrency: UTF8String;
begin
  Result := GetStringProp('Currency');
end;

function TKSeFInvoiceHeader.GetFaP17Annotation: Boolean;
begin
  Result := GetBooleanProp('FaP17Annotation');
end;

function TKSeFInvoiceHeader.GetGross: UTF8String;
begin
  Result := GetStringProp('Gross');
end;

function TKSeFInvoiceHeader.GetHidden: Boolean;
begin
  Result := GetBooleanProp('Hidden');
end;

function TKSeFInvoiceHeader.GetHidingTime: TDateTime;
begin
  Result := GetDoubleProp('HidingTime');
end;

function TKSeFInvoiceHeader.GetHidingTimeRaw: UTF8String;
begin
  Result := GetStringProp('HidingTimeRaw');
end;

function TKSeFInvoiceHeader.GetInvoiceReferenceNumber: UTF8String;
begin
  Result := GetStringProp('InvoiceReferenceNumber');
end;

function TKSeFInvoiceHeader.GetInvoiceType: TKSeFInvoiceType;
begin
  Result := TKSeFInvoiceType(GetIntegerProp('InvoiceType'));
end;

function TKSeFInvoiceHeader.GetInvoiceTypeRaw: UTF8String;
begin
  Result := GetStringProp('InvoiceTypeRaw');
end;

function TKSeFInvoiceHeader.GetInvoicingDate: TDateTime;
begin
  Result := GetDoubleProp('InvoicingDate');
end;

function TKSeFInvoiceHeader.GetInvoicingDateRaw: UTF8String;
begin
  Result := GetStringProp('InvoicingDateRaw');
end;

function TKSeFInvoiceHeader.GetKsefReferenceNumber: UTF8String;
begin
  Result := GetStringProp('KsefReferenceNumber');
end;

function TKSeFInvoiceHeader.GetNet: UTF8String;
begin
  Result := GetStringProp('Net');
end;

function TKSeFInvoiceHeader.GetSchemaVersion: UTF8String;
begin
  Result := GetStringProp('SchemaVersion');
end;

function TKSeFInvoiceHeader.GetVat: UTF8String;
begin
  Result := GetStringProp('Vat');
end;

constructor TKSeFInvoiceHeader.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('InvoiceHash');
  if O <> nil then
    FInvoiceHash := TKSeFFileUnlimitedHash.Create(O);
  O := GetObjectProp('SubjectBy');
  if O <> nil then
    FSubjectBy := TKSeFSubjectBy.Create(O);
  O := GetObjectProp('SubjectByK');
  if O <> nil then
    FSubjectByK := TKSeFSubjectBy.Create(O);
  O := GetObjectProp('SubjectsAuthorizedList');
  if O <> nil then
    FSubjectsAuthorizedList := TKSeFSubjectAuthorizedArray.Create(O);
  O := GetObjectProp('SubjectsOtherList');
  if O <> nil then
    FSubjectsOtherList := TKSeFSubjectOtherArray.Create(O);
  O := GetObjectProp('SubjectTo');
  if O <> nil then
    FSubjectTo := TKSeFSubjectTo.Create(O);
  O := GetObjectProp('SubjectToKList');
  if O <> nil then
    FSubjectToKList := TKSeFSubjectToArray.Create(O);

end;

destructor TKSeFInvoiceHeader.Destroy;
begin
  if Assigned(FInvoiceHash) then
  begin
    FInvoiceHash.Free;
    SetObjectProp('InvoiceHash', nil);
  end;
  if Assigned(FSubjectBy) then
  begin
    FSubjectBy.Free;
    SetObjectProp('SubjectBy', nil);
  end;
  if Assigned(FSubjectByK) then
  begin
    FSubjectByK.Free;
    SetObjectProp('SubjectByK', nil);
  end;
  if Assigned(FSubjectsAuthorizedList) then
  begin
    FSubjectsAuthorizedList.Free;
    SetObjectProp('SubjectsAuthorizedList', nil);
  end;
  if Assigned(FSubjectsOtherList) then
  begin
    FSubjectsOtherList.Free;
    SetObjectProp('SubjectsOtherList', nil);
  end;
  if Assigned(FSubjectTo) then
  begin
    FSubjectTo.Free;
    SetObjectProp('SubjectTo', nil);
  end;
  if Assigned(FSubjectToKList) then
  begin
    FSubjectToKList.Free;
    SetObjectProp('SubjectToKList', nil);
  end;
  inherited Destroy;
end;

{ TKSeFFileUnlimitedHash }

function TKSeFFileUnlimitedHash.GetFileSize: Integer;
begin
  Result := GetIntegerProp('FileSize');
end;

constructor TKSeFFileUnlimitedHash.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('HashSHA');
  if O <> nil then
    FHashSHA := TKSeFHashSHA.Create(O);
end;

destructor TKSeFFileUnlimitedHash.Destroy;
begin
  if Assigned(FHashSHA) then
  begin
    FHashSHA.Free;
    SetObjectProp('HashSHA', nil);
  end;
  inherited Destroy;
end;

{ TKSeFHashSHA }

function TKSeFHashSHA.GetAlgorithm: UTF8String;
begin
  Result := GetStringProp('Algorithm');
end;

function TKSeFHashSHA.GetEncoding: UTF8String;
begin
  Result := GetStringProp('Encoding');
end;

function TKSeFHashSHA.GetValue: UTF8String;
begin
  Result := GetStringProp('Value');
end;

procedure TKSeFHashSHA.SetAlgorithm(AValue: UTF8String);
begin
  SetStringProp('Algorithm', AValue);
end;

procedure TKSeFHashSHA.SetEncoding(AValue: UTF8String);
begin
  SetStringProp('Encoding', AValue);
end;

procedure TKSeFHashSHA.SetValue(AValue: UTF8String);
begin
  SetStringProp('Value', AValue);
end;

{ TKSeFSubjectAuthorizedArray }

function TKSeFSubjectAuthorizedArray.GetItem(AIndex: Integer
  ): TKSeFSubjectAuthorized;
begin
  Result := TKSeFSubjectAuthorized(inherited GetItem(AIndex));
end;

{ TKSeFSubjectAuthorized }

function TKSeFSubjectAuthorized.GetSubjectAuthorizedType: TKSeFSubjectAuthorizedType;
begin
  Result := TKSeFSubjectAuthorizedType(GetIntegerProp('SubjectAuthorizedType'));
end;

function TKSeFSubjectAuthorized.GetSubjectAuthorizedTypeRaw: UTF8String;
begin
  Result := GetStringProp('SubjectAuthorizedTypeRaw');
end;

constructor TKSeFSubjectAuthorized.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('IssuedToIdentifier');
  if O <> nil then
    FIssuedToIdentifier := TKSeFSubjectIdentifierTo.CreateFromObject(O);
  O := GetObjectProp('IssuedToName');
  if O <> nil then
    FIssuedToName := TKSeFSubjectName.CreateFromObject(O);
end;

destructor TKSeFSubjectAuthorized.Destroy;
begin
  if Assigned(FIssuedToIdentifier) then
  begin
    FIssuedToIdentifier.Free;
    SetObjectProp('IssuedToIdentifier', nil);
  end;
  if Assigned(FIssuedToName) then
  begin
    FIssuedToName.Free;
    SetObjectProp('IssuedToName', nil);
  end;
  inherited Destroy;
end;

{ TKSeFSubjectOtherArray }

function TKSeFSubjectOtherArray.GetItem(AIndex: Integer): TKSeFSubjectOther;
begin
  Result := TKSeFSubjectOther(inherited GetItem(AIndex));
end;

{ TKSeFSubjectOther }

function TKSeFSubjectOther.GetSubjectOtherType: TKSeFSubjectOtherType;
begin
  Result := TKSeFSubjectOtherType(GetIntegerProp('SubjectOtherType'));
end;

function TKSeFSubjectOther.GetSubjectOtherTypeRaw: UTF8String;
begin
  Result := GetStringProp('SubjectOtherTypeRaw');
end;

constructor TKSeFSubjectOther.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('IssuedToIdentifier');
  if O <> nil then
    FIssuedToIdentifier := TKSeFSubjectIdentifierOtherTo.CreateFromObject(O);
  O := GetObjectProp('IssuedToName');
  if O <> nil then
    FIssuedToName := TKSeFSubjectName.CreateFromObject(O);
end;

destructor TKSeFSubjectOther.Destroy;
begin
  if Assigned(FIssuedToIdentifier) then
  begin
    FIssuedToIdentifier.Free;
    SetObjectProp('IssuedToIdentifier', nil);
  end;
  if Assigned(FIssuedToName) then
  begin
    FIssuedToName.Free;
    SetObjectProp('IssuedToName', nil);
  end;
  inherited Destroy;
end;

{ TKSeFSubjectIdentifierOtherToVatUe }

function TKSeFSubjectIdentifierOtherToVatUe.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

{ TKSeFSubjectIdentifierOtherToCompany }

function TKSeFSubjectIdentifierOtherToCompany.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

{ TKSeFSubjectIdentifierOtherToNrId }

function TKSeFSubjectIdentifierOtherToNrId.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

{ TKSeFSubjectIdentifierOtherToInternal }

function TKSeFSubjectIdentifierOtherToInternal.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

{ TKSeFSubjectIdentifierOtherTo }

function TKSeFSubjectIdentifierOtherTo.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

class function TKSeFSubjectIdentifierOtherTo.CreateFromObject(O: LGP_OBJECT
  ): TKSeFSubjectIdentifierOtherTo;
var
  C: TKSeFObjectClass;
begin
  C := TKSeFObjectClass(lgoFindClass(lgoClassName(O)));
  if C <> nil then
    Result := TKSeFSubjectIdentifierOtherTo(C.Create(O))
  else
    Result := nil;
  {S := UpperCase(ObjClassName);
  if S = 'TKSEFSUBJECTIDENTIFIEROTHERTOINTERNAL' then
    Result := TKSeFSubjectIdentifierOtherToInternal.Create(O)
  else if S = 'TKSEFSUBJECTIDENTIFIEROTHERTONONE' then
    Result := TKSeFSubjectIdentifierOtherToNone.Create(O)
  else if ;
  TKSeFSubjectIdentifierOtherToNrId
  TKSeFSubjectIdentifierOtherToCompany
  TKSeFSubjectIdentifierOtherToVatUe}
end;

{ TKSeFSubjectIdentifierBy }

function TKSeFSubjectIdentifierBy.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

class function TKSeFSubjectIdentifierBy.CreateFromObject(O: LGP_OBJECT
  ): TKSeFSubjectIdentifierBy;
var
  C: TKSeFObjectClass;
begin
  C := TKSeFObjectClass(lgoFindClass(lgoClassName(O)));
  if C <> nil then
    Result := TKSeFSubjectIdentifierBy(C.Create(O))
  else
    Result := nil;
end;

{ TKSeFQueryInvoiceRequest }

procedure TKSeFQueryInvoiceRequest.SetQueryCriteria(
  AValue: TKSeFQueryCriteriaInvoice);
var
  O: LGP_OBJECT;
begin
  if FQueryCriteria = AValue then Exit;
  if AValue = nil then
    O := nil
  else
    O := AValue.ExtObject;
  SetObjectProp('QueryCriteria', O);
  FQueryCriteria := AValue;
end;

constructor TKSeFQueryInvoiceRequest.Create(
  AQueryCriteria: TKSeFQueryCriteriaInvoice);
begin
  inherited Create;
  QueryCriteria := AQueryCriteria;
end;

destructor TKSeFQueryInvoiceRequest.Destroy;
begin
  if Assigned(FQueryCriteria) then
  begin
    FQueryCriteria.Free;
    SetObjectProp('QueryCriteria', nil);
  end;
  inherited Destroy;
end;

{ TKSeFQueryCriteriaInvoiceRange }

function TKSeFQueryCriteriaInvoiceRange.GetInvoicingDateFrom: TDateTime;
begin
  Result := GetDoubleProp('InvoicingDateFrom');
end;

function TKSeFQueryCriteriaInvoiceRange.GetInvoicingDateTo: TDateTime;
begin
  Result := GetDoubleProp('InvoicingDateTo');
end;

procedure TKSeFQueryCriteriaInvoiceRange.SetInvoicingDateFrom(AValue: TDateTime
  );
begin
  SetDoubleProp('InvoicingDateFrom', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceRange.SetInvoicingDateTo(AValue: TDateTime);
begin
  SetDoubleProp('InvoicingDateTo', AValue);
end;

{ TKSeFQueryCriteriaInvoiceIncremental }

function TKSeFQueryCriteriaInvoiceIncremental.GetAcquisitionTimestampThresholdFrom: TDateTime;
begin
  Result := GetDoubleProp('AcquisitionTimestampThresholdFrom');
end;

function TKSeFQueryCriteriaInvoiceIncremental.GetAcquisitionTimestampThresholdTo: TDateTime;
begin
  Result := GetDoubleProp('AcquisitionTimestampThresholdTo');
end;

procedure TKSeFQueryCriteriaInvoiceIncremental.SetAcquisitionTimestampThresholdFrom
  (AValue: TDateTime);
begin
  SetDoubleProp('AcquisitionTimestampThresholdFrom', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceIncremental.SetAcquisitionTimestampThresholdTo
  (AValue: TDateTime);
begin
  SetDoubleProp('AcquisitionTimestampThresholdTo', AValue);
end;

{ TKSeFQueryCriteriaInvoiceDetail }

function TKSeFQueryCriteriaInvoiceDetail.GetAmountFrom: Currency;
begin
  Result := GetCurrencyProp('AmountFrom');
end;

function TKSeFQueryCriteriaInvoiceDetail.GetAmountTo: Currency;
begin
  Result := GetCurrencyProp('AmountTo');
end;

function TKSeFQueryCriteriaInvoiceDetail.GetAmountType: TKSeFAmountType;
begin
  Result := TKSeFAmountType(GetIntegerProp('AmountType'));
end;

function TKSeFQueryCriteriaInvoiceDetail.GetCurrencyCodes: TStringArray;
var
  SL: TStringList;
  I: Integer;
begin
  SL := TStringList.Create;
  SL.Delimiter := ';';
  SL.DelimitedText := GetStringProp('CurrencyCodesStr');
  SetLength(Result, SL.Count);
  for I := 0 to SL.Count - 1 do
    Result[I] := SL[I];
  SL.Free;
end;

function TKSeFQueryCriteriaInvoiceDetail.GetCurrencyCodesStr: UTF8String;
begin
  Result := GetStringProp('CurrencyCodesStr');
end;

function TKSeFQueryCriteriaInvoiceDetail.GetFaP17Annotation: Boolean;
begin
  Result := GetBooleanProp('FaP17Annotation');
end;

function TKSeFQueryCriteriaInvoiceDetail.GetInvoiceNumber: UTF8String;
begin
  Result := GetStringProp('InvoiceNumber');
end;

function TKSeFQueryCriteriaInvoiceDetail.GetInvoiceTypes: TKSeFInvoiceTypes;
var
  SL: TStringList;
  S: String;
  I: Integer;
begin
  Result := [];
  SL := TStringList.Create;
  SL.Delimiter := ';';
  try
    SL.DelimitedText := GetStringProp('InvoiceTypesStr');
    for I := 0 to SL.Count - 1 do
    begin
      S := UpperCase(Trim(SL[I]));
      if S = 'VAT' then
        Include(Result, itVAT)
      else if S = 'KOR' then
        Include(Result, itKOR)
      else if S = 'ZAL' then
        Include(Result, itZAL)
      else if S = 'ROZ' then
        Include(Result, itROZ)
      else if S = 'UPR' then
        Include(Result, itUPR)
      else if S = 'KOR_ZAL' then
        Include(Result, itKOR_ZAL)
      else if S = 'KOR_ROZ' then
        Include(Result, itKOR_ROZ);
    end;
  finally
    SL.Free;
  end;
end;

function TKSeFQueryCriteriaInvoiceDetail.GetInvoicingDateFrom: TDateTime;
begin
  Result := GetDoubleProp('InvoicingDateFrom');
end;

function TKSeFQueryCriteriaInvoiceDetail.GetInvoicingDateTo: TDateTime;
begin
  Result := GetDoubleProp('InvoicingDateTo');
end;

function TKSeFQueryCriteriaInvoiceDetail.GetKsefReferenceNumber: UTF8String;
begin
  Result := GetStringProp('KsefReferenceNumber');
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetAmountFrom(AValue: Currency);
begin
  SetCurrencyProp('AmountFrom', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetAmountTo(AValue: Currency);
begin
  SetCurrencyProp('AmountTo', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetAmountType(AValue: TKSeFAmountType
  );
begin
  SetIntegerProp('AmountType', Ord(AValue));
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetCurrencyCodes(AValue: TStringArray
  );
var
  S: String;
  I: Integer;
begin
  S := '';
  for I := 0 to Length(AValue) - 1 do
  begin
    if S <> '' then
      S := S + ';';
    S := S + AValue[I];
  end;
  SetStringProp('CurrencyCodesStr', S);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetCurrencyCodesStr(AValue: UTF8String
  );
begin
  SetStringProp('CurrencyCodesStr', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetFaP17Annotation(AValue: Boolean);
begin
  SetBooleanProp('FaP17Annotation', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetInvoiceNumber(AValue: UTF8String);
begin
  SetStringProp('InvoiceNumber', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetInvoiceTypes(
  AValue: TKSeFInvoiceTypes);
var
  S: String;
begin
  S := '';
  if itVAT in AValue then
    S := S + 'VAT;';
  if itKOR in AValue then
    S := S + 'KOR;';
  if itZAL in AValue then
    S := S + 'ZAL;';
  if itROZ in AValue then
    S := S + 'ROZ;';
  if itUPR in AValue then
    S := S + 'UPR;';
  if itKOR_ZAL in AValue then
    S := S + 'KOR_ZAL;';
  if itKOR_ROZ in AValue then
    S := S + 'KOR_ROZ;';
  if S <> '' then
    Delete(S, Length(S), 1);
  SetStringProp('InvoiceTypesStr', S);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetInvoicingDateFrom(AValue: TDateTime
  );
begin
  SetDoubleProp('InvoicingDateFrom', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetInvoicingDateTo(AValue: TDateTime);
begin
  SetDoubleProp('InvoicingDateTo', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetKsefReferenceNumber(
  AValue: UTF8String);
begin
  SetStringProp('KsefReferenceNumber', AValue);
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetSubjectBy(AValue: TKSeFSubjectBy);
begin
  if FSubjectBy = AValue then Exit;
  FSubjectBy := AValue;
end;

procedure TKSeFQueryCriteriaInvoiceDetail.SetSubjectTo(AValue: TKSeFSubjectTo);
begin
  if FSubjectTo = AValue then Exit;
  FSubjectTo := AValue;
end;

destructor TKSeFQueryCriteriaInvoiceDetail.Destroy;
begin
  if Assigned(FSubjectBy) then
  begin
    FSubjectBy.Free;
    SetObjectProp('SubjectBy', nil);
  end;
  if Assigned(FSubjectTo) then
  begin
    FSubjectTo.Free;
    SetObjectProp('SubjectTo', nil);
  end;
  inherited Destroy;
end;

{ TKSeFQueryCriteriaInvoice }

function TKSeFQueryCriteriaInvoice.GetHidingDateFrom: TDateTime;
begin
  Result := GetDoubleProp('HidingDateFrom');
end;

function TKSeFQueryCriteriaInvoice.GetHidingDateTo: TDateTime;
begin
  Result := GetDoubleProp('HidingDateTo');
end;

function TKSeFQueryCriteriaInvoice.GetIsHidden: Boolean;
begin
  Result := GetBooleanProp('IsHidden');
end;

function TKSeFQueryCriteriaInvoice.GetSubjectType: TKSeFSubjectType;
begin
  Result := TKSeFSubjectType(GetIntegerProp('SubjectType'));
end;

procedure TKSeFQueryCriteriaInvoice.SetHidingDateFrom(AValue: TDateTime);
begin
  SetDoubleProp('HidingDateFrom', AValue);
end;

procedure TKSeFQueryCriteriaInvoice.SetHidingDateTo(AValue: TDateTime);
begin
  SetDoubleProp('HidingDateTo', AValue);
end;

procedure TKSeFQueryCriteriaInvoice.SetIsHidden(AValue: Boolean);
begin
  SetBooleanProp('IsHidden', AValue);
end;

procedure TKSeFQueryCriteriaInvoice.SetSubjectType(AValue: TKSeFSubjectType);
begin
  SetIntegerProp('SubjectType', Integer(AValue));
end;

{ TKSeFSubjectTo }

function TKSeFSubjectTo.GetIssuedToIdentifier: TKSeFSubjectIdentifierTo;
begin
  Result := FIssuedToIdentifier;
end;

function TKSeFSubjectTo.GetIssuedToName: TKSeFSubjectName;
begin
  Result := FIssuedToName;
end;

procedure TKSeFSubjectTo.SetIssuedToIdentifier(AValue: TKSeFSubjectIdentifierTo
  );
var
  O: LGP_OBJECT;
begin
  FIssuedToIdentifier := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('IssuedToIdentifier', O);
end;

procedure TKSeFSubjectTo.SetIssuedToName(AValue: TKSeFSubjectName);
var
  O: LGP_OBJECT;
begin
  FIssuedToName := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('IssuedToName', O);
end;

constructor TKSeFSubjectTo.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('IssuedToIdentifier');
  if O <> nil then
    FIssuedToIdentifier := TKSeFSubjectIdentifierTo.CreateFromObject(O);
  O := GetObjectProp('IssuedToName');
  if O <> nil then
    FIssuedToName := TKSeFSubjectName.CreateFromObject(O);
end;

destructor TKSeFSubjectTo.Destroy;
begin
  if Assigned(FIssuedToIdentifier) then
  begin
    FIssuedToIdentifier.Free;
    SetObjectProp('IssuedToIdentifier', nil);
  end;
  if Assigned(FIssuedToName) then
  begin
    FIssuedToName.Free;
    SetObjectProp('IssuedToName', nil);
  end;
  inherited Destroy;
end;

{ TKSeFSubjectIdentifierToVatUe }

function TKSeFSubjectIdentifierToVatUe.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

procedure TKSeFSubjectIdentifierToVatUe.SetIdentifier(AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

{ TKSeFSubjectIdentifierToOther }

function TKSeFSubjectIdentifierToOther.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

procedure TKSeFSubjectIdentifierToOther.SetIdentifier(AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

{ TKSeFSubjectIdentifierToCompany }

function TKSeFSubjectIdentifierToCompany.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

procedure TKSeFSubjectIdentifierToCompany.SetIdentifier(AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

{ TKSeFSubjectIdentifierTo }

function TKSeFSubjectIdentifierTo.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

procedure TKSeFSubjectIdentifierTo.SetType(AValue: UTF8String);
begin
  SetStringProp('Type', AValue);
end;

class function TKSeFSubjectIdentifierTo.CreateFromObject(O: LGP_OBJECT
  ): TKSeFSubjectIdentifierTo;
var
  C: TKSeFObjectClass;
begin
  C := TKSeFObjectClass(lgoFindClass(lgoClassName(O)));
  if C <> nil then
    Result := TKSeFSubjectIdentifierTo(C.Create(O))
  else
    Result := nil;
end;

{ TKSeFSubjectBy }

function TKSeFSubjectBy.GetIssuedByIdentifier: TKSeFSubjectIdentifierBy;
begin
  Result := FIssuedByIdentifier;
end;

function TKSeFSubjectBy.GetIssuedByName: TKSeFSubjectName;
begin
  Result := FIssuedByName;
end;

procedure TKSeFSubjectBy.SetIssuedByIdentifier(AValue: TKSeFSubjectIdentifierBy
  );
var
  O: LGP_OBJECT;
begin
  FIssuedByIdentifier := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('IssuedByIdentifier', O);
end;

procedure TKSeFSubjectBy.SetIssuedByName(AValue: TKSeFSubjectName);
var
  O: LGP_OBJECT;
begin
  FIssuedByName := AValue;
  if AValue <> nil then
    O := AValue.ExtObject
  else
    O := nil;
  SetObjectProp('IssuedByName', O);
end;

constructor TKSeFSubjectBy.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('IssuedByIdentifier');
  if O <> nil then
    FIssuedByIdentifier := TKSeFSubjectIdentifierBy.CreateFromObject(O);
  O := GetObjectProp('IssuedByName');
  if O <> nil then
    FIssuedByName := TKSeFSubjectName.CreateFromObject(O);
end;

destructor TKSeFSubjectBy.Destroy;
begin
  if Assigned(FIssuedByIdentifier) then
  begin
    FIssuedByIdentifier.Free;
    SetObjectProp('IssuedByIdentifier', nil);
  end;
  if Assigned(FIssuedByName) then
  begin
    FIssuedByName.Free;
    SetObjectProp('IssuedByName', nil);
  end;
  inherited Destroy;
end;

{ TKSeFObject }

procedure TKSeFObject.CreateExtObject(AClassName: UTF8String);
begin
  ExtObject := lgpKSeF_CreateKSeFClass(LGP_PCHAR(AClassName));
  if ExtObject = nil then
    raise EClassNotFound.Create('Nie znaleziono klasy: ' + AClassName);
end;

constructor TKSeFObject.Create;
begin
  CreateExtObject(Self.ClassName);
end;

constructor TKSeFObject.Create(AClassName: UTF8String);
begin
  CreateExtObject(AClassName);
end;

{ TKSeFStatusInvoiceResponse }

function TKSeFStatusInvoiceResponse.GetElementReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ElementReferenceNumber');
end;

function TKSeFStatusInvoiceResponse.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFStatusInvoiceResponse.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

function TKSeFStatusInvoiceResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFStatusInvoiceResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFStatusInvoiceResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

constructor TKSeFStatusInvoiceResponse.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited;
  O := GetObjectProp('InvoiceStatus');
  if O <> nil then
    FInvoiceStatus := TKSeFInvoiceStatus.Create(O);
end;

destructor TKSeFStatusInvoiceResponse.Destroy;
begin
  if FInvoiceStatus <> nil then
  begin
    FInvoiceStatus.Free;
    SetObjectProp('InvoiceStatus', nil);
  end;
  inherited Destroy;
end;

{ TKSeFHideInvoiceRequestType }

function TKSeFHideInvoiceRequestType.GetHidingReason: UTF8String;
begin
  Result := GetStringProp('HidingReason');
end;

function TKSeFHideInvoiceRequestType.GetKsefReferenceNumber: UTF8String;
begin
  Result := GetStringProp('KsefReferenceNumber');
end;

procedure TKSeFHideInvoiceRequestType.SetHidingReason(AValue: UTF8String);
begin
  SetStringProp('HidingReason', AValue);
end;

procedure TKSeFHideInvoiceRequestType.SetKsefReferenceNumber(AValue: UTF8String
  );
begin
  SetStringProp('KsefReferenceNumber', AValue);
end;

procedure TKSeFHideInvoiceRequest.SetInvoiceHideRequest(
  AValue: TKSeFHideInvoiceRequestType);
begin
  if FInvoiceHideRequest = AValue then Exit;
  FInvoiceHideRequest := AValue;
  SetObjectProp('InvoiceHideRequest', AValue.ExtObject);
end;

destructor TKSeFHideInvoiceRequest.Destroy;
begin
  if Assigned(FInvoiceHideRequest) then
  begin
    FInvoiceHideRequest.Free;
    SetObjectProp('InvoiceHideRequest', nil);
  end;
  inherited Destroy;
end;

{ TKSeFShowInvoiceRequestType }

function TKSeFShowInvoiceRequestType.GetHidingCancelationReason: UTF8String;
begin
  Result := GetStringProp('HidingCancelationReason');
end;

function TKSeFShowInvoiceRequestType.GetKsefReferenceNumber: UTF8String;
begin
  Result := GetStringProp('KsefReferenceNumber');
end;

procedure TKSeFShowInvoiceRequestType.SetHidingCancelationReason(
  AValue: UTF8String);
begin
  SetStringProp('HidingCancelationReason', AValue);
end;

procedure TKSeFShowInvoiceRequestType.SetKsefReferenceNumber(AValue: UTF8String
  );
begin
  SetStringProp('KsefReferenceNumber', AValue);
end;

procedure TKSeFShowInvoiceRequest.SetInvoiceHideCancelationRequest(
  AValue: TKSeFShowInvoiceRequestType);
begin
  if FInvoiceHideCancelationRequest = AValue then Exit;
  FInvoiceHideCancelationRequest := AValue;
  SetObjectProp('InvoiceHideCancelationRequest', FInvoiceHideCancelationRequest.ExtObject);
end;

destructor TKSeFShowInvoiceRequest.Destroy;
begin
  if Assigned(FInvoiceHideCancelationRequest) then
  begin
    FInvoiceHideCancelationRequest.Free;
    SetObjectProp('InvoiceHideCancelationRequest', nil);
  end;
  inherited Destroy;
end;

{ TKSeFVisibilityInvoiceResponse }

function TKSeFVisibilityInvoiceResponse.GetCancelationReason: UTF8String;
begin
  Result := GetStringProp('CancelationReason');
end;

function TKSeFVisibilityInvoiceResponse.GetCancelationTimestamp: TDateTime;
begin
  Result := GetDoubleProp('CancelationTimestamp');
end;

function TKSeFVisibilityInvoiceResponse.GetCancelationTimestampRaw: UTF8String;
begin
  Result := GetStringProp('CancelationTimestampRaw');
end;

function TKSeFVisibilityInvoiceResponse.GetCanceled: Boolean;
begin
  Result := GetBooleanProp('Canceled');
end;

function TKSeFVisibilityInvoiceResponse.GetHidingReason: UTF8String;
begin
  Result := GetStringProp('HidingReason');
end;

function TKSeFVisibilityInvoiceResponse.GetHidingTimestamp: TDateTime;
begin
  Result := GetDoubleProp('HidingTimestamp');
end;

function TKSeFVisibilityInvoiceResponse.GetHidingTimestampRaw: UTF8String;
begin
  Result := GetStringProp('HidingTimestampRaw');
end;

function TKSeFVisibilityInvoiceResponse.GetKsefReferenceNumber: UTF8String;
begin
  Result := GetStringProp('KsefReferenceNumber');
end;

{ TKSeFInvoiceStatus }

function TKSeFInvoiceStatus.GetAcquisitionTimestamp: TDateTime;
begin
  Result := GetDoubleProp('AcquisitionTimestamp');
end;

function TKSeFInvoiceStatus.GetAcquisitionTimestampRaw: UTF8String;
begin
  Result := GetStringProp('AcquisitionTimestampRaw');
end;

function TKSeFInvoiceStatus.GetInvoiceNumber: UTF8String;
begin
  Result := GetStringProp('InvoiceNumber');
end;

function TKSeFInvoiceStatus.GetKsefReferenceNumber: UTF8String;
begin
  Result := GetStringProp('KsefReferenceNumber');
end;

{ TKSeFSendInvoiceResponse }

function TKSeFSendInvoiceResponse.GetElementReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ElementReferenceNumber');
end;

function TKSeFSendInvoiceResponse.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFSendInvoiceResponse.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

function TKSeFSendInvoiceResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFSendInvoiceResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFSendInvoiceResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

{ TKSeFInternalIdentifierGeneratedResponse }

function TKSeFInternalIdentifierGeneratedResponse.GetInternalIdentifier: UTF8String;
begin
  Result := GetStringProp('InternalIdentifier');
end;

function TKSeFInternalIdentifierGeneratedResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFInternalIdentifierGeneratedResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

function TKSeFCredentialsIdentifierRequest.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

function TKSeFCredentialsIdentifierRequest.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

procedure TKSeFCredentialsIdentifierRequest.SetIdentifier(AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

procedure TKSeFCredentialsIdentifierRequest.SetType(AValue: UTF8String);
begin
  SetStringProp('Type', AValue);
end;

function TKSeFQueryCriteriaCredentials.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

procedure TKSeFQueryCriteriaCredentials.SetType(AValue: UTF8String);
begin
  SetStringProp('Type', AValue);
end;

function TKSeFQueryCriteriaCredentialsAll.GetQueryCredentialsScopeResultTypeRaw: UTF8String;
begin
  Result := GetStringProp('QueryCredentialsScopeResultTypeRaw');
end;

function TKSeFQueryCriteriaCredentialsAll.GetQueryCredentialsTypeResultTypeRaw: UTF8String;
begin
  Result := GetStringProp('QueryCredentialsTypeResultTypeRaw');
end;

procedure TKSeFQueryCriteriaCredentialsAll.SetQueryCredentialsScopeResultTypeRaw
  (AValue: UTF8String);
begin
  SetStringProp('QueryCredentialsScopeResultTypeRaw', AValue);
end;

procedure TKSeFQueryCriteriaCredentialsAll.SetQueryCredentialsTypeResultTypeRaw(
  AValue: UTF8String);
begin
  SetStringProp('QueryCredentialsTypeResultTypeRaw', AValue);
end;

function TKSeFQueryCriteriaCredentialsId.GetQueryCredentialsScopeResultTypeRaw: UTF8String;
begin
  Result := GetStringProp('QueryCredentialsScopeResultTypeRaw');
end;

function TKSeFQueryCriteriaCredentialsId.GetQueryCredentialsTypeResultTypeRaw: UTF8String;
begin
  Result := GetStringProp('QueryCredentialsTypeResultTypeRaw');
end;

procedure TKSeFQueryCriteriaCredentialsId.SetCredentialsIdentifier(
  AValue: TKSeFCredentialsIdentifierRequest);
begin
  if FCredentialsIdentifier = AValue then Exit;
  FCredentialsIdentifier := AValue;
  SetObjectProp('CredentialsIdentifier', lgoExtObject(AValue));
end;

procedure TKSeFQueryCriteriaCredentialsId.SetQueryCredentialsScopeResultTypeRaw(
  AValue: UTF8String);
begin
  SetStringProp('QueryCredentialsScopeResultTypeRaw', AValue);
end;

procedure TKSeFQueryCriteriaCredentialsId.SetQueryCredentialsTypeResultTypeRaw(
  AValue: UTF8String);
begin
  SetStringProp('QueryCredentialsTypeResultTypeRaw', AValue);
end;

constructor TKSeFQueryCriteriaCredentialsId.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited;
  O := GetObjectProp('CredentialsIdentifier');
  if O <> nil then
    FCredentialsIdentifier := TKSeFCredentialsIdentifierRequest.Create(O);
end;

destructor TKSeFQueryCriteriaCredentialsId.Destroy;
begin
  if Assigned(FCredentialsIdentifier) then
  begin
    FCredentialsIdentifier.Free;
    SetObjectProp('CredentialsIdentifier', nil);
  end;
  inherited Destroy;
end;

procedure TKSeFQuerySyncCredentialsRequest.SetQueryCriteria(
  AValue: TKSeFQueryCriteriaCredentials);
begin
  if FQueryCriteria = AValue then Exit;
  FQueryCriteria := AValue;
  SetObjectProp('QueryCriteria', lgoExtObject(AValue));
end;

constructor TKSeFQuerySyncCredentialsRequest.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited;
  O := GetObjectProp('QueryCriteria');
  if O <> nil then
    FQueryCriteria := TKSeFQueryCriteriaCredentials.Create(O);
end;

destructor TKSeFQuerySyncCredentialsRequest.Destroy;
begin
  if Assigned(FQueryCriteria) then
  begin
    FQueryCriteria.Free;
    SetObjectProp('QueryCriteria', nil);
  end;
  inherited Destroy;
end;

function TKSeFCredentialsBaseTypeObject.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

constructor TKSeFCredentialsBaseTypeObject.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('CredentialsRoleList');
  if O <> nil then
    FCredentialsRoleList := TKSeFCredentialsRoleResponseBaseArray.Create(O);
  O := GetObjectProp('Identifier');
  if O <> nil then
    FIdentifier := TKSeFCredentialsIdentifierResponse.Create(O);
end;

destructor TKSeFCredentialsBaseTypeObject.Destroy;
begin
  if Assigned(FCredentialsRoleList) then
  begin
    FCredentialsRoleList.Free;
    SetObjectProp('CredentialsRoleList', nil);
  end;
  if Assigned(FIdentifier) then
  begin
    FIdentifier.Free;
    SetObjectProp('Identifier', nil);
  end;
  inherited Destroy;
end;

class function TKSeFCredentialsBaseTypeObject.CreateFromObject(O: LGP_OBJECT
  ): TKSeFCredentialsBaseTypeObject;
var
  C: TKSeFObjectClass;
begin
  C := TKSeFObjectClass(lgoFindClass(lgoClassName(O)));
  if C <> nil then
    Result := TKSeFCredentialsBaseTypeObject(C.Create(O))
  else
    Result := nil;
end;

{ TKSeFCredentialsPlain }

constructor TKSeFCredentialsPlain.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('CredentialsRole');
  if O <> nil then
    FCredentialsRole := TKSeFCredentialsRoleResponseStandardPlain.Create(O);
end;

destructor TKSeFCredentialsPlain.Destroy;
begin
  if Assigned(FCredentialsRole) then
  begin
    FCredentialsRole.Free;
    SetObjectProp('CredentialsRole', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsToken }

function TKSeFCredentialsToken.GetDescription: UTF8String;
begin
  Result := GetStringProp('Description');
end;

function TKSeFCredentialsToken.GetLastUseTimestamp: TDateTime;
begin
  Result := GetDoubleProp('LastUseTimestamp');
end;

function TKSeFCredentialsToken.GetLastUseTimestampRaw: UTF8String;
begin
  Result := GetStringProp('LastUseTimestampRaw');
end;

function TKSeFCredentialsToken.GetRegistrationTimestamp: TDateTime;
begin
  Result := GetDoubleProp('RegistrationTimestamp');
end;

function TKSeFCredentialsToken.GetRegistrationTimestampRaw: UTF8String;
begin
  Result := GetStringProp('RegistrationTimestampRaw');
end;

function TKSeFCredentialsToken.GetStatus: Integer;
begin
  Result := GetIntegerProp('Status');
end;

constructor TKSeFCredentialsToken.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('Parent');
  if O <> nil then
    FParent := TKSeFCredentialsPlain.Create(O);
end;

destructor TKSeFCredentialsToken.Destroy;
begin
  if Assigned(FParent) then
  begin
    FParent.Free;
    SetObjectProp('Parent', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsParent }

constructor TKSeFCredentialsParent.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('CredentialsRole');
  if O <> nil then
    FCredentialsRole := TKSeFCredentialsRoleResponseStandardPlain.Create(O);
end;

destructor TKSeFCredentialsParent.Destroy;
begin
  if Assigned(FCredentialsRole) then
  begin
    FCredentialsRole.Free;
    SetObjectProp('CredentialsRole', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsBaseTypeObjectArray }

function TKSeFCredentialsBaseTypeObjectArray.GetItem(AIndex: Integer
  ): TKSeFCredentialsBaseTypeObject;
begin
  Result := TKSeFCredentialsBaseTypeObject(inherited GetItem(AIndex));
end;

function TKSeFQuerySyncCredentialsResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFQuerySyncCredentialsResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFQuerySyncCredentialsResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

constructor TKSeFQuerySyncCredentialsResponse.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited Create(AObject);
  O := GetObjectProp('CredentialsList');
  if O <> nil then
    FCredentialsList := TKSeFCredentialsBaseTypeObjectArray.Create(O);
end;

destructor TKSeFQuerySyncCredentialsResponse.Destroy;
begin
  if Assigned(FCredentialsList) then
  begin
    FCredentialsList.Free;
    SetObjectProp('CredentialsList', nil);
  end;
  inherited Destroy;
end;

{ TKSeFTerminateSessionResponse }

function TKSeFTerminateSessionResponse.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFTerminateSessionResponse.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

function TKSeFTerminateSessionResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFTerminateSessionResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFTerminateSessionResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

{ TKSeFSessionStatusResponse }

function TKSeFSessionStatusResponse.GetNumberOfElements: Integer;
begin
  Result := GetIntegerProp('NumberOfElements');
end;

function TKSeFSessionStatusResponse.GetCreationTimestamp: TDateTime;
begin
  Result := GetDoubleProp('CreationTimestamp');
end;

function TKSeFSessionStatusResponse.GetCreationTimestampRaw: UTF8String;
begin
  Result := GetStringProp('CreationTimestampRaw');
end;

function TKSeFSessionStatusResponse.GetEntityType: UTF8String;
begin
  Result := GetStringProp('EntityType');
end;

function TKSeFSessionStatusResponse.GetLastUpdateTimestamp: TDateTime;
begin
  Result := GetDoubleProp('LastUpdateTimestamp');
end;

function TKSeFSessionStatusResponse.GetLastUpdateTimestampRaw: UTF8String;
begin
  Result := GetStringProp('LastUpdateTimestampRaw');
end;

function TKSeFSessionStatusResponse.GetPageOffset: Integer;
begin
  Result := GetIntegerProp('PageOffset');
end;

function TKSeFSessionStatusResponse.GetPageSize: Integer;
begin
  Result := GetIntegerProp('PageSize');
end;

function TKSeFSessionStatusResponse.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFSessionStatusResponse.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

function TKSeFSessionStatusResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFSessionStatusResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFSessionStatusResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

constructor TKSeFSessionStatusResponse.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited;
  O := GetObjectProp('InvoiceStatusList');
  if O <> nil then
    FInvoiceStatusList := TKSeFSessionInvoiceStatusArray.Create(O);
end;

destructor TKSeFSessionStatusResponse.Destroy;
begin
  if FInvoiceStatusList <> nil then
  begin
    FInvoiceStatusList.Free;
    SetObjectProp('InvoiceStatusList', nil);
  end;
  inherited Destroy;
end;

{ TKSeFTKSeFSessionInvoiceStatusArray }

function TKSeFSessionInvoiceStatusArray.GetItem(AIndex: Integer
  ): TKSeFSessionInvoiceStatus;
begin
  Result := TKSeFSessionInvoiceStatus(inherited GetItem(AIndex));
end;

{class function TKSeFSessionInvoiceStatusArray.GetItemClass(
  AObject: LGP_OBJECT): TKSeFObjectClass;
begin
  Result := TKSeFSessionInvoiceStatus;
end;}

{ TKSeFSessionInvoiceStatus }

function TKSeFSessionInvoiceStatus.GetAcquisitionTimestamp: TDateTime;
begin
  Result := GetDoubleProp('AcquisitionTimestamp');
end;

function TKSeFSessionInvoiceStatus.GetAcquisitionTimestampRaw: UTF8String;
begin
  Result := GetStringProp('AcquisitionTimestampRaw');
end;

function TKSeFSessionInvoiceStatus.GetElementReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ElementReferenceNumber');
end;

function TKSeFSessionInvoiceStatus.GetInvoiceNumber: UTF8String;
begin
  Result := GetStringProp('InvoiceNumber');
end;

function TKSeFSessionInvoiceStatus.GetKsefReferenceNumber: UTF8String;
begin
  Result := GetStringProp('KsefReferenceNumber');
end;

function TKSeFSessionInvoiceStatus.GetProcessingCode: Integer;
begin
  Result := GetIntegerProp('ProcessingCode');
end;

function TKSeFSessionInvoiceStatus.GetProcessingDescription: UTF8String;
begin
  Result := GetStringProp('ProcessingDescription');
end;

{ TKSeFInitSessionResponse }

function TKSeFInitSessionResponse.GetReferenceNumber: UTF8String;
begin
  Result := GetStringProp('ReferenceNumber');
end;

function TKSeFInitSessionResponse.GetTimestamp: TDateTime;
begin
  Result := GetDoubleProp('Timestamp');
end;

function TKSeFInitSessionResponse.GetTimestampRaw: UTF8String;
begin
  Result := GetStringProp('TimestampRaw');
end;

constructor TKSeFInitSessionResponse.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited;
  O := GetObjectProp('SessionToken');
  if O <> nil then
    FSessionToken := TKSeFInitialisedSession.Create(O);
end;

destructor TKSeFInitSessionResponse.Destroy;
begin
  if FSessionToken <> nil then
  begin
    FSessionToken.Free;
    SetObjectProp('SessionToken', nil);
  end;
  inherited Destroy;
end;

{ TKSeFInitialisedSession }

function TKSeFInitialisedSession.GetToken: UTF8String;
begin
  Result := GetStringProp('Token');
end;

constructor TKSeFInitialisedSession.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
begin
  inherited;
  O := GetObjectProp('Context');
  if O <> nil then
    FContext := TKSeFSessionContext.Create(O);
end;

destructor TKSeFInitialisedSession.Destroy;
begin
  if FContext <> nil then
  begin
    FContext.Free;
    SetObjectProp('Context', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsRoleResponseBaseArray }

function TKSeFCredentialsRoleResponseBaseArray.GetItem(AIndex: Integer
  ): TKSeFCredentialsRoleResponseBase;
begin
  Result := TKSeFCredentialsRoleResponseBase(inherited GetItem(AIndex));
end;

{class function TKSeFCredentialsRoleResponseBaseArray.GetItemClass(
  AObject: LGP_OBJECT): TKSeFObjectClass;
var
  S: UTF8String;
begin
  S := UpperCase(lgoClassName(AObject));
  if S = 'TKSEFCREDENTIALSROLERESPONSEGRANTEDFORINSTITUTION' then
    Result := TKSeFCredentialsRoleResponseGrantedForInstitution
  else if S = 'TKSEFCREDENTIALSROLERESPONSESTANDARDDETAILS' then
    Result := TKSeFCredentialsRoleResponseStandardDetails
  else if S = 'TKSEFCREDENTIALSROLERESPONSESTANDARDPLAIN' then
    Result := TKSeFCredentialsRoleResponseStandardPlain
  else if S = 'TKSEFCREDENTIALSROLERESPONSETOKEN' then
    Result := TKSeFCredentialsRoleResponseToken;
end;}

{ TKSeFSessionContext }

constructor TKSeFSessionContext.Create(AObject: LGP_OBJECT);
var
  O: LGP_OBJECT;
  S: UTF8String;
begin
  inherited;
  O := GetObjectProp('ContextIdentifier');
  S := UpperCase(lgoClassName(O));
  if O <> nil then
    FContextIdentifier := TKSeFSubjectIdentifierBy.CreateFromObject(O);
  {begin
    if S = 'TKSEFSUBJECTIDENTIFIERBYCOMPANY' then
      FContextIdentifier := TKSeFSubjectIdentifierByCompany.Create(O)
    else if S = 'TKSEFSUBJECTIDENTIFIERINTERNAL' then
      FContextIdentifier := TKSeFSubjectIdentifierInternal.Create(O);
  end;}
  O := GetObjectProp('ContextName');
  if O <>  nil then
    FContextName := TKSeFSubjectCompleteName.Create(O);
  O := GetObjectProp('CredentialsRoleList');
  if O <> nil then
    FCredentialsRoleList := TKSeFCredentialsRoleResponseBaseArray.Create(O);
end;

destructor TKSeFSessionContext.Destroy;
begin
  if FContextIdentifier <> nil then
  begin
    FContextIdentifier.Free;
    SetObjectProp('ContextIdentifier', nil);
  end;
  if FContextName <> nil then
  begin
    FContextName.Free;
    SetObjectProp('ContextName', nil);
  end;
  if FCredentialsRoleList <> nil then
  begin
    FCredentialsRoleList.Free;
    SetObjectProp('CredentialsRoleList', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsRoleResponseStandardDetails }

function TKSeFCredentialsRoleResponseStandardDetails.GetCredentialsAssignmentType: UTF8String;
begin
  Result := GetStringProp('CredentialsAssignmentType');
end;

constructor TKSeFCredentialsRoleResponseStandardDetails.Create(
  AObject: LGP_OBJECT);
var
  Role: LGP_OBJECT;
begin
  inherited;
  Role := GetObjectProp('RoleAssigningAuthorIdentifier');
  if Role <> nil then
    FRoleAssigningAuthorIdentifier := TKSeFCredentialsIdentifierResponse.Create(Role);
end;

destructor TKSeFCredentialsRoleResponseStandardDetails.Destroy;
begin
  if FRoleAssigningAuthorIdentifier <> nil then
  begin
    FRoleAssigningAuthorIdentifier.Free;
    SetObjectProp('RoleAssigningAuthorIdentifier', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsRoleResponseStandardContextDetails }

function TKSeFCredentialsRoleResponseStandardContextDetails.GetCredentialsAssignmentType: UTF8String;
begin
  Result := GetStringProp('CredentialsAssignmentType');
end;

constructor TKSeFCredentialsRoleResponseStandardContextDetails.Create(
  AObject: LGP_OBJECT);
var
  Obj: LGP_OBJECT;
begin
  inherited Create(AObject);
  Obj := GetObjectProp('ContextIdentifier');
  if Obj <> nil then
    FContextIdentifier := TKSeFCredentialsIdentifierResponse.Create(Obj);
  Obj := GetObjectProp('SourceIdentifier');
  if Obj <> nil then
    FSourceIdentifier := TKSeFCredentialsIdentifierResponse.Create(Obj);
  Obj := GetObjectProp('TargetIdentifier');
  if Obj <> nil then
    FTargetIdentifier := TKSeFCredentialsIdentifierResponse.Create(Obj);
end;

destructor TKSeFCredentialsRoleResponseStandardContextDetails.Destroy;
begin
  if Assigned(FContextIdentifier) then
  begin
    FContextIdentifier.Free;
    SetObjectProp('ContextIdentifier', nil);
  end;
  if Assigned(FSourceIdentifier) then
  begin
    FSourceIdentifier.Free;
    SetObjectProp('SourceIdentifier', nil);
  end;
  if Assigned(FTargetIdentifier) then
  begin
    FTargetIdentifier.Free;
    SetObjectProp('TargetIdentifier', nil);
  end;
  inherited Destroy;
end;

{ TKSeFCredentialsRoleResponseBase }

function TKSeFCredentialsRoleResponseBase.GetRoleDescription: UTF8String;
begin
  Result := GetStringProp('RoleDescription');
end;

function TKSeFCredentialsRoleResponseBase.GetRoleType: TKSeFRoleType;
begin
  Result := TKSeFRoleType(GetIntegerProp('RoleType'));
end;

function TKSeFCredentialsRoleResponseBase.GetRoleTypeRaw: UTF8String;
begin
  Result := GetStringProp('RoleTypeRaw');
end;

function TKSeFCredentialsRoleResponseBase.GetStartTimestamp: TDateTime;
begin
  Result := GetDoubleProp('StartTimestamp');
end;

function TKSeFCredentialsRoleResponseBase.GetStartTimestampRaw: UTF8String;
begin
  Result := GetStringProp('StartTimestampRaw');
end;

function TKSeFCredentialsRoleResponseBase.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

{ TKSeFCredentialsIdentifierResponse }

function TKSeFCredentialsIdentifierResponse.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

function TKSeFCredentialsIdentifierResponse.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

{ TKSeFSubjectPersonName }

function TKSeFSubjectPersonName.GetFirstName: UTF8String;
begin
  Result := GetStringProp('FirstName');
end;

function TKSeFSubjectPersonName.GetSurname: UTF8String;
begin
  Result := GetStringProp('Surname');
end;

procedure TKSeFSubjectPersonName.SetFirstName(AValue: UTF8String);
begin
  SetStringProp('FirstName', AValue);
end;

procedure TKSeFSubjectPersonName.SetSurname(AValue: UTF8String);
begin
  SetStringProp('Surname', AValue);
end;

{ TKSeFSubjectFullName }

function TKSeFSubjectFullName.GetFullName: UTF8String;
begin
  Result := GetStringProp('FullName');
end;

procedure TKSeFSubjectFullName.SetFullName(AValue: UTF8String);
begin
  SetStringProp('FullName', AValue);
end;

{ TKSeFSubjectName }

function TKSeFSubjectName.GetTradeName: UTF8String;
begin
  Result := GetStringProp('TradeName');
end;

function TKSeFSubjectName.GetType: UTF8String;
begin
  Result := GetStringProp('Type');
end;

procedure TKSeFSubjectName.SetTradeName(AValue: UTF8String);
begin
  SetStringProp('TradeName', AValue);
end;

class function TKSeFSubjectName.CreateFromObject(O: LGP_OBJECT
  ): TKSeFSubjectName;
var
  C: TKSeFObjectClass;
begin
  C := TKSeFObjectClass(lgoFindClass(lgoClassName(O)));
  if C <> nil then
    Result := TKSeFSubjectName(C.Create(O))
  else
    Result := nil;
end;

{ TKSeFSubjectIdentifierInternal }

function TKSeFSubjectIdentifierInternal.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

procedure TKSeFSubjectIdentifierInternal.SetIdentifier(AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

{ TKSeFSubjectCompleteName }

function TKSeFSubjectCompleteName.GetFullName: String;
begin
  Result := GetStringProp('FullName');
end;

{ TKSeFSubjectIdentifierByCompany }

function TKSeFSubjectIdentifierByCompany.GetIdentifier: UTF8String;
begin
  Result := GetStringProp('Identifier');
end;

procedure TKSeFSubjectIdentifierByCompany.SetIdentifier(AValue: UTF8String);
begin
  SetStringProp('Identifier', AValue);
end;

{ TKSeFArray }

function TKSeFArray.GetOwnObjects: Boolean;
var
  I: LGP_INT32;
begin
  lgoCheckResult(lgpListObject_GetOwnsObjects(ExtObject, I));
  Result := I <> 0;
end;

procedure TKSeFArray.SetOwnObjects(AValue: Boolean);
begin
  lgoCheckResult(lgpListObject_SetOwnsObjects(ExtObject, Integer(AValue)));
end;

function TKSeFArray.GetItem(AIndex: Integer): TKSeFObject;
var
  O: LGP_OBJECT;
begin
  if ((AIndex < FList.Count) and (FList[AIndex] = nil)) or (FList.Count <= AIndex) then
  begin
    lgoCheckResult(lgpListObject_GetItem(ExtObject, AIndex, O));
    if O <> nil then
    begin
      Result := GetItemClass(O).Create(O);
      if FList.Count <= AIndex then
        FList.Count := AIndex + 1;
      FList[AIndex] := Result;
    end
    else
      Result := nil;
  end
  else
    Result := TKSeFObject(FList[AIndex]);
end;

class function TKSeFArray.GetItemClass(AObject: LGP_OBJECT): TKSeFObjectClass;
begin
  Result := TKSeFObjectClass(lgoFindClass(lgoClassName(AObject)));
end;

constructor TKSeFArray.Create(AClassName: UTF8String);
begin
  inherited;
  FList := TList.Create;
end;

constructor TKSeFArray.Create(AObject: LGP_OBJECT);
begin
  inherited;
  FList := TList.Create;
end;

destructor TKSeFArray.Destroy;
var
  I: Integer;
  O: LGP_OBJECT;
begin
  OwnObjects := False;
  for I := 0 to Count - 1 do
    if (I < FList.Count) and (FList[I] <> nil) then
      TKSeFObject(FList[I]).Free
    else
    begin
      lgoCheckResult(lgpListObject_GetItem(ExtObject, I, O));
      if O <> nil then
        lgoCheckResult(lgpObject_Free(O));
    end;
  FList.Free;
  inherited Destroy;
end;

function TKSeFArray.Count: Integer;
begin
  lgoCheckResult(lgpListObject_GetCount(ExtObject, Result));
end;

procedure TKSeFArray.Delete(AIndex: Integer);
begin
  lgoCheckResult(lgpListObject_Delete(ExtObject, AIndex));
end;

{ TKSeFResponse }

function TKSeFResponse.GetRawResponse: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpObject_GetStringProp(ExtObject, 'RawResponse', S));
  Result := lgoGetString(S);
end;

initialization
  lgoRegister;

end.

