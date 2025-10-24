{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4Backend;

{$ifdef fpc}
{$mode Delphi}
{$endif}

{$IFNDEF FPC}
  {$IF CompilerVersion >= 18.0}
    {$DEFINE LGP_HAVE_EXTRECORDS}
  {$IFEND}
{$ELSE}
  {$DEFINE LGP_HAVE_EXTRECORDS}
{$ENDIF}

interface

uses
  Classes, SysUtils, LibGovPl4Intf, LibGovPl4Obj;

type
  ElgBackendError = class(ElgoException);

  TlgoUTF8StringArray = array of UTF8String;

  { TlgoBackend }

  TlgoBackend = class
  public
    class function ListDrivers(AClassType: Integer): TlgoUTF8StringArray;
    class function HTTPClientClasses: TlgoUTF8StringArray;
    class function RandomGeneratorClasses: TlgoUTF8StringArray;
    class function Base64EncoderClasses: TlgoUTF8StringArray;
    class function MD5HashClasses: TlgoUTF8StringArray;
    class function SHA1HashClasses: TlgoUTF8StringArray;
    class function SHA256HashClasses: TlgoUTF8StringArray;
    class function AES256EncryptClasses: TlgoUTF8StringArray;
    class function CertSignerClasses: TlgoUTF8StringArray;
    class function EDekGateClasses: TlgoUTF8StringArray;
    class function XMLCanonizatorClasses: TlgoUTF8StringArray;
    class function XMLReaderClasses: TlgoUTF8StringArray;
    class function ZipperClasses: TlgoUTF8StringArray;
    class function RSAEncryptClasses: TlgoUTF8StringArray;
    class function XMLValidatorClasses: TlgoUTF8StringArray;
    class function XMLXSLTClasses: TlgoUTF8StringArray;
  end;

  TlgoEDekGateType = (egtProduction, egtTest);
  TlgoEDekSignType = (estCertificate, estAuthData);

  { TlgoHTTPClient }

  TlgoHTTPClient = class(TlgoCreatableObject)
  private
    function GetIgnoreSSLErrors: Boolean;
    procedure SetIgnoreSSLErrors(AValue: Boolean);
  public
    constructor Create(AClassName: UTF8String); override;
  published
    property IgnoreSSLErrors: Boolean read GetIgnoreSSLErrors write SetIgnoreSSLErrors;
  end;

  { Kodowanie kluczy i certyfikatow }
  TlgoEncodingType = (letPEM, letDER, letPFX);

  { TlgoRSAPublicKey }

  TlgoRSAPublicKey = class(TlgoObject)
  public
    class function CreateKey(AClassName: UTF8String; AStream: TStream; AFormat: TlgoEncodingType = letPEM): TlgoRSAPublicKey;
  end;

  { Wersja certyfikatu X509 }
  TlgoCertificateVersion = (cvUnknown, cvV1, cvV2, cvV3);

  TlgoCertificateKeyUsageType = (ckuDigitalSignature, ckuNonRepudiation,
    ckuKeyEncipherment, ckuDataEncipherment, ckuKeyAgreement, ckuKeyCertSign,
    ckuCRLSign, ckuEncipherOnly, ckuDecipherOnly);
  TlgoCertificateKeyUsage = set of TlgoCertificateKeyUsageType;

  TlgoCertificates = class;

  { TlgoCertificate }

  TlgoCertificate = class
  private
    FItem: LGP_OBJECT;
    FList: TlgoCertificates;
    FIndex: Integer;
    function GetDisplayName: UTF8String;
    function GetIssuer: UTF8String;
    function GetIssuerField(AIndex: UTF8String): UTF8String;
    function GetIssuerFields: UTF8String;
    function GetIssuerUID: UTF8String;
    function GetKeyUsage: TlgoCertificateKeyUsage;
    function GetPublicKeyAlgorithm: UTF8String;
    function GetSerialNoDec: UTF8String;
    function GetSerialNoHex: UTF8String;
    function GetSignature: UTF8String;
    function GetSubject: UTF8String;
    function GetSubjectField(AIndex: UTF8String): UTF8String;
    function GetSubjectFields: UTF8String;
    function GetSubjectUID: UTF8String;
    function GetValidFrom: TDateTime;
    function GetValidTo: TDateTime;
    function GetVersion: TlgoCertificateVersion;
    procedure SetPIN(AValue: UTF8String);
  public
    destructor Destroy; override;
    function ObjClassName: UTF8String;
    property Item: LGP_OBJECT read FItem;
    property SubjectField[AIndex: UTF8String]: UTF8String read GetSubjectField;
    property IssuerField[AIndex: UTF8String]: UTF8String read GetIssuerField;
  published
    property Version: TlgoCertificateVersion read GetVersion;
    property DisplayName: UTF8String read GetDisplayName;
    property Subject: UTF8String read GetSubject;
    property SubjectFields: UTF8String read GetSubjectFields;
    property SubjectUID: UTF8String read GetSubjectUID;
    property Issuer: UTF8String read GetIssuer;
    property IssuerFields: UTF8String read GetIssuerFields;
    property IssuerUID: UTF8String read GetIssuerUID;
    property SerialNoDec: UTF8String read GetSerialNoDec;
    property SerialNoHex: UTF8String read GetSerialNoHex;
    property ValidFrom: TDateTime read GetValidFrom;
    property ValidTo: TDateTime read GetValidTo;
    property Signature: UTF8String read GetSignature;
    property KeyUsage: TlgoCertificateKeyUsage read GetKeyUsage;
    property PublicKeyAlgorithm: UTF8String read GetPublicKeyAlgorithm;
    property PIN: UTF8String write SetPIN;
  end;

  { TlgoCertificates }

  TlgoCertificates = class(TlgoObject)
  private
    FClassItems: TList;
    function GetOwnObjects: Boolean;
    procedure SetOwnObjects(AValue: Boolean);
  public
    constructor Create(AOwnsObjects: Boolean = True); overload;
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
    function Count: Integer;
    function Add(ACert: TlgoCertificate): Integer;
    procedure Delete(AIndex: Integer);
    function GetItem(AIndex: Integer): TlgoCertificate;
    property Items[AIndex: Integer]: TlgoCertificate read GetItem; default;
    property OwnObjects: Boolean read GetOwnObjects write SetOwnObjects;
  end;

  { TlgoCertificateSigner }

  TlgoCertificateSigner = class(TlgoCreatableObject)
  public
    constructor Create(AClassName: UTF8String); override;
    function List: TlgoCertificates;
    function UISelect: TlgoCertificate;
    function LoadFromStream(const ACertificateStream: TStream; const ACertificateFormat: TlgoEncodingType = letPEM;
      const APrivateKeyStream: TStream = nil; APrivateKeyFormat: TlgoEncodingType = letPEM;
      const APassword: UTF8String = ''): TlgoCertificate;
  end;

  ElgWSTError = class(ElgoException);

  { ElgWinHTTPException }

  ElgWinHTTPException = class(ElgoException)
  protected
    procedure LoadObject(AException: LGP_EXCEPTION); override;
  public
    ErrorCode: LongWord;
  end;

  {$IFDEF LGP_ENABLE_PKCS11}

  // PKCS#11

  { TlgoPKCS11Info }

  TlgoPKCS11Info = class(TlgoObject)
  private
    function GetCryptokitVersionMajor: Integer;
    function GetCryptokitVersionMinor: Integer;
    function GetCryptokitVersionStr: UTF8String;
    function GetLibraryDescription: UTF8String;
    function GetLibraryVersionMajor: Integer;
    function GetLibraryVersionMinor: Integer;
    function GetLibraryVersionStr: UTF8String;
    function GetManufacturerID: UTF8String;
  published
    property CryptokitVersionStr: UTF8String read GetCryptokitVersionStr;
    property CryptokitVersionMajor: Integer read GetCryptokitVersionMajor;
    property CryptokitVersionMinor: Integer read GetCryptokitVersionMinor;
    property ManufacturerID: UTF8String read GetManufacturerID;
    property LibraryDescription: UTF8String read GetLibraryDescription;
    property LibraryVersionStr: UTF8String read GetLibraryVersionStr;
    property LibraryVersionMajor: Integer read GetLibraryVersionMajor;
    property LibraryVersionMinor: Integer read GetLibraryVersionMinor;
  end;

  TlgPKCS11TokenFlag = (
    ptfRNG,                //< has random # generator
    ptfWriteProtected,     //< token is write-protected
    ptfLoginRequired,      //< user must login
    ptfUserPINInitialized, //< normal user's PIN is set

    { CKF_RESTORE_KEY_NOT_NEEDED.  If it is set,
      that means that *every* time the state of cryptographic
      operations of a session is successfully saved, all keys
      needed to continue those operations are stored in the state
     }
    ptfRestoreKeyNotNeeded,

    { CKF_CLOCK_ON_TOKEN.  If it is set, that means
      that the token has some sort of clock.  The time on that
      clock is returned in the token info structure
     }
    ptfClockOnToken,

    { CKF_PROTECTED_AUTHENTICATION_PATH.  If it is
      set, that means that there is some way for the user to login
      without sending a PIN through the Cryptoki library itself
     }
    ptfProtectedAuthenticationPath,

    { CKF_DUAL_CRYPTO_OPERATIONS.  If it is true,
      that means that a single session with the token can perform
      dual simultaneous cryptographic operations (digest and
      encrypt; decrypt and digest; sign and encrypt; and decrypt
      and sign)
     }
    ptfDualCryptoOperations,

    { CKF_TOKEN_INITIALIZED. If it is true, the
      token has been initialized using C_InitializeToken or an
      equivalent mechanism outside the scope of PKCS #11.
      Calling C_InitializeToken when this flag is set will cause
      the token to be reinitialized.
     }
    ptfTokenInitialized,

    { CKF_SECONDARY_AUTHENTICATION. If it is
      true, the token supports secondary authentication for
      private key objects.
     }
    ptfSecondaryAuthentication,

    { CKF_USER_PIN_COUNT_LOW. If it is true, an
      incorrect user login PIN has been entered at least once
      since the last successful authentication.
     }
    ptfUserPINCountLow,

    { CKF_USER_PIN_FINAL_TRY. If it is true,
      supplying an incorrect user PIN will it to become locked.
     }
    ptfUserPINFinalTry,

    { CKF_USER_PIN_LOCKED. If it is true, the
      user PIN has been locked. User login to the token is not
      possible.
     }
    ptfUserPINLocked,

    { CKF_USER_PIN_TO_BE_CHANGED. If it is true,
      the user PIN value is the default value set by token
      initialization or manufacturing, or the PIN has been
      expired by the card.
     }
    ptfUserPINToBeChanged,

    { CKF_SO_PIN_COUNT_LOW. If it is true, an
      incorrect SO login PIN has been entered at least once since
      the last successful authentication.
     }
    ptfSOPINCountLow,

    { CKF_SO_PIN_FINAL_TRY. If it is true,
      supplying an incorrect SO PIN will it to become locked.
     }
    ptfSOPINFinalTry,

    { CKF_SO_PIN_LOCKED. If it is true, the SO
      PIN has been locked. SO login to the token is not possible.
     }
    ptfSOPINLocked,

    { CKF_SO_PIN_TO_BE_CHANGED. If it is true,
      the SO PIN value is the default value set by token
      initialization or manufacturing, or the PIN has been
      expired by the card.
     }
    ptfSOPINToBeChanged,

    ptfErrorState);

  TlgPKCS11TokenFlags = set of TlgPKCS11TokenFlag;

  { TlgoPKCS11TokenInfo }

  TlgoPKCS11TokenInfo = class(TlgoObject)
  private
    function GetFirmwareVersionMajor: Integer;
    function GetFirmwareVersionMinor: Integer;
    function GetFirmwareVersionStr: UTF8String;
    function GetFlags: TlgPKCS11TokenFlags;
    function GetFlagsRaw: LGP_CK_ULONG;
    function GetFreePrivateMemory: LGP_CK_ULONG;
    function GetFreePublicMemory: LGP_CK_ULONG;
    function GetHardwareVersionMajor: Integer;
    function GetHardwareVersionMinor: Integer;
    function GetHardwareVersionStr: UTF8String;
    function GetManufacturerID: UTF8String;
    function GetMaxPinLen: LGP_CK_ULONG;
    function GetMaxRwSessionCount: LGP_CK_ULONG;
    function GetMaxSessionCount: LGP_CK_ULONG;
    function GetMinPinLen: LGP_CK_ULONG;
    function GetModel: UTF8String;
    function GetRwSessionCount: LGP_CK_ULONG;
    function GetSerialNumber: UTF8String;
    function GetSessionCount: LGP_CK_ULONG;
    function GetTokenLabel: UTF8String;
    function GetTotalPrivateMemory: LGP_CK_ULONG;
    function GetTotalPublicMemory: LGP_CK_ULONG;
    function GetUtcTime: UTF8String;
  public
    destructor Destroy; override;
  published
    property TokenLabel: UTF8String read GetTokenLabel;
    property ManufacturerID: UTF8String read GetManufacturerID;
    property Model: UTF8String read GetModel;
    property SerialNumber: UTF8String read GetSerialNumber;
    property Flags: TlgPKCS11TokenFlags read GetFlags;
    property FlagsRaw: LGP_CK_ULONG read GetFlagsRaw;
    property MaxSessionCount: LGP_CK_ULONG read GetMaxSessionCount;
    property SessionCount: LGP_CK_ULONG read GetSessionCount;
    property MaxRwSessionCount: LGP_CK_ULONG read GetMaxRwSessionCount;
    property RwSessionCount: LGP_CK_ULONG read GetRwSessionCount;
    property MaxPinLen: LGP_CK_ULONG read GetMaxPinLen;
    property MinPinLen: LGP_CK_ULONG read GetMinPinLen;
    property TotalPublicMemory: LGP_CK_ULONG read GetTotalPublicMemory;
    property FreePublicMemory: LGP_CK_ULONG read GetFreePublicMemory;
    property TotalPrivateMemory: LGP_CK_ULONG read GetTotalPrivateMemory;
    property FreePrivateMemory: LGP_CK_ULONG read GetFreePrivateMemory;
    property HardwareVersionStr: UTF8String read GetHardwareVersionStr;
    property HardwareVersionMajor: Integer read GetHardwareVersionMajor;
    property HardwareVersionMinor: Integer read GetHardwareVersionMinor;
    property FirmwareVersionStr: UTF8String read GetFirmwareVersionStr;
    property FirmwareVersionMajor: Integer read GetFirmwareVersionMajor;
    property FirmwareVersionMinor: Integer read GetFirmwareVersionMinor;
    property UtcTime: UTF8String read GetUtcTime;
  end;

  TlgPKCS11SlotFlag = (
    psfTokenPresent,     //< a token is there
    psfRemovableDevice,  //< removable devices
    psfHWSlot);          //< hardware slot

  TlgPKCS11SlotFlags = set of TlgPKCS11SlotFlag;

  { TlgoPKCS11SlotInfo }

  TlgoPKCS11SlotInfo = class(TlgoObject)
  private
    FTokenInfo: TlgoPKCS11TokenInfo;
    function GetFirmwareVersionMajor: Integer;
    function GetFirmwareVersionMinor: Integer;
    function GetFirmwareVersionStr: UTF8String;
    function GetFlags: TlgPKCS11SlotFlags;
    function GetFlagsRaw: LGP_CK_ULONG;
    function GetHardwareVersionMajor: Integer;
    function GetHardwareVersionMinor: Integer;
    function GetHardwareVersionStr: UTF8String;
    function GetManufacturerID: UTF8String;
    function GetSlotDescription: UTF8String;
    function GetSlotID: LGP_CK_ULONG;
    function GetTokenInfo: TlgoPKCS11TokenInfo;
    function GetTokenPresent: Boolean;
  public
    destructor Destroy; override;
  published
    property SlotID: LGP_CK_ULONG read GetSlotID;
    property SlotDescription: UTF8String read GetSlotDescription;
    property ManufacturerID: UTF8String read GetManufacturerID;
    property Flags: TlgPKCS11SlotFlags read GetFlags;
    property FlagsRaw: LGP_CK_ULONG read GetFlagsRaw;
    property HardwareVersionStr: UTF8String read GetHardwareVersionStr;
    property HardwareVersionMajor: Integer read GetHardwareVersionMajor;
    property HardwareVersionMinor: Integer read GetHardwareVersionMinor;
    property FirmwareVersionStr: UTF8String read GetFirmwareVersionStr;
    property FirmwareVersionMajor: Integer read GetFirmwareVersionMajor;
    property FirmwareVersionMinor: Integer read GetFirmwareVersionMinor;
    property TokenPresent: Boolean read GetTokenPresent;
    property TokenInfo: TlgoPKCS11TokenInfo read GetTokenInfo;
  end;

  { TlgoPKCS11SlotInfoList }

  TlgoPKCS11SlotInfoList = class(TlgoObject)
  private
    FList: TList;
  public
    constructor Create(AObject: LGP_OBJECT); overload; override;
    destructor Destroy; override;
    function Count: Integer;
    function GetItem(AIndex: Integer): TlgoPKCS11SlotInfo;
  //published
    property Items[AIndex: Integer]: TlgoPKCS11SlotInfo read GetItem; default;
  end;

  TlgPKCS11SessionState = (pssROPublicSession, pssROUserFunctions,
    pssRWPublicSession, pssRWUserFunctions, pssRWSOFunctions);

  TlgPKCS11SessionFlag = (psfRWSession, psfSerialSession);
  TlgPKCS11SessionFlags = set of TlgPKCS11SessionFlag;

  TlgPKCS11UserType = (putSO, putUser, putContextSpecific);

  { TlgoPKCS11Session }

  {$IFDEF LGP_HAVE_EXTRECORDS}

  TlgoPKCS11Session = record
  private
    function GetFlags: TlgPKCS11SessionFlags;
    function GetFlagsRaw: LGP_CK_ULONG;
    function GetHandle: LGP_CK_ULONG;
    function GetSlotID: LGP_CK_ULONG;
    function GetState: TlgPKCS11SessionState;
  public
    ExtObject: LGP_OBJECT;
    function CheckActive: Boolean;
    procedure Login(APIN: UTF8String; AUserType: TlgPKCS11UserType = putUser);
    procedure Logout;
    property Handle: LGP_CK_ULONG read GetHandle;
    property SlotID: LGP_CK_ULONG read GetSlotID;
    property State: TlgPKCS11SessionState read GetState;
    property FlagsRaw: LGP_CK_ULONG read GetFlagsRaw;
    property Flags: TlgPKCS11SessionFlags read GetFlags;
  end;

  {$ELSE}

  TlgoPKCS11Session = class
  public
    class function CheckActive(ASession: LGP_OBJECT): Boolean;
    class procedure Login(ASession: LGP_OBJECT; APIN: String; AUserType: TlgPKCS11UserType = putUser);
    class procedure Logout(ASession: LGP_OBJECT);
    class function GetHandle(ASession: LGP_OBJECT): LGP_CK_ULONG;
    class function GetSlotID(ASession: LGP_OBJECT): LGP_CK_ULONG;
    class function GetState(ASession: LGP_OBJECT): TlgPKCS11SessionState;
    class function FlagsRaw(ASession: LGP_OBJECT): LGP_CK_ULONG;
    class function Flags(ASession: LGP_OBJECT): TlgPKCS11SessionFlags;
  end;

  {$ENDIF}

  { TlgoPKCS11Sessions }

  TlgoPKCS11Sessions = class(TlgoObject)
  private
    function GetItem(AIndex: Integer): {$IFDEF LGP_HAVE_EXTRECORDS}TlgoPKCS11Session{$ELSE}LGP_OBJECT{$ENDIF};
  public
    destructor Destroy; override;
    function Count: Integer;
    property Items[AIndex: Integer]: {$IFDEF LGP_HAVE_EXTRECORDS}TlgoPKCS11Session{$ELSE}LGP_OBJECT{$ENDIF} read GetItem;
  end;

  { TlgoPKCS11Certificate }

  TlgoPKCS11Certificate = class(TlgoCertificate)
  private
    function GetSession: {$IFDEF LGP_HAVE_EXTRECORDS}TlgoPKCS11Session{$ELSE}LGP_OBJECT{$ENDIF};
  public
    property Session: {$IFDEF LGP_HAVE_EXTRECORDS}TlgoPKCS11Session{$ELSE}LGP_OBJECT{$ENDIF} read GetSession;
  end;

  { TlgoPKCS11CertificateSigner }

  TlgoPKCS11CertificateSigner = class(TlgoCertificateSigner)
  private
    FSessions: TlgoPKCS11Sessions;
    function GetFunctionList: Pointer;
    function GetLibFileName: UTF8String;
    function GetLibLoaded: Boolean;
  public
    constructor Create(AClassName: UTF8String); override;
    destructor Destroy; override;

    procedure LoadLibrary(ALibFileName: UTF8String);
    procedure FreeLibrary;

    function GetInfo: TlgoPKCS11Info;
    function GetSlots(AWithToken: Boolean = True): TlgoPKCS11SlotInfoList;

    function SessionStart(ACert: TlgoCertificate): LGP_OBJECT; overload;
    //function SessionStart(ASlotID: CK_SLOT_ID): LGP_OBJECT; overload;
    procedure SessionClose(ASession: LGP_OBJECT); overload;
    procedure SessionClose(ASessionIndex: Integer); overload;

    procedure SessionCloseAll;

    property FunctionList: Pointer read GetFunctionList;

    class function CheckLibrary(const ALibFile: UTF8String; out AKomunikat: UTF8String): Boolean;
    class function GetLibraryInfo(const ALibFile: UTF8String; out ALibInfo: TlgoPKCS11Info; out AKomunikat: UTF8String): Boolean;
  published
    property LibLoaded: Boolean read GetLibLoaded;
    property LibFileName: UTF8String read GetLibFileName;
    property Sessions: TlgoPKCS11Sessions read FSessions;
  end;

  {$ENDIF}

function lgoCreateSigner(AClassName: String): TlgoCertificateSigner;
function lgoCreateCertificate(AClassObject: LGP_OBJECT): TlgoCertificate;

const
  AES256_BLOCK_SIZE = 16;
  AES256_KEY_SIZE = 32;
  AES256_IV_SIZE = 16;

function SetToInt32(ASet: Pointer; AMaxElem, ASetTypeSize: Integer): Integer;
procedure Int32ToSet(AValue: Integer; AMaxElem, ASetTypeSize: Integer; ASet: Pointer);

implementation

{$IFDEF LGP_ENABLE_PKCS11}

function CKTokenFlagsToSet(AFlags: LGP_CK_ULONG): TlgPKCS11TokenFlags;
const
  CKF_RNG                    = LGP_CK_ULONG($00000001);
  CKF_WRITE_PROTECTED        = LGP_CK_ULONG($00000002);
  CKF_LOGIN_REQUIRED         = LGP_CK_ULONG($00000004);
  CKF_USER_PIN_INITIALIZED   = LGP_CK_ULONG($00000008);
  CKF_RESTORE_KEY_NOT_NEEDED = LGP_CK_ULONG($00000020);
  CKF_CLOCK_ON_TOKEN         = LGP_CK_ULONG($00000040);
  CKF_PROTECTED_AUTHENTICATION_PATH = LGP_CK_ULONG($00000100);
  CKF_DUAL_CRYPTO_OPERATIONS  = LGP_CK_ULONG($00000200);
  CKF_TOKEN_INITIALIZED       = LGP_CK_ULONG($00000400);
  CKF_SECONDARY_AUTHENTICATION = LGP_CK_ULONG($00000800);
  CKF_USER_PIN_COUNT_LOW       = LGP_CK_ULONG($00010000);
  CKF_USER_PIN_FINAL_TRY       = LGP_CK_ULONG($00020000);
  CKF_USER_PIN_LOCKED          = LGP_CK_ULONG($00040000);
  CKF_USER_PIN_TO_BE_CHANGED   = LGP_CK_ULONG($00080000);
  CKF_SO_PIN_COUNT_LOW         = LGP_CK_ULONG($00100000);
  CKF_SO_PIN_FINAL_TRY         = LGP_CK_ULONG($00200000);
  CKF_SO_PIN_LOCKED            = LGP_CK_ULONG($00400000);
  CKF_SO_PIN_TO_BE_CHANGED     = LGP_CK_ULONG($00800000);
  CKF_ERROR_STATE              = LGP_CK_ULONG($01000000);
begin
  Result := [];
  if AFlags and CKF_RNG <> 0 then
    Include(Result, ptfRNG);
  if AFlags and CKF_WRITE_PROTECTED <> 0 then
    Include(Result, ptfWriteProtected);
  if AFlags and CKF_LOGIN_REQUIRED <> 0 then
    Include(Result, ptfLoginRequired);
  if AFlags and CKF_USER_PIN_INITIALIZED <> 0 then
    Include(Result, ptfUserPINInitialized);
  if AFlags and CKF_RESTORE_KEY_NOT_NEEDED <> 0 then
    Include(Result, ptfRestoreKeyNotNeeded);
  if AFlags and CKF_CLOCK_ON_TOKEN <> 0 then
    Include(Result, ptfClockOnToken);
  if AFlags and CKF_PROTECTED_AUTHENTICATION_PATH <> 0 then
    Include(Result, ptfProtectedAuthenticationPath);
  if AFlags and CKF_DUAL_CRYPTO_OPERATIONS <> 0 then
    Include(Result, ptfDualCryptoOperations);
  if AFlags and CKF_TOKEN_INITIALIZED <> 0 then
    Include(Result, ptfTokenInitialized);
  if AFlags and CKF_SECONDARY_AUTHENTICATION <> 0 then
    Include(Result, ptfSecondaryAuthentication);
  if AFlags and CKF_USER_PIN_COUNT_LOW <> 0 then
    Include(Result, ptfUserPINCountLow);
  if AFlags and CKF_USER_PIN_FINAL_TRY <> 0 then
    Include(Result, ptfUserPINFinalTry);
  if AFlags and CKF_USER_PIN_LOCKED <> 0 then
    Include(Result, ptfUserPINLocked);
  if AFlags and CKF_USER_PIN_TO_BE_CHANGED <> 0 then
    Include(Result, ptfUserPINToBeChanged);
  if AFlags and CKF_SO_PIN_COUNT_LOW <> 0 then
    Include(Result, ptfSOPINCountLow);
  if AFlags and CKF_SO_PIN_FINAL_TRY <> 0 then
    Include(Result, ptfSOPINFinalTry);
  if AFlags and CKF_SO_PIN_LOCKED <> 0 then
    Include(Result, ptfSOPINLocked);
  if AFlags and CKF_SO_PIN_TO_BE_CHANGED <> 0 then
    Include(Result, ptfSOPINToBeChanged);
  if AFlags and CKF_ERROR_STATE <> 0 then
    Include(Result, ptfErrorState);
end;

function CKSlotFlagsToSet(AFlags: LGP_CK_ULONG): TlgPKCS11SlotFlags;
const
  CKF_TOKEN_PRESENT     = LGP_CK_ULONG($00000001);
  CKF_REMOVABLE_DEVICE  = LGP_CK_ULONG($00000002);
  CKF_HW_SLOT           = LGP_CK_ULONG($00000004);
begin
  Result := [];
  if AFlags and CKF_TOKEN_PRESENT <> 0 then
    Include(Result, psfTokenPresent);
  if AFlags and CKF_REMOVABLE_DEVICE <> 0 then
    Include(Result, psfRemovableDevice);
  if AFlags and CKF_HW_SLOT <> 0 then
    Include(Result, psfHWSlot);
end;

function CKSessionFlagsToSet(AFlags: LGP_CK_ULONG): TlgPKCS11SessionFlags;
const
  CKF_RW_SESSION          = LGP_CK_ULONG($00000002);
  CKF_SERIAL_SESSION      = LGP_CK_ULONG($00000004);
begin
  Result := [];
  if AFlags and CKF_RW_SESSION <> 0 then
    Include(Result, psfRWSession);
  if AFlags and CKF_SERIAL_SESSION <> 0 then
    Include(Result, psfSerialSession);
end;

{$ENDIF}

function lgoCreateSigner(AClassName: String): TlgoCertificateSigner;
begin
  {$IFDEF LGP_ENABLE_PKCS11}
  if SameText(AClassName, 'TlgPKCS11CertificateSigner') then
    Result := TlgoPKCS11CertificateSigner.Create(AClassName)
  else
  {$ENDIF}
    Result := TlgoCertificateSigner.Create(AClassName);
end;

function lgoCreateCertificate(AClassObject: LGP_OBJECT): TlgoCertificate;
{$IFDEF LGP_ENABLE_PKCS11}
var
  CName: LGP_PSSTRING;
{$ENDIF}
begin
  {$IFDEF LGP_ENABLE_PKCS11}
  lgoCheckResult(lgpObject_ClassName(AClassObject, CName));
  if SameText(CName^, 'TlgPKCS11Certificate') then
    Result := TlgoPKCS11Certificate.Create
  else
  {$ENDIF}
    Result := TlgoCertificate.Create;
end;

function SetToInt32(ASet: Pointer; AMaxElem, ASetTypeSize: Integer): Integer;
begin
  case ASetTypeSize of
    1: Result := PByte(ASet)^;
    2: Result := PWord(ASet)^;
    4: Result := PInteger(ASet)^;
    else raise EConvertError.Create('Nie można skonwertować zbioru');
  end;
end;

procedure Int32ToSet(AValue: Integer; AMaxElem, ASetTypeSize: Integer;
  ASet: Pointer);
begin
  case ASetTypeSize of
    1: PByte(ASet)^ := AValue;
    2: PWord(ASet)^ := AValue;
    4: PInteger(ASet)^ := AValue;
    else raise EConvertError.Create('Nie można skonwertować zbioru');
  end;
end;

{$IFDEF LGP_ENABLE_PKCS11}

{ TlgoPKCS11Certificate }

function TlgoPKCS11Certificate.GetSession: {$IFDEF LGP_HAVE_EXTRECORDS}TlgoPKCS11Session{$ELSE}LGP_OBJECT{$ENDIF};
begin
  lgoCheckResult(lgpPKCS11Certificate_GetSession(FItem, Result{$IFDEF LGP_HAVE_EXTRECORDS}.ExtObject{$ENDIF}));
end;

{ TlgoPKCS11Session }

{$IFDEF LGP_HAVE_EXTRECORDS}

function TlgoPKCS11Session.GetFlags: TlgPKCS11SessionFlags;
begin
  Result := CKSessionFlagsToSet(FlagsRaw);
end;

function TlgoPKCS11Session.GetFlagsRaw: LGP_CK_ULONG;
begin
  lgoCheckResult(lgpPKCS11Session_GetFlags(ExtObject, Result));
end;

function TlgoPKCS11Session.GetHandle: LGP_CK_ULONG;
begin
  lgoCheckResult(lgpPKCS11Session_GetHandle(ExtObject, Result));
end;

function TlgoPKCS11Session.GetSlotID: LGP_CK_ULONG;
begin
  lgoCheckResult(lgpPKCS11Session_GetSlotID(ExtObject, Result));
end;

function TlgoPKCS11Session.GetState: TlgPKCS11SessionState;
var
  Res: LGP_UINT32;
begin
  lgoCheckResult(lgpPKCS11Session_GetState(ExtObject, Res));
  Result := TlgPKCS11SessionState(Res);
end;

function TlgoPKCS11Session.CheckActive: Boolean;
var
  Res: LGP_INT32;
begin
  lgoCheckResult(lgpPKCS11Session_CheckActive(ExtObject, Res));
  Result := Res <> 0;
end;

procedure TlgoPKCS11Session.Login(APIN: UTF8String; AUserType: TlgPKCS11UserType
  );
begin
  lgoCheckResult(lgpPKCS11Session_Login(ExtObject, LGP_PCHAR(APIN), LGP_INT32(AUserType)));
end;

procedure TlgoPKCS11Session.Logout;
begin
  lgoCheckResult(lgpPKCS11Session_Logout(ExtObject));
end;

{$ELSE}

class function TlgoPKCS11Session.CheckActive(ASession: LGP_OBJECT): Boolean;
var
  Res: LGP_INT32;
begin
  lgoCheckResult(lgpPKCS11Session_CheckActive(ASession, Res));
  Result := Res <> 0;
end;

class procedure TlgoPKCS11Session.Login(ASession: LGP_OBJECT; APIN: String;
  AUserType: TlgPKCS11UserType);
begin
  lgoCheckResult(lgpPKCS11Session_Login(ASession, LGP_PCHAR(APIN), LGP_INT32(AUserType)));
end;

class procedure TlgoPKCS11Session.Logout(ASession: LGP_OBJECT);
begin
  lgoCheckResult(lgpPKCS11Session_Logout(ASession));
end;

class function TlgoPKCS11Session.GetHandle(ASession: LGP_OBJECT): LGP_CK_ULONG;
begin
  lgoCheckResult(lgpPKCS11Session_GetHandle(ASession, Result));
end;

class function TlgoPKCS11Session.GetSlotID(ASession: LGP_OBJECT): LGP_CK_ULONG;
begin
  lgoCheckResult(lgpPKCS11Session_GetSlotID(ASession, Result));
end;

class function TlgoPKCS11Session.GetState(ASession: LGP_OBJECT
  ): TlgPKCS11SessionState;
var
  Res: LGP_UINT32;
begin
  lgoCheckResult(lgpPKCS11Session_GetState(ASession, Res));
  Result := TlgPKCS11SessionState(Res);
end;

class function TlgoPKCS11Session.FlagsRaw(ASession: LGP_OBJECT): LGP_CK_ULONG;
begin
  lgoCheckResult(lgpPKCS11Session_GetFlags(ASession, Result));
end;

class function TlgoPKCS11Session.Flags(ASession: LGP_OBJECT): TlgPKCS11SessionFlags;
const
  CKF_RW_SESSION          = LGP_CK_ULONG($00000002); { session is r/w }
  CKF_SERIAL_SESSION      = LGP_CK_ULONG($00000004); { no parallel    }
var
  Flags: LGP_CK_ULONG;
begin
  Result := [];
  Flags := Self.FlagsRaw(ASession);
  if Flags and CKF_RW_SESSION <> 0 then
    Include(Result, psfRWSession);
  if Flags and CKF_SERIAL_SESSION <> 0 then
    Include(Result, psfSerialSession);
end;

{$ENDIF}

{ TlgoPKCS11Sessions }

function TlgoPKCS11Sessions.GetItem(AIndex: Integer): {$IFDEF LGP_HAVE_EXTRECORDS}TlgoPKCS11Session{$ELSE}LGP_OBJECT{$ENDIF};
begin
  lgoCheckResult(lgpListObject_GetItem(ExtObject, AIndex, Result{$IFDEF LGP_HAVE_EXTRECORDS}.ExtObject{$ENDIF}));
end;

destructor TlgoPKCS11Sessions.Destroy;
begin
  ExtObject := nil;
  inherited Destroy;
end;

function TlgoPKCS11Sessions.Count: Integer;
begin
  lgoCheckResult(lgpListObject_GetCount(ExtObject, Result));
end;

{$ENDIF}

{ TlgoCertificateSigner }

constructor TlgoCertificateSigner.Create(AClassName: UTF8String);
begin
  lgoCheckResult(lgpCertificateSigner_Create(LGP_PCHAR(AClassName), ExtObject));
end;

function TlgoCertificateSigner.List: TlgoCertificates;
var
  L: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificateSigner_List(ExtObject, L));
  if L <> nil then
    Result := TlgoCertificates.Create(L)
  else
    Result := nil;
end;

function TlgoCertificateSigner.UISelect: TlgoCertificate;
var
  Cert: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificateSigner_UISelect(ExtObject, Cert));
  if Cert <> nil then
  begin
    Result := TlgoCertificate.Create;
    Result.FItem := Cert;
  end
  else
    Result := nil;
end;

function TlgoCertificateSigner.LoadFromStream(const ACertificateStream: TStream;
  const ACertificateFormat: TlgoEncodingType; const APrivateKeyStream: TStream;
  APrivateKeyFormat: TlgoEncodingType; const APassword: UTF8String): TlgoCertificate;
var
  Cert, OKeyStream: LGP_OBJECT;
  LCertStream: TlgoStream;
  LKeyStream: TlgoStream;
begin
  Result := nil;
  LCertStream := nil;
  LKeyStream := nil;
  try
    LCertStream := TlgoStream.Create(ACertificateStream);
    if APrivateKeyStream <> nil then
    begin
      LKeyStream := TlgoStream.Create(APrivateKeyStream);
      OKeyStream := LKeyStream.StreamObj;
    end
    else
      OKeyStream := nil;
    lgoCheckResult(lgpCertificateSigner_LoadFromStream(ExtObject, LCertStream.StreamObj,
      Ord(ACertificateFormat), OKeyStream, Ord(APrivateKeyFormat),
      LGP_PCHAR(APassword), Cert));
    if Cert <> nil then
    begin
      Result := TlgoCertificate.Create;
      Result.FItem := Cert;
    end
  finally
    if Assigned(LKeyStream) then
      LKeyStream.Free;
    if Assigned(LCertStream) then
      LCertStream.Free;
  end;
end;

{ ElgWinHTTPException }

procedure ElgWinHTTPException.LoadObject(AException: LGP_EXCEPTION);
var
  I: Integer;
begin
  inherited LoadObject(AException);
  if AException <> nil then
  begin
    lgoCheckResult(lgpObject_GetIntegerProp(AException, 'ErrorCode', I));
    ErrorCode := LongWord(I);
  end;
end;

{$IFDEF LGP_ENABLE_PKCS11}

{ TlgoPKCS11Info }

function TlgoPKCS11Info.GetCryptokitVersionMajor: Integer;
begin
  Result := GetIntegerProp('CryptokitVersionMajor');
end;

function TlgoPKCS11Info.GetCryptokitVersionMinor: Integer;
begin
  Result := GetIntegerProp('CryptokitVersionMinor');
end;

function TlgoPKCS11Info.GetCryptokitVersionStr: UTF8String;
begin
  Result := GetStringProp('CryptokitVersionStr');
end;

function TlgoPKCS11Info.GetLibraryDescription: UTF8String;
begin
  Result := GetStringProp('LibraryDescription');
end;

function TlgoPKCS11Info.GetLibraryVersionMajor: Integer;
begin
  Result := GetIntegerProp('LibraryVersionMajor');
end;

function TlgoPKCS11Info.GetLibraryVersionMinor: Integer;
begin
  Result := GetIntegerProp('LibraryVersionMinor');
end;

function TlgoPKCS11Info.GetLibraryVersionStr: UTF8String;
begin
  Result := GetStringProp('LibraryVersionStr');
end;

function TlgoPKCS11Info.GetManufacturerID: UTF8String;
begin
  Result := GetStringProp('ManufacturerID');
end;

{ TlgoPKCS11TokenInfo }

function TlgoPKCS11TokenInfo.GetFirmwareVersionMajor: Integer;
begin
  Result := GetIntegerProp('FirmwareVersionMajor');
end;

function TlgoPKCS11TokenInfo.GetFirmwareVersionMinor: Integer;
begin
  Result := GetIntegerProp('FirmwareVersionMinor');
end;

function TlgoPKCS11TokenInfo.GetFirmwareVersionStr: UTF8String;
begin
  Result := GetStringProp('FirmwareVersionStr');
end;

function TlgoPKCS11TokenInfo.GetFlags: TlgPKCS11TokenFlags;
begin
  Result := CKTokenFlagsToSet(GetFlagsRaw);
end;

function TlgoPKCS11TokenInfo.GetFlagsRaw: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('FlagsRaw'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('FlagsRaw'));
end;

function TlgoPKCS11TokenInfo.GetFreePrivateMemory: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('FreePrivateMemory'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('FreePrivateMemory'));
end;

function TlgoPKCS11TokenInfo.GetFreePublicMemory: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('FreePublicMemory'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('FreePublicMemory'));
end;

function TlgoPKCS11TokenInfo.GetHardwareVersionMajor: Integer;
begin
  Result := GetIntegerProp('HardwareVersionMajor');
end;

function TlgoPKCS11TokenInfo.GetHardwareVersionMinor: Integer;
begin
  Result := GetIntegerProp('HardwareVersionMinor');
end;

function TlgoPKCS11TokenInfo.GetHardwareVersionStr: UTF8String;
begin
  Result := GetStringProp('HardwareVersionStr');
end;

function TlgoPKCS11TokenInfo.GetManufacturerID: UTF8String;
begin
  Result := GetStringProp('ManufacturerID');
end;

function TlgoPKCS11TokenInfo.GetMaxPinLen: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('MaxPinLen'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('MaxPinLen'));
end;

function TlgoPKCS11TokenInfo.GetMaxRwSessionCount: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('MaxRwSessionCount'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('MaxRwSessionCount'));
end;

function TlgoPKCS11TokenInfo.GetMaxSessionCount: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('MaxSessionCount'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('MaxSessionCount'));
end;

function TlgoPKCS11TokenInfo.GetMinPinLen: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('MinPinLen'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('MinPinLen'));
end;

function TlgoPKCS11TokenInfo.GetModel: UTF8String;
begin
  Result := GetStringProp('Model');
end;

function TlgoPKCS11TokenInfo.GetRwSessionCount: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('RwSessionCount'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('RwSessionCount'));
end;

function TlgoPKCS11TokenInfo.GetSerialNumber: UTF8String;
begin
  Result := GetStringProp('SerialNumber');
end;

function TlgoPKCS11TokenInfo.GetSessionCount: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('SessionCount'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('SessionCount'));
end;

function TlgoPKCS11TokenInfo.GetTokenLabel: UTF8String;
begin
  Result := GetStringProp('TokenLabel');
end;

function TlgoPKCS11TokenInfo.GetTotalPrivateMemory: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('TotalPrivateMemory'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('TotalPrivateMemory'));
end;

function TlgoPKCS11TokenInfo.GetTotalPublicMemory: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('TotalPublicMemory'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('TotalPublicMemory'));
end;

function TlgoPKCS11TokenInfo.GetUtcTime: UTF8String;
begin
  Result := GetStringProp('UtcTime');
end;

destructor TlgoPKCS11TokenInfo.Destroy;
begin
  ExtObject := nil;
  inherited Destroy;
end;

{ TlgoPKCS11SlotInfo }

function TlgoPKCS11SlotInfo.GetFirmwareVersionMajor: Integer;
begin
  Result := GetIntegerProp('FirmwareVersionMajor');
end;

function TlgoPKCS11SlotInfo.GetFirmwareVersionMinor: Integer;
begin
  Result := GetIntegerProp('FirmwareVersionMinor');
end;

function TlgoPKCS11SlotInfo.GetFirmwareVersionStr: UTF8String;
begin
  Result := GetStringProp('FirmwareVersionStr');
end;

function TlgoPKCS11SlotInfo.GetFlags: TlgPKCS11SlotFlags;
begin
  Result := CKSlotFlagsToSet(GetFlagsRaw);
end;

function TlgoPKCS11SlotInfo.GetFlagsRaw: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('FlagsRaw'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('FlagsRaw'));
end;

function TlgoPKCS11SlotInfo.GetHardwareVersionMajor: Integer;
begin
  Result := GetIntegerProp('HardwareVersionMajor');
end;

function TlgoPKCS11SlotInfo.GetHardwareVersionMinor: Integer;
begin
  Result := GetIntegerProp('HardwareVersionMinor');
end;

function TlgoPKCS11SlotInfo.GetHardwareVersionStr: UTF8String;
begin
  Result := GetStringProp('HardwareVersionStr');
end;

function TlgoPKCS11SlotInfo.GetManufacturerID: UTF8String;
begin
  Result := GetStringProp('ManufacturerID');
end;

function TlgoPKCS11SlotInfo.GetSlotDescription: UTF8String;
begin
  Result := GetStringProp('SlotDescription');
end;

function TlgoPKCS11SlotInfo.GetSlotID: LGP_CK_ULONG;
begin
  if SizeOf(Result) = 8 then
    Result := LGP_CK_ULONG(GetInt64Prop('SlotID'))
  else
    Result := LGP_CK_ULONG(GetIntegerProp('SlotID'));
end;

function TlgoPKCS11SlotInfo.GetTokenInfo: TlgoPKCS11TokenInfo;
var
  O: LGP_OBJECT;
begin
  if not Assigned(FTokenInfo) then
  begin
    O := GetObjectProp('TokenInfo');
    if O <> nil then
      FTokenInfo := TlgoPKCS11TokenInfo.Create(O);
  end;
  Result := FTokenInfo;
end;

function TlgoPKCS11SlotInfo.GetTokenPresent: Boolean;
begin
  Result := GetBooleanProp('TokenPresent');
end;

destructor TlgoPKCS11SlotInfo.Destroy;
begin
  if Assigned(FTokenInfo) then
  begin
    FTokenInfo.Free;
    SetObjectProp('TokenInfo', nil);
  end;
  ExtObject := nil;
  inherited Destroy;
end;

{ TlgoPKCS11SlotInfoList }

constructor TlgoPKCS11SlotInfoList.Create(AObject: LGP_OBJECT);
begin
  inherited Create(AObject);
  FList := TList.Create;
end;

destructor TlgoPKCS11SlotInfoList.Destroy;
begin
  while FList.Count > 0 do
  begin
    TlgoPKCS11SlotInfo(FList[0]).Free;
    FList.Delete(0);
  end;
  FList.Free;
  inherited Destroy;
end;

function TlgoPKCS11SlotInfoList.Count: Integer;
begin
  lgoCheckResult(lgpListObject_GetCount(ExtObject, Result));
end;

function TlgoPKCS11SlotInfoList.GetItem(AIndex: Integer): TlgoPKCS11SlotInfo;
var
  Item: LGP_OBJECT;
begin
  if (FList.Count > AIndex) and (FList.Items[AIndex] <> nil) then
    Result := TlgoPKCS11SlotInfo(FList[AIndex])
  else
  begin
    lgoCheckResult(lgpListObject_GetItem(ExtObject, AIndex, Item));
    if Item <> nil then
    begin
      Result := TlgoPKCS11SlotInfo.Create(Item);
      if AIndex >= FList.Count then
        FList.Count := AIndex + 1;
      FList[AIndex] := Result;
    end
    else
      Result := nil;
  end;
end;

{ TlgoPKCS11CertificateSigner }

function TlgoPKCS11CertificateSigner.GetLibFileName: UTF8String;
begin
  Result := GetStringProp('LibFileName');
end;

function TlgoPKCS11CertificateSigner.GetFunctionList: Pointer;
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_FunctionList(ExtObject, Result));
end;

function TlgoPKCS11CertificateSigner.GetLibLoaded: Boolean;
begin
  Result := GetBooleanProp('LibLoaded');
end;

constructor TlgoPKCS11CertificateSigner.Create(AClassName: UTF8String);
begin
  inherited Create(AClassName);
  FSessions := TlgoPKCS11Sessions.Create(GetObjectProp('Sessions'));
end;

destructor TlgoPKCS11CertificateSigner.Destroy;
begin
  FSessions.Free;
  inherited Destroy;
end;

procedure TlgoPKCS11CertificateSigner.LoadLibrary(ALibFileName: UTF8String);
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_LoadLibrary(ExtObject, LGP_PCHAR(ALibFileName)));
end;

procedure TlgoPKCS11CertificateSigner.FreeLibrary;
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_FreeLibrary(ExtObject));
end;

function TlgoPKCS11CertificateSigner.GetInfo: TlgoPKCS11Info;
var
  O: LGP_OBJECT;
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_GetInfo(ExtObject, O));
  if O <> nil then
    Result := TlgoPKCS11Info.Create(O)
  else
    Result := nil;
end;

function TlgoPKCS11CertificateSigner.GetSlots(AWithToken: Boolean
  ): TlgoPKCS11SlotInfoList;
var
  O: LGP_OBJECT;
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_GetSlots(ExtObject, LGP_INT32(AWithToken), O));
  if O <> nil then
    Result := TlgoPKCS11SlotInfoList.Create(O)
  else
    Result := nil;
end;

function TlgoPKCS11CertificateSigner.SessionStart(ACert: TlgoCertificate
  ): LGP_OBJECT;
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_SessionStart(ExtObject, ACert.FItem, Result));
end;

//function TlgoPKCS11CertificateSigner.SessionStart(ASlotID: CK_SLOT_ID
//  ): LGP_OBJECT;
//begin
//
//end;

procedure TlgoPKCS11CertificateSigner.SessionClose(ASession: LGP_OBJECT);
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_SessionClose(ExtObject, ASession));
end;

procedure TlgoPKCS11CertificateSigner.SessionClose(ASessionIndex: Integer);
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_SessionCloseIdx(ExtObject, ASessionIndex));
end;

procedure TlgoPKCS11CertificateSigner.SessionCloseAll;
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_SessionCloseAll(ExtObject));
end;

class function TlgoPKCS11CertificateSigner.CheckLibrary(
  const ALibFile: UTF8String; out AKomunikat: UTF8String): Boolean;
var
  Komunikat: LGP_OBJECT;
  Res: LGP_INT32;
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_CheckLibrary(LGP_PCHAR(ALibFile), Komunikat, Res));
  Result := Res <> 0;
  AKomunikat := lgoGetString(Komunikat);
end;

class function TlgoPKCS11CertificateSigner.GetLibraryInfo(
  const ALibFile: UTF8String; out ALibInfo: TlgoPKCS11Info; out
  AKomunikat: UTF8String): Boolean;
var
  Komunikat: LGP_OBJECT;
  Res: LGP_INT32;
  LibInfoObj: LGP_OBJECT;
begin
  lgoCheckResult(lgpPKCS11CertificateSigner_GetLibraryInfo(LGP_PCHAR(ALibFile), LibInfoObj, Komunikat, Res));
  Result := Res <> 0;
  AKomunikat := lgoGetString(Komunikat);
  if Result and (LibInfoObj <> nil) then
    ALibInfo := TlgoPKCS11Info.Create(LibInfoObj)
  else
    ALibInfo := nil;
end;

{$ENDIF}

{ TlgoCertificates }

function TlgoCertificates.GetOwnObjects: Boolean;
var
  L: LGP_INT32;
begin
  lgoCheckResult(lgpListObject_GetOwnsObjects(ExtObject, L));
  Result := L <> 0;
end;

procedure TlgoCertificates.SetOwnObjects(AValue: Boolean);
begin
  lgoCheckResult(lgpListObject_SetOwnsObjects(ExtObject, LGP_INT32(AValue)));
end;

constructor TlgoCertificates.Create(AOwnsObjects: Boolean);
begin
  lgoCheckResult(lgpCertificates_Create(LGP_INT32(AOwnsObjects), ExtObject));
  FClassItems := TList.Create;
end;

constructor TlgoCertificates.Create(AObject: LGP_OBJECT);
begin
  inherited Create(AObject);
  FClassItems := TList.Create;
end;

destructor TlgoCertificates.Destroy;
var
  I: Integer;
begin
  for I := 0 to FClassItems.Count - 1 do
    if FClassItems[I] <> nil then
      if OwnObjects then
        TlgoCertificate(FClassItems[I]).Free
      else
        TlgoCertificate(FClassItems[I]).FList := nil;
  FClassItems.Free;
  inherited Destroy;
end;

function TlgoCertificates.Count: Integer;
begin
  lgoCheckResult(lgpListObject_GetCount(ExtObject, Result));
end;

function TlgoCertificates.Add(ACert: TlgoCertificate): Integer;
begin
  lgoCheckResult(lgpListObject_Add(ExtObject, ACert.FItem, Result));
  if Result > -1 then
  begin
    if Result >= FClassItems.Count then
      FClassItems.Count := Result + 1;
    FClassItems[Result] := ACert;
    ACert.FList := Self;
  end;
end;

procedure TlgoCertificates.Delete(AIndex: Integer);
begin
  lgoCheckResult(lgpListObject_Delete(ExtObject, AIndex));
  FClassItems.Delete(AIndex);
end;

function TlgoCertificates.GetItem(AIndex: Integer): TlgoCertificate;
var
  Item: LGP_OBJECT;
begin
  if (FClassItems.Count > AIndex) and (FClassItems.Items[AIndex] <> nil) then
    Result := TlgoCertificate(FClassItems[AIndex])
  else
  begin
    lgoCheckResult(lgpListObject_GetItem(ExtObject, AIndex, Item));
    if Item <> nil then
    begin
      Result := lgoCreateCertificate(Item);
      Result.FList := Self;
      Result.FIndex := AIndex;
      Result.FItem := Item;
      if AIndex >= FClassItems.Count then
        FClassItems.Count := AIndex + 1;
      FClassItems[AIndex] := Result;
    end
    else
      Result := nil;
  end;
end;

{ TlgoCertificate }

function TlgoCertificate.GetDisplayName: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetDisplayName(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetIssuer: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetIssuer(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetIssuerField(AIndex: UTF8String): UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetIssuerField(FItem, LGP_PCHAR(AIndex), S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetIssuerFields: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetIssuerFields(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetIssuerUID: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetIssuerUID(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetKeyUsage: TlgoCertificateKeyUsage;
var
  I: LGP_INT32;
begin
  lgoCheckResult(lgpCertificate_GetKeyUsage(FItem, I));
  Result := [];
  if I and LGP_CKU_DIGITAL_SIGNATURE <> 0 then
    Include(Result, ckuDigitalSignature);
  if I and LGP_CKU_NON_REPUDIATION <> 0 then
    Include(Result, ckuNonRepudiation);
  if I and LGP_CKU_KEY_ENCIPHERMENT <> 0 then
    Include(Result, ckuKeyEncipherment);
  if I and LGP_CKU_DATA_ENCIPHERMENT <> 0 then
    Include(Result, ckuDataEncipherment);
  if I and LGP_CKU_KEY_AGREEMENT <> 0 then
    Include(Result, ckuKeyAgreement);
  if I and LGP_CKU_KEY_CERT_SIGN <> 0 then
    Include(Result, ckuKeyCertSign);
  if I and LGP_CKU_CRL_SIGN <> 0 then
    Include(Result, ckuCRLSign);
  if I and LGP_CKU_ENCIPHER_ONLY <> 0 then
    Include(Result, ckuEncipherOnly);
  if I and LGP_CKU_DECIPHER_ONLY <> 0 then
    Include(Result, ckuDecipherOnly);
end;

function TlgoCertificate.GetPublicKeyAlgorithm: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetPublicKeyAlgorithm(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSerialNoDec: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSerialNoDec(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSerialNoHex: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSerialNoHex(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSignature: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSignature(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSubject: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSubject(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSubjectField(AIndex: UTF8String): UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSubjectField(FItem, LGP_PCHAR(AIndex), S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSubjectFields: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSubjectFields(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetSubjectUID: UTF8String;
var
  S: LGP_OBJECT;
begin
  lgoCheckResult(lgpCertificate_GetSubjectUID(FItem, S));
  Result := lgoGetString(S);
end;

function TlgoCertificate.GetValidFrom: TDateTime;
begin
  lgoCheckResult(lgpCertificate_GetValidFrom(FItem, Result));
end;

function TlgoCertificate.GetValidTo: TDateTime;
begin
  lgoCheckResult(lgpCertificate_GetValidTo(FItem, Result));
end;

function TlgoCertificate.GetVersion: TlgoCertificateVersion;
var
  I: LGP_INT32;
begin
  lgoCheckResult(lgpCertificate_GetVersion(FItem, I));
  Result := TlgoCertificateVersion(I);
end;

procedure TlgoCertificate.SetPIN(AValue: UTF8String);
begin
  lgoCheckResult(lgpCertificate_SetPIN(FItem, LGP_PCHAR(AValue)));
end;

destructor TlgoCertificate.Destroy;
begin
  if FList = nil then
  begin
    if FItem <> nil then
      lgoCheckResult(lgpObject_Free(FItem), False);
  end
  else
  begin
    if FList.FClassItems.Count > FIndex then
      FList.FClassItems.Items[FIndex] := nil;
  end;
  inherited Destroy;
end;

function TlgoCertificate.ObjClassName: UTF8String;
begin
  Result := lgoClassName(FItem);
end;

{ TlgoBackend }

class function TlgoBackend.ListDrivers(AClassType: Integer
  ): TlgoUTF8StringArray;
var
  I: Integer;
begin
  SetLength(Result, lgplDriverCount(AClassType));
  for I := 0 to lgplDriverCount(AClassType) - 1 do
    Result[I] := lgplDriverName(AClassType, I);
end;

class function TlgoBackend.HTTPClientClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_HTTP_CLIENT);
end;

class function TlgoBackend.RandomGeneratorClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_RAND_GENERATOR);
end;

class function TlgoBackend.Base64EncoderClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_BASE64_ENCODER);
end;

class function TlgoBackend.MD5HashClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_MD5_HASH);
end;

class function TlgoBackend.SHA1HashClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_SHA1_HASH);
end;

class function TlgoBackend.SHA256HashClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_SHA256_HASH);
end;

class function TlgoBackend.AES256EncryptClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_AES256_ENC);
end;

class function TlgoBackend.CertSignerClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_CERT_SIGNER);
end;

class function TlgoBackend.EDekGateClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_EDEK_GATE);
end;

class function TlgoBackend.XMLCanonizatorClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_XML_C14N);
end;

class function TlgoBackend.XMLReaderClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_XML_READER);
end;

class function TlgoBackend.ZipperClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_ZIPPRE);
end;

class function TlgoBackend.RSAEncryptClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_RSA_ENC);
end;

class function TlgoBackend.XMLValidatorClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_XML_VALIDATOR);
end;

class function TlgoBackend.XMLXSLTClasses: TlgoUTF8StringArray;
begin
  Result := ListDrivers(LGP_CLSTYPE_XML_XSLT);
end;

{ TlgoHTTPClient }

function TlgoHTTPClient.GetIgnoreSSLErrors: Boolean;
var
  V: LGP_INT32;
begin
  lgoCheckResult(lgpHTTPClient_GetIgnoreSSLErrors(ExtObject, V));
  Result := V <> 0;
end;

procedure TlgoHTTPClient.SetIgnoreSSLErrors(AValue: Boolean);
begin
  lgoCheckResult(lgpHTTPClient_SetIgnoreSSLErrors(ExtObject, Integer(AValue)));
end;

constructor TlgoHTTPClient.Create(AClassName: UTF8String);
begin
  lgoCheckResult(lgpHTTPClient_Create(LGP_PCHAR(AClassName), ExtObject));
end;

{ TlgoRSAPublicKey }

class function TlgoRSAPublicKey.CreateKey(AClassName: UTF8String;
  AStream: TStream; AFormat: TlgoEncodingType): TlgoRSAPublicKey;
var
  Key: LGP_OBJECT;
  LGStream: TlgoStream;
begin
  LGStream := nil;
  try
    LGStream := TlgoStream.Create(AStream);
    lgoCheckResult(lgpRSAEncrypt_CreateKey(LGP_PCHAR(AClassName), LGStream.StreamObj, Ord(AFormat), Key));
    Result := TlgoRSAPublicKey.Create;
    Result.ExtObject := Key;
  finally
    if Assigned(LGStream) then
      LGStream.Free;
  end;
end;

procedure RegisterExceptions;
begin
  lgoRegisterExceptionClass(ElgBackendError);
  lgoRegisterExceptionClass(ElgWSTError);
  lgoRegisterExceptionClass(ElgWinHTTPException);
end;

initialization
  RegisterExceptions;

end.

