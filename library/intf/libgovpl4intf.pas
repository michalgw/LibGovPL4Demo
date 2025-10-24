{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

unit LibGovPl4Intf;

{$ifdef fpc}
{$mode Delphi}
{$endif}

{.$DEFINE LIBGOVPL_DYNAMIC}

interface

uses
  Classes, SysUtils {$IFNDEF FPC}, Types{$ENDIF};

{$IFDEF LIBGOVPL_DYNAMIC}
const
  LIBGOVPL_DYNAMIC = True;
{$ENDIF}

type
  LGP_PCHAR = PAnsiChar;
  LGP_PSSTRING = PShortString;
  LGP_INT32 = {$IFDEF FPC}Int32{$ELSE}Integer{$ENDIF};
  LGP_UINT32 = {$IFDEF FPC}UInt32{$ELSE}Cardinal{$ENDIF};
  LGP_DOUBLE = Double;
  LGP_CURRENCY = Currency;
  LGP_INT64 = Int64;
  LGP_PASDATETIME = TDateTime;
  LGP_POINTER = Pointer;
  LGP_OBJECT = type Pointer;
  LGP_EXCEPTION = LGP_OBJECT;
  LGP_PBYTE = PByte;

  {$IFNDEF FPC}
  LGP_CK_ULONG = LongWord;
  {$ELSE}
  LGP_CK_ULONG = {$IFDEF WINDOWS}LongWord{$ELSE}PtrUInt{$ENDIF};
  {$ENDIF}

  {$IFNDEF FPC}
  TStringArray = TStringDynArray;
  {$ENDIF}

  // Stream
  TlgpStreamReadFunc = function(AStreamObject: LGP_POINTER; AData: LGP_POINTER; ASize: LGP_INT32): LGP_INT32; stdcall;
  TlgpStreamWriteFunc = function(AStreamObject: LGP_POINTER; AData: LGP_POINTER; ASize: LGP_INT32): LGP_INT32; stdcall;
  TlgpStreamSeekFunc = function(AStreamObject: LGP_POINTER; AOffset: LGP_INT32; AOrigin: LGP_INT32): LGP_INT32; stdcall;
  TlgpStreamGetPositionFunc = function(AStreamObject: LGP_POINTER): LGP_INT32; stdcall;
  TlgpStreamGetSizeFunc = function(AStreamObject: LGP_POINTER): LGP_INT32; stdcall;

  TlgpRequestPartStreamEvent = procedure(ASender: LGP_OBJECT; ACargo: LGP_POINTER; APartNumber: LGP_INT32; var AStream: LGP_OBJECT); stdcall;


const
  LGP_LIBNAME = 'libgovpl4.dll';

  LGP_CLSTYPE_HTTP_CLIENT    = 0;
  LGP_CLSTYPE_CERT_SIGNER    = 1;
  LGP_CLSTYPE_RAND_GENERATOR = 2;
  LGP_CLSTYPE_BASE64_ENCODER = 3;
  LGP_CLSTYPE_MD5_HASH       = 4;
  LGP_CLSTYPE_SHA1_HASH      = 5;
  LGP_CLSTYPE_SHA256_HASH    = 6;
  LGP_CLSTYPE_AES256_ENC     = 7;
  LGP_CLSTYPE_RSA_ENC        = 8;
  LGP_CLSTYPE_ZIPPRE         = 9;
  LGP_CLSTYPE_XML_READER     = 10;
  LGP_CLSTYPE_XML_C14N       = 11;
  LGP_CLSTYPE_EDEK_GATE      = 12;
  LGP_CLSTYPE_XML_VALIDATOR  = 13;
  LGP_CLSTYPE_XML_XSLT       = 14;

  LGP_CLSTYPE_MAX = LGP_CLSTYPE_XML_XSLT;

  LGP_XADES_SHA1 = 1;
  LGP_XADES_SHA256 = 2;

  // Stream
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

  // TlgCertificateKeyUsage
  LGP_CKU_DIGITAL_SIGNATURE = 1;
  LGP_CKU_NON_REPUDIATION   = 2;
  LGP_CKU_KEY_ENCIPHERMENT  = 4;
  LGP_CKU_DATA_ENCIPHERMENT = 8;
  LGP_CKU_KEY_AGREEMENT     = 16;
  LGP_CKU_KEY_CERT_SIGN     = 32;
  LGP_CKU_CRL_SIGN          = 64;
  LGP_CKU_ENCIPHER_ONLY     = 128;
  LGP_CKU_DECIPHER_ONLY     = 256;

  // XAdES
  LGP_XADES_SIGNTYPE_SHA1 = 0;
  LGP_XADES_SIGNTYPE_SHA256 = 1;
  LGP_XADES_SERIALNOFMT_DEC = 0;
  LGP_XADES_SERIALNOFMT_HEX = 1;

  // EDek
  LGP_EDEK_GATE_PRODUCTION = 0;
  LGP_EDEK_GATE_TEST = 1;
  LGP_EDEK_SIGN_CERTIFICATE = 0;
  LGP_EDEK_SIGN_AUTHDATA = 1;

  // KSeF
  LGP_KSEF_GATETYPE_PROD = 0;
  LGP_KSEF_GATETYPE_DEMO = 1;
  LGP_KSEF_GATETYPE_TEST = 2;

  LGP_KSEF_CERTAUTHTYPE_SERIALNUMBER = 0;
  LGP_KSEF_CERTAUTHTYPE_FINGERPRINT = 1;

  LGP_KSEF_FORM_CODE_CUSTOM = 0;
  LGP_KSEF_FORM_CODE_FA1 = 1;
  LGP_KSEF_FORM_CODE_FA2 = 2;

  LGP_KSEF_SUBJECTTYPE_SUBJECT1 = 0;
  LGP_KSEF_SUBJECTTYPE_SUBJECT2 = 1;
  LGP_KSEF_SUBJECTTYPE_SUBJECT3 = 2;
  LGP_KSEF_SUBJECTTYPE_SUBJECTAUTHORIZED = 3;


{$IFNDEF LIBGOVPL_DYNAMIC}
// Backend
function lgplVersion: LGP_UINT32; stdcall; external LGP_LIBNAME;
function lgplListDrivers(AClassType: LGP_INT32): LGP_PCHAR; stdcall; external LGP_LIBNAME;
function lgplDriverCount(AClassType: LGP_INT32): LGP_INT32; stdcall; external LGP_LIBNAME;
function lgplDriverName(AClassType, ADriverIndex: LGP_INT32): LGP_PCHAR; stdcall; external LGP_LIBNAME;
function lgplInit: LGP_INT32; stdcall; external LGP_LIBNAME;
function lgplExit: LGP_INT32; stdcall; external LGP_LIBNAME;
function lgplSetDefaultDriver(ADriverClass: LGP_INT32; ADriverName: LGP_PCHAR): LGP_INT32; stdcall; external LGP_LIBNAME;

function lgpHTTPClient_Create(AClassName: LGP_PCHAR; var AHttpClient: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpHTTPClient_GetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpHTTPClient_SetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpRSAEncrypt_CreateKey(AClassName: LGP_PCHAR; AKeyStream: LGP_OBJECT; AFormat: LGP_INT32; var ARSAKey: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpCertificate_GetVersion(ACertificate: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetDisplayName(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSubject(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSubjectField(ACertificate: LGP_OBJECT; AField: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSubjectFields(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSubjectUID(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetIssuer(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetIssuerField(ACertificate: LGP_OBJECT; AField: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetIssuerFields(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetIssuerUID(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSerialNoDec(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSerialNoHex(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetValidFrom(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetValidTo(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSignature(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetKeyUsage(ACertificate: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetPublicKeyAlgorithm(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_SetPIN(ACertificate: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpCertificates_Create(AOwnsObjects: LGP_INT32; var ACertificates: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpCNGCertificate_ShowCertificateInfo(ACertificate: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpCertificateSigner_Create(AClassName: LGP_PCHAR; var ACertSigner: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificateSigner_List(ACertificateSigner: LGP_OBJECT; var ACertList: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificateSigner_FindBySerialNumber(ACertificateSigner: LGP_OBJECT; ASerialNo: LGP_PCHAR; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificateSigner_UISelect(ACertificateSigner: LGP_OBJECT; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificateSigner_LoadFromStream(ACertificateSigner: LGP_OBJECT; ACertificateStream: LGP_OBJECT; ACertificateFormat: LGP_INT32;
  APrivateKeyStream: LGP_OBJECT; APrivateKeyFormat: LGP_INT32; APassword: LGP_PCHAR; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpCNGCertificateSigner_SetHWnd(ACertificateSigner: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpEncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASec, AMSec: LGP_INT32): LGP_PASDATETIME; stdcall; external LGP_LIBNAME;
procedure lgpDecodeDateTime(ADateTime: LGP_PASDATETIME; var AYear, AMonth, ADay, AHour, AMinute, ASec, AMSec: LGP_INT32); stdcall; external LGP_LIBNAME;

function lgpLoadLibXML2(AFileName: LGP_PCHAR): LGP_INT32; stdcall; external LGP_LIBNAME;

// Object
function lgpObject_Free(AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_ClassName(AObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetStringProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_SetStringProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetIntegerProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_SetIntegerProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_DOUBLE): LGP_EXCEPTION; overload; stdcall; external LGP_LIBNAME;
{$IFNDEF FPC}
function lgpObject_GetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; overload; stdcall; external LGP_LIBNAME;
{$ENDIF}
function lgpObject_SetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetObjectProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_SetObjectProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetCurrencyProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_CURRENCY): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_SetCurrencyProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_CURRENCY): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetBooleanProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_SetBooleanProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetInt64Prop(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT64): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_SetInt64Prop(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT64): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpStringObject_GetValue(AStringObject: LGP_OBJECT; var AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpListObject_GetCount(AListObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpListObject_GetItem(AListObject: LGP_OBJECT; AIndex: LGP_INT32; var AItem: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpListObject_Delete(AListObject: LGP_OBJECT; AIndex: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpListObject_Remove(AListObject: LGP_OBJECT; AItem: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpListObject_Add(AListObject: LGP_OBJECT; AItem: LGP_OBJECT; var AIndex: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpListObject_GetOwnsObjects(AListObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpListObject_SetOwnsObjects(AListObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpDbgObjectCount: LGP_INT32; stdcall; external LGP_LIBNAME;

// Stream
function lgpStream_Create(AStreamObject: Pointer; AReadFunc: TlgpStreamReadFunc;
  AWriteFunc: TlgpStreamWriteFunc; ASeekFunc: TlgpStreamSeekFunc;
  AGetPositionFunc: TlgpStreamGetPositionFunc; AGetSizeFunc: TlgpStreamGetSizeFunc;
  var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpFileStream_Create(AFileName: LGP_PCHAR; AMode: LGP_INT32; var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpStringStream_Create(AData: LGP_PCHAR; var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpStringStream_GetString(AStringStream: LGP_OBJECT; var AString: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpMemoryStream_Create(var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpMemoryStream_GetData(AMemoryStream: LGP_OBJECT; var AData: LGP_POINTER): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpStream_GetPosition(AStream: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpStream_SetPosition(AStream: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpStream_GetSize(AStream: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpStream_Read(AStream: LGP_OBJECT; AData: LGP_POINTER; ADataSize: LGP_INT32; var AReaded: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpStream_Write(AStream: LGP_OBJECT; AData: LGP_POINTER; ADataSize: LGP_INT32; var AWritten: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// WST EDek Gate
function lgpWST_RegisterTransport: LGP_EXCEPTiON; stdcall; external LGP_LIBNAME;
function lgpWST_GetHTTPClient(var AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpWST_SetHTTPClient(AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// XML
function lgpXMLReader_CreateFromFile(AClassName: LGP_PCHAR; AFileName: LGP_PCHAR; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLReader_CreateFromStream(AClassName: LGP_PCHAR; AStream: LGP_OBJECT; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLReader_CreateFromString(AClassName: LGP_PCHAR; AString: LGP_PCHAR; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLReader_ReadValue(AReader: LGP_OBJECT; AXPath: LGP_PCHAR; var AValue: LGP_OBJECT; var AFound: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpXMLValidator_Create(AClassName: LGP_PCHAR; var AValidator: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLValidator_AddSchemaLocation(AValidator: LGP_OBJECT; ANS: LGP_PCHAR; ALocation: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLValidator_AddSchemaReader(AValidator: LGP_OBJECT; ANS: LGP_PCHAR; AXMLDoc: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLValidator_ClearSchemas(AValidator: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLValidator_Validate(AValidator: LGP_OBJECT; AXMLDoc: LGP_OBJECT; var AErrors: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpXMLXSLTransformation_Create(AClassName: LGP_PCHAR; var ATransformation: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLXSLTransformation_AddStyleLocation(ATransformation: LGP_OBJECT; ANS: LGP_PCHAR; ALocation: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLXSLTransformation_AddStyleReader(ATransformation: LGP_OBJECT; ANS: LGP_PCHAR; AXMLDoc: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLXSLTransformation_ClearStyles(ATransformation: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXMLXSLTransformation_Transform(ATransformation: LGP_OBJECT; AXMLDoc: LGP_OBJECT; AOutStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpLibXML2Backend_LibXMLLoaded: LGP_INT32; stdcall; external LGP_LIBNAME;
function lgpLibXML2Backend_LibXSLTLoaded: LGP_INT32; stdcall; external LGP_LIBNAME;
function lgpLibXML2Backend_LoadLibXML(ALibXML: LGP_PCHAR): LGP_INT32; stdcall; external LGP_LIBNAME;
function lgpLibXML2Backend_LoadLibXSLT(ALibXSLT, ALibEXSLT: LGP_PCHAR): LGP_INT32; stdcall; external LGP_LIBNAME;
function lgpLibXML2Backend_GetCacheExternals: LGP_INT32; stdcall; external LGP_LIBNAME;
procedure lgpLibXML2Backend_SetCacheExternals(AValue: LGP_INT32); stdcall; external LGP_LIBNAME;
function lgpLibXML2Backend_GetCacheDir: LGP_PCHAR; stdcall; external LGP_LIBNAME;
procedure lgpLibXML2Backend_SetCacheDir(AValue: LGP_PCHAR); stdcall; external LGP_LIBNAME;
function lgpLibXML2Backend_GetHTTPClient: LGP_OBJECT; stdcall; external LGP_LIBNAME;
function lgpLibXML2Backend_SetHTTPClient(AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

{$IFDEF LGP_ENABLE_PKCS11}
// PKCS#11
function lgpPKCS11Certificate_GetSession(ACertificate: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpPKCS11Session_CheckActive(ASession: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11Session_Login(ASession: LGP_OBJECT; APIN: LGP_PCHAR; AUserType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11Session_Logout(ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11Session_GetSigner(ASession: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11Session_GetHandle(ASession: LGP_OBJECT; var AHandle: LGP_CK_ULONG): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11Session_GetSlotID(ASession: LGP_OBJECT; var ASlotID: LGP_CK_ULONG): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11Session_GetState(ASession: LGP_OBJECT; var AState: LGP_UINT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11Session_GetFlags(ASession: LGP_OBJECT; var AFlags: LGP_UINT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpPKCS11CertificateSigner_LoadLibrary(ASigner: LGP_OBJECT; ALibName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_FreeLibrary(ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_GetInfo(ASigner: LGP_OBJECT; var AInfo: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_GetSlots(ASigner: LGP_OBJECT; AWithToken: LGP_INT32; var AList: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_SessionStart(ASigner: LGP_OBJECT; ACertificate: LGP_OBJECT; var ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_SessionClose(ASigner: LGP_OBJECT; ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_SessionCloseIdx(ASigner: LGP_OBJECT; ASessionIndex: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_SessionCloseAll(ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_GetLibLoaded(ASigner: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_GetLibFileName(ASigner: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_GetSessions(ASigner: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_FunctionList(ASigner: LGP_OBJECT; var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_CheckLibrary(ALibFile: LGP_PCHAR; var AKomunikat: LGP_OBJECT; var AResult: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpPKCS11CertificateSigner_GetLibraryInfo(ALibFile: LGP_PCHAR; var ALibInfo: LGP_OBJECT; var AKomunikat: LGP_OBJECT; var AResult: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
{$ENDIF}

// XAdES
function lgpXAdES_Create(ASHA1HashClass, ASHA256HashClass, ABase64EncoderClass: LGP_PCHAR;
  ASigner: LGP_OBJECT; var AXAdESObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetSHA1HashClass(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetSHA1HashClass(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetSHA256HashClass(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetSHA256HashClass(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetBase64EncoderClass(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetBase64EncoderClass(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetSigner(AXAdESObject: LGP_OBJECT; var ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetSigner(AXAdESObject: LGP_OBJECT; ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetSignType(AXAdESObject: LGP_OBJECT; var ASignType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetSignType(AXAdESObject: LGP_OBJECT; ASignType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetSerialNoFormat(AXAdESObject: LGP_OBJECT; var ASerialNoFormat: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetSerialNoFormat(AXAdESObject: LGP_OBJECT; ASerialNoFormat: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetIncludeSigningTime(AXAdESObject: LGP_OBJECT; var AIncludeSigningTime: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetIncludeSigningTime(AXAdESObject: LGP_OBJECT; AIncludeSigningTime: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetSigningTime(AXAdESObject: LGP_OBJECT; var ASigningTime: LGP_PASDATETIME): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetSigningTime(AXAdESObject: LGP_OBJECT; ASigningTime: LGP_PASDATETIME): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// EDek
function lgpEDek_Create(AXMLCanonizator, AEDekGate: LGP_PCHAR; var AEDekObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_GetXAdES(AEDekObj: LGP_OBJECT; var AXAdESObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_SetXAdES(AEDekObj: LGP_OBJECT; AXAdESObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_GetXMLCanonizatorClass(AEDekObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_SetXMLCanonizatorClass(AEDekObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_GetEDekGateClass(AEDekObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_SetEDekGateClass(AEDekObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_GetCanonization(AEDekObj: LGP_OBJECT; var AC14N: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_SetCanonization(AEDekObj: LGP_OBJECT; AC14N: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpEDek_PodpiszCertyfikatem(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR; ACertyfikat: LGP_OBJECT; var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_PodpiszCertyfikatemStream(AEDekObj: LGP_OBJECT; ADane: LGP_OBJECT; ACertyfikat: LGP_OBJECT; ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_PodpiszDanymiAut(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR; AImie, ANazwisko, ANIP: LGP_PCHAR; ADataUr: LGP_DOUBLE; AKwota: LGP_CURRENCY; var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_PodpiszDanymiAutStream(AEDekObj: LGP_OBJECT; ADane: LGP_OBJECT; AImie, ANazwisko, ANIP: LGP_PCHAR; ADataUr: LGP_DOUBLE; AKwota: LGP_CURRENCY; ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpEDek_Wyslij(AEDekObj: LGP_OBJECT; ADanePodpisane: LGP_PCHAR; ARodzajBramki: LGP_INT32; ARodzajPodpisu: LGP_INT32; var ANrRef: LGP_OBJECT; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_WyslijStream(AEDekObj: LGP_OBJECT; ADanePodpisane: LGP_OBJECT; ARodzajBramki: LGP_INT32; ARodzajPodpisu: LGP_INT32; var ANrRef: LGP_OBJECT; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_PobierzUPO(AEDekObj: LGP_OBJECT; ANrRef: LGP_PCHAR; ARodzajBramki: LGP_INT32; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT; var ADaneUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_PobierzUPOStream(AEDekObj: LGP_OBJECT; ANrRef: LGP_PCHAR; ARodzajBramki: LGP_INT32; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT; ADaneUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// JPK
function lgpJPK_Create(ABase64EncoderClass, AAES256EncryptClass, AMD5HashClass, ASHA256HashClass, AZipperClass, ARSAEncryptClass, ARandomGeneratorClass, AXMLReaderClass: LGP_PCHAR; var AJPKObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpJPK_GetBase64EncoderClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetBase64EncoderClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetAES256EncryptClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetAES256EncryptClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetMD5HashClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetMD5HashClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetSHA256HashClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetSHA256HashClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetZipperClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetZipperClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetRandomGeneratorClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetRandomGeneratorClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetXMLReaderClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetXMLReaderClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpJPK_GetRSAKeyProd(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetRSAKeyProd(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetRSAKeyTest(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetRSAKeyTest(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetXAdES(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetXAdES(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetHTTPClient(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetHTTPClient(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpJPK_SignCerificate(AJPKObj: LGP_OBJECT; ACertificate: LGP_OBJECT; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SignCerificateStream(AJPKObj: LGP_OBJECT; ACertificate: LGP_OBJECT; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SignDataAuth(AJPKObj: LGP_OBJECT; ANIP, AImiePierwsze, ANazwisko: LGP_PCHAR; ADataUrodzenia: LGP_DOUBLE; AKwota: LGP_CURRENCY; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SignDataAuthStream(AJPKObj: LGP_OBJECT; ANIP, AImiePierwsze, ANazwisko: LGP_PCHAR; ADataUrodzenia: LGP_DOUBLE; AKwota: LGP_CURRENCY; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_Send(AJPKObj: LGP_OBJECT; AInitUpload: LGP_PCHAR; AEncryptedData: LGP_OBJECT; var ARefNo: LGP_OBJECT; AGateType: LGP_INT32; AVerifySign: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SendStream(AJPKObj: LGP_OBJECT; AInitUpload: LGP_OBJECT; AEncryptedData: LGP_OBJECT; var ARefNo: LGP_OBJECT; AGateType: LGP_INT32; AVerifySign: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_RequestUPO(AJPKObj: LGP_OBJECT; ARefNo: LGP_PCHAR; AGateType: LGP_INT32; var AStatus: LGP_INT32; var AStatusDesc, ADetails, AUPO, ATimeStamp: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_RequestUPOStream(AJPKObj: LGP_OBJECT; ARefNo: LGP_PCHAR; AGateType: LGP_INT32; var AStatus: LGP_INT32; var AStatusDesc, ADetails, ATimeStamp: LGP_OBJECT; AUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// KSeF
function lgpKSeF_Create(var AKSeFObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetBase64EncoderClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetBase64EncoderClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetAES256EncryptClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetAES256EncryptClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetSHA256HashClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetSHA256HashClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetRandomGeneratorClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetRandomGeneratorClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetRSAKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetRSAKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetXAdES(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetXAdES(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetHTTPClient(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetHTTPClient(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetGateType(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetGateType(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetNIP(AKSeFObject: LGP_OBJECT; var ANIP: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetNIP(AKSeFObject: LGP_OBJECT; ANIP: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetFormCode(AKSeFObject: LGP_OBJECT; var AFCode: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetFormCode(AKSeFObject: LGP_OBJECT; AFCode: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetFormCodeSystemCode(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetFormCodeSystemCode(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetFormCodeTargetNamespace(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetFormCodeTargetNamespace(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetFormCodeValue(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetFormCodeValue(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetCertificate(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetCertificate(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetCertificateAuthType(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetCertificateAuthType(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetEncryption(AKSeFObject: LGP_OBJECT; var AEnc: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetEncryption(AKSeFObject: LGP_OBJECT; AEnc: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetSessionToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetSessionToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetSessionActive(AKSeFObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_GenerateAESKey(AKSeFObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_SessionInitSigned(AKSeFObject: LGP_OBJECT; var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SessionInitToken(AKSeFObject: LGP_OBJECT; var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SessionChalangePZ(AKSeFObject: LGP_OBJECT; var AChalange: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SessionInitPZ(AKSeFObject: LGP_OBJECT; ASignedChalange: LGP_PCHAR; var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SessionStatus(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; APageSize, APageOffset, AIncludeDetails: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SessionTerminate(AKSeFObject: LGP_OBJECT; AForce: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SessionGenerateInternalIdentifier(AKSeFObject: LGP_OBJECT; AInputDigitsSequence: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_InvoiceGet(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; AOutputStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceSend(AKSeFObject: LGP_OBJECT; ADataStream: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceStatus(AKSeFObject: LGP_OBJECT; AInvoiceElementReferenceNumber: LGP_PCHAR; AKSeFNumberVariant: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceVisibilityHide(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber, AHidingReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceVisibilityShow(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber, AHidingCancelationReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceVisibilityStatus(AKSeFObject: LGP_OBJECT; AHidingElementReferenceNumber: LGP_PCHAR; AKSeFNumberVariant: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceVisibility(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; AKSeFNumberVariant: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceScamCancel(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; AReportCancelationReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceScamReport(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; AReportReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceScamStatus(AKSeFObject: LGP_OBJECT; AScamElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_InvoiceScam(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_QueryInvoiceSync(AKSeFObject: LGP_OBJECT; AQueryCriteria: LGP_OBJECT; APageSize, APageOffset: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_QueryInvoiceAsyncInit(AKSeFObject: LGP_OBJECT; AQueryCriteria: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_QueryInvoiceAsyncStatus(AKSeFObject: LGP_OBJECT; AQueryElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_QueryInvoiceAsyncFetch(AKSeFObject: LGP_OBJECT; AQueryElementReferenceNumber, APartElementReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_PaymentIdentifierGetReferenceNumbers(AKSeFObject: LGP_OBJECT; APaymentIdentifier: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_PaymentIdentifierRequest(AKSeFObject: LGP_OBJECT; AKsefReferenceNumberList: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_CredentialsAccountingGrant(AKSeFObject: LGP_OBJECT; AGrantAccountingCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CredentialsAccountingRevoke(AKSeFObject: LGP_OBJECT; ARevokeAccountingCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CredentialsContextGrant(AKSeFObject: LGP_OBJECT; AGrantContextCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CredentialsContextRevoke(AKSeFObject: LGP_OBJECT; ARevokeContextCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CredentialsGenerateToken(AKSeFObject: LGP_OBJECT; AGenerateTokenRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CredentialsGrant(AKSeFObject: LGP_OBJECT; AGrantCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CredentialsRevoke(AKSeFObject: LGP_OBJECT; ARevokeCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CredentialsRevokeToken(AKSeFObject: LGP_OBJECT; ARevokeTokenRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CredentialsStatus(AKSeFObject: LGP_OBJECT; ACredentialsElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_QueryCredentialContextSync(AKSeFObject: LGP_OBJECT; AContextNip, ASourceIdentifier, ATargetIdentifier: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_QueryCredentialSync(AKSeFObject: LGP_OBJECT; AQuerySyncCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_CommonInvoiceKSeF(AKSeFObject: LGP_OBJECT; AInvoiceRequest: LGP_OBJECT; AOutStream: LGP_OBJECT; AGateType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CommonDownload(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber: LGP_PCHAR; ADownloadRequest: LGP_OBJECT; AOutStream: LGP_OBJECT; AGateType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CommonStatus(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AGateType: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CommonVerification(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber: LGP_PCHAR; AVerificationRequest: LGP_OBJECT; AGateType: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_BatchSign(AKSeFObject: LGP_OBJECT; AZIPDataStream: LGP_OBJECT; APZ: LGP_INT32; AEncryptedStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT; AZIPFileName, APartFileName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_BatchSend(AKSeFObject: LGP_OBJECT; APartStream: LGP_OBJECT; AInitUpload: LGP_PCHAR; var ANrRef: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// KSeF Obj
function lgpKSeF_CreateKSeFClass(AClassName: LGP_PCHAR): LGP_OBJECT; stdcall; external LGP_LIBNAME;

// VIES
function lgpViesService_CheckVatNumber(ACountryCode, AVatNumber,
  ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
  ATraderPostalCode, ATraderCity, ATraderCompanyType: LGP_PCHAR;
  AHTTPClient: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpViesService_CheckVatTestService(ACountryCode, AVatNumber,
  ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
  ATraderPostalCode, ATraderCity, ATraderCompanyType: LGP_PCHAR;
  AHTTPClient: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpViesService_CheckStatus(AHTTPClient: LGP_OBJECT;
  var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// KSeF 2.0
function lgpKSeF2_Create(var AKSeFObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetBase64EncoderClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetBase64EncoderClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetAES256EncryptClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetAES256EncryptClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetSHA256HashClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetSHA256HashClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetRandomGeneratorClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetRandomGeneratorClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetRSAPubliicKeyClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetRSAPubliicKeyClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetRSATokenEncKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetRSATokenEncKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetRSASymmetricKeyEncKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetRSASymmetricKeyEncKey(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetXAdES(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetXAdES(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetHTTPClient(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetHTTPClient(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetGateType(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetGateType(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetIdentifier(AKSeFObject: LGP_OBJECT; var AIdentifier: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetIdentifier(AKSeFObject: LGP_OBJECT; AIdentifier: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetIdentifierType(AKSeFObject: LGP_OBJECT; var AIdentifierType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetIdentifierType(AKSeFObject: LGP_OBJECT; AIdentifierType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetFormCode(AKSeFObject: LGP_OBJECT; var AFCode: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetFormCode(AKSeFObject: LGP_OBJECT; AFCode: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetFormCodeSystemCode(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetFormCodeSystemCode(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetFormCodeSchemaVersion(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetFormCodeValue(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetFormCodeValue(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetAuthCertificate(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetAuthCertificate(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetAuthCertificateSubject(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetAuthCertificateSubject(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetKsefToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetKsefToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetAuthenticationToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetAuthenticationToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetAuthenticationTokenValidUntil(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetAuthenticationTokenValidUntil(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetAuthenticationRefNo(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetAuthenticationRefNo(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetAccessToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetAccessToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetAccessTokenValidUntil(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetAccessTokenValidUntil(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetRefreshToken(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetRefreshToken(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetRefreshTokenValidUntil(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetRefreshTokenValidUntil(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetInteractiveEncryptionKey(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetInteractiveEncryptionKey(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetInteractiveVector(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetInteractiveVector(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetInteractiveReferenceNumber(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetInteractiveReferenceNumber(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetInteractiveValidUntil(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetInteractiveValidUntil(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetBatchReferenceNumber(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetBatchReferenceNumber(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetBatchPartSize(AKSeFObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetBatchPartSize(AKSeFObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetInvoiceExportEncryptionKey(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetInvoiceExportEncryptionKey(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetInvoiceExportVector(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetInvoiceExportVector(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetInvoiceExportReferenceNumber(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetInvoiceExportReferenceNumber(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetRequestPartStreamCargo(AKSeFObject: LGP_OBJECT; var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetRequestPartStreamCargo(AKSeFObject: LGP_OBJECT; AValue: LGP_POINTER): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_GetOnRequestPartStream(AKSeFObject: LGP_OBJECT; var AValue: TlgpRequestPartStreamEvent): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SetOnRequestPartStream(AKSeFObject: LGP_OBJECT; AValue: TlgpRequestPartStreamEvent): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_AuthChallenge(AKSeFObject: LGP_OBJECT; var AAuthenticationChallengeResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_AuthXadesSignatureGenerate(AKSeFObject: LGP_OBJECT; var AAuthenticationStructure: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_AuthXadesSignatureGenerate2(AKSeFObject: LGP_OBJECT; ASubjectIdType: LGP_INT32; AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32; var AAuthenticationStructure: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_AuthXadesSignature(AKSeFObject: LGP_OBJECT; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_AuthXadesSignature2(AKSeFObject: LGP_OBJECT; ACertificate: LGP_OBJECT; ASubjectIdType: LGP_INT32; AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_AuthXadesSignature3(AKSeFObject: LGP_OBJECT; ASignedAuthData: LGP_PCHAR; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_AuthKsefToken(AKSeFObject: LGP_OBJECT; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_AuthKsefToken2(AKSeFObject: LGP_OBJECT; AToken: LGP_PCHAR; AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_AuthStatus(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAuthenticationToken: LGP_PCHAR; var AAuthenticationOperationStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_AuthTokenRedem(AKSeFObject: LGP_OBJECT; AAuthenticationToken: LGP_PCHAR; var AAuthenticationTokensResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_AuthTokenRefresh(AKSeFObject: LGP_OBJECT; ARefreshToken: LGP_PCHAR; var AAuthenticationTokenRefreshResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_AuthSessions(AKSeFObject: LGP_OBJECT; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var AAuthenticationListResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_AuthSessionTerminateCurrent(AKSeFObject: LGP_OBJECT; AToken: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_AuthSessionTerminate(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_SecurityPublicKeyCertificates(AKSeFObject: LGP_OBJECT; AGate: LGP_INT32; var APublicKeyCertificateResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_SecurityLoadKeys(AKSeFObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_InteractiveOpen(AKSeFObject: LGP_OBJECT; AFormCode: LGP_INT32; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AFormCodeSystemCode: LGP_PCHAR; AFormCodeSchemaVersion: LGP_PCHAR; AFormCodeValue: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InteractiveOpen2(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InteractiveOpen3(AKSeFObject: LGP_OBJECT; var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InteractiveOpenSimple(AKSeFObject: LGP_OBJECT; var ASessionReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_InteractiveSend(AKSeFObject: LGP_OBJECT; AInvoiceStream: LGP_OBJECT; AOfflineMode: LGP_INT32; AHashOfCorrectedInvoice: LGP_PCHAR; ASessionReferenceNumber: LGP_PCHAR; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR; var AInvoiceRefenenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InteractiveSend2(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ASendInvoiceResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InteractiveSend3(AKSeFObject: LGP_OBJECT; AInvoiceStream: LGP_OBJECT; AOfflineMode: LGP_INT32; AHashOfCorrectedInvoice: LGP_PCHAR; var AInvoiceRefenenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_InteractiveClose(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_BatchPrepare(AKSeFObject: LGP_OBJECT; AZIPFileStream: LGP_OBJECT; AOutputStream: LGP_OBJECT; AFormCode: LGP_INT32; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AFormCodeSystemCode: LGP_PCHAR; AFormCodeSchemaVersion: LGP_PCHAR; AFormCodeValue: LGP_PCHAR; APartSize: LGP_INT32; var AOpenBatchSessionRequest: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_BatchPrepare2(AKSeFObject: LGP_OBJECT; AZIPFileStream: LGP_OBJECT; AOutputStream: LGP_OBJECT; APartSize: LGP_INT32; var AOpenBatchSessionRequest: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_BatchOpen(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AOpenBatchSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_BatchSendPart(AKSeFObject: LGP_OBJECT; APartUploadRequest: LGP_OBJECT; ADataStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_BatchClose(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_StatusSessions(AKSeFObject: LGP_OBJECT; ASessionType: LGP_INT32; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AReferenceNumber: LGP_PCHAR; ADateCreatedFrom: LGP_DOUBLE; ADateCreatedTo: LGP_DOUBLE; ADateClosedFrom: LGP_DOUBLE; ADateClosedTo: LGP_DOUBLE; ADateModifiedFrom: LGP_DOUBLE; ADateModifiedTo: LGP_DOUBLE; AStatuses: LGP_UINT32; AAccessToken: LGP_PCHAR; var ASessionsQueryResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusSession(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ASessionStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusInvoices(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusSessionInvoice(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusInvoicesFailed(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusUpoKsef(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AKsefNumber: LGP_PCHAR; AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusUpoKsefSimple(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AKsefNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusUpoSessionInvoice(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusUpoSessionInvoiceSimple(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusUpoSession(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AUpoReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_StatusUpoSessionSimple(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AUpoReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_InvoicesKsef(AKSeFObject: LGP_OBJECT; AKsefNumber: LGP_PCHAR; AOutputStram: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InvoicesQueryMetadata(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; APageOffset: LGP_INT32; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var AQueryInvoicesMetadataResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InvoicesExport(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AExportInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InvoicesExport2(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR; var AExportInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InvoicesExportSimple(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var ASessionReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InvoicesExportSimple2(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR; var AReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InvoicesExportStatus(AKSeFObject: LGP_OBJECT; AOperationReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AInvoiceExportStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_InvoicesExportDownload(AKSeFObject: LGP_OBJECT; AStatusResponse: LGP_OBJECT; AOutputStream: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_TokensGenerate(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AGenerateTokenResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_TokensGenerate2(AKSeFObject: LGP_OBJECT; APermissions: LGP_INT32; ADescription: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AGenerateTokenResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_TokensList(AKSeFObject: LGP_OBJECT; AStatus: LGP_INT32; ADescription: LGP_PCHAR; AAuthorIdentifier: LGP_PCHAR; AAuthorIdentifierType: LGP_INT32; APageSize: LGP_INT32; AContinuationToken: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AQueryTokensResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_TokensStatus(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ATokenStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_TokensRevoke(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF2_TestdataSubject(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_TestdataSubjectRemove(AKSeFObject: LGP_OBJECT; ASubjectNip: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_TestdataPerson(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF2_TestdataPersonRemove(AKSeFObject: LGP_OBJECT; ANip: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// KSeF 2.0 obiekty
function lgpKSeF2_CreateKSeFClass(AClassName: LGP_PCHAR): LGP_OBJECT; stdcall; external LGP_LIBNAME;
function lgpKSeF2_KSeFClassSetExt(AObject: LGP_OBJECT; AExtObj: LGP_POINTER): LGP_OBJECT; stdcall; external LGP_LIBNAME;

// Zgodnosc z poprzednia wersja biblioteki
function edekInicjuj(AWinHandle: THandle; ATransport: LongWord; ARodzajSHA: LongWord): LongWord; stdcall; external LGP_LIBNAME;
function edekOstatniBladTekst: PWideChar; stdcall; external LGP_LIBNAME;
procedure edekZwolnijTekst(ATekst: PWideChar); stdcall; external LGP_LIBNAME;

function edekCertyfikatIlosc: Integer; stdcall; external LGP_LIBNAME;
function edekCertyfikatDane(AIndex: Integer; ADane:Integer; var ARes: PWideChar): Integer; stdcall; external LGP_LIBNAME;
procedure edekCertyfikatPokaz(AIndex: Integer); stdcall; external LGP_LIBNAME;

function edekPodpisz(APlikWej, APlikWyj: PWideChar; ACertIdx: Integer; ACertSerialNo: PWideChar): Integer; stdcall; external LGP_LIBNAME;
function edekPodpiszAut(APlikWej, APlikWyj, ANIP, AImie, ANazwisko, ADataUr, AKwota: PWideChar): Integer; stdcall; external LGP_LIBNAME;
function edekWyslij(APlikDek: PWideChar; ABramkaTestowa: LongBool; APodpis: LongBool; var ArefID: PWideChar; var AStatus: Integer; var AStatusOpis: PWideChar): Integer; stdcall; external LGP_LIBNAME;
function edekPobierzUPO(ARefId: PWideChar; ABramkaTestowa: LongBool; APlikWyj: PWideChar; var AStatus: Integer; var AStatusOpis: PWideChar): Integer; stdcall; external LGP_LIBNAME;

function jpkPodpisz(APlikWej: PWideChar; ACertyfikat: Integer; ATestowa: LongBool; ACertSerialNo: PWideChar): Integer; stdcall; external LGP_LIBNAME;
function jpkPodpisz2(APlikWej: PWideChar; ACertyfikat: Integer; ATestowa, ADoraznie: LongBool; ACertSerialNo: PWideChar): Integer; stdcall; external LGP_LIBNAME;
function jpkPodpiszAut(APlikWej: PWideChar; ATestowa, ADoraznie: LongBool; ADANip, ADAImie, ADANazwisko, ADAData, ADAKwota: PWideChar): Integer; stdcall; external LGP_LIBNAME;
function jpkWyslij(APlik: PWideChar; ATestowa: LongBool; var ANrRef: PWideChar): Integer; stdcall; external LGP_LIBNAME;
function jpkWyslij2(APlik: PWideChar; ATestowa, AWeryfPodpis: LongBool; var ANrRef: PWideChar): Integer; stdcall; external LGP_LIBNAME;
function jpkPobierzUPO(ANrRef: PWideChar; APlikWyj: PWideChar; ATestowa: LongBool): Integer; stdcall; external LGP_LIBNAME;

function edekWeryfikuj(APlik: PWideChar): Integer; stdcall; external LGP_LIBNAME; deprecated;

function jpkMicroPodpisz(APlikWej, APlikWyj, ANIP, AImie, ANazwisko, ADataUr, AKwota, AEmail: PWideChar): Integer; stdcall; external LGP_LIBNAME; deprecated;
function jpkMicroWyslij(APlikJPK: PWideChar; ABramkaTestowa: LongBool; var ARefID: PWideChar; var AStatusNo: Integer; var AStatusOpis: PWideChar): Integer; stdcall; external LGP_LIBNAME; deprecated;
function jpkMicroPobierzUPO(APlikWyj: PWideChar; ARefID: PWideChar; ABramkaTestowa: LongBool; var AStatusNo: Integer; var AStatusOpis: PWideChar): Integer; stdcall; external LGP_LIBNAME; deprecated;
function mfSprawdzVAT(ANIP: PWideChar): LongWord; stdcall; external LGP_LIBNAME; deprecated;

{$ELSE} {LIBGOVPL_DYNAMIC}

var

  // Backend
  lgplVersion: function: LGP_UINT32; stdcall;
  lgplListDrivers: function(AClassType: LGP_INT32): LGP_PCHAR; stdcall;
  lgplDriverCount: function(AClassType: LGP_INT32): LGP_INT32; stdcall;
  lgplDriverName: function(AClassType, ADriverIndex: LGP_INT32): LGP_PCHAR; stdcall;
  lgplInit: function: LGP_INT32; stdcall;
  lgplExit: function: LGP_INT32; stdcall;
  lgplSetDefaultDriver: function(ADriverClass: LGP_INT32; ADriverName: LGP_PCHAR): LGP_INT32; stdcall;

  lgpHTTPClient_Create: function(AClassName: LGP_PCHAR; var AHttpClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpHTTPClient_GetIgnoreSSLErrors: function(AHTTPClientObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpHTTPClient_SetIgnoreSSLErrors: function(AHTTPClientObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;

  lgpRSAEncrypt_CreateKey: function(AClassName: LGP_PCHAR; AKeyStream: LGP_OBJECT; AFormat: LGP_INT32; var ARSAKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpCertificate_GetVersion: function(ACertificate: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetDisplayName: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetSubject: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetSubjectField: function(ACertificate: LGP_OBJECT; AField: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetSubjectFields: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetSubjectUID: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetIssuer: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetIssuerField: function(ACertificate: LGP_OBJECT; AField: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetIssuerFields: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetIssuerUID: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetSerialNoDec: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetSerialNoHex: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetValidFrom: function(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetValidTo: function(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetSignature: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetKeyUsage: function(ACertificate: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpCertificate_GetPublicKeyAlgorithm: function(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificate_SetPIN: function(ACertificate: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;

  lgpCNGCertificate_ShowCertificateInfo: function(ACertificate: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall;

  lgpCertificateSigner_Create: function(AClassName: LGP_PCHAR; var ACertSigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificateSigner_List: function(ACertificateSigner: LGP_OBJECT; var ACertList: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificateSigner_FindBySerialNumber: function(ACertificateSigner: LGP_OBJECT; ASerialNo: LGP_PCHAR; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificateSigner_UISelect: function(ACertificateSigner: LGP_OBJECT; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpCertificateSigner_LoadFromStream: function(ACertificateSigner: LGP_OBJECT; ACertificateStream: LGP_OBJECT; ACertificateFormat: LGP_INT32;
    APrivateKeyStream: LGP_OBJECT; APrivateKeyFormat: LGP_INT32; APassword: LGP_PCHAR; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpCertificates_Create: function(AOwnsObjects: LGP_INT32; var ACertificates: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpCNGCertificateSigner_SetHWnd: function(ACertificateSigner: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall;

  lgpEncodeDateTime: function(AYear, AMonth, ADay, AHour, AMinute, ASec, AMSec: LGP_INT32): LGP_PASDATETIME; stdcall;
  lgpDecodeDateTime: procedure(ADateTime: LGP_PASDATETIME; var AYear, AMonth, ADay, AHour, AMinute, ASec, AMSec: LGP_INT32); stdcall;

  lgpLoadLibXML2: function(AFileName: LGP_PCHAR): LGP_INT32; stdcall;

  // Object
  lgpObject_Free: function(AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpObject_ClassName: function(AObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpObject_GetStringProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpObject_SetStringProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpObject_GetIntegerProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpObject_SetIntegerProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  {$IFDEF FPC}
  lgpObject_GetDoubleProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  {$ELSE}
  _lgpObject_GetDoubleProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  {$ENDIF}
  lgpObject_SetDoubleProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  lgpObject_GetObjectProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpObject_SetObjectProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpObject_GetCurrencyProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_CURRENCY): LGP_EXCEPTION; stdcall;
  lgpObject_SetCurrencyProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_CURRENCY): LGP_EXCEPTION; stdcall;
  lgpObject_GetBooleanProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpObject_SetBooleanProp: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpObject_GetInt64Prop: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT64): LGP_EXCEPTION; stdcall;
  lgpObject_SetInt64Prop: function(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT64): LGP_EXCEPTION; stdcall;

  lgpStringObject_GetValue: function(AStringObject: LGP_OBJECT; var AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;

  lgpListObject_GetCount: function(AListObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpListObject_GetItem: function(AListObject: LGP_OBJECT; AIndex: LGP_INT32; var AItem: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpListObject_Delete: function(AListObject: LGP_OBJECT; AIndex: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpListObject_Remove: function(AListObject: LGP_OBJECT; AItem: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpListObject_Add: function(AListObject: LGP_OBJECT; AItem: LGP_OBJECT; var AIndex: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpListObject_GetOwnsObjects: function(AListObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpListObject_SetOwnsObjects: function(AListObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;

  lgpDbgObjectCount: function: LGP_INT32; stdcall;

  // Stream
  lgpStream_Create: function(AStreamObject: Pointer; AReadFunc: TlgpStreamReadFunc;
    AWriteFunc: TlgpStreamWriteFunc; ASeekFunc: TlgpStreamSeekFunc;
    AGetPositionFunc: TlgpStreamGetPositionFunc; AGetSizeFunc: TlgpStreamGetSizeFunc;
    var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpFileStream_Create: function(AFileName: LGP_PCHAR; AMode: LGP_INT32; var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpStringStream_Create: function(AData: LGP_PCHAR; var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpStringStream_GetString: function(AStringStream: LGP_OBJECT; var AString: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpMemoryStream_Create: function(var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpMemoryStream_GetData: function(AMemoryStream: LGP_OBJECT; var AData: LGP_POINTER): LGP_EXCEPTION; stdcall;

  lgpStream_GetPosition: function(AStream: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpStream_SetPosition: function(AStream: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpStream_GetSize: function(AStream: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpStream_Read: function(AStream: LGP_OBJECT; AData: LGP_POINTER; ADataSize: LGP_INT32; var AReaded: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpStream_Write: function(AStream: LGP_OBJECT; AData: LGP_POINTER; ADataSize: LGP_INT32; var AWritten: LGP_INT32): LGP_EXCEPTION; stdcall;

  // WST EDek Gate
  lgpWST_RegisterTransport: function: LGP_EXCEPTiON; stdcall;
  lgpWST_GetHTTPClient: function(var AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpWST_SetHTTPClient: function(AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  // XML
  lgpXMLReader_CreateFromFile: function(AClassName: LGP_PCHAR; AFileName: LGP_PCHAR; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXMLReader_CreateFromStream: function(AClassName: LGP_PCHAR; AStream: LGP_OBJECT; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXMLReader_CreateFromString: function(AClassName: LGP_PCHAR; AString: LGP_PCHAR; var AReader: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXMLReader_ReadValue: function(AReader: LGP_OBJECT; AXPath: LGP_PCHAR; var AValue: LGP_OBJECT; var AFound: LGP_INT32): LGP_EXCEPTION; stdcall;

  lgpXMLValidator_Create: function(AClassName: LGP_PCHAR; var AValidator: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXMLValidator_AddSchemaLocation: function(AValidator: LGP_OBJECT; ANS: LGP_PCHAR; ALocation: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpXMLValidator_AddSchemaReader: function(AValidator: LGP_OBJECT; ANS: LGP_PCHAR; AXMLDoc: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXMLValidator_ClearSchemas: function(AValidator: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXMLValidator_Validate: function(AValidator: LGP_OBJECT; AXMLDoc: LGP_OBJECT; var AErrors: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpXMLXSLTransformation_Create: function(AClassName: LGP_PCHAR; var ATransformation: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXMLXSLTransformation_AddStyleLocation: function(ATransformation: LGP_OBJECT; ANS: LGP_PCHAR; ALocation: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpXMLXSLTransformation_AddStyleReader: function(ATransformation: LGP_OBJECT; ANS: LGP_PCHAR; AXMLDoc: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXMLXSLTransformation_ClearStyles: function(ATransformation: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXMLXSLTransformation_Transform: function (ATransformation: LGP_OBJECT; AXMLDoc: LGP_OBJECT; AOutStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpLibXML2Backend_LibXMLLoaded: function: LGP_INT32; stdcall;
  lgpLibXML2Backend_LibXSLTLoaded: function: LGP_INT32; stdcall;
  lgpLibXML2Backend_LoadLibXML: function(ALibXML: LGP_PCHAR): LGP_INT32; stdcall;
  lgpLibXML2Backend_LoadLibXSLT: function(ALibXSLT, ALibEXSLT: LGP_PCHAR): LGP_INT32; stdcall;
  lgpLibXML2Backend_GetCacheExternals: function: LGP_INT32; stdcall;
  lgpLibXML2Backend_SetCacheExternals: procedure(AValue: LGP_INT32);
  lgpLibXML2Backend_GetCacheDir: function: LGP_PCHAR; stdcall;
  lgpLibXML2Backend_SetCacheDir: procedure(AValue: LGP_PCHAR); stdcall;
  lgpLibXML2Backend_GetHTTPClient: function: LGP_OBJECT; stdcall;
  lgpLibXML2Backend_SetHTTPClient: function(AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  {$IFDEF LGP_ENABLE_PKCS11}
  // PKCS#11
  lgpPKCS11Certificate_GetSession: function(ACertificate: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpPKCS11Session_CheckActive: function(ASession: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpPKCS11Session_Login: function(ASession: LGP_OBJECT; APIN: LGP_PCHAR; AUserType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpPKCS11Session_Logout: function(ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
  lgpPKCS11Session_GetSigner: function(ASession: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpPKCS11Session_GetHandle: function(ASession: LGP_OBJECT; var AHandle: LGP_CK_ULONG): LGP_EXCEPTION; stdcall;
  lgpPKCS11Session_GetSlotID: function(ASession: LGP_OBJECT; var ASlotID: LGP_CK_ULONG): LGP_EXCEPTION; stdcall;
  lgpPKCS11Session_GetState: function(ASession: LGP_OBJECT; var AState: LGP_UINT32): LGP_EXCEPTION; stdcall;
  lgpPKCS11Session_GetFlags: function(ASession: LGP_OBJECT; var AFlags: LGP_UINT32): LGP_EXCEPTION; stdcall;

  lgpPKCS11CertificateSigner_LoadLibrary: function(ASigner: LGP_OBJECT; ALibName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_FreeLibrary: function(ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_GetInfo: function(ASigner: LGP_OBJECT; var AInfo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_GetSlots: function(ASigner: LGP_OBJECT; AWithToken: LGP_INT32; var AList: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_SessionStart: function(ASigner: LGP_OBJECT; ACertificate: LGP_OBJECT; var ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_SessionClose: function(ASigner: LGP_OBJECT; ASession: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_SessionCloseIdx: function(ASigner: LGP_OBJECT; ASessionIndex: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_SessionCloseAll: function(ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_GetLibLoaded: function(ASigner: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_GetLibFileName: function(ASigner: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_GetSessions: function(ASigner: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_FunctionList: function(ASigner: LGP_OBJECT; var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_CheckLibrary: function(ALibFile: LGP_PCHAR; var AKomunikat: LGP_OBJECT; var AResult: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpPKCS11CertificateSigner_GetLibraryInfo: function(ALibFile: LGP_PCHAR; var ALibInfo: LGP_OBJECT; var AKomunikat: LGP_OBJECT; var AResult: LGP_INT32): LGP_EXCEPTION; stdcall;
  {$ENDIF}

  // XAdES
  lgpXAdES_Create: function(ASHA1HashClass, ASHA256HashClass, ABase64EncoderClass: LGP_PCHAR;
    ASigner: LGP_OBJECT; var AXAdESObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXAdES_GetSHA1HashClass: function(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpXAdES_SetSHA1HashClass: function(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpXAdES_GetSHA256HashClass: function(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpXAdES_SetSHA256HashClass: function(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpXAdES_GetBase64EncoderClass: function(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpXAdES_SetBase64EncoderClass: function(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpXAdES_GetSigner: function(AXAdESObject: LGP_OBJECT; var ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXAdES_SetSigner: function(AXAdESObject: LGP_OBJECT; ASigner: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpXAdES_GetSignType: function(AXAdESObject: LGP_OBJECT; var ASignType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpXAdES_SetSignType: function(AXAdESObject: LGP_OBJECT; ASignType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpXAdES_GetSerialNoFormat: function(AXAdESObject: LGP_OBJECT; var ASerialNoFormat: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpXAdES_SetSerialNoFormat: function(AXAdESObject: LGP_OBJECT; ASerialNoFormat: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpXAdES_GetIncludeSigningTime: function(AXAdESObject: LGP_OBJECT; var AIncludeSigningTime: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpXAdES_SetIncludeSigningTime: function(AXAdESObject: LGP_OBJECT; AIncludeSigningTime: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpXAdES_GetSigningTime: function(AXAdESObject: LGP_OBJECT; var ASigningTime: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;
  lgpXAdES_SetSigningTime: function(AXAdESObject: LGP_OBJECT; ASigningTime: LGP_PASDATETIME): LGP_EXCEPTION; stdcall;

  // EDek
  lgpEDek_Create: function(AXMLCanonizator, AEDekGate: LGP_PCHAR; var AEDekObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpEDek_GetXAdES: function(AEDekObj: LGP_OBJECT; var AXAdESObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpEDek_SetXAdES: function(AEDekObj: LGP_OBJECT; AXAdESObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpEDek_GetXMLCanonizatorClass: function(AEDekObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpEDek_SetXMLCanonizatorClass: function(AEDekObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpEDek_GetEDekGateClass: function(AEDekObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpEDek_SetEDekGateClass: function(AEDekObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpEDek_GetCanonization: function(AEDekObj: LGP_OBJECT; var AC14N: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpEDek_SetCanonization: function(AEDekObj: LGP_OBJECT; AC14N: LGP_INT32): LGP_EXCEPTION; stdcall;

  lgpEDek_PodpiszCertyfikatem: function(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR; ACertyfikat: LGP_OBJECT; var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpEDek_PodpiszCertyfikatemStream: function(AEDekObj: LGP_OBJECT; ADane: LGP_OBJECT; ACertyfikat: LGP_OBJECT; ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpEDek_PodpiszDanymiAut: function(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR; AImie, ANazwisko, ANIP: LGP_PCHAR; ADataUr: LGP_DOUBLE; AKwota: LGP_CURRENCY; var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpEDek_PodpiszDanymiAutStream: function(AEDekObj: LGP_OBJECT; ADane: LGP_OBJECT; AImie, ANazwisko, ANIP: LGP_PCHAR; ADataUr: LGP_DOUBLE; AKwota: LGP_CURRENCY; ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpEDek_Wyslij: function(AEDekObj: LGP_OBJECT; ADanePodpisane: LGP_PCHAR; ARodzajBramki: LGP_INT32; ARodzajPodpisu: LGP_INT32; var ANrRef: LGP_OBJECT; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpEDek_WyslijStream: function(AEDekObj: LGP_OBJECT; ADanePodpisane: LGP_OBJECT; ARodzajBramki: LGP_INT32; ARodzajPodpisu: LGP_INT32; var ANrRef: LGP_OBJECT; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpEDek_PobierzUPO: function(AEDekObj: LGP_OBJECT; ANrRef: LGP_PCHAR; ARodzajBramki: LGP_INT32; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT; var ADaneUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpEDek_PobierzUPOStream: function(AEDekObj: LGP_OBJECT; ANrRef: LGP_PCHAR; ARodzajBramki: LGP_INT32; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT; ADaneUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  // JPK
  lgpJPK_Create: function(ABase64EncoderClass, AAES256EncryptClass, AMD5HashClass, ASHA256HashClass, AZipperClass, ARSAEncryptClass, ARandomGeneratorClass, AXMLReaderClass: LGP_PCHAR; var AJPKObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpJPK_GetBase64EncoderClass: function(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpJPK_SetBase64EncoderClass: function(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpJPK_GetAES256EncryptClass: function(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpJPK_SetAES256EncryptClass: function(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpJPK_GetMD5HashClass: function(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpJPK_SetMD5HashClass: function(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpJPK_GetSHA256HashClass: function(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpJPK_SetSHA256HashClass: function(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpJPK_GetZipperClass: function(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpJPK_SetZipperClass: function(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpJPK_GetRandomGeneratorClass: function(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpJPK_SetRandomGeneratorClass: function(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpJPK_GetXMLReaderClass: function(AJPKObj: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpJPK_SetXMLReaderClass: function(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;

  lgpJPK_GetRSAKeyProd: function(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_SetRSAKeyProd: function(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_GetRSAKeyTest: function(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_SetRSAKeyTest: function(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_GetXAdES: function(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_SetXAdES: function(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_GetHTTPClient: function(AJPKObj: LGP_OBJECT; var AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_SetHTTPClient: function(AJPKObj: LGP_OBJECT; AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpJPK_SignCerificate: function(AJPKObj: LGP_OBJECT; ACertificate: LGP_OBJECT; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_SignCerificateStream: function(AJPKObj: LGP_OBJECT; ACertificate: LGP_OBJECT; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_SignDataAuth: function(AJPKObj: LGP_OBJECT; ANIP, AImiePierwsze, ANazwisko: LGP_PCHAR; ADataUrodzenia: LGP_DOUBLE; AKwota: LGP_CURRENCY; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_SignDataAuthStream: function(AJPKObj: LGP_OBJECT; ANIP, AImiePierwsze, ANazwisko: LGP_PCHAR; ADataUrodzenia: LGP_DOUBLE; AKwota: LGP_CURRENCY; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_Send: function(AJPKObj: LGP_OBJECT; AInitUpload: LGP_PCHAR; AEncryptedData: LGP_OBJECT; var ARefNo: LGP_OBJECT; AGateType: LGP_INT32; AVerifySign: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpJPK_SendStream: function(AJPKObj: LGP_OBJECT; AInitUpload: LGP_OBJECT; AEncryptedData: LGP_OBJECT; var ARefNo: LGP_OBJECT; AGateType: LGP_INT32; AVerifySign: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpJPK_RequestUPO: function(AJPKObj: LGP_OBJECT; ARefNo: LGP_PCHAR; AGateType: LGP_INT32; var AStatus: LGP_INT32; var AStatusDesc, ADetails, AUPO, ATimeStamp: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpJPK_RequestUPOStream: function(AJPKObj: LGP_OBJECT; ARefNo: LGP_PCHAR; AGateType: LGP_INT32; var AStatus: LGP_INT32; var AStatusDesc, ADetails, ATimeStamp: LGP_OBJECT; AUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  // KSeF
  lgpKSeF_Create: function(var AKSeFObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetBase64EncoderClass: function(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetBase64EncoderClass: function(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetAES256EncryptClass: function(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetAES256EncryptClass: function(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetSHA256HashClass: function(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetSHA256HashClass: function(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetRandomGeneratorClass: function(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetRandomGeneratorClass: function(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetRSAKey: function(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetRSAKey: function(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetXAdES: function(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetXAdES: function(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetHTTPClient: function(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetHTTPClient: function(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetGateType: function(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetGateType: function(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetNIP: function(AKSeFObject: LGP_OBJECT; var ANIP: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetNIP: function(AKSeFObject: LGP_OBJECT; ANIP: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetFormCode: function(AKSeFObject: LGP_OBJECT; var AFCode: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetFormCode: function(AKSeFObject: LGP_OBJECT; AFCode: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetFormCodeSystemCode: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetFormCodeSystemCode: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetFormCodeSchemaVersion: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetFormCodeSchemaVersion: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetFormCodeTargetNamespace: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetFormCodeTargetNamespace: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetFormCodeValue: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetFormCodeValue: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetCertificate: function(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetCertificate: function(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetCertificateAuthType: function(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetCertificateAuthType: function(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetToken: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetToken: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetEncryption: function(AKSeFObject: LGP_OBJECT; var AEnc: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetEncryption: function(AKSeFObject: LGP_OBJECT; AEnc: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetSessionToken: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SetSessionToken: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_GetSessionActive: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;

  lgpKSeF_GenerateAESKey: function(AKSeFObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF_SessionInitSigned: function(AKSeFObject: LGP_OBJECT; var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SessionInitToken: function(AKSeFObject: LGP_OBJECT; var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SessionChalangePZ: function(AKSeFObject: LGP_OBJECT; var AChalange: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SessionInitPZ: function(AKSeFObject: LGP_OBJECT; ASignedChalange: LGP_PCHAR; var AInitSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SessionStatus: function(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; APageSize, APageOffset, AIncludeDetails: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SessionTerminate: function(AKSeFObject: LGP_OBJECT; AForce: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_SessionGenerateInternalIdentifier: function(AKSeFObject: LGP_OBJECT; AInputDigitsSequence: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF_InvoiceGet: function(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; AOutputStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceSend: function(AKSeFObject: LGP_OBJECT; ADataStream: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceStatus: function(AKSeFObject: LGP_OBJECT; AInvoiceElementReferenceNumber: LGP_PCHAR; AKSeFNumberVariant: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceVisibilityHide: function(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber, AHidingReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceVisibilityShow: function(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber, AHidingCancelationReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceVisibilityStatus: function(AKSeFObject: LGP_OBJECT; AHidingElementReferenceNumber: LGP_PCHAR; AKSeFNumberVariant: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceVisibility: function(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; AKSeFNumberVariant: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceScamCancel: function(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; AReportCancelationReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceScamReport: function(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; AReportReason: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceScamStatus: function(AKSeFObject: LGP_OBJECT; AScamElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_InvoiceScam: function(AKSeFObject: LGP_OBJECT; AKSeFReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF_QueryInvoiceSync: function(AKSeFObject: LGP_OBJECT; AQueryCriteria: LGP_OBJECT; APageSize, APageOffset: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_QueryInvoiceAsyncInit: function(AKSeFObject: LGP_OBJECT; AQueryCriteria: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_QueryInvoiceAsyncStatus: function(AKSeFObject: LGP_OBJECT; AQueryElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_QueryInvoiceAsyncFetch: function(AKSeFObject: LGP_OBJECT; AQueryElementReferenceNumber, APartElementReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF_PaymentIdentifierGetReferenceNumbers: function(AKSeFObject: LGP_OBJECT; APaymentIdentifier: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_PaymentIdentifierRequest: function(AKSeFObject: LGP_OBJECT; AKsefReferenceNumberList: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF_CredentialsAccountingGrant: function(AKSeFObject: LGP_OBJECT; AGrantAccountingCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_CredentialsAccountingRevoke: function(AKSeFObject: LGP_OBJECT; ARevokeAccountingCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_CredentialsContextGrant: function(AKSeFObject: LGP_OBJECT; AGrantContextCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_CredentialsContextRevoke: function(AKSeFObject: LGP_OBJECT; ARevokeContextCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_CredentialsGenerateToken: function(AKSeFObject: LGP_OBJECT; AGenerateTokenRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_CredentialsGrant: function(AKSeFObject: LGP_OBJECT; AGrantCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_CredentialsRevoke: function(AKSeFObject: LGP_OBJECT; ARevokeCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_CredentialsRevokeToken: function(AKSeFObject: LGP_OBJECT; ARevokeTokenRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_CredentialsStatus: function(AKSeFObject: LGP_OBJECT; ACredentialsElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_QueryCredentialContextSync: function(AKSeFObject: LGP_OBJECT; AContextNip, ASourceIdentifier, ATargetIdentifier: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_QueryCredentialSync: function(AKSeFObject: LGP_OBJECT; AQuerySyncCredentialsRequest: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF_CommonInvoiceKSeF: function(AKSeFObject: LGP_OBJECT; AInvoiceRequest: LGP_OBJECT; AOutStream: LGP_OBJECT; AGateType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_CommonDownload: function(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber: LGP_PCHAR; ADownloadRequest: LGP_OBJECT; AOutStream: LGP_OBJECT; AGateType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF_CommonStatus: function(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AGateType: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF_CommonVerification: function(AKSeFObject: LGP_OBJECT; AKsefReferenceNumber: LGP_PCHAR; AVerificationRequest: LGP_OBJECT; AGateType: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF_BatchSign: function(AKSeFObject: LGP_OBJECT; AZIPDataStream: LGP_OBJECT; APZ: LGP_INT32; AEncryptedStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT; AZIPFileName, APartFileName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF_BatchSend: function(AKSeFObject: LGP_OBJECT; APartStream: LGP_OBJECT; AInitUpload: LGP_PCHAR; var ANrRef: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  // KSeF Obj
  lgpKSeF_CreateKSeFClass: function(AClassName: LGP_PCHAR): LGP_OBJECT; stdcall;

  // VIES
  lgpViesService_CheckVatNumber: function(ACountryCode, AVatNumber,
    ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
    ATraderPostalCode, ATraderCity, ATraderCompanyType: LGP_PCHAR;
    AHTTPClient: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpViesService_CheckVatTestService: function(ACountryCode, AVatNumber,
    ARequesterMemberStateCode, ARequesterNumber, ATraderName, ATraderStreet,
    ATraderPostalCode, ATraderCity, ATraderCompanyType: LGP_PCHAR;
    AHTTPClient: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpViesService_CheckStatus: function(AHTTPClient: LGP_OBJECT;
    var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_Create: function(var AKSeFObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetBase64EncoderClass: function(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetBase64EncoderClass: function(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetAES256EncryptClass: function(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetAES256EncryptClass: function(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetSHA256HashClass: function(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetSHA256HashClass: function(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetRandomGeneratorClass: function(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetRandomGeneratorClass: function(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetRSAPubliicKeyClass: function(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PSSTRING): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetRSAPubliicKeyClass: function(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetRSATokenEncKey: function(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetRSATokenEncKey: function(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetRSASymmetricKeyEncKey: function(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; var AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetRSASymmetricKeyEncKey: function(AKSeFObject: LGP_OBJECT; AKeyType: LGP_INT32; AKey: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetXAdES: function(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetXAdES: function(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetHTTPClient: function(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetHTTPClient: function(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetGateType: function(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetGateType: function(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetIdentifier: function(AKSeFObject: LGP_OBJECT; var AIdentifier: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetIdentifier: function(AKSeFObject: LGP_OBJECT; AIdentifier: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetIdentifierType: function(AKSeFObject: LGP_OBJECT; var AIdentifierType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetIdentifierType: function(AKSeFObject: LGP_OBJECT; AIdentifierType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetFormCode: function(AKSeFObject: LGP_OBJECT; var AFCode: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetFormCode: function(AKSeFObject: LGP_OBJECT; AFCode: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetFormCodeSystemCode: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetFormCodeSystemCode: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetFormCodeSchemaVersion: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetFormCodeSchemaVersion: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetFormCodeValue: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetFormCodeValue: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetAuthCertificate: function(AKSeFObject: LGP_OBJECT; var AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetAuthCertificate: function(AKSeFObject: LGP_OBJECT; AObj: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetAuthCertificateSubject: function(AKSeFObject: LGP_OBJECT; var AType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetAuthCertificateSubject: function(AKSeFObject: LGP_OBJECT; AType: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetKsefToken: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetKsefToken: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetAuthenticationToken: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetAuthenticationToken: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetAuthenticationTokenValidUntil: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetAuthenticationTokenValidUntil: function(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetAuthenticationRefNo: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetAuthenticationRefNo: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetAccessToken: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetAccessToken: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetAccessTokenValidUntil: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetAccessTokenValidUntil: function(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetRefreshToken: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetRefreshToken: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetRefreshTokenValidUntil: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetRefreshTokenValidUntil: function(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetInteractiveEncryptionKey: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetInteractiveEncryptionKey: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetInteractiveVector: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetInteractiveVector: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetInteractiveReferenceNumber: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetInteractiveReferenceNumber: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetInteractiveValidUntil: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetInteractiveValidUntil: function(AKSeFObject: LGP_OBJECT; AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetBatchReferenceNumber: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetBatchReferenceNumber: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetBatchPartSize: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetBatchPartSize: function(AKSeFObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetInvoiceExportEncryptionKey: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetInvoiceExportEncryptionKey: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetInvoiceExportVector: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetInvoiceExportVector: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PBYTE): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetInvoiceExportReferenceNumber: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetInvoiceExportReferenceNumber: function(AKSeFObject: LGP_OBJECT; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetRequestPartStreamCargo: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetRequestPartStreamCargo: function(AKSeFObject: LGP_OBJECT; AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
  lgpKSeF2_GetOnRequestPartStream: function(AKSeFObject: LGP_OBJECT; var AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SetOnRequestPartStream: function(AKSeFObject: LGP_OBJECT; AValue: LGP_POINTER): LGP_EXCEPTION; stdcall;

  lgpKSeF2_AuthChallenge: function(AKSeFObject: LGP_OBJECT; var AAuthenticationChallengeResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_AuthXadesSignatureGenerate: function(AKSeFObject: LGP_OBJECT; var AAuthenticationStructure: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_AuthXadesSignatureGenerate2: function(AKSeFObject: LGP_OBJECT; ASubjectIdType: LGP_INT32; AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32; var AAuthenticationStructure: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_AuthXadesSignature: function(AKSeFObject: LGP_OBJECT; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_AuthXadesSignature2: function(AKSeFObject: LGP_OBJECT; ACertificate: LGP_OBJECT; ASubjectIdType: LGP_INT32; AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_AuthXadesSignature3: function(AKSeFObject: LGP_OBJECT; ASignedAuthData: LGP_PCHAR; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_AuthKsefToken: function(AKSeFObject: LGP_OBJECT; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_AuthKsefToken2: function(AKSeFObject: LGP_OBJECT; AToken: LGP_PCHAR; AIdentifier: LGP_PCHAR; AIdentifierType: LGP_INT32; var AAuthenticationInitResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_AuthStatus: function(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAuthenticationToken: LGP_PCHAR; var AAuthenticationOperationStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_AuthTokenRedem: function(AKSeFObject: LGP_OBJECT; AAuthenticationToken: LGP_PCHAR; var AAuthenticationTokensResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_AuthTokenRefresh: function(AKSeFObject: LGP_OBJECT; ARefreshToken: LGP_PCHAR; var AAuthenticationTokenRefreshResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_AuthSessions: function(AKSeFObject: LGP_OBJECT; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var AAuthenticationListResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_AuthSessionTerminateCurrent: function(AKSeFObject: LGP_OBJECT; AToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_AuthSessionTerminate: function(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;

  lgpKSeF2_SecurityPublicKeyCertificates: function(AKSeFObject: LGP_OBJECT; AGate: LGP_INT32; var APublicKeyCertificateResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_SecurityLoadKeys: function(AKSeFObject: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_InteractiveOpen: function(AKSeFObject: LGP_OBJECT; AFormCode: LGP_INT32; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AFormCodeSystemCode: LGP_PCHAR; AFormCodeSchemaVersion: LGP_PCHAR; AFormCodeValue: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InteractiveOpen2: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InteractiveOpen3: function(AKSeFObject: LGP_OBJECT; var AOpenOnlineSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InteractiveOpenSimple: function(AKSeFObject: LGP_OBJECT; var ASessionReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_InteractiveSend: function(AKSeFObject: LGP_OBJECT; AInvoiceStream: LGP_OBJECT; AOfflineMode: LGP_INT32; AHashOfCorrectedInvoice: LGP_PCHAR; ASessionReferenceNumber: LGP_PCHAR; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR; var AInvoiceRefenenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InteractiveSend2: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ASendInvoiceResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InteractiveSend3: function(AKSeFObject: LGP_OBJECT; AInvoiceStream: LGP_OBJECT; AOfflineMode: LGP_INT32; AHashOfCorrectedInvoice: LGP_PCHAR; var AInvoiceRefenenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_InteractiveClose: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;

  lgpKSeF2_BatchPrepare: function(AKSeFObject: LGP_OBJECT; AZIPFileStream: LGP_OBJECT; AOutputStream: LGP_OBJECT; AFormCode: LGP_INT32; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AFormCodeSystemCode: LGP_PCHAR; AFormCodeSchemaVersion: LGP_PCHAR; AFormCodeValue: LGP_PCHAR; APartSize: LGP_INT32; var AOpenBatchSessionRequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_BatchPrepare2: function(AKSeFObject: LGP_OBJECT; AZIPFileStream: LGP_OBJECT; AOutputStream: LGP_OBJECT; APartSize: LGP_INT32; var AOpenBatchSessionRequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_BatchOpen: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AOpenBatchSessionResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_BatchSendPart: function(AKSeFObject: LGP_OBJECT; APartUploadRequest: LGP_OBJECT; ADataStream: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_BatchClose: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;

  lgpKSeF2_StatusSessions: function(AKSeFObject: LGP_OBJECT; ASessionType: LGP_INT32; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AReferenceNumber: LGP_PCHAR; ADateCreatedFrom: LGP_DOUBLE; ADateCreatedTo: LGP_DOUBLE; ADateClosedFrom: LGP_DOUBLE; ADateClosedTo: LGP_DOUBLE; ADateModifiedFrom: LGP_DOUBLE; ADateModifiedTo: LGP_DOUBLE; AStatuses: LGP_UINT32; AAccessToken: LGP_PCHAR; var ASessionsQueryResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusSession: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ASessionStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusInvoices: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusSessionInvoice: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusInvoicesFailed: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AContinuationToken: LGP_PCHAR; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var ASessionInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusUpoKsef: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AKsefNumber: LGP_PCHAR; AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusUpoKsefSimple: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AKsefNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusUpoSessionInvoice: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusUpoSessionInvoiceSimple: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AInvoiceReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusUpoSession: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AUpoReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_StatusUpoSessionSimple: function(AKSeFObject: LGP_OBJECT; ASessionReferenceNumber: LGP_PCHAR; AUpoReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AUpo: LGP_OBJECT): LGP_EXCEPTION; stdcall;

  lgpKSeF2_InvoicesKsef: function(AKSeFObject: LGP_OBJECT; AKsefNumber: LGP_PCHAR; AOutputStram: LGP_OBJECT; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InvoicesQueryMetadata: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; APageOffset: LGP_INT32; APageSize: LGP_INT32; AAccessToken: LGP_PCHAR; var AQueryInvoicesMetadataResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InvoicesExport: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AExportInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InvoicesExport2: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR; var AExportInvoicesResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InvoicesExportSimple: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var ASessionReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InvoicesExportSimple2: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE; AAccessToken: LGP_PCHAR; var AReferenceNumber: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InvoicesExportStatus: function(AKSeFObject: LGP_OBJECT; AOperationReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AInvoiceExportStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_InvoicesExportDownload: function(AKSeFObject: LGP_OBJECT; AStatusResponse: LGP_OBJECT; AOutputStream: LGP_OBJECT; AEncryptionSymetricKey: LGP_PBYTE; AInitializationVector: LGP_PBYTE): LGP_EXCEPTION; stdcall;

  lgpKSeF2_TokensGenerate: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT; AAccessToken: LGP_PCHAR; var AGenerateTokenResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_TokensGenerate2: function(AKSeFObject: LGP_OBJECT; APermissions: LGP_INT32; ADescription: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AGenerateTokenResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_TokensList: function(AKSeFObject: LGP_OBJECT; AStatus: LGP_INT32; ADescription: LGP_PCHAR; AAuthorIdentifier: LGP_PCHAR; AAuthorIdentifierType: LGP_INT32; APageSize: LGP_INT32; AContinuationToken: LGP_PCHAR; AAccessToken: LGP_PCHAR; var AQueryTokensResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_TokensStatus: function(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR; var ATokenStatusResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_TokensRevoke: function(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AAccessToken: LGP_PCHAR): LGP_EXCEPTION; stdcall;

  lgpKSeF2_TestdataSubject: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_TestdataSubjectRemove: function(AKSeFObject: LGP_OBJECT; ASubjectNip: LGP_PCHAR): LGP_EXCEPTION; stdcall;
  lgpKSeF2_TestdataPerson: function(AKSeFObject: LGP_OBJECT; ARequest: LGP_OBJECT): LGP_EXCEPTION; stdcall;
  lgpKSeF2_TestdataPersonRemove: function(AKSeFObject: LGP_OBJECT; ANip: LGP_PCHAR): LGP_EXCEPTION; stdcall;

  lgpKSeF2_CreateKSeFClass: function(AClassName: LGP_PCHAR): LGP_OBJECT; stdcall;
  lgpKSeF2_KSeFClassSetExt: function(AObject: LGP_OBJECT; AExtObj: LGP_POINTER): LGP_OBJECT; stdcall;

  // Zgodnosc z poprzednia wersja biblioteki
  edekInicjuj: function(AWinHandle: THandle; ATransport: LongWord; ARodzajSHA: LongWord): LongWord; stdcall;
  edekOstatniBladTekst: function: PWideChar; stdcall;
  edekZwolnijTekst: procedure(ATekst: PWideChar); stdcall;

  edekCertyfikatIlosc: function: Integer; stdcall;
  edekCertyfikatDane: function(AIndex: Integer; ADane:Integer; var ARes: PWideChar): Integer; stdcall;
  edekCertyfikatPokaz: procedure(AIndex: Integer); stdcall;

  edekPodpisz: function(APlikWej, APlikWyj: PWideChar; ACertIdx: Integer; ACertSerialNo: PWideChar): Integer; stdcall;
  edekPodpiszAut: function(APlikWej, APlikWyj, ANIP, AImie, ANazwisko, ADataUr, AKwota: PWideChar): Integer; stdcall;
  edekWyslij: function(APlikDek: PWideChar; ABramkaTestowa: LongBool; APodpis: LongBool; var ArefID: PWideChar; var AStatus: Integer; var AStatusOpis: PWideChar): Integer; stdcall;
  edekPobierzUPO: function(ARefId: PWideChar; ABramkaTestowa: LongBool; APlikWyj: PWideChar; var AStatus: Integer; var AStatusOpis: PWideChar): Integer; stdcall;

  jpkPodpisz: function(APlikWej: PWideChar; ACertyfikat: Integer; ATestowa: LongBool; ACertSerialNo: PWideChar): Integer; stdcall;
  jpkPodpisz2: function(APlikWej: PWideChar; ACertyfikat: Integer; ATestowa, ADoraznie: LongBool; ACertSerialNo: PWideChar): Integer; stdcall;
  jpkPodpiszAut: function(APlikWej: PWideChar; ATestowa, ADoraznie: LongBool; ADANip, ADAImie, ADANazwisko, ADAData, ADAKwota: PWideChar): Integer; stdcall;
  jpkWyslij: function(APlik: PWideChar; ATestowa: LongBool; var ANrRef: PWideChar): Integer; stdcall;
  jpkWyslij2: function(APlik: PWideChar; ATestowa, AWeryfPodpis: LongBool; var ANrRef: PWideChar): Integer; stdcall;
  jpkPobierzUPO: function(ANrRef: PWideChar; APlikWyj: PWideChar; ATestowa: LongBool): Integer; stdcall;

  LibGovPl4Handle: THandle = 0;

{$IFNDEF FPC}
function lgpObject_GetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_DOUBLE): LGP_EXCEPTION; overload;
function lgpObject_GetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; overload;
{$ENDIF}

function LoadLibGovPl(AFileName: String = ''): Boolean;

{$ENDIF} {LIBGOVPL_DYNAMIC}

implementation

{$IFDEF LIBGOVPL_DYNAMIC}

{$IFNDEF FPC}
uses
  Windows;

function lgpObject_GetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_DOUBLE): LGP_EXCEPTION; overload;
begin
  Result := _lgpObject_GetDoubleProp(AObject, APropName, AValue);
end;

function lgpObject_GetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; overload;
var
  D: Double;
begin
  Result := _lgpObject_GetDoubleProp(AObject, APropName, D);
  AValue := D;
end;
{$ENDIF}

function LoadLibGovPl(AFileName: String): Boolean;
begin
  if AFileName = '' then
    AFileName := LGP_LIBNAME;

  if LibGovPl4Handle <> 0 then
  begin
    Result := True;
    Exit;
  end;

  LibGovPl4Handle := LoadLibrary({$IFNDEF FPC}PAnsiChar{$ENDIF}(AFileName));
  if LibGovPl4Handle <> 0 then
  begin
    // Backend
    @lgplVersion := GetProcAddress(LibGovPl4Handle, 'lgplVersion');
    @lgplListDrivers := GetProcAddress(LibGovPl4Handle, 'lgplListDrivers');
    @lgplDriverCount := GetProcAddress(LibGovPl4Handle, 'lgplDriverCount');
    @lgplDriverName := GetProcAddress(LibGovPl4Handle, 'lgplDriverName');
    @lgplInit := GetProcAddress(LibGovPl4Handle, 'lgplInit');
    @lgplExit := GetProcAddress(LibGovPl4Handle, 'lgplExit');
    @lgplSetDefaultDriver := GetProcAddress(LibGovPl4Handle, 'lgplSetDefaultDriver');

    @lgpHTTPClient_Create := GetProcAddress(LibGovPl4Handle, 'lgpHTTPClient_Create');
    @lgpHTTPClient_GetIgnoreSSLErrors := GetProcAddress(LibGovPl4Handle, 'lgpHTTPClient_GetIgnoreSSLErrors');
    @lgpHTTPClient_SetIgnoreSSLErrors := GetProcAddress(LibGovPl4Handle, 'lgpHTTPClient_SetIgnoreSSLErrors');

    @lgpRSAEncrypt_CreateKey := GetProcAddress(LibGovPl4Handle, 'lgpRSAEncrypt_CreateKey');

    @lgpCertificate_GetVersion := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetVersion');
    @lgpCertificate_GetDisplayName := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetDisplayName');
    @lgpCertificate_GetSubject := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetSubject');
    @lgpCertificate_GetSubjectField := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetSubjectField');
    @lgpCertificate_GetSubjectFields := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetSubjectFields');
    @lgpCertificate_GetSubjectUID := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetSubjectUID');
    @lgpCertificate_GetIssuer := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetIssuer');
    @lgpCertificate_GetIssuerField := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetIssuerField');
    @lgpCertificate_GetIssuerFields := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetIssuerFields');
    @lgpCertificate_GetIssuerUID := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetIssuerUID');
    @lgpCertificate_GetSerialNoDec := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetSerialNoDec');
    @lgpCertificate_GetSerialNoHex := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetSerialNoHex');
    @lgpCertificate_GetValidFrom := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetValidFrom');
    @lgpCertificate_GetValidTo := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetValidTo');
    @lgpCertificate_GetSignature := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetSignature');
    @lgpCertificate_GetKeyUsage := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetKeyUsage');
    @lgpCertificate_GetPublicKeyAlgorithm := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_GetPublicKeyAlgorithm');
    @lgpCertificate_SetPIN := GetProcAddress(LibGovPl4Handle, 'lgpCertificate_SetPIN');

    @lgpCertificates_Create := GetProcAddress(LibGovPl4Handle, 'lgpCertificates_Create');

    @lgpCNGCertificate_ShowCertificateInfo := GetProcAddress(LibGovPl4Handle, 'lgpCNGCertificate_ShowCertificateInfo');

    @lgpCertificateSigner_Create := GetProcAddress(LibGovPl4Handle, 'lgpCertificateSigner_Create');
    @lgpCertificateSigner_List := GetProcAddress(LibGovPl4Handle, 'lgpCertificateSigner_List');
    @lgpCertificateSigner_FindBySerialNumber := GetProcAddress(LibGovPl4Handle, 'lgpCertificateSigner_FindBySerialNumber');
    @lgpCertificateSigner_UISelect := GetProcAddress(LibGovPl4Handle, 'lgpCertificateSigner_UISelect');
    @lgpCertificateSigner_LoadFromStream := GetProcAddress(LibGovPl4Handle, 'lgpCertificateSigner_LoadFromStream');

    @lgpCNGCertificateSigner_SetHWnd := GetProcAddress(LibGovPl4Handle, 'lgpCNGCertificateSigner_SetHWnd');

    @lgpEncodeDateTime := GetProcAddress(LibGovPl4Handle, 'lgpEncodeDateTime');
    @lgpDecodeDateTime := GetProcAddress(LibGovPl4Handle, 'lgpDecodeDateTime');

    @lgpLoadLibXML2 := GetProcAddress(LibGovPl4Handle, 'lgpLoadLibXML2');

    // Object
    @lgpObject_Free := GetProcAddress(LibGovPl4Handle, 'lgpObject_Free');
    @lgpObject_ClassName := GetProcAddress(LibGovPl4Handle, 'lgpObject_ClassName');
    @lgpObject_GetStringProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_GetStringProp');
    @lgpObject_SetStringProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_SetStringProp');
    @lgpObject_GetIntegerProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_GetIntegerProp');
    @lgpObject_SetIntegerProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_SetIntegerProp');
    {$IFDEF FPC}
    @lgpObject_GetDoubleProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_GetDoubleProp');
    {$ELSE}
    @_lgpObject_GetDoubleProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_GetDoubleProp');
    {$ENDIF}
    @lgpObject_SetDoubleProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_SetDoubleProp');
    @lgpObject_GetObjectProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_GetObjectProp');
    @lgpObject_SetObjectProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_SetObjectProp');
    @lgpObject_GetCurrencyProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_GetCurrencyProp');
    @lgpObject_SetCurrencyProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_SetCurrencyProp');
    @lgpObject_GetBooleanProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_GetBooleanProp');
    @lgpObject_SetBooleanProp := GetProcAddress(LibGovPl4Handle, 'lgpObject_SetBooleanProp');
    @lgpObject_GetInt64Prop := GetProcAddress(LibGovPl4Handle, 'lgpObject_GetInt64Prop');
    @lgpObject_SetInt64Prop := GetProcAddress(LibGovPl4Handle, 'lgpObject_SetInt64Prop');

    @lgpStringObject_GetValue := GetProcAddress(LibGovPl4Handle, 'lgpStringObject_GetValue');

    @lgpListObject_GetCount := GetProcAddress(LibGovPl4Handle, 'lgpListObject_GetCount');
    @lgpListObject_GetItem := GetProcAddress(LibGovPl4Handle, 'lgpListObject_GetItem');
    @lgpListObject_Delete := GetProcAddress(LibGovPl4Handle, 'lgpListObject_Delete');
    @lgpListObject_Remove := GetProcAddress(LibGovPl4Handle, 'lgpListObject_Remove');
    @lgpListObject_Add := GetProcAddress(LibGovPl4Handle, 'lgpListObject_Add');
    @lgpListObject_GetOwnsObjects := GetProcAddress(LibGovPl4Handle, 'lgpListObject_GetOwnsObjects');
    @lgpListObject_SetOwnsObjects := GetProcAddress(LibGovPl4Handle, 'lgpListObject_SetOwnsObjects');

    @lgpDbgObjectCount  := GetProcAddress(LibGovPl4Handle, 'lgpDbgObjectCount');

    // Stream
    @lgpStream_Create := GetProcAddress(LibGovPl4Handle, 'lgpStream_Create');

    @lgpFileStream_Create := GetProcAddress(LibGovPl4Handle, 'lgpFileStream_Create');

    @lgpStringStream_Create := GetProcAddress(LibGovPl4Handle, 'lgpStringStream_Create');
    @lgpStringStream_GetString := GetProcAddress(LibGovPl4Handle, 'lgpStringStream_GetString');

    @lgpMemoryStream_Create := GetProcAddress(LibGovPl4Handle, 'lgpMemoryStream_Create');
    @lgpMemoryStream_GetData := GetProcAddress(LibGovPl4Handle, 'lgpMemoryStream_GetData');

    @lgpStream_GetPosition := GetProcAddress(LibGovPl4Handle, 'lgpStream_GetPosition');
    @lgpStream_SetPosition := GetProcAddress(LibGovPl4Handle, 'lgpStream_SetPosition');
    @lgpStream_GetSize := GetProcAddress(LibGovPl4Handle, 'lgpStream_GetSize');
    @lgpStream_Read := GetProcAddress(LibGovPl4Handle, 'lgpStream_Read');
    @lgpStream_Write := GetProcAddress(LibGovPl4Handle, 'lgpStream_Write');

    // WST EDek Gate
    @lgpWST_RegisterTransport := GetProcAddress(LibGovPl4Handle, 'lgpWST_RegisterTransport');
    @lgpWST_GetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpWST_GetHTTPClient');
    @lgpWST_SetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpWST_SetHTTPClient');

    // XML
    @lgpXMLReader_CreateFromFile := GetProcAddress(LibGovPl4Handle, 'lgpXMLReader_CreateFromFile');
    @lgpXMLReader_CreateFromStream := GetProcAddress(LibGovPl4Handle, 'lgpXMLReader_CreateFromStream');
    @lgpXMLReader_CreateFromString := GetProcAddress(LibGovPl4Handle, 'lgpXMLReader_CreateFromString');
    @lgpXMLReader_ReadValue := GetProcAddress(LibGovPl4Handle, 'lgpXMLReader_ReadValue');

    @lgpXMLValidator_Create := GetProcAddress(LibGovPl4Handle, 'lgpXMLValidator_Create');
    @lgpXMLValidator_AddSchemaLocation := GetProcAddress(LibGovPl4Handle, 'lgpXMLValidator_AddSchemaLocation');
    @lgpXMLValidator_AddSchemaReader := GetProcAddress(LibGovPl4Handle, 'lgpXMLValidator_AddSchemaReader');
    @lgpXMLValidator_ClearSchemas := GetProcAddress(LibGovPl4Handle, 'lgpXMLValidator_ClearSchemas');
    @lgpXMLValidator_Validate := GetProcAddress(LibGovPl4Handle, 'lgpXMLValidator_Validate');

    @lgpXMLXSLTransformation_Create := GetProcAddress(LibGovPl4Handle, 'lgpXMLXSLTransformation_Create');
    @lgpXMLXSLTransformation_AddStyleLocation := GetProcAddress(LibGovPl4Handle, 'lgpXMLXSLTransformation_AddStyleLocation');
    @lgpXMLXSLTransformation_AddStyleReader := GetProcAddress(LibGovPl4Handle, 'lgpXMLXSLTransformation_AddStyleReader');
    @lgpXMLXSLTransformation_ClearStyles := GetProcAddress(LibGovPl4Handle, 'lgpXMLXSLTransformation_ClearStyles');
    @lgpXMLXSLTransformation_Transform := GetProcAddress(LibGovPl4Handle, 'lgpXMLXSLTransformation_Transform');

    @lgpLibXML2Backend_LibXMLLoaded := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_LibXMLLoaded');
    @lgpLibXML2Backend_LibXSLTLoaded := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_LibXSLTLoaded');
    @lgpLibXML2Backend_LoadLibXML := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_LoadLibXML');
    @lgpLibXML2Backend_LoadLibXSLT := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_LoadLibXSLT');
    @lgpLibXML2Backend_GetCacheExternals := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_GetCacheExternals');
    @lgpLibXML2Backend_SetCacheExternals := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_SetCacheExternals');
    @lgpLibXML2Backend_GetCacheDir := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_GetCacheDir');
    @lgpLibXML2Backend_SetCacheDir := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_SetCacheDir');
    @lgpLibXML2Backend_GetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_GetHTTPClient');
    @lgpLibXML2Backend_SetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpLibXML2Backend_SetHTTPClient');

    {$IFDEF LGP_ENABLE_PKCS11}
    // PKCS#11
    @lgpPKCS11Certificate_GetSession := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11Certificate_GetSession');

    @lgpPKCS11Session_CheckActive := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11Session_CheckActive');
    @lgpPKCS11Session_Login := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11Session_Login');
    @lgpPKCS11Session_Logout := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11Session_Logout');
    @lgpPKCS11Session_GetSigner := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11Session_GetSigner');
    @lgpPKCS11Session_GetHandle := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11Session_GetHandle');
    @lgpPKCS11Session_GetSlotID := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11Session_GetSlotID');
    @lgpPKCS11Session_GetState := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11Session_GetState');
    @lgpPKCS11Session_GetFlags := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11Session_GetFlags');

    @lgpPKCS11CertificateSigner_LoadLibrary := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_LoadLibrary');
    @lgpPKCS11CertificateSigner_FreeLibrary := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_FreeLibrary');
    @lgpPKCS11CertificateSigner_GetInfo := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_GetInfo');
    @lgpPKCS11CertificateSigner_GetSlots := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_GetSlots');
    @lgpPKCS11CertificateSigner_SessionStart := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_SessionStart');
    @lgpPKCS11CertificateSigner_SessionClose := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_SessionClose');
    @lgpPKCS11CertificateSigner_SessionCloseIdx := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_SessionCloseIdx');
    @lgpPKCS11CertificateSigner_SessionCloseAll := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_SessionCloseAll');
    @lgpPKCS11CertificateSigner_GetLibLoaded := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_GetLibLoaded');
    @lgpPKCS11CertificateSigner_GetLibFileName := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_GetLibFileName');
    @lgpPKCS11CertificateSigner_GetSessions := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_GetSessions');
    @lgpPKCS11CertificateSigner_FunctionList := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_FunctionList');
    @lgpPKCS11CertificateSigner_CheckLibrary := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_CheckLibrary');
    @lgpPKCS11CertificateSigner_GetLibraryInfo := GetProcAddress(LibGovPl4Handle, 'lgpPKCS11CertificateSigner_GetLibraryInfo');
    {$ENDIF}

    // XAdES
    @lgpXAdES_Create := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_Create');
    @lgpXAdES_GetSHA1HashClass := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_GetSHA1HashClass');
    @lgpXAdES_SetSHA1HashClass := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_SetSHA1HashClass');
    @lgpXAdES_GetSHA256HashClass := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_GetSHA256HashClass');
    @lgpXAdES_SetSHA256HashClass := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_SetSHA256HashClass');
    @lgpXAdES_GetBase64EncoderClass := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_GetBase64EncoderClass');
    @lgpXAdES_SetBase64EncoderClass := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_SetBase64EncoderClass');
    @lgpXAdES_GetSigner := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_GetSigner');
    @lgpXAdES_SetSigner := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_SetSigner');
    @lgpXAdES_GetSignType := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_GetSignType');
    @lgpXAdES_SetSignType := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_SetSignType');
    @lgpXAdES_GetSerialNoFormat := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_GetSerialNoFormat');
    @lgpXAdES_SetSerialNoFormat := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_SetSerialNoFormat');
    @lgpXAdES_GetIncludeSigningTime := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_GetIncludeSigningTime');
    @lgpXAdES_SetIncludeSigningTime := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_SetIncludeSigningTime');
    @lgpXAdES_GetSigningTime := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_GetSigningTime');
    @lgpXAdES_SetSigningTime := GetProcAddress(LibGovPl4Handle, 'lgpXAdES_SetSigningTime');

    // EDek
    @lgpEDek_Create := GetProcAddress(LibGovPl4Handle, 'lgpEDek_Create');
    @lgpEDek_GetXAdES := GetProcAddress(LibGovPl4Handle, 'lgpEDek_GetXAdES');
    @lgpEDek_SetXAdES := GetProcAddress(LibGovPl4Handle, 'lgpEDek_SetXAdES');
    @lgpEDek_GetXMLCanonizatorClass := GetProcAddress(LibGovPl4Handle, 'lgpEDek_GetXMLCanonizatorClass');
    @lgpEDek_SetXMLCanonizatorClass := GetProcAddress(LibGovPl4Handle, 'lgpEDek_SetXMLCanonizatorClass');
    @lgpEDek_GetEDekGateClass := GetProcAddress(LibGovPl4Handle, 'lgpEDek_GetEDekGateClass');
    @lgpEDek_SetEDekGateClass := GetProcAddress(LibGovPl4Handle, 'lgpEDek_SetEDekGateClass');
    @lgpEDek_GetCanonization := GetProcAddress(LibGovPl4Handle, 'lgpEDek_GetCanonization');
    @lgpEDek_SetCanonization := GetProcAddress(LibGovPl4Handle, 'lgpEDek_SetCanonization');

    @lgpEDek_PodpiszCertyfikatem := GetProcAddress(LibGovPl4Handle, 'lgpEDek_PodpiszCertyfikatem');
    @lgpEDek_PodpiszCertyfikatemStream := GetProcAddress(LibGovPl4Handle, 'lgpEDek_PodpiszCertyfikatemStream');
    @lgpEDek_PodpiszDanymiAut := GetProcAddress(LibGovPl4Handle, 'lgpEDek_PodpiszDanymiAut');
    @lgpEDek_PodpiszDanymiAutStream := GetProcAddress(LibGovPl4Handle, 'lgpEDek_PodpiszDanymiAutStream');

    @lgpEDek_Wyslij := GetProcAddress(LibGovPl4Handle, 'lgpEDek_Wyslij');
    @lgpEDek_WyslijStream := GetProcAddress(LibGovPl4Handle, 'lgpEDek_WyslijStream');
    @lgpEDek_PobierzUPO := GetProcAddress(LibGovPl4Handle, 'lgpEDek_PobierzUPO');
    @lgpEDek_PobierzUPOStream := GetProcAddress(LibGovPl4Handle, 'lgpEDek_PobierzUPOStream');

    // JPK
    @lgpJPK_Create := GetProcAddress(LibGovPl4Handle, 'lgpJPK_Create');

    @lgpJPK_GetBase64EncoderClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetBase64EncoderClass');
    @lgpJPK_SetBase64EncoderClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetBase64EncoderClass');
    @lgpJPK_GetAES256EncryptClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetAES256EncryptClass');
    @lgpJPK_SetAES256EncryptClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetAES256EncryptClass');
    @lgpJPK_GetMD5HashClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetMD5HashClass');
    @lgpJPK_SetMD5HashClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetMD5HashClass');
    @lgpJPK_GetSHA256HashClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetSHA256HashClass');
    @lgpJPK_SetSHA256HashClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetSHA256HashClass');
    @lgpJPK_GetZipperClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetZipperClass');
    @lgpJPK_SetZipperClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetZipperClass');
    @lgpJPK_GetRandomGeneratorClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetRandomGeneratorClass');
    @lgpJPK_SetRandomGeneratorClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetRandomGeneratorClass');
    @lgpJPK_GetXMLReaderClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetXMLReaderClass');
    @lgpJPK_SetXMLReaderClass := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetXMLReaderClass');

    @lgpJPK_GetRSAKeyProd := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetRSAKeyProd');
    @lgpJPK_SetRSAKeyProd := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetRSAKeyProd');
    @lgpJPK_GetRSAKeyTest := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetRSAKeyTest');
    @lgpJPK_SetRSAKeyTest := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetRSAKeyTest');
    @lgpJPK_GetXAdES := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetXAdES');
    @lgpJPK_SetXAdES := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetXAdES');
    @lgpJPK_GetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpJPK_GetHTTPClient');
    @lgpJPK_SetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SetHTTPClient');

    @lgpJPK_SignCerificate := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SignCerificate');
    @lgpJPK_SignCerificateStream := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SignCerificateStream');
    @lgpJPK_SignDataAuth := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SignDataAuth');
    @lgpJPK_SignDataAuthStream := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SignDataAuthStream');
    @lgpJPK_Send := GetProcAddress(LibGovPl4Handle, 'lgpJPK_Send');
    @lgpJPK_SendStream := GetProcAddress(LibGovPl4Handle, 'lgpJPK_SendStream');
    @lgpJPK_RequestUPO := GetProcAddress(LibGovPl4Handle, 'lgpJPK_RequestUPO');
    @lgpJPK_RequestUPOStream := GetProcAddress(LibGovPl4Handle, 'lgpJPK_RequestUPOStream');

    // KSeF
    @lgpKSeF_Create := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_Create');
    @lgpKSeF_GetBase64EncoderClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetBase64EncoderClass');
    @lgpKSeF_SetBase64EncoderClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetBase64EncoderClass');
    @lgpKSeF_GetAES256EncryptClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetAES256EncryptClass');
    @lgpKSeF_SetAES256EncryptClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetAES256EncryptClass');
    @lgpKSeF_GetSHA256HashClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetSHA256HashClass');
    @lgpKSeF_SetSHA256HashClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetSHA256HashClass');
    @lgpKSeF_GetRandomGeneratorClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetRandomGeneratorClass');
    @lgpKSeF_SetRandomGeneratorClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetRandomGeneratorClass');
    @lgpKSeF_GetRSAKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetRSAKey');
    @lgpKSeF_SetRSAKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetRSAKey');
    @lgpKSeF_GetXAdES := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetXAdES');
    @lgpKSeF_SetXAdES := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetXAdES');
    @lgpKSeF_GetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetHTTPClient');
    @lgpKSeF_SetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetHTTPClient');
    @lgpKSeF_GetGateType := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetGateType');
    @lgpKSeF_SetGateType := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetGateType');
    @lgpKSeF_GetNIP := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetNIP');
    @lgpKSeF_SetNIP := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetNIP');
    @lgpKSeF_GetFormCode := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetFormCode');
    @lgpKSeF_SetFormCode := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetFormCode');
    @lgpKSeF_GetFormCodeSystemCode := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetFormCodeSystemCode');
    @lgpKSeF_SetFormCodeSystemCode := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetFormCodeSystemCode');
    @lgpKSeF_GetFormCodeSchemaVersion := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetFormCodeSchemaVersion');
    @lgpKSeF_SetFormCodeSchemaVersion := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetFormCodeSchemaVersion');
    @lgpKSeF_GetFormCodeTargetNamespace := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetFormCodeTargetNamespace');
    @lgpKSeF_SetFormCodeTargetNamespace := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetFormCodeTargetNamespace');
    @lgpKSeF_GetFormCodeValue := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetFormCodeValue');
    @lgpKSeF_SetFormCodeValue := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetFormCodeValue');
    @lgpKSeF_GetCertificate := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetCertificate');
    @lgpKSeF_SetCertificate := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetCertificate');
    @lgpKSeF_GetCertificateAuthType := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetCertificateAuthType');
    @lgpKSeF_SetCertificateAuthType := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetCertificateAuthType');
    @lgpKSeF_GetToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetToken');
    @lgpKSeF_SetToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetToken');
    @lgpKSeF_GetEncryption := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetEncryption');
    @lgpKSeF_SetEncryption := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetEncryption');
    @lgpKSeF_GetSessionToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetSessionToken');
    @lgpKSeF_SetSessionToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SetSessionToken');
    @lgpKSeF_GetSessionActive := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GetSessionActive');

    @lgpKSeF_GenerateAESKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_GenerateAESKey');

    @lgpKSeF_SessionInitSigned := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SessionInitSigned');
    @lgpKSeF_SessionInitToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SessionInitToken');
    @lgpKSeF_SessionChalangePZ := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SessionChalangePZ');
    @lgpKSeF_SessionInitPZ := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SessionInitPZ');
    @lgpKSeF_SessionStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SessionStatus');
    @lgpKSeF_SessionTerminate := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SessionTerminate');
    @lgpKSeF_SessionGenerateInternalIdentifier := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_SessionGenerateInternalIdentifier');

    @lgpKSeF_InvoiceGet := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceGet');
    @lgpKSeF_InvoiceSend := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceSend');
    @lgpKSeF_InvoiceStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceStatus');
    @lgpKSeF_InvoiceVisibilityHide := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceVisibilityHide');
    @lgpKSeF_InvoiceVisibilityShow := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceVisibilityShow');
    @lgpKSeF_InvoiceVisibilityStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceVisibilityStatus');
    @lgpKSeF_InvoiceVisibility := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceVisibility');
    @lgpKSeF_InvoiceScamCancel := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceScamCancel');
    @lgpKSeF_InvoiceScamReport := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceScamReport');
    @lgpKSeF_InvoiceScamStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceScamStatus');
    @lgpKSeF_InvoiceScam := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_InvoiceScam');

    @lgpKSeF_QueryInvoiceSync := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_QueryInvoiceSync');
    @lgpKSeF_QueryInvoiceAsyncInit := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_QueryInvoiceAsyncInit');
    @lgpKSeF_QueryInvoiceAsyncStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_QueryInvoiceAsyncStatus');
    @lgpKSeF_QueryInvoiceAsyncFetch := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_QueryInvoiceAsyncFetch');

    @lgpKSeF_PaymentIdentifierGetReferenceNumbers := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_PaymentIdentifierGetReferenceNumbers');
    @lgpKSeF_PaymentIdentifierRequest := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_PaymentIdentifierRequest');

    @lgpKSeF_CredentialsAccountingGrant := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CredentialsAccountingGrant');
    @lgpKSeF_CredentialsAccountingRevoke := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CredentialsAccountingRevoke');
    @lgpKSeF_CredentialsContextGrant := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CredentialsContextGrant');
    @lgpKSeF_CredentialsContextRevoke := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CredentialsContextRevoke');
    @lgpKSeF_CredentialsGenerateToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CredentialsGenerateToken');
    @lgpKSeF_CredentialsGrant := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CredentialsGrant');
    @lgpKSeF_CredentialsRevoke := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CredentialsRevoke');
    @lgpKSeF_CredentialsRevokeToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CredentialsRevokeToken');
    @lgpKSeF_CredentialsStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CredentialsStatus');
    @lgpKSeF_QueryCredentialContextSync := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_QueryCredentialContextSync');
    @lgpKSeF_QueryCredentialSync := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_QueryCredentialSync');

    @lgpKSeF_CommonInvoiceKSeF := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CommonInvoiceKSeF');
    @lgpKSeF_CommonDownload := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CommonDownload');
    @lgpKSeF_CommonStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CommonStatus');
    @lgpKSeF_CommonVerification := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CommonVerification');

    @lgpKSeF_BatchSign := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_BatchSign');
    @lgpKSeF_BatchSend := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_BatchSend');

    // KSeF Obj
    @lgpKSeF_CreateKSeFClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF_CreateKSeFClass');

    //VIES
    @lgpViesService_CheckVatNumber := GetProcAddress(LibGovPl4Handle, 'lgpViesService_CheckVatNumber');
    @lgpViesService_CheckVatTestService := GetProcAddress(LibGovPl4Handle, 'lgpViesService_CheckVatTestService');
    @lgpViesService_CheckStatus := GetProcAddress(LibGovPl4Handle, 'lgpViesService_CheckStatus');

    // KSeF 2.0
    @lgpKSeF2_Create := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_Create');
    @lgpKSeF2_GetBase64EncoderClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetBase64EncoderClass');
    @lgpKSeF2_SetBase64EncoderClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetBase64EncoderClass');
    @lgpKSeF2_GetAES256EncryptClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetAES256EncryptClass');
    @lgpKSeF2_SetAES256EncryptClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetAES256EncryptClass');
    @lgpKSeF2_GetSHA256HashClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetSHA256HashClass');
    @lgpKSeF2_SetSHA256HashClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetSHA256HashClass');
    @lgpKSeF2_GetRandomGeneratorClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetRandomGeneratorClass');
    @lgpKSeF2_SetRandomGeneratorClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetRandomGeneratorClass');
    @lgpKSeF2_GetRSAPubliicKeyClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetRSAPubliicKeyClass');
    @lgpKSeF2_SetRSAPubliicKeyClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetRSAPubliicKeyClass');
    @lgpKSeF2_GetRSATokenEncKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetRSATokenEncKey');
    @lgpKSeF2_SetRSATokenEncKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetRSATokenEncKey');
    @lgpKSeF2_GetRSASymmetricKeyEncKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetRSASymmetricKeyEncKey');
    @lgpKSeF2_SetRSASymmetricKeyEncKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetRSASymmetricKeyEncKey');
    @lgpKSeF2_GetXAdES := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetXAdES');
    @lgpKSeF2_SetXAdES := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetXAdES');
    @lgpKSeF2_GetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetHTTPClient');
    @lgpKSeF2_SetHTTPClient := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetHTTPClient');
    @lgpKSeF2_GetGateType := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetGateType');
    @lgpKSeF2_SetGateType := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetGateType');
    @lgpKSeF2_GetIdentifier := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetIdentifier');
    @lgpKSeF2_SetIdentifier := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetIdentifier');
    @lgpKSeF2_GetIdentifierType := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetIdentifierType');
    @lgpKSeF2_SetIdentifierType := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetIdentifierType');
    @lgpKSeF2_GetFormCode := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetFormCode');
    @lgpKSeF2_SetFormCode := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetFormCode');
    @lgpKSeF2_GetFormCodeSystemCode := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetFormCodeSystemCode');
    @lgpKSeF2_SetFormCodeSystemCode := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetFormCodeSystemCode');
    @lgpKSeF2_GetFormCodeSchemaVersion := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetFormCodeSchemaVersion');
    @lgpKSeF2_SetFormCodeSchemaVersion := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetFormCodeSchemaVersion');
    @lgpKSeF2_GetFormCodeValue := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetFormCodeValue');
    @lgpKSeF2_SetFormCodeValue := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetFormCodeValue');
    @lgpKSeF2_GetAuthCertificate := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetAuthCertificate');
    @lgpKSeF2_SetAuthCertificate := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetAuthCertificate');
    @lgpKSeF2_GetAuthCertificateSubject := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetAuthCertificateSubject');
    @lgpKSeF2_SetAuthCertificateSubject := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetAuthCertificateSubject');
    @lgpKSeF2_GetKsefToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetKsefToken');
    @lgpKSeF2_SetKsefToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetKsefToken');
    @lgpKSeF2_GetAuthenticationToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetAuthenticationToken');
    @lgpKSeF2_SetAuthenticationToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetAuthenticationToken');
    @lgpKSeF2_GetAuthenticationTokenValidUntil := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetAuthenticationTokenValidUntil');
    @lgpKSeF2_SetAuthenticationTokenValidUntil := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetAuthenticationTokenValidUntil');
    @lgpKSeF2_GetAuthenticationRefNo := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetAuthenticationRefNo');
    @lgpKSeF2_SetAuthenticationRefNo := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetAuthenticationRefNo');
    @lgpKSeF2_GetAccessToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetAccessToken');
    @lgpKSeF2_SetAccessToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetAccessToken');
    @lgpKSeF2_GetAccessTokenValidUntil := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetAccessTokenValidUntil');
    @lgpKSeF2_SetAccessTokenValidUntil := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetAccessTokenValidUntil');
    @lgpKSeF2_GetRefreshToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetRefreshToken');
    @lgpKSeF2_SetRefreshToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetRefreshToken');
    @lgpKSeF2_GetRefreshTokenValidUntil := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetRefreshTokenValidUntil');
    @lgpKSeF2_SetRefreshTokenValidUntil := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetRefreshTokenValidUntil');
    @lgpKSeF2_GetInteractiveEncryptionKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetInteractiveEncryptionKey');
    @lgpKSeF2_SetInteractiveEncryptionKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetInteractiveEncryptionKey');
    @lgpKSeF2_GetInteractiveVector := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetInteractiveVector');
    @lgpKSeF2_SetInteractiveVector := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetInteractiveVector');
    @lgpKSeF2_GetInteractiveReferenceNumber := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetInteractiveReferenceNumber');
    @lgpKSeF2_SetInteractiveReferenceNumber := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetInteractiveReferenceNumber');
    @lgpKSeF2_GetInteractiveValidUntil := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetInteractiveValidUntil');
    @lgpKSeF2_SetInteractiveValidUntil := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetInteractiveValidUntil');
    @lgpKSeF2_GetBatchReferenceNumber := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetBatchReferenceNumber');
    @lgpKSeF2_SetBatchReferenceNumber := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetBatchReferenceNumber');
    @lgpKSeF2_GetBatchPartSize := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetBatchPartSize');
    @lgpKSeF2_SetBatchPartSize := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetBatchPartSize');
    @lgpKSeF2_GetInvoiceExportEncryptionKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetInvoiceExportEncryptionKey');
    @lgpKSeF2_SetInvoiceExportEncryptionKey := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetInvoiceExportEncryptionKey');
    @lgpKSeF2_GetInvoiceExportVector := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetInvoiceExportVector');
    @lgpKSeF2_SetInvoiceExportVector := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetInvoiceExportVector');
    @lgpKSeF2_GetInvoiceExportReferenceNumber := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetInvoiceExportReferenceNumber');
    @lgpKSeF2_SetInvoiceExportReferenceNumber := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetInvoiceExportReferenceNumber');
    @lgpKSeF2_GetRequestPartStreamCargo := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetRequestPartStreamCargo');
    @lgpKSeF2_SetRequestPartStreamCargo := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetRequestPartStreamCargo');
    @lgpKSeF2_GetOnRequestPartStream := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_GetOnRequestPartStream');
    @lgpKSeF2_SetOnRequestPartStream := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SetOnRequestPartStream');

    @lgpKSeF2_AuthChallenge := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthChallenge');

    @lgpKSeF2_AuthXadesSignatureGenerate := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthXadesSignatureGenerate');
    @lgpKSeF2_AuthXadesSignatureGenerate2 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthXadesSignatureGenerate2');

    @lgpKSeF2_AuthXadesSignature := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthXadesSignature');
    @lgpKSeF2_AuthXadesSignature2 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthXadesSignature2');
    @lgpKSeF2_AuthXadesSignature3 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthXadesSignature3');

    @lgpKSeF2_AuthKsefToken := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthKsefToken');
    @lgpKSeF2_AuthKsefToken2 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthKsefToken2');

    @lgpKSeF2_AuthStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthStatus');

    @lgpKSeF2_AuthTokenRedem := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthTokenRedem');

    @lgpKSeF2_AuthTokenRefresh := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthTokenRefresh');

    @lgpKSeF2_AuthSessions := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthSessions');
    @lgpKSeF2_AuthSessionTerminateCurrent := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthSessionTerminateCurrent');
    @lgpKSeF2_AuthSessionTerminate := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_AuthSessionTerminate');

    @lgpKSeF2_SecurityPublicKeyCertificates := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SecurityPublicKeyCertificates');
    @lgpKSeF2_SecurityLoadKeys := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_SecurityLoadKeys');

    @lgpKSeF2_InteractiveOpen := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InteractiveOpen');
    @lgpKSeF2_InteractiveOpen2 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InteractiveOpen2');
    @lgpKSeF2_InteractiveOpen3 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InteractiveOpen3');
    @lgpKSeF2_InteractiveOpenSimple := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InteractiveOpenSimple');

    @lgpKSeF2_InteractiveSend := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InteractiveSend');
    @lgpKSeF2_InteractiveSend2 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InteractiveSend2');
    @lgpKSeF2_InteractiveSend3 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InteractiveSend3');

    @lgpKSeF2_InteractiveClose := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InteractiveClose');

    @lgpKSeF2_BatchPrepare := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_BatchPrepare');
    @lgpKSeF2_BatchPrepare2 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_BatchPrepare2');
    @lgpKSeF2_BatchOpen := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_BatchOpen');
    @lgpKSeF2_BatchSendPart := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_BatchSendPart');
    @lgpKSeF2_BatchClose := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_BatchClose');

    @lgpKSeF2_StatusSessions := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusSessions');
    @lgpKSeF2_StatusSession := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusSession');
    @lgpKSeF2_StatusInvoices := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusInvoices');
    @lgpKSeF2_StatusSessionInvoice := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusSessionInvoice');
    @lgpKSeF2_StatusInvoicesFailed := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusInvoicesFailed');
    @lgpKSeF2_StatusUpoKsef := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusUpoKsef');
    @lgpKSeF2_StatusUpoKsefSimple := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusUpoKsefSimple');
    @lgpKSeF2_StatusUpoSessionInvoice := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusUpoSessionInvoice');
    @lgpKSeF2_StatusUpoSessionInvoiceSimple := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusUpoSessionInvoiceSimple');
    @lgpKSeF2_StatusUpoSession := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusUpoSession');
    @lgpKSeF2_StatusUpoSessionSimple := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_StatusUpoSessionSimple');

    @lgpKSeF2_InvoicesKsef := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InvoicesKsef');
    @lgpKSeF2_InvoicesQueryMetadata := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InvoicesQueryMetadata');
    @lgpKSeF2_InvoicesExport := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InvoicesExport');
    @lgpKSeF2_InvoicesExport2 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InvoicesExport2');
    @lgpKSeF2_InvoicesExportSimple := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InvoicesExportSimple');
    @lgpKSeF2_InvoicesExportSimple2 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InvoicesExportSimple2');
    @lgpKSeF2_InvoicesExportStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InvoicesExportStatus');
    @lgpKSeF2_InvoicesExportDownload := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_InvoicesExportDownload');

    @lgpKSeF2_TokensGenerate := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_TokensGenerate');
    @lgpKSeF2_TokensGenerate2 := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_TokensGenerate2');
    @lgpKSeF2_TokensList := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_TokensList');
    @lgpKSeF2_TokensStatus := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_TokensStatus');
    @lgpKSeF2_TokensRevoke := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_TokensRevoke');

    @lgpKSeF2_TestdataSubject := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_TestdataSubject');
    @lgpKSeF2_TestdataSubjectRemove := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_TestdataSubjectRemove');
    @lgpKSeF2_TestdataPerson := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_TestdataPerson');
    @lgpKSeF2_TestdataPersonRemove := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_TestdataPersonRemove');

    @lgpKSeF2_CreateKSeFClass := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_CreateKSeFClass');
    @lgpKSeF2_KSeFClassSetExt := GetProcAddress(LibGovPl4Handle, 'lgpKSeF2_KSeFClassSetExt');

    // Zgodnosc z poprzednia wersja biblioteki
    @edekInicjuj := GetProcAddress(LibGovPl4Handle, 'edekInicjuj');
    @edekOstatniBladTekst := GetProcAddress(LibGovPl4Handle, 'edekOstatniBladTekst');
    @edekZwolnijTekst := GetProcAddress(LibGovPl4Handle, 'edekZwolnijTekst');

    @edekCertyfikatIlosc := GetProcAddress(LibGovPl4Handle, 'edekCertyfikatIlosc');
    @edekCertyfikatDane := GetProcAddress(LibGovPl4Handle, 'edekCertyfikatDane');
    @edekCertyfikatPokaz := GetProcAddress(LibGovPl4Handle, 'edekCertyfikatPokaz');

    @edekPodpisz := GetProcAddress(LibGovPl4Handle, 'edekPodpisz');
    @edekPodpiszAut := GetProcAddress(LibGovPl4Handle, 'edekPodpiszAut');
    @edekWyslij := GetProcAddress(LibGovPl4Handle, 'edekWyslij');
    @edekPobierzUPO := GetProcAddress(LibGovPl4Handle, 'edekPobierzUPO');

    @jpkPodpisz := GetProcAddress(LibGovPl4Handle, 'jpkPodpisz');
    @jpkPodpisz2 := GetProcAddress(LibGovPl4Handle, 'jpkPodpisz2');
    @jpkPodpiszAut := GetProcAddress(LibGovPl4Handle, 'jpkPodpiszAut');
    @jpkWyslij := GetProcAddress(LibGovPl4Handle, 'jpkWyslij');
    @jpkWyslij2 := GetProcAddress(LibGovPl4Handle, 'jpkWyslij2');
    @jpkPobierzUPO := GetProcAddress(LibGovPl4Handle, 'jpkPobierzUPO');

    Result := True;
  end
  else
    Result := False;
end;
{$ENDIF}

end.

