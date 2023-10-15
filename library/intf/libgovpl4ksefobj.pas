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

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Obj;

type
  EKSeFException = class(ElgoException);

  TKSeFExceptionDetail = record
    ExceptionCode: Integer;
    ExceptionDescription: UTF8String;
  end;

  TKSeFExceptionDetailList = array of TKSeFExceptionDetail;

  { EKSeFExceptionResponse }

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

  EKSeFNotFoundException = class(EKSeFException);

  { TKSeFObject }

  TKSeFObject = class(TlgoCreatableObject)
  protected
    procedure CreateExtObject(AClassName: UTF8String);
  public
    constructor Create;  overload; virtual;
    constructor Create(AClassName: UTF8String); overload; override;
  end;

  TKSeFObjectClass = class of TKSeFObject;

  { TKSeFArray }

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

  TKSeFRequest = class(TKSeFObject)
  private
    function GetAsJSONString: UTF8String;
  published
    property AsJSONString: UTF8String read GetAsJSONString;
  end;

  { TKSeFResponse }

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
  published
    property &Type: UTF8String read GetType;
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

  { TKSeFSubjectName }

  TKSeFSubjectName = class(TKSeFObject)
  private
    function GetTradeName: UTF8String;
    function GetType: UTF8String;
    procedure SetTradeName(AValue: UTF8String);
  public
    class function CreateFromObject(O: LGP_OBJECT): TKSeFSubjectName;
  published
    property &Type: UTF8String read GetType;
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
    property &Type: UTF8String read GetType;
  end;

  { TKSeFCredentialsRoleResponseBase }

  TKSeFCredentialsRoleResponseBase = class(TKSeFObject)
  private
    function GetRoleDescription: UTF8String;
    function GetRoleType: UTF8String;
    function GetStartTimestamp: TDateTime;
    function GetStartTimestampRaw: UTF8String;
    function GetType: UTF8String;
  published
    property RoleDescription: UTF8String read GetRoleDescription;
    property StartTimestamp: TDateTime read GetStartTimestamp;
    property StartTimestampRaw: UTF8String read GetStartTimestampRaw;
    property &Type: UTF8String read GetType;
    property RoleType: UTF8String read GetRoleType;
  end;

  { TKSeFCredentialsRoleResponseGrantedForInstitution }

  TKSeFCredentialsRoleResponseGrantedForInstitution = class(TKSeFCredentialsRoleResponseBase)
  end;

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
    FContextName: TKSeFSubjectName;
    FCredentialsRoleList: TKSeFCredentialsRoleResponseBaseArray;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
  published
    property ContextIdentifier: TKSeFSubjectIdentifierBy read FContextIdentifier;
    property ContextName: TKSeFSubjectName read FContextName;
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
    property InvoiceStatusList: TKSeFSessionInvoiceStatusArray read FInvoiceStatusList write FInvoiceStatusList;
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
    property &Type: UTF8String read GetType write SetType;
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
    destructor Destroy; override;
  published
    property IssuedToIdentifier: TKSeFSubjectIdentifierTo read GetIssuedToIdentifier write SetIssuedToIdentifier;
    property IssuedToName: TKSeFSubjectName read GetIssuedToName write SetIssuedToName;
  end;

  { TKSeFQueryCriteriaInvoice }

  TKSeFQueryCriteriaInvoice = class(TKSeFRequest)
  private
    function GetSubjectType: TKSeFSubjectType;
    procedure SetSubjectType(AValue: TKSeFSubjectType);
  published
    property SubjectType: TKSeFSubjectType read GetSubjectType write SetSubjectType;
  end;

  { TKSeFQueryCriteriaInvoiceDetail }

  TKSeFQueryCriteriaInvoiceDetail = class(TKSeFQueryCriteriaInvoice)
  private
    FSubjectBy: TKSeFSubjectBy;
    FSubjectTo: TKSeFSubjectTo;
    function GetAmountFrom: Currency;
    function GetAmountTo: Currency;
    function GetAmountType: Double;
    function GetCurrencyCodes: TStringArray;
    function GetFaP17Annotation: Boolean;
    function GetInvoiceNumber: UTF8String;
    function GetInvoiceTypes: TKSeFInvoiceTypes;
    function GetInvoicingDateFrom: TDateTime;
    function GetInvoicingDateTo: TDateTime;
    function GetKsefReferenceNumber: UTF8String;
    procedure SetAmountFrom(AValue: Currency);
    procedure SetAmountTo(AValue: Currency);
    procedure SetAmountType(AValue: Double);
    procedure SetCurrencyCodes(AValue: TStringArray);
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
    property AmountType: Double read GetAmountType write SetAmountType;
    property CurrencyCodes: TStringArray read GetCurrencyCodes write SetCurrencyCodes;
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
    property &Type: UTF8String read GetType;
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
  published
    property Algorithm: UTF8String read GetAlgorithm;
    property Encoding: UTF8String read GetEncoding;
    property Value: UTF8String read GetValue;
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
    GeyPartExpirationRaw: UTF8String;
    function GetPartExpiration: TDateTime;
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
    property PartExpirationRaw: UTF8String read GeyPartExpirationRaw;
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
    function GetReferenceNumber: UTF8String;
    function GetTimestamp: TDateTime;
    function GetTimestampRaw: UTF8String;
  published
    property KsefReferenceNumberList: TStringArray read GetKsefReferenceNumberList;
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

procedure lgoRegister;

implementation

procedure lgoRegister;
begin
  lgoRegisterClasses([
    TKSeFSubjectIdentifierBy,
    TKSeFSubjectIdentifierByCompany,
    TKSeFSubjectIdentifierInternal,
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
    TKSeFStatusInvoiceResponse,
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
    //TKSeFCredentialsIdentifierRequest,
    //TKSeFQueryCriteriaCredentials,
    //TKSeFQueryCriteriaCredentialsAll,
    //TKSeFQueryCriteriaCredentialsId,
    //TKSeFQuerySyncCredentialsRequest,
    //TKSeFCredentialsBaseTypeObject,
    //TKSeFQuerySyncCredentialsResponse,
    TKSeFGetPaymentIdentifierReferenceNumbersResponse,
    TKSeFRequestPaymentIdentifierResponse,
    TKSeFInvoiceQueryDetails,
    TKSeFInvoiceRequestKSeF,
    TKSeFStatusResponse
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
    Result := TKSeFSubjectIdentifierOtherTo(C.Create(O));
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

function TKSeFQueryCriteriaInvoiceDetail.GetAmountType: Double;
begin
  Result := GetDoubleProp('AmountType');
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

procedure TKSeFQueryCriteriaInvoiceDetail.SetAmountType(AValue: Double);
begin
  SetDoubleProp('AmountType', AValue);
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
    S := AValue[I];
  end;
  SetStringProp('CurrencyCodesStr', S);
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

function TKSeFQueryCriteriaInvoice.GetSubjectType: TKSeFSubjectType;
begin
  Result := TKSeFSubjectType(GetIntegerProp('SubjectType'));
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
  begin
    if S = 'TKSEFSUBJECTIDENTIFIERBYCOMPANY' then
      FContextIdentifier := TKSeFSubjectIdentifierByCompany.Create(O)
    else if S = 'TKSEFSUBJECTIDENTIFIERINTERNAL' then
      FContextIdentifier := TKSeFSubjectIdentifierInternal.Create(O);
  end;
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
    FCredentialsRoleList.Free;
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

{ TKSeFCredentialsRoleResponseBase }

function TKSeFCredentialsRoleResponseBase.GetRoleDescription: UTF8String;
begin
  Result := GetStringProp('RoleDescription');
end;

function TKSeFCredentialsRoleResponseBase.GetRoleType: UTF8String;
begin
  Result := GetStringProp('RoleType');
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
    Result := TKSeFSubjectName(C.Create(O));
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

