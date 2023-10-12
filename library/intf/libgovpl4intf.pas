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

interface

uses
  Classes, SysUtils;

type
  LGP_PCHAR = PAnsiChar;
  LGP_INT32 = Int32;
  LGP_UINT32 = UInt32;
  LGP_DOUBLE = Double;
  LGP_CURRENCY = Currency;
  LGP_INT64 = Int64;
  LGP_PASDATETIME = Double;
  LGP_POINTER = Pointer;
  LGP_OBJECT = type Pointer;
  LGP_EXCEPTION = LGP_OBJECT;

  // Stream
  TlgpStreamReadFunc = function(AStreamObject: LGP_POINTER; AData: LGP_POINTER; ASize: LGP_INT32): LGP_INT32; stdcall;
  TlgpStreamWriteFunc = function(AStreamObject: LGP_POINTER; AData: LGP_POINTER; ASize: LGP_INT32): LGP_INT32; stdcall;
  TlgpStreamSeekFunc = function(AStreamObject: LGP_POINTER; AOffset: LGP_INT32; AOrigin: LGP_INT32): LGP_INT32; stdcall;
  TlgpStreamGetPositionFunc = function(AStreamObject: LGP_POINTER): LGP_INT32; stdcall;
  TlgpStreamGetSizeFunc = function(AStreamObject: LGP_POINTER): LGP_INT32; stdcall;


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

  LGP_CLSTYPE_MAX = LGP_CLSTYPE_EDEK_GATE;

  LGP_XADES_SHA1 = 1;
  LGP_XADES_SHA256 = 2;

  // Stream
  LGP_SEEKORIGIN_BEGINNING = soFromBeginning;
  LGP_SEEKORIGIN_CURRENT = soFromCurrent;
  LGP_SEEKORIGIN_END = soFromEnd;

  // XAdES
  LGP_XADES_SiGNTYPE_SHA1 = 0;
  LGP_XADES_SiGNTYPE_SHA256 = 1;
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
  LGP_KSEF_FORM_CODE_FA2 = 1;

  LGP_KSEF_SUBJECTTYPE_SUBJECT1 = 0;
  LGP_KSEF_SUBJECTTYPE_SUBJECT2 = 1;
  LGP_KSEF_SUBJECTTYPE_SUBJECT3 = 2;
  LGP_KSEF_SUBJECTTYPE_SUBJECTAUTHORIZED = 3;


// Backend
function lgplVersion: LGP_UINT32; external LGP_LIBNAME;
function lgplListDrivers(AClassType: LGP_INT32): LGP_PCHAR; external LGP_LIBNAME;
function lgplInit: LGP_INT32; external LGP_LIBNAME;
function lgpExit: LGP_INT32; external LGP_LIBNAME;
function lgplSetDefaultDriver(ADriverClass: LGP_INT32; ADriverName: LGP_PCHAR): LGP_INT32; external LGP_LIBNAME;

function lgpHTTPClient_Create(AClassName: LGP_PCHAR; var AHttpClient: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpHTTPClient_GetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpHTTPClient_SetIgnoreSSLErrors(AHTTPClientObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpRSAEncrypt_CreateKey(AClassName: LGP_PCHAR; AKeyStream: LGP_OBJECT; var ARSAKey: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpCertificate_GetDisplayName(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSubject(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetIssuer(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSerialNoDec(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetSerialNoHex(ACertificate: LGP_OBJECT; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetValidFrom(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificate_GetValidTo(ACertificate: LGP_OBJECT; var AValue: LGP_PASDATETIME): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpCNGCertificate_ShowCertificateInfo(ACertificate: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpCertificateSigner_Create(AClassName: LGP_PCHAR; var ACertSigner: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificateSigner_List(ACertificateSigner: LGP_OBJECT; var ACertList: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificateSigner_FindBySerialNumber(ACertificateSigner: LGP_OBJECT; ASerialNo: LGP_PCHAR; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpCertificateSigner_UISelect(ACertificateSigner: LGP_OBJECT; var ACertificate: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpCNGCertificateSigner_SetHWnd(ACertificateSigner: LGP_OBJECT; AHWnd: THandle): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;


// Object
function lgpObject_Free(AObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_ClassName(AObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetStringProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_SetStringProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetIntegerProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_SetIntegerProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpObject_GetDoubleProp(AObject: LGP_OBJECT; APropName: LGP_PCHAR; var AValue: LGP_DOUBLE): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
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
function lgpListObject_GetOwnsObjects(AListObject: LGP_OBJECT; var AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpListObject_SetOwnsObjects(AListObject: LGP_OBJECT; AValue: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// Stream
function lgpStream_Create(AStreamObject: Pointer; AReadFunc: TlgpStreamReadFunc;
  AWriteFunc: TlgpStreamWriteFunc; ASeekFunc: TlgpStreamSeekFunc;
  AGetPositionFunc: TlgpStreamGetPositionFunc; AGetSizeFunc: TlgpStreamGetSizeFunc;
  var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// WST EDek Gate
function lgpWST_RegisterTransport: LGP_EXCEPTiON; stdcall; external LGP_LIBNAME;
function lgpWST_GetHTTPClient(var AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpWST_SetHTTPClient(AHTTPClient: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// XAdES
function lgpXAdES_Create(ASHA1HashClass, ASHA256HashClass, ABase64EncoderClass: LGP_PCHAR;
  ASigner: LGP_OBJECT; var AXAdESObject: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetSHA1HashClass(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetSHA1HashClass(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetSHA256HashClass(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_SetSHA256HashClass(AXAdESObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpXAdES_GetBase64EncoderClass(AXAdESObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
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
function lgpEDek_GetXMLCanonizatorClass(AEDekObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_SetXMLCanonizatorClass(AEDekObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_GetEDekGateClass(AEDekObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_SetEDekGateClass(AEDekObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_GetCanonization(AEDekObj: LGP_OBJECT; var AC14N: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_SetCanonization(AEDekObj: LGP_OBJECT; AC14N: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpEDek_PodpiszCertyfikatem(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR; ACertyfikat: LGP_OBJECT; var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_PodpiszDanymiAut(AEDekObj: LGP_OBJECT; ADane: LGP_PCHAR; AImie, ANazwisko, ANIP: LGP_PCHAR; ADataUr: LGP_DOUBLE; AKwota: LGP_CURRENCY; var ADanePodpisane: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpEDek_Wyslij(AEDekObj: LGP_OBJECT; ADanePodpisane: LGP_PCHAR; ARodzajBramki: LGP_INT32; ARodzajPodpisu: LGP_INT32; var ANrRef: LGP_OBJECT; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpEDek_PobierzUPO(AEDekObj: LGP_OBJECT; ANrRef: LGP_PCHAR; ARodzajBramki: LGP_INT32; var AStatus: LGP_INT32; var AStatusOpis: LGP_OBJECT; var ADaneUPO: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// JPK
function lgpJPK_Create(ABase64EncoderClass, AAES256EncryptClass, AMD5HashClass, ASHA256HashClass, AZipperClass, ARSAEncryptClass, ARandomGeneratorClass, AXMLReaderClass: LGP_PCHAR; var AJPKObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpJPK_GetBase64EncoderClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetBase64EncoderClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetAES256EncryptClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetAES256EncryptClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetMD5HashClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetMD5HashClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetSHA256HashClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetSHA256HashClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetZipperClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetZipperClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetRSAEncryptClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetRSAEncryptClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetRandomGeneratorClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_SetRandomGeneratorClass(AJPKObj: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_GetXMLReaderClass(AJPKObj: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
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
function lgpJPK_SignDataAuth(AJPKObj: LGP_OBJECT; ANIP, AImiePierwsze, ANazwisko: LGP_PCHAR; ADataUrodzenia: LGP_DOUBLE; AKwota: LGP_CURRENCY; AGateType: LGP_INT32; AAdHoc: LGP_INT32; AInputStream, AOutputStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_Send(AJPKObj: LGP_OBJECT; AInitUpload: LGP_PCHAR; AEncryptedData: LGP_OBJECT; var ARefNo: LGP_OBJECT; AGateType: LGP_INT32; AVerifySign: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpJPK_RequestUPO(AJPKObj: LGP_OBJECT; ARefNo: LGP_PCHAR; AGateType: LGP_INT32; var AStatus: LGP_INT32; var AStatusDesc, ADetails, AUPO, ATimeStamp: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// KSeF
function lgpKSeF_Create(var AKSeFObj: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetRSAEncryptClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetRSAEncryptClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetBase64EncoderClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetBase64EncoderClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetAES256EncryptClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetAES256EncryptClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetSHA256HashClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_SetSHA256HashClass(AKSeFObject: LGP_OBJECT; AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_GetRandomGeneratorClass(AKSeFObject: LGP_OBJECT; var AClassName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
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
function lgpKSeF_InvoiceStatus(AKSeFObject: LGP_OBJECT; AInvoiceElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_QueryInvoiceSync(AKSeFObject: LGP_OBJECT; AQueryCriteria: LGP_OBJECT; APageSize, APageOffset: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_QueryInvoiceAsyncInit(AKSeFObject: LGP_OBJECT; AQueryCriteria: LGP_OBJECT; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_QueryInvoiceAsyncStatus(AKSeFObject: LGP_OBJECT; AQueryElementReferenceNumber: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_QueryInvoiceAsyncFetch(AKSeFObject: LGP_OBJECT; AQueryElementReferenceNumber, APartElementReferenceNumber: LGP_PCHAR; AOutStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_PaymentIdentifierGetReferenceNumbers(AKSeFObject: LGP_OBJECT; APaymentIdentifier: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_PaymentIdentifierRequest(AKSeFObject: LGP_OBJECT; AKsefReferenceNumberList: LGP_PCHAR; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_CommonInvoiceKSeF(AKSeFObject: LGP_OBJECT; AInvoiceRequest: LGP_OBJECT; AOutStream: LGP_OBJECT; AGateType: LGP_INT32): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_CommonStatus(AKSeFObject: LGP_OBJECT; AReferenceNumber: LGP_PCHAR; AGateType: LGP_INT32; var AResponse: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

function lgpKSeF_BatchSign(AKSeFObject: LGP_OBJECT; AZIPDataStream: LGP_OBJECT; APZ: LGP_INT32; AEncryptedStream: LGP_OBJECT; var AInitUpload: LGP_OBJECT; AZIPFileName, APartFileName: LGP_PCHAR): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;
function lgpKSeF_BatchSend(AKSeFObject: LGP_OBJECT; APartStream: LGP_OBJECT; AInitUpload: LGP_PCHAR; var ANrRef: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME;

// KSeF Obj
function lgpKSeF_CreateKSeFClass(AClassName: LGP_PCHAR): LGP_OBJECT; stdcall; external LGP_LIBNAME;

implementation

end.

