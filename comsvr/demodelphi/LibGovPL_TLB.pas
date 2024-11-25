unit LibGovPL_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 22/11/2024 16:53:30 from Type Library described below.

// ************************************************************************  //
// Type Lib: c:\DELPHI\libgovpl4com32.dll (1)
// LIBID: {923701A2-ECEF-4DD8-A560-51B56CB1FE75}
// LCID: 0
// Helpfile: 
// HelpString: LibGovPl4com Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  LibGovPLMajorVersion = 1;
  LibGovPLMinorVersion = 0;

  LIBID_LibGovPL: TGUID = '{923701A2-ECEF-4DD8-A560-51B56CB1FE75}';

  IID_IlgcErrorInfo: TGUID = '{9043B49E-3089-4FDB-9575-3DBE9AD258AE}';
  IID_IlgcBaseObject: TGUID = '{617C8313-E12F-47FA-A01E-AC0A212C8855}';
  IID_IlgcBackend: TGUID = '{393A6861-4A95-4CED-8B93-3A8FFA77F5C3}';
  IID_IlgcWSTBackend: TGUID = '{D829DEDA-20A8-4C28-9A38-7F42F599C8D7}';
  IID_IlgcLibXMLBackend: TGUID = '{D87A7A97-38CD-4172-92B0-5AA97BECB494}';
  IID_IlgcOpenSSLBackend: TGUID = '{516EC757-193C-42B4-9B5A-FE64059129AD}';
  IID_IlgcObject: TGUID = '{A7720948-5883-4F9E-8355-F57381433787}';
  IID_IlgcList: TGUID = '{F0A18AD2-8F91-4C8E-845A-B2F3524A390A}';
  IID_IlgcStringStream: TGUID = '{5F50981B-976D-4E90-A682-E2DC34115CDA}';
  IID_IlgcFileStream: TGUID = '{2B2E8876-C57E-4879-AFD6-6AF218D4705D}';
  IID_IlgcHTTPClient: TGUID = '{0587DB7A-AAFF-4900-B734-4BACE3EEE8FA}';
  IID_IlgcCertificate: TGUID = '{322D506B-4C30-43D1-A75E-F4D308D79022}';
  IID_IlgcCertificateSigner: TGUID = '{913A275A-8D26-4762-8C08-4D2CA11D214D}';
  IID_IlgcCNGCertificateSigner: TGUID = '{A1AE7A86-2200-494B-8C4D-FF5E0C97C268}';
  IID_IlgcPKCS11Info: TGUID = '{FA907E32-D103-4C20-B955-A0A6D478C7C7}';
  IID_IlgcPKCS11TokenInfo: TGUID = '{B4BB1EDB-4F32-4B0C-B390-566F02237A55}';
  IID_IlgcPKCS11SlotInfo: TGUID = '{597607F4-CA0A-4722-BBC9-EB15ECAEBA49}';
  IID_IlgcPKCS11Session: TGUID = '{BB0C246D-BA87-44C4-B614-53FB1D4AE900}';
  IID_IlgcPKCS11Certificate: TGUID = '{A14EB3D8-25C5-4C22-B6AA-3E7EA2884D78}';
  IID_IlgcPKCS11CertificateSigner: TGUID = '{02F51066-4584-476A-B0DB-CDFCA648B534}';
  IID_IlgcPKCS11Backend: TGUID = '{4B3C369B-79D4-4B26-862C-691E41E74AD1}';
  IID_IlgcXAdES: TGUID = '{50DC95DF-A1C2-460D-8A46-D90BE7016886}';
  IID_IlgcEDeklaracjaStatus: TGUID = '{79E8257A-AE97-4D81-BE00-6B69700BDFCE}';
  IID_IlgcEDeklaracja: TGUID = '{4C7E267D-D83D-4713-9120-CB57D7881F33}';
  IID_IlgcJPK: TGUID = '{5EB2F974-0D10-44D4-AA8F-E557BB91FF30}';
  IID_IlgcKSeFRequest: TGUID = '{7B4EF1CE-8FC8-433C-99E4-A446E6F62D98}';
  IID_IlgcKSeFResponse: TGUID = '{9ED3DF16-92DA-4EDC-BC63-FC17CDDF9BDC}';
  IID_IlgcKSeFBase: TGUID = '{452578AC-F2AE-4771-9FCF-5F4DC66021CD}';
  IID_IlgcKSeF_2_6_0: TGUID = '{C44AAC54-CE22-421C-B159-B864DF2EB753}';
  IID_IlgcMemoryStream: TGUID = '{BCF17136-365B-4AF4-9720-44EB9E4CABB0}';
  CLASS_lgcErrorInfo: TGUID = '{635B56F7-B613-4E78-8AE3-B37C4591668B}';
  CLASS_lgcBaseObject: TGUID = '{2966D8CF-42F7-4AFF-9BB4-F3FA1DA714A6}';
  CLASS_lgcBackend: TGUID = '{2FAD736C-1297-4705-B19F-AD1EE260A9A2}';
  CLASS_lgcObject: TGUID = '{BCC209CD-4297-48D7-A37D-C15FAC40E5E0}';
  CLASS_lgcList: TGUID = '{8BAC56DE-067C-4302-8EB7-A6F8CF305B2A}';
  CLASS_lgcWSTBackend: TGUID = '{04CF0786-A71D-4415-930B-3F83EFDAA785}';
  CLASS_lgcLibXMLBackend: TGUID = '{9E2861C0-9FF3-48E8-9C88-6A00C8109DC2}';
  CLASS_lgcOpenSSLBackend: TGUID = '{EC4729F3-7024-45C5-84DD-F0EEE1BD0B6B}';
  CLASS_lgcStringStream: TGUID = '{ABB6BB86-F269-4E8A-98B5-E647B0CFA3EC}';
  CLASS_lgcFileStream: TGUID = '{FA48C1DA-7774-4663-837F-40E473BBF8BB}';
  CLASS_lgcMemoryStream: TGUID = '{E444DD02-F45D-4223-BD84-0BB223ABCEAF}';
  CLASS_lgcHTTPClient: TGUID = '{9CC81EAA-644D-4554-A55D-8EAB6452511A}';
  CLASS_lgcCertificate: TGUID = '{C706CFE8-C856-4D00-B0B4-0FDE4EDC3E24}';
  CLASS_lgcCertificateSigner: TGUID = '{223F3D90-F22D-4D41-8BFD-B792C1F62D94}';
  CLASS_lgcCNGCertificateSigner: TGUID = '{146721D2-FAC8-4268-B0DD-CF3281292560}';
  CLASS_lgcPKCS11Info: TGUID = '{95C1BB09-0646-43A0-927B-0D3103E0F3FA}';
  CLASS_lgcPKCS11TokenInfo: TGUID = '{3BF254C8-F3C5-4D35-B2C0-DA0C2A17C0AD}';
  CLASS_lgcPKCS11SlotInfo: TGUID = '{792248A8-5FBD-4E62-899C-6FC9B2FB34CF}';
  CLASS_lgcPKCS11Session: TGUID = '{9FE1B11E-84AE-42B4-BE72-7D67C9618F51}';
  CLASS_lgcPKCS11Certificate: TGUID = '{2C30F57F-8A42-4E99-BB74-C98B9642A069}';
  CLASS_lgcPKCS11CertificateSigner: TGUID = '{F8B3FB4E-78AC-432E-BDAC-704948690547}';
  CLASS_lgcPKCS11Backend: TGUID = '{328DF6A8-3E5D-40A8-905A-281A9571726C}';
  CLASS_lgcXAdES: TGUID = '{3C94F1FA-4A88-42FF-B2C9-B4FB9121E3E2}';
  CLASS_lgcEDeklaracjaStatus: TGUID = '{39A1AFDC-A1E7-4034-99E7-BE8FB01861BF}';
  CLASS_lgcEDeklaracja: TGUID = '{BB0AC581-5B43-4757-8625-94041A59D459}';
  CLASS_lgcJPK: TGUID = '{5BD3B376-EE5B-40AC-91F3-B6A093640651}';
  CLASS_lgcKSeFRequest: TGUID = '{3C4A4763-D416-4CF7-BBF5-FE3ED580D12B}';
  CLASS_lgcKSeFResponse: TGUID = '{A6040209-EA0A-4861-A425-B0B486CFE55B}';
  CLASS_lgcKSeFBase: TGUID = '{15C1BB69-A675-48E5-A7E8-FDF9BCBA50A8}';
  CLASS_lgcKSeF_2_6_0: TGUID = '{448AC566-E8A4-4560-B717-6CB3526EFC49}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum lgcClassType
type
  lgcClassType = TOleEnum;
const
  lgcCTHTTPClient = $00000000;
  lgcCTCertSigner = $00000001;
  lgcCTRandGenerator = $00000002;
  lgcCTBase64Encoder = $00000003;
  lgcCTMD5Hash = $00000004;
  lgcCTSHA1Hash = $00000005;
  lgcCTSHA256Hash = $00000006;
  lgcCTAES256Encrypt = $00000007;
  lgcCTRSAEncrypt = $00000008;
  lgcCTZipper = $00000009;
  lgcCTXMLReader = $0000000A;
  lgcCTXMLC14N = $0000000B;
  lgcCTEdekGate = $0000000C;

// Constants for enum lgcPropertyType
type
  lgcPropertyType = TOleEnum;
const
  lgcPTUnknown = $00000000;
  lgcPTString = $00000001;
  lgcPTInt32 = $00000002;
  lgcPTInt64 = $00000003;
  lgcPTDouble = $00000004;
  lgcPTCurrency = $00000005;
  lgcPTBoolean = $00000006;
  lgcPTDateTime = $00000007;
  lgcPTObject = $00000008;
  lgcPTObjectList = $00000009;

// Constants for enum lgcPKCS11UserType
type
  lgcPKCS11UserType = TOleEnum;
const
  lgcP11UTSO = $00000000;
  lgcP11UTUser = $00000001;
  lgcP11UTContextSpecific = $00000002;

// Constants for enum lgcPKCS11SessionState
type
  lgcPKCS11SessionState = TOleEnum;
const
  lgcP11SSROPublicSession = $00000000;
  lgcP11SSROUserFunctions = $00000001;
  lgcP11SSRWPublicSession = $00000002;
  lgcP11SSRWUserFunctions = $00000003;
  lgcP11SSRWSOFunctions = $00000004;

// Constants for enum lgcSignHashType
type
  lgcSignHashType = TOleEnum;
const
  lgcSHTSHA1 = $00000000;
  lgcSHTSHA256 = $00000001;

// Constants for enum lgcXAdESSerialNoFormat
type
  lgcXAdESSerialNoFormat = TOleEnum;
const
  lgcXSFDecimal = $00000000;
  lgcXSFHex = $00000001;

// Constants for enum lgcEDekGateType
type
  lgcEDekGateType = TOleEnum;
const
  lgcEGTProduction = $00000000;
  lgcEGTTest = $00000001;

// Constants for enum lgcEDekSignType
type
  lgcEDekSignType = TOleEnum;
const
  lgcESTCertificate = $00000000;
  lgcESTAuthData = $00000001;

// Constants for enum lgcKSeFGateType
type
  lgcKSeFGateType = TOleEnum;
const
  lgcKTGProd = $00000000;
  lgcKTGDemo = $00000001;
  lgcKTGTest = $00000002;

// Constants for enum lgcKSeFNumberVariant
type
  lgcKSeFNumberVariant = TOleEnum;
const
  lgcKNVDefault = $00000000;
  lgcKNV35 = $00000001;
  lgcKNV36 = $00000002;

// Constants for enum lgcKSeFCertificateAuthType
type
  lgcKSeFCertificateAuthType = TOleEnum;
const
  lgcCATSerialNumber = $00000000;
  lgcCATFingerprint = $00000001;

// Constants for enum lgcFileMode
type
  lgcFileMode = TOleEnum;
const
  lgcFMOpenRead = $00000000;
  lgcFMOpenWrite = $00000001;
  lgcFMOpenReadWrite = $00000002;
  lgcFMShareCompat = $00000000;
  lgcFMShareExclusive = $00000010;
  lgcFMShareDenyWrite = $00000020;
  lgcFMShareDenyRead = $00000030;
  lgcFMShareDenyNone = $00000040;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IlgcErrorInfo = interface;
  IlgcErrorInfoDisp = dispinterface;
  IlgcBaseObject = interface;
  IlgcBaseObjectDisp = dispinterface;
  IlgcBackend = interface;
  IlgcBackendDisp = dispinterface;
  IlgcWSTBackend = interface;
  IlgcWSTBackendDisp = dispinterface;
  IlgcLibXMLBackend = interface;
  IlgcLibXMLBackendDisp = dispinterface;
  IlgcOpenSSLBackend = interface;
  IlgcOpenSSLBackendDisp = dispinterface;
  IlgcObject = interface;
  IlgcObjectDisp = dispinterface;
  IlgcList = interface;
  IlgcListDisp = dispinterface;
  IlgcStringStream = interface;
  IlgcStringStreamDisp = dispinterface;
  IlgcFileStream = interface;
  IlgcFileStreamDisp = dispinterface;
  IlgcHTTPClient = interface;
  IlgcHTTPClientDisp = dispinterface;
  IlgcCertificate = interface;
  IlgcCertificateDisp = dispinterface;
  IlgcCertificateSigner = interface;
  IlgcCertificateSignerDisp = dispinterface;
  IlgcCNGCertificateSigner = interface;
  IlgcCNGCertificateSignerDisp = dispinterface;
  IlgcPKCS11Info = interface;
  IlgcPKCS11InfoDisp = dispinterface;
  IlgcPKCS11TokenInfo = interface;
  IlgcPKCS11TokenInfoDisp = dispinterface;
  IlgcPKCS11SlotInfo = interface;
  IlgcPKCS11SlotInfoDisp = dispinterface;
  IlgcPKCS11Session = interface;
  IlgcPKCS11SessionDisp = dispinterface;
  IlgcPKCS11Certificate = interface;
  IlgcPKCS11CertificateDisp = dispinterface;
  IlgcPKCS11CertificateSigner = interface;
  IlgcPKCS11CertificateSignerDisp = dispinterface;
  IlgcPKCS11Backend = interface;
  IlgcPKCS11BackendDisp = dispinterface;
  IlgcXAdES = interface;
  IlgcXAdESDisp = dispinterface;
  IlgcEDeklaracjaStatus = interface;
  IlgcEDeklaracjaStatusDisp = dispinterface;
  IlgcEDeklaracja = interface;
  IlgcEDeklaracjaDisp = dispinterface;
  IlgcJPK = interface;
  IlgcJPKDisp = dispinterface;
  IlgcKSeFRequest = interface;
  IlgcKSeFRequestDisp = dispinterface;
  IlgcKSeFResponse = interface;
  IlgcKSeFResponseDisp = dispinterface;
  IlgcKSeFBase = interface;
  IlgcKSeFBaseDisp = dispinterface;
  IlgcKSeF_2_6_0 = interface;
  IlgcKSeF_2_6_0Disp = dispinterface;
  IlgcMemoryStream = interface;
  IlgcMemoryStreamDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  lgcErrorInfo = IlgcErrorInfo;
  lgcBaseObject = IlgcBaseObject;
  lgcBackend = IlgcBackend;
  lgcObject = IlgcObject;
  lgcList = IlgcList;
  lgcWSTBackend = IlgcWSTBackend;
  lgcLibXMLBackend = IlgcLibXMLBackend;
  lgcOpenSSLBackend = IlgcOpenSSLBackend;
  lgcStringStream = IlgcStringStream;
  lgcFileStream = IlgcFileStream;
  lgcMemoryStream = IlgcMemoryStream;
  lgcHTTPClient = IlgcHTTPClient;
  lgcCertificate = IlgcCertificate;
  lgcCertificateSigner = IlgcCertificateSigner;
  lgcCNGCertificateSigner = IlgcCNGCertificateSigner;
  lgcPKCS11Info = IlgcPKCS11Info;
  lgcPKCS11TokenInfo = IlgcPKCS11TokenInfo;
  lgcPKCS11SlotInfo = IlgcPKCS11SlotInfo;
  lgcPKCS11Session = IlgcPKCS11Session;
  lgcPKCS11Certificate = IlgcPKCS11Certificate;
  lgcPKCS11CertificateSigner = IlgcPKCS11CertificateSigner;
  lgcPKCS11Backend = IlgcPKCS11Backend;
  lgcXAdES = IlgcXAdES;
  lgcEDeklaracjaStatus = IlgcEDeklaracjaStatus;
  lgcEDeklaracja = IlgcEDeklaracja;
  lgcJPK = IlgcJPK;
  lgcKSeFRequest = IlgcKSeFRequest;
  lgcKSeFResponse = IlgcKSeFResponse;
  lgcKSeFBase = IlgcKSeFBase;
  lgcKSeF_2_6_0 = IlgcKSeF_2_6_0;


// *********************************************************************//
// Interface: IlgcErrorInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9043B49E-3089-4FDB-9575-3DBE9AD258AE}
// *********************************************************************//
  IlgcErrorInfo = interface(IDispatch)
    ['{9043B49E-3089-4FDB-9575-3DBE9AD258AE}']
    function Get_ExceptionClass: WideString; safecall;
    function Get_Message: WideString; safecall;
    function Get_ExtraInfo: OleVariant; safecall;
    function Get_HandlerClass: WideString; safecall;
    property ExceptionClass: WideString read Get_ExceptionClass;
    property Message: WideString read Get_Message;
    property ExtraInfo: OleVariant read Get_ExtraInfo;
    property HandlerClass: WideString read Get_HandlerClass;
  end;

// *********************************************************************//
// DispIntf:  IlgcErrorInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9043B49E-3089-4FDB-9575-3DBE9AD258AE}
// *********************************************************************//
  IlgcErrorInfoDisp = dispinterface
    ['{9043B49E-3089-4FDB-9575-3DBE9AD258AE}']
    property ExceptionClass: WideString readonly dispid 3001;
    property Message: WideString readonly dispid 3002;
    property ExtraInfo: OleVariant readonly dispid 3003;
    property HandlerClass: WideString readonly dispid 3004;
  end;

// *********************************************************************//
// Interface: IlgcBaseObject
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {617C8313-E12F-47FA-A01E-AC0A212C8855}
// *********************************************************************//
  IlgcBaseObject = interface(IDispatch)
    ['{617C8313-E12F-47FA-A01E-AC0A212C8855}']
    function GetObjClassName: WideString; safecall;
    procedure ClearLastError; safecall;
    function Get_LastError: IDispatch; safecall;
    property LastError: IDispatch read Get_LastError;
  end;

// *********************************************************************//
// DispIntf:  IlgcBaseObjectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {617C8313-E12F-47FA-A01E-AC0A212C8855}
// *********************************************************************//
  IlgcBaseObjectDisp = dispinterface
    ['{617C8313-E12F-47FA-A01E-AC0A212C8855}']
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcBackend
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {393A6861-4A95-4CED-8B93-3A8FFA77F5C3}
// *********************************************************************//
  IlgcBackend = interface(IlgcBaseObject)
    ['{393A6861-4A95-4CED-8B93-3A8FFA77F5C3}']
    function GetLibVersion: WideString; safecall;
    function GetDebugInfo(CounterType: Integer): OleVariant; safecall;
    function GetClassCount(ClsType: lgcClassType): Integer; safecall;
    function GetClassName(ClsType: lgcClassType; ClassIndex: Integer): WideString; safecall;
    function GetClassNames(ClsType: lgcClassType): OleVariant; safecall;
    function CreateFileStream(const FileName: WideString; Mode: Integer): IDispatch; safecall;
    function CreateHTTPClient(const ClsName: WideString): IDispatch; safecall;
    function CreateRSAKey(const ClsName: WideString; Source: OleVariant): IDispatch; safecall;
    function CreateCertificateSigner(const ClsName: WideString): IDispatch; safecall;
    function CreateXAdES: IDispatch; safecall;
    function CreateEDeklaracja: IDispatch; safecall;
    function CreateJPK: IDispatch; safecall;
    function CreateKSeF: IDispatch; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcBackendDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {393A6861-4A95-4CED-8B93-3A8FFA77F5C3}
// *********************************************************************//
  IlgcBackendDisp = dispinterface
    ['{393A6861-4A95-4CED-8B93-3A8FFA77F5C3}']
    function GetLibVersion: WideString; dispid 2001;
    function GetDebugInfo(CounterType: Integer): OleVariant; dispid 2002;
    function GetClassCount(ClsType: lgcClassType): Integer; dispid 2003;
    function GetClassName(ClsType: lgcClassType; ClassIndex: Integer): WideString; dispid 2004;
    function GetClassNames(ClsType: lgcClassType): OleVariant; dispid 2005;
    function CreateFileStream(const FileName: WideString; Mode: Integer): IDispatch; dispid 2006;
    function CreateHTTPClient(const ClsName: WideString): IDispatch; dispid 2007;
    function CreateRSAKey(const ClsName: WideString; Source: OleVariant): IDispatch; dispid 2008;
    function CreateCertificateSigner(const ClsName: WideString): IDispatch; dispid 2009;
    function CreateXAdES: IDispatch; dispid 2010;
    function CreateEDeklaracja: IDispatch; dispid 2011;
    function CreateJPK: IDispatch; dispid 2012;
    function CreateKSeF: IDispatch; dispid 2013;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcWSTBackend
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D829DEDA-20A8-4C28-9A38-7F42F599C8D7}
// *********************************************************************//
  IlgcWSTBackend = interface(IlgcBaseObject)
    ['{D829DEDA-20A8-4C28-9A38-7F42F599C8D7}']
    procedure RegisterTransport; safecall;
    function Get_HTTPClient: IDispatch; safecall;
    procedure Set_HTTPClient(const Value: IDispatch); safecall;
    property HTTPClient: IDispatch read Get_HTTPClient write Set_HTTPClient;
  end;

// *********************************************************************//
// DispIntf:  IlgcWSTBackendDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D829DEDA-20A8-4C28-9A38-7F42F599C8D7}
// *********************************************************************//
  IlgcWSTBackendDisp = dispinterface
    ['{D829DEDA-20A8-4C28-9A38-7F42F599C8D7}']
    procedure RegisterTransport; dispid 4001;
    property HTTPClient: IDispatch dispid 4002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcLibXMLBackend
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D87A7A97-38CD-4172-92B0-5AA97BECB494}
// *********************************************************************//
  IlgcLibXMLBackend = interface(IlgcBaseObject)
    ['{D87A7A97-38CD-4172-92B0-5AA97BECB494}']
    procedure LoadLibXML(const LibFileName: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcLibXMLBackendDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D87A7A97-38CD-4172-92B0-5AA97BECB494}
// *********************************************************************//
  IlgcLibXMLBackendDisp = dispinterface
    ['{D87A7A97-38CD-4172-92B0-5AA97BECB494}']
    procedure LoadLibXML(const LibFileName: WideString); dispid 5001;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcOpenSSLBackend
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {516EC757-193C-42B4-9B5A-FE64059129AD}
// *********************************************************************//
  IlgcOpenSSLBackend = interface(IlgcBaseObject)
    ['{516EC757-193C-42B4-9B5A-FE64059129AD}']
    procedure LoadOpenSSL(const SSLName: WideString; const CryptoName: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcOpenSSLBackendDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {516EC757-193C-42B4-9B5A-FE64059129AD}
// *********************************************************************//
  IlgcOpenSSLBackendDisp = dispinterface
    ['{516EC757-193C-42B4-9B5A-FE64059129AD}']
    procedure LoadOpenSSL(const SSLName: WideString; const CryptoName: WideString); dispid 6001;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcObject
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A7720948-5883-4F9E-8355-F57381433787}
// *********************************************************************//
  IlgcObject = interface(IlgcBaseObject)
    ['{A7720948-5883-4F9E-8355-F57381433787}']
    function Get_ExtObject: Pointer; safecall;
    function Get_StringProp(const Name: WideString): WideString; safecall;
    procedure Set_StringProp(const Name: WideString; const Value: WideString); safecall;
    function Get_IntegerProp(const Name: WideString): Integer; safecall;
    procedure Set_IntegerProp(const Name: WideString; Value: Integer); safecall;
    function Get_DoubleProp(const Name: WideString): Double; safecall;
    procedure Set_DoubleProp(const Name: WideString; Value: Double); safecall;
    function Get_CurrencyProp(const Name: WideString): Currency; safecall;
    procedure Set_CurrencyProp(const Name: WideString; Value: Currency); safecall;
    function Get_BooleanProp(const Name: WideString): WordBool; safecall;
    procedure Set_BooleanProp(const Name: WideString; Value: WordBool); safecall;
    function Get_Int64Prop(const Name: WideString): Int64; safecall;
    procedure Set_Int64Prop(const Name: WideString; Value: Int64); safecall;
    function Get_DateProp(const Name: WideString): TDateTime; safecall;
    procedure Set_DateProp(const Name: WideString; Value: TDateTime); safecall;
    function ListProps: OleVariant; safecall;
    function PropType(const PropName: WideString): lgcPropertyType; safecall;
    function ObjectPropClass(const PropName: WideString): WideString; safecall;
    procedure SetObjectProp(const Name: WideString; Value: OleVariant); safecall;
    function GetObjectProp(const Name: WideString): OleVariant; safecall;
    property ExtObject: Pointer read Get_ExtObject;
    property StringProp[const Name: WideString]: WideString read Get_StringProp write Set_StringProp;
    property IntegerProp[const Name: WideString]: Integer read Get_IntegerProp write Set_IntegerProp;
    property DoubleProp[const Name: WideString]: Double read Get_DoubleProp write Set_DoubleProp;
    property CurrencyProp[const Name: WideString]: Currency read Get_CurrencyProp write Set_CurrencyProp;
    property BooleanProp[const Name: WideString]: WordBool read Get_BooleanProp write Set_BooleanProp;
    property Int64Prop[const Name: WideString]: Int64 read Get_Int64Prop write Set_Int64Prop;
    property DateProp[const Name: WideString]: TDateTime read Get_DateProp write Set_DateProp;
  end;

// *********************************************************************//
// DispIntf:  IlgcObjectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A7720948-5883-4F9E-8355-F57381433787}
// *********************************************************************//
  IlgcObjectDisp = dispinterface
    ['{A7720948-5883-4F9E-8355-F57381433787}']
    property ExtObject: {??Pointer}OleVariant readonly dispid 7001;
    property StringProp[const Name: WideString]: WideString dispid 7002;
    property IntegerProp[const Name: WideString]: Integer dispid 7003;
    property DoubleProp[const Name: WideString]: Double dispid 7004;
    property CurrencyProp[const Name: WideString]: Currency dispid 7005;
    property BooleanProp[const Name: WideString]: WordBool dispid 7006;
    property Int64Prop[const Name: WideString]: {??Int64}OleVariant dispid 7007;
    property DateProp[const Name: WideString]: TDateTime dispid 7008;
    function ListProps: OleVariant; dispid 7009;
    function PropType(const PropName: WideString): lgcPropertyType; dispid 7010;
    function ObjectPropClass(const PropName: WideString): WideString; dispid 7011;
    procedure SetObjectProp(const Name: WideString; Value: OleVariant); dispid 7012;
    function GetObjectProp(const Name: WideString): OleVariant; dispid 7013;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F0A18AD2-8F91-4C8E-845A-B2F3524A390A}
// *********************************************************************//
  IlgcList = interface(IlgcBaseObject)
    ['{F0A18AD2-8F91-4C8E-845A-B2F3524A390A}']
    procedure Add(Item: OleVariant; Key: OleVariant); safecall;
    procedure Remove(Index: OleVariant); safecall;
    function Get_Count: Integer; safecall;
    function Get_Item(Index: OleVariant): OleVariant; safecall;
    function _NewEnum: IUnknown; safecall;
    procedure Delete(ObjIndex: Integer); safecall;
    property Count: Integer read Get_Count;
    property Item[Index: OleVariant]: OleVariant read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  IlgcListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F0A18AD2-8F91-4C8E-845A-B2F3524A390A}
// *********************************************************************//
  IlgcListDisp = dispinterface
    ['{F0A18AD2-8F91-4C8E-845A-B2F3524A390A}']
    procedure Add(Item: OleVariant; Key: OleVariant); dispid 1;
    procedure Remove(Index: OleVariant); dispid 2;
    property Count: Integer readonly dispid 3;
    property Item[Index: OleVariant]: OleVariant readonly dispid 0; default;
    function _NewEnum: IUnknown; dispid -4;
    procedure Delete(ObjIndex: Integer); dispid 8001;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcStringStream
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5F50981B-976D-4E90-A682-E2DC34115CDA}
// *********************************************************************//
  IlgcStringStream = interface(IlgcBaseObject)
    ['{5F50981B-976D-4E90-A682-E2DC34115CDA}']
    function Get_Data: WideString; safecall;
    procedure Set_Data(const Value: WideString); safecall;
    procedure Clear; safecall;
    procedure LoadFromFile(const AFileName: WideString); safecall;
    procedure SaveToFile(const AFileName: WideString); safecall;
    property Data: WideString read Get_Data write Set_Data;
  end;

// *********************************************************************//
// DispIntf:  IlgcStringStreamDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5F50981B-976D-4E90-A682-E2DC34115CDA}
// *********************************************************************//
  IlgcStringStreamDisp = dispinterface
    ['{5F50981B-976D-4E90-A682-E2DC34115CDA}']
    property Data: WideString dispid 9001;
    procedure Clear; dispid 9002;
    procedure LoadFromFile(const AFileName: WideString); dispid 9003;
    procedure SaveToFile(const AFileName: WideString); dispid 9004;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcFileStream
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2B2E8876-C57E-4879-AFD6-6AF218D4705D}
// *********************************************************************//
  IlgcFileStream = interface(IlgcBaseObject)
    ['{2B2E8876-C57E-4879-AFD6-6AF218D4705D}']
    function Get_FileName: WideString; safecall;
    property FileName: WideString read Get_FileName;
  end;

// *********************************************************************//
// DispIntf:  IlgcFileStreamDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2B2E8876-C57E-4879-AFD6-6AF218D4705D}
// *********************************************************************//
  IlgcFileStreamDisp = dispinterface
    ['{2B2E8876-C57E-4879-AFD6-6AF218D4705D}']
    property FileName: WideString readonly dispid 10001;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcHTTPClient
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0587DB7A-AAFF-4900-B734-4BACE3EEE8FA}
// *********************************************************************//
  IlgcHTTPClient = interface(IlgcBaseObject)
    ['{0587DB7A-AAFF-4900-B734-4BACE3EEE8FA}']
    function Get_IgnoreSSLErrors: WordBool; safecall;
    procedure Set_IgnoreSSLErrors(Value: WordBool); safecall;
    property IgnoreSSLErrors: WordBool read Get_IgnoreSSLErrors write Set_IgnoreSSLErrors;
  end;

// *********************************************************************//
// DispIntf:  IlgcHTTPClientDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0587DB7A-AAFF-4900-B734-4BACE3EEE8FA}
// *********************************************************************//
  IlgcHTTPClientDisp = dispinterface
    ['{0587DB7A-AAFF-4900-B734-4BACE3EEE8FA}']
    property IgnoreSSLErrors: WordBool dispid 12001;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcCertificate
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {322D506B-4C30-43D1-A75E-F4D308D79022}
// *********************************************************************//
  IlgcCertificate = interface(IlgcBaseObject)
    ['{322D506B-4C30-43D1-A75E-F4D308D79022}']
    function Get_DisplayName: WideString; safecall;
    function Get_Subject: WideString; safecall;
    function Get_Issuer: WideString; safecall;
    function Get_SerialNoDec: WideString; safecall;
    function Get_SerialNoHex: WideString; safecall;
    function Get_ValidFrom: OleVariant; safecall;
    function Get_ValidTo: OleVariant; safecall;
    procedure Set_PIN(const Param1: WideString); safecall;
    procedure ShowCertificateInfo(WinHandle: OleVariant); safecall;
    property DisplayName: WideString read Get_DisplayName;
    property Subject: WideString read Get_Subject;
    property Issuer: WideString read Get_Issuer;
    property SerialNoDec: WideString read Get_SerialNoDec;
    property SerialNoHex: WideString read Get_SerialNoHex;
    property ValidFrom: OleVariant read Get_ValidFrom;
    property ValidTo: OleVariant read Get_ValidTo;
    property PIN: WideString write Set_PIN;
  end;

// *********************************************************************//
// DispIntf:  IlgcCertificateDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {322D506B-4C30-43D1-A75E-F4D308D79022}
// *********************************************************************//
  IlgcCertificateDisp = dispinterface
    ['{322D506B-4C30-43D1-A75E-F4D308D79022}']
    property DisplayName: WideString readonly dispid 13001;
    property Subject: WideString readonly dispid 13002;
    property Issuer: WideString readonly dispid 13003;
    property SerialNoDec: WideString readonly dispid 13004;
    property SerialNoHex: WideString readonly dispid 13005;
    property ValidFrom: OleVariant readonly dispid 13006;
    property ValidTo: OleVariant readonly dispid 13007;
    property PIN: WideString writeonly dispid 13008;
    procedure ShowCertificateInfo(WinHandle: OleVariant); dispid 13009;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcCertificateSigner
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {913A275A-8D26-4762-8C08-4D2CA11D214D}
// *********************************************************************//
  IlgcCertificateSigner = interface(IlgcBaseObject)
    ['{913A275A-8D26-4762-8C08-4D2CA11D214D}']
    function List: IDispatch; safecall;
    function UISelect: IDispatch; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcCertificateSignerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {913A275A-8D26-4762-8C08-4D2CA11D214D}
// *********************************************************************//
  IlgcCertificateSignerDisp = dispinterface
    ['{913A275A-8D26-4762-8C08-4D2CA11D214D}']
    function List: IDispatch; dispid 14001;
    function UISelect: IDispatch; dispid 14002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcCNGCertificateSigner
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1AE7A86-2200-494B-8C4D-FF5E0C97C268}
// *********************************************************************//
  IlgcCNGCertificateSigner = interface(IlgcCertificateSigner)
    ['{A1AE7A86-2200-494B-8C4D-FF5E0C97C268}']
    function Get_WinHandle: OleVariant; safecall;
    procedure Set_WinHandle(Value: OleVariant); safecall;
    property WinHandle: OleVariant read Get_WinHandle write Set_WinHandle;
  end;

// *********************************************************************//
// DispIntf:  IlgcCNGCertificateSignerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1AE7A86-2200-494B-8C4D-FF5E0C97C268}
// *********************************************************************//
  IlgcCNGCertificateSignerDisp = dispinterface
    ['{A1AE7A86-2200-494B-8C4D-FF5E0C97C268}']
    property WinHandle: OleVariant dispid 15001;
    function List: IDispatch; dispid 14001;
    function UISelect: IDispatch; dispid 14002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcPKCS11Info
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FA907E32-D103-4C20-B955-A0A6D478C7C7}
// *********************************************************************//
  IlgcPKCS11Info = interface(IlgcBaseObject)
    ['{FA907E32-D103-4C20-B955-A0A6D478C7C7}']
    function Get_CryptokitVersionStr: WideString; safecall;
    function Get_CryptokitVersionMajor: Integer; safecall;
    function Get_CryptokitVersionMinor: Integer; safecall;
    function Get_ManufacturerID: WideString; safecall;
    function Get_LibraryDescription: WideString; safecall;
    function Get_LibraryVersionStr: WideString; safecall;
    function Get_LibraryVersionMajor: Integer; safecall;
    function Get_LibraryVersionMinor: Integer; safecall;
    property CryptokitVersionStr: WideString read Get_CryptokitVersionStr;
    property CryptokitVersionMajor: Integer read Get_CryptokitVersionMajor;
    property CryptokitVersionMinor: Integer read Get_CryptokitVersionMinor;
    property ManufacturerID: WideString read Get_ManufacturerID;
    property LibraryDescription: WideString read Get_LibraryDescription;
    property LibraryVersionStr: WideString read Get_LibraryVersionStr;
    property LibraryVersionMajor: Integer read Get_LibraryVersionMajor;
    property LibraryVersionMinor: Integer read Get_LibraryVersionMinor;
  end;

// *********************************************************************//
// DispIntf:  IlgcPKCS11InfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FA907E32-D103-4C20-B955-A0A6D478C7C7}
// *********************************************************************//
  IlgcPKCS11InfoDisp = dispinterface
    ['{FA907E32-D103-4C20-B955-A0A6D478C7C7}']
    property CryptokitVersionStr: WideString readonly dispid 16001;
    property CryptokitVersionMajor: Integer readonly dispid 16002;
    property CryptokitVersionMinor: Integer readonly dispid 16003;
    property ManufacturerID: WideString readonly dispid 16004;
    property LibraryDescription: WideString readonly dispid 16005;
    property LibraryVersionStr: WideString readonly dispid 16006;
    property LibraryVersionMajor: Integer readonly dispid 16007;
    property LibraryVersionMinor: Integer readonly dispid 16008;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcPKCS11TokenInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B4BB1EDB-4F32-4B0C-B390-566F02237A55}
// *********************************************************************//
  IlgcPKCS11TokenInfo = interface(IlgcBaseObject)
    ['{B4BB1EDB-4F32-4B0C-B390-566F02237A55}']
    function Get_TokenLabel: WideString; safecall;
    function Get_ManufacturerID: WideString; safecall;
    function Get_Model: WideString; safecall;
    function Get_SerialNumber: WideString; safecall;
    function Get_Flags: LongWord; safecall;
    function Get_MaxSessionCount: LongWord; safecall;
    function Get_SessionCount: LongWord; safecall;
    function Get_MaxRwSessionCount: LongWord; safecall;
    function Get_RwSessionCount: LongWord; safecall;
    function Get_MaxPinLen: LongWord; safecall;
    function Get_MinPinLen: LongWord; safecall;
    function Get_TotalPublicMemory: LongWord; safecall;
    function Get_FreePublicMemory: LongWord; safecall;
    function Get_TotalPrivateMemory: LongWord; safecall;
    function Get_FreePrivateMemory: LongWord; safecall;
    function Get_HardwareVersionStr: WideString; safecall;
    function Get_HardwareVersionMajor: Integer; safecall;
    function Get_HardwareVersionMinor: Integer; safecall;
    function Get_FirmwareVersionStr: WideString; safecall;
    function Get_FirmwareVersionMajor: Integer; safecall;
    function Get_FirmwareVersionMinor: Integer; safecall;
    function Get_UtcTime: WideString; safecall;
    property TokenLabel: WideString read Get_TokenLabel;
    property ManufacturerID: WideString read Get_ManufacturerID;
    property Model: WideString read Get_Model;
    property SerialNumber: WideString read Get_SerialNumber;
    property Flags: LongWord read Get_Flags;
    property MaxSessionCount: LongWord read Get_MaxSessionCount;
    property SessionCount: LongWord read Get_SessionCount;
    property MaxRwSessionCount: LongWord read Get_MaxRwSessionCount;
    property RwSessionCount: LongWord read Get_RwSessionCount;
    property MaxPinLen: LongWord read Get_MaxPinLen;
    property MinPinLen: LongWord read Get_MinPinLen;
    property TotalPublicMemory: LongWord read Get_TotalPublicMemory;
    property FreePublicMemory: LongWord read Get_FreePublicMemory;
    property TotalPrivateMemory: LongWord read Get_TotalPrivateMemory;
    property FreePrivateMemory: LongWord read Get_FreePrivateMemory;
    property HardwareVersionStr: WideString read Get_HardwareVersionStr;
    property HardwareVersionMajor: Integer read Get_HardwareVersionMajor;
    property HardwareVersionMinor: Integer read Get_HardwareVersionMinor;
    property FirmwareVersionStr: WideString read Get_FirmwareVersionStr;
    property FirmwareVersionMajor: Integer read Get_FirmwareVersionMajor;
    property FirmwareVersionMinor: Integer read Get_FirmwareVersionMinor;
    property UtcTime: WideString read Get_UtcTime;
  end;

// *********************************************************************//
// DispIntf:  IlgcPKCS11TokenInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B4BB1EDB-4F32-4B0C-B390-566F02237A55}
// *********************************************************************//
  IlgcPKCS11TokenInfoDisp = dispinterface
    ['{B4BB1EDB-4F32-4B0C-B390-566F02237A55}']
    property TokenLabel: WideString readonly dispid 17001;
    property ManufacturerID: WideString readonly dispid 17002;
    property Model: WideString readonly dispid 17003;
    property SerialNumber: WideString readonly dispid 17004;
    property Flags: LongWord readonly dispid 17005;
    property MaxSessionCount: LongWord readonly dispid 17006;
    property SessionCount: LongWord readonly dispid 17007;
    property MaxRwSessionCount: LongWord readonly dispid 17008;
    property RwSessionCount: LongWord readonly dispid 17009;
    property MaxPinLen: LongWord readonly dispid 17010;
    property MinPinLen: LongWord readonly dispid 17011;
    property TotalPublicMemory: LongWord readonly dispid 17012;
    property FreePublicMemory: LongWord readonly dispid 17013;
    property TotalPrivateMemory: LongWord readonly dispid 17014;
    property FreePrivateMemory: LongWord readonly dispid 17015;
    property HardwareVersionStr: WideString readonly dispid 17016;
    property HardwareVersionMajor: Integer readonly dispid 17017;
    property HardwareVersionMinor: Integer readonly dispid 17018;
    property FirmwareVersionStr: WideString readonly dispid 17019;
    property FirmwareVersionMajor: Integer readonly dispid 17020;
    property FirmwareVersionMinor: Integer readonly dispid 17021;
    property UtcTime: WideString readonly dispid 17022;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcPKCS11SlotInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {597607F4-CA0A-4722-BBC9-EB15ECAEBA49}
// *********************************************************************//
  IlgcPKCS11SlotInfo = interface(IlgcBaseObject)
    ['{597607F4-CA0A-4722-BBC9-EB15ECAEBA49}']
    function Get_SlotID: LongWord; safecall;
    function Get_SlotDescription: WideString; safecall;
    function Get_ManufacturerID: WideString; safecall;
    function Get_Flags: LongWord; safecall;
    function Get_HardwareVersionStr: WideString; safecall;
    function Get_HardwareVersionMajor: Integer; safecall;
    function Get_HardwareVersionMinor: Integer; safecall;
    function Get_FirmwareVersionStr: WideString; safecall;
    function Get_FirmwareVersionMajor: Integer; safecall;
    function Get_FirmwareVersionMinor: Integer; safecall;
    function Get_TokenPresent: WordBool; safecall;
    function Get_TokenInfo: IDispatch; safecall;
    property SlotID: LongWord read Get_SlotID;
    property SlotDescription: WideString read Get_SlotDescription;
    property ManufacturerID: WideString read Get_ManufacturerID;
    property Flags: LongWord read Get_Flags;
    property HardwareVersionStr: WideString read Get_HardwareVersionStr;
    property HardwareVersionMajor: Integer read Get_HardwareVersionMajor;
    property HardwareVersionMinor: Integer read Get_HardwareVersionMinor;
    property FirmwareVersionStr: WideString read Get_FirmwareVersionStr;
    property FirmwareVersionMajor: Integer read Get_FirmwareVersionMajor;
    property FirmwareVersionMinor: Integer read Get_FirmwareVersionMinor;
    property TokenPresent: WordBool read Get_TokenPresent;
    property TokenInfo: IDispatch read Get_TokenInfo;
  end;

// *********************************************************************//
// DispIntf:  IlgcPKCS11SlotInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {597607F4-CA0A-4722-BBC9-EB15ECAEBA49}
// *********************************************************************//
  IlgcPKCS11SlotInfoDisp = dispinterface
    ['{597607F4-CA0A-4722-BBC9-EB15ECAEBA49}']
    property SlotID: LongWord readonly dispid 18001;
    property SlotDescription: WideString readonly dispid 18002;
    property ManufacturerID: WideString readonly dispid 18003;
    property Flags: LongWord readonly dispid 18004;
    property HardwareVersionStr: WideString readonly dispid 18005;
    property HardwareVersionMajor: Integer readonly dispid 18006;
    property HardwareVersionMinor: Integer readonly dispid 18007;
    property FirmwareVersionStr: WideString readonly dispid 18008;
    property FirmwareVersionMajor: Integer readonly dispid 18009;
    property FirmwareVersionMinor: Integer readonly dispid 18010;
    property TokenPresent: WordBool readonly dispid 18011;
    property TokenInfo: IDispatch readonly dispid 18012;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcPKCS11Session
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BB0C246D-BA87-44C4-B614-53FB1D4AE900}
// *********************************************************************//
  IlgcPKCS11Session = interface(IlgcBaseObject)
    ['{BB0C246D-BA87-44C4-B614-53FB1D4AE900}']
    function CheckActive: WordBool; safecall;
    procedure Login(const PIN: WideString; UserType: lgcPKCS11UserType); safecall;
    procedure Logout; safecall;
    function Get_Handle: LongWord; safecall;
    function Get_SlotID: LongWord; safecall;
    function Get_State: lgcPKCS11SessionState; safecall;
    function Get_Flags: LongWord; safecall;
    property Handle: LongWord read Get_Handle;
    property SlotID: LongWord read Get_SlotID;
    property State: lgcPKCS11SessionState read Get_State;
    property Flags: LongWord read Get_Flags;
  end;

// *********************************************************************//
// DispIntf:  IlgcPKCS11SessionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BB0C246D-BA87-44C4-B614-53FB1D4AE900}
// *********************************************************************//
  IlgcPKCS11SessionDisp = dispinterface
    ['{BB0C246D-BA87-44C4-B614-53FB1D4AE900}']
    function CheckActive: WordBool; dispid 19001;
    procedure Login(const PIN: WideString; UserType: lgcPKCS11UserType); dispid 19002;
    procedure Logout; dispid 19003;
    property Handle: LongWord readonly dispid 19004;
    property SlotID: LongWord readonly dispid 19005;
    property State: lgcPKCS11SessionState readonly dispid 19006;
    property Flags: LongWord readonly dispid 19007;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcPKCS11Certificate
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A14EB3D8-25C5-4C22-B6AA-3E7EA2884D78}
// *********************************************************************//
  IlgcPKCS11Certificate = interface(IlgcCertificate)
    ['{A14EB3D8-25C5-4C22-B6AA-3E7EA2884D78}']
    function Get_Session: IDispatch; safecall;
    property Session: IDispatch read Get_Session;
  end;

// *********************************************************************//
// DispIntf:  IlgcPKCS11CertificateDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A14EB3D8-25C5-4C22-B6AA-3E7EA2884D78}
// *********************************************************************//
  IlgcPKCS11CertificateDisp = dispinterface
    ['{A14EB3D8-25C5-4C22-B6AA-3E7EA2884D78}']
    property Session: IDispatch readonly dispid 20001;
    property DisplayName: WideString readonly dispid 13001;
    property Subject: WideString readonly dispid 13002;
    property Issuer: WideString readonly dispid 13003;
    property SerialNoDec: WideString readonly dispid 13004;
    property SerialNoHex: WideString readonly dispid 13005;
    property ValidFrom: OleVariant readonly dispid 13006;
    property ValidTo: OleVariant readonly dispid 13007;
    property PIN: WideString writeonly dispid 13008;
    procedure ShowCertificateInfo(WinHandle: OleVariant); dispid 13009;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcPKCS11CertificateSigner
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02F51066-4584-476A-B0DB-CDFCA648B534}
// *********************************************************************//
  IlgcPKCS11CertificateSigner = interface(IlgcCertificateSigner)
    ['{02F51066-4584-476A-B0DB-CDFCA648B534}']
    procedure LoadLibrary(const LibFileName: WideString); safecall;
    procedure FreeLibrary; safecall;
    function GetInfo: IDispatch; safecall;
    function GetSlots(WithToken: WordBool): IDispatch; safecall;
    function SessionStart(const Certificate: IDispatch): IDispatch; safecall;
    procedure SessionClose(IndexOrSession: OleVariant); safecall;
    procedure SessionCloseAll; safecall;
    function Get_LibLoaded: WordBool; safecall;
    function Get_LibFileName: WideString; safecall;
    function Get_Sessions: IDispatch; safecall;
    property LibLoaded: WordBool read Get_LibLoaded;
    property LibFileName: WideString read Get_LibFileName;
    property Sessions: IDispatch read Get_Sessions;
  end;

// *********************************************************************//
// DispIntf:  IlgcPKCS11CertificateSignerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02F51066-4584-476A-B0DB-CDFCA648B534}
// *********************************************************************//
  IlgcPKCS11CertificateSignerDisp = dispinterface
    ['{02F51066-4584-476A-B0DB-CDFCA648B534}']
    procedure LoadLibrary(const LibFileName: WideString); dispid 21001;
    procedure FreeLibrary; dispid 21002;
    function GetInfo: IDispatch; dispid 21003;
    function GetSlots(WithToken: WordBool): IDispatch; dispid 21004;
    function SessionStart(const Certificate: IDispatch): IDispatch; dispid 21005;
    procedure SessionClose(IndexOrSession: OleVariant); dispid 21006;
    procedure SessionCloseAll; dispid 21007;
    property LibLoaded: WordBool readonly dispid 21008;
    property LibFileName: WideString readonly dispid 21009;
    property Sessions: IDispatch readonly dispid 21010;
    function List: IDispatch; dispid 14001;
    function UISelect: IDispatch; dispid 14002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcPKCS11Backend
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4B3C369B-79D4-4B26-862C-691E41E74AD1}
// *********************************************************************//
  IlgcPKCS11Backend = interface(IlgcBaseObject)
    ['{4B3C369B-79D4-4B26-862C-691E41E74AD1}']
    function CheckLibrary(const LibFileName: WideString): WordBool; safecall;
    function GetLibraryInfo(const LibFileName: WideString): IDispatch; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcPKCS11BackendDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4B3C369B-79D4-4B26-862C-691E41E74AD1}
// *********************************************************************//
  IlgcPKCS11BackendDisp = dispinterface
    ['{4B3C369B-79D4-4B26-862C-691E41E74AD1}']
    function CheckLibrary(const LibFileName: WideString): WordBool; dispid 22001;
    function GetLibraryInfo(const LibFileName: WideString): IDispatch; dispid 22002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcXAdES
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {50DC95DF-A1C2-460D-8A46-D90BE7016886}
// *********************************************************************//
  IlgcXAdES = interface(IlgcBaseObject)
    ['{50DC95DF-A1C2-460D-8A46-D90BE7016886}']
    function Get_SHA1HashClass: WideString; safecall;
    procedure Set_SHA1HashClass(const Value: WideString); safecall;
    function Get_SHA256HashClass: WideString; safecall;
    procedure Set_SHA256HashClass(const Value: WideString); safecall;
    function Get_Base64EncoderClass: WideString; safecall;
    procedure Set_Base64EncoderClass(const Value: WideString); safecall;
    function Get_Signer: IDispatch; safecall;
    procedure Set_Signer(const Value: IDispatch); safecall;
    function Get_SignType: lgcSignHashType; safecall;
    procedure Set_SignType(Value: lgcSignHashType); safecall;
    function Get_SerialNoFormat: lgcXAdESSerialNoFormat; safecall;
    procedure Set_SerialNoFormat(Value: lgcXAdESSerialNoFormat); safecall;
    function Get_IncludeSigningTime: WordBool; safecall;
    procedure Set_IncludeSigningTime(Value: WordBool); safecall;
    function Get_SigningTime: OleVariant; safecall;
    procedure Set_SigningTime(Value: OleVariant); safecall;
    property SHA1HashClass: WideString read Get_SHA1HashClass write Set_SHA1HashClass;
    property SHA256HashClass: WideString read Get_SHA256HashClass write Set_SHA256HashClass;
    property Base64EncoderClass: WideString read Get_Base64EncoderClass write Set_Base64EncoderClass;
    property Signer: IDispatch read Get_Signer write Set_Signer;
    property SignType: lgcSignHashType read Get_SignType write Set_SignType;
    property SerialNoFormat: lgcXAdESSerialNoFormat read Get_SerialNoFormat write Set_SerialNoFormat;
    property IncludeSigningTime: WordBool read Get_IncludeSigningTime write Set_IncludeSigningTime;
    property SigningTime: OleVariant read Get_SigningTime write Set_SigningTime;
  end;

// *********************************************************************//
// DispIntf:  IlgcXAdESDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {50DC95DF-A1C2-460D-8A46-D90BE7016886}
// *********************************************************************//
  IlgcXAdESDisp = dispinterface
    ['{50DC95DF-A1C2-460D-8A46-D90BE7016886}']
    property SHA1HashClass: WideString dispid 23001;
    property SHA256HashClass: WideString dispid 23002;
    property Base64EncoderClass: WideString dispid 23003;
    property Signer: IDispatch dispid 23004;
    property SignType: lgcSignHashType dispid 23005;
    property SerialNoFormat: lgcXAdESSerialNoFormat dispid 23006;
    property IncludeSigningTime: WordBool dispid 23007;
    property SigningTime: OleVariant dispid 23008;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcEDeklaracjaStatus
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {79E8257A-AE97-4D81-BE00-6B69700BDFCE}
// *********************************************************************//
  IlgcEDeklaracjaStatus = interface(IlgcBaseObject)
    ['{79E8257A-AE97-4D81-BE00-6B69700BDFCE}']
    function Get_NrRef: WideString; safecall;
    function Get_Status: Integer; safecall;
    function Get_Opis: WideString; safecall;
    function Get_PobranoUPO: WordBool; safecall;
    function Get_UPO: WideString; safecall;
    function Get_Timestamp: OleVariant; safecall;
    function Get_Szczegoly: WideString; safecall;
    property NrRef: WideString read Get_NrRef;
    property Status: Integer read Get_Status;
    property Opis: WideString read Get_Opis;
    property PobranoUPO: WordBool read Get_PobranoUPO;
    property UPO: WideString read Get_UPO;
    property Timestamp: OleVariant read Get_Timestamp;
    property Szczegoly: WideString read Get_Szczegoly;
  end;

// *********************************************************************//
// DispIntf:  IlgcEDeklaracjaStatusDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {79E8257A-AE97-4D81-BE00-6B69700BDFCE}
// *********************************************************************//
  IlgcEDeklaracjaStatusDisp = dispinterface
    ['{79E8257A-AE97-4D81-BE00-6B69700BDFCE}']
    property NrRef: WideString readonly dispid 24001;
    property Status: Integer readonly dispid 24002;
    property Opis: WideString readonly dispid 24003;
    property PobranoUPO: WordBool readonly dispid 24004;
    property UPO: WideString readonly dispid 24005;
    property Timestamp: OleVariant readonly dispid 24006;
    property Szczegoly: WideString readonly dispid 24007;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcEDeklaracja
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4C7E267D-D83D-4713-9120-CB57D7881F33}
// *********************************************************************//
  IlgcEDeklaracja = interface(IlgcBaseObject)
    ['{4C7E267D-D83D-4713-9120-CB57D7881F33}']
    function PodpiszCertyfikatem(const Dane: WideString; const Certyfikat: IDispatch): WideString; safecall;
    function PodpiszDanymiAut(const Dane: WideString; const ImiePierwsze: WideString; 
                              const Nazwisko: WideString; const Nip: WideString; DataUr: TDateTime; 
                              Kwota: Currency): WideString; safecall;
    function Wyslij(const DanePodpisane: WideString; RodzajBramki: lgcEDekGateType; 
                    RodzajPodpisu: lgcEDekSignType): IDispatch; safecall;
    function PobierzUPO(const NrRef: WideString; RodzajBramki: lgcEDekGateType): IDispatch; safecall;
    function Get_XAdES: IDispatch; safecall;
    procedure Set_XAdES(const Value: IDispatch); safecall;
    function Get_XMLCanonizator: WideString; safecall;
    procedure Set_XMLCanonizator(const Value: WideString); safecall;
    function Get_EDekGate: WideString; safecall;
    procedure Set_EDekGate(const Value: WideString); safecall;
    function Get_Canonization: WordBool; safecall;
    procedure Set_Canonization(Value: WordBool); safecall;
    property XAdES: IDispatch read Get_XAdES write Set_XAdES;
    property XMLCanonizator: WideString read Get_XMLCanonizator write Set_XMLCanonizator;
    property EDekGate: WideString read Get_EDekGate write Set_EDekGate;
    property Canonization: WordBool read Get_Canonization write Set_Canonization;
  end;

// *********************************************************************//
// DispIntf:  IlgcEDeklaracjaDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4C7E267D-D83D-4713-9120-CB57D7881F33}
// *********************************************************************//
  IlgcEDeklaracjaDisp = dispinterface
    ['{4C7E267D-D83D-4713-9120-CB57D7881F33}']
    function PodpiszCertyfikatem(const Dane: WideString; const Certyfikat: IDispatch): WideString; dispid 25001;
    function PodpiszDanymiAut(const Dane: WideString; const ImiePierwsze: WideString; 
                              const Nazwisko: WideString; const Nip: WideString; DataUr: TDateTime; 
                              Kwota: Currency): WideString; dispid 25002;
    function Wyslij(const DanePodpisane: WideString; RodzajBramki: lgcEDekGateType; 
                    RodzajPodpisu: lgcEDekSignType): IDispatch; dispid 25003;
    function PobierzUPO(const NrRef: WideString; RodzajBramki: lgcEDekGateType): IDispatch; dispid 25004;
    property XAdES: IDispatch dispid 25005;
    property XMLCanonizator: WideString dispid 25006;
    property EDekGate: WideString dispid 25007;
    property Canonization: WordBool dispid 25008;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcJPK
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5EB2F974-0D10-44D4-AA8F-E557BB91FF30}
// *********************************************************************//
  IlgcJPK = interface(IlgcBaseObject)
    ['{5EB2F974-0D10-44D4-AA8F-E557BB91FF30}']
    function SignCertificate(const Certificate: IDispatch; GateType: lgcEDekGateType; 
                             AdHoc: WordBool; InputStream: OleVariant; OutputStream: OleVariant): WideString; safecall;
    function SignAuthData(const Nip: WideString; const ImiePierwsze: WideString; 
                          const Nazwisko: WideString; DataUr: TDateTime; Kwota: Currency; 
                          GateType: lgcEDekGateType; AdHoc: WordBool; InputStream: OleVariant; 
                          OutputStream: OleVariant): WideString; safecall;
    function Send(const InitUpload: WideString; EncryptedData: OleVariant; 
                  GateType: lgcEDekGateType; VerifySign: WordBool): WideString; safecall;
    function RequestUPO(const RefNo: WideString; GateType: lgcEDekGateType): IDispatch; safecall;
    function Get_Base64EncoderClass: WideString; safecall;
    procedure Set_Base64EncoderClass(const Value: WideString); safecall;
    function Get_AES256EncryptClass: WideString; safecall;
    procedure Set_AES256EncryptClass(const Value: WideString); safecall;
    function Get_MD5HashClass: WideString; safecall;
    procedure Set_MD5HashClass(const Value: WideString); safecall;
    function Get_SHA256HashClass: WideString; safecall;
    procedure Set_SHA256HashClass(const Value: WideString); safecall;
    function Get_ZipperClass: WideString; safecall;
    procedure Set_ZipperClass(const Value: WideString); safecall;
    function Get_RSAEncryptClass: WideString; safecall;
    procedure Set_RSAEncryptClass(const Value: WideString); safecall;
    function Get_RandomGeneratorClass: WideString; safecall;
    procedure Set_RandomGeneratorClass(const Value: WideString); safecall;
    function Get_XMLReaderClass: WideString; safecall;
    procedure Set_XMLReaderClass(const Value: WideString); safecall;
    function Get_RSAKeyProd: IDispatch; safecall;
    procedure Set_RSAKeyProd(const Value: IDispatch); safecall;
    function Get_RSAKeyTest: IDispatch; safecall;
    procedure Set_RSAKeyTest(const Value: IDispatch); safecall;
    function Get_XAdES: IDispatch; safecall;
    procedure Set_XAdES(const Value: IDispatch); safecall;
    function Get_HTTPClient: IDispatch; safecall;
    procedure Set_HTTPClient(const Value: IDispatch); safecall;
    property Base64EncoderClass: WideString read Get_Base64EncoderClass write Set_Base64EncoderClass;
    property AES256EncryptClass: WideString read Get_AES256EncryptClass write Set_AES256EncryptClass;
    property MD5HashClass: WideString read Get_MD5HashClass write Set_MD5HashClass;
    property SHA256HashClass: WideString read Get_SHA256HashClass write Set_SHA256HashClass;
    property ZipperClass: WideString read Get_ZipperClass write Set_ZipperClass;
    property RSAEncryptClass: WideString read Get_RSAEncryptClass write Set_RSAEncryptClass;
    property RandomGeneratorClass: WideString read Get_RandomGeneratorClass write Set_RandomGeneratorClass;
    property XMLReaderClass: WideString read Get_XMLReaderClass write Set_XMLReaderClass;
    property RSAKeyProd: IDispatch read Get_RSAKeyProd write Set_RSAKeyProd;
    property RSAKeyTest: IDispatch read Get_RSAKeyTest write Set_RSAKeyTest;
    property XAdES: IDispatch read Get_XAdES write Set_XAdES;
    property HTTPClient: IDispatch read Get_HTTPClient write Set_HTTPClient;
  end;

// *********************************************************************//
// DispIntf:  IlgcJPKDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5EB2F974-0D10-44D4-AA8F-E557BB91FF30}
// *********************************************************************//
  IlgcJPKDisp = dispinterface
    ['{5EB2F974-0D10-44D4-AA8F-E557BB91FF30}']
    function SignCertificate(const Certificate: IDispatch; GateType: lgcEDekGateType; 
                             AdHoc: WordBool; InputStream: OleVariant; OutputStream: OleVariant): WideString; dispid 26001;
    function SignAuthData(const Nip: WideString; const ImiePierwsze: WideString; 
                          const Nazwisko: WideString; DataUr: TDateTime; Kwota: Currency; 
                          GateType: lgcEDekGateType; AdHoc: WordBool; InputStream: OleVariant; 
                          OutputStream: OleVariant): WideString; dispid 26002;
    function Send(const InitUpload: WideString; EncryptedData: OleVariant; 
                  GateType: lgcEDekGateType; VerifySign: WordBool): WideString; dispid 26003;
    function RequestUPO(const RefNo: WideString; GateType: lgcEDekGateType): IDispatch; dispid 26004;
    property Base64EncoderClass: WideString dispid 26005;
    property AES256EncryptClass: WideString dispid 26006;
    property MD5HashClass: WideString dispid 26007;
    property SHA256HashClass: WideString dispid 26008;
    property ZipperClass: WideString dispid 26009;
    property RSAEncryptClass: WideString dispid 26010;
    property RandomGeneratorClass: WideString dispid 26011;
    property XMLReaderClass: WideString dispid 26012;
    property RSAKeyProd: IDispatch dispid 26013;
    property RSAKeyTest: IDispatch dispid 26014;
    property XAdES: IDispatch dispid 26015;
    property HTTPClient: IDispatch dispid 26016;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcKSeFRequest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7B4EF1CE-8FC8-433C-99E4-A446E6F62D98}
// *********************************************************************//
  IlgcKSeFRequest = interface(IlgcObject)
    ['{7B4EF1CE-8FC8-433C-99E4-A446E6F62D98}']
    function GetAsJSON: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcKSeFRequestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7B4EF1CE-8FC8-433C-99E4-A446E6F62D98}
// *********************************************************************//
  IlgcKSeFRequestDisp = dispinterface
    ['{7B4EF1CE-8FC8-433C-99E4-A446E6F62D98}']
    function GetAsJSON: WideString; dispid 27001;
    property ExtObject: {??Pointer}OleVariant readonly dispid 7001;
    property StringProp[const Name: WideString]: WideString dispid 7002;
    property IntegerProp[const Name: WideString]: Integer dispid 7003;
    property DoubleProp[const Name: WideString]: Double dispid 7004;
    property CurrencyProp[const Name: WideString]: Currency dispid 7005;
    property BooleanProp[const Name: WideString]: WordBool dispid 7006;
    property Int64Prop[const Name: WideString]: {??Int64}OleVariant dispid 7007;
    property DateProp[const Name: WideString]: TDateTime dispid 7008;
    function ListProps: OleVariant; dispid 7009;
    function PropType(const PropName: WideString): lgcPropertyType; dispid 7010;
    function ObjectPropClass(const PropName: WideString): WideString; dispid 7011;
    procedure SetObjectProp(const Name: WideString; Value: OleVariant); dispid 7012;
    function GetObjectProp(const Name: WideString): OleVariant; dispid 7013;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcKSeFResponse
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9ED3DF16-92DA-4EDC-BC63-FC17CDDF9BDC}
// *********************************************************************//
  IlgcKSeFResponse = interface(IlgcObject)
    ['{9ED3DF16-92DA-4EDC-BC63-FC17CDDF9BDC}']
    function GetRawResponse: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcKSeFResponseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9ED3DF16-92DA-4EDC-BC63-FC17CDDF9BDC}
// *********************************************************************//
  IlgcKSeFResponseDisp = dispinterface
    ['{9ED3DF16-92DA-4EDC-BC63-FC17CDDF9BDC}']
    function GetRawResponse: WideString; dispid 28001;
    property ExtObject: {??Pointer}OleVariant readonly dispid 7001;
    property StringProp[const Name: WideString]: WideString dispid 7002;
    property IntegerProp[const Name: WideString]: Integer dispid 7003;
    property DoubleProp[const Name: WideString]: Double dispid 7004;
    property CurrencyProp[const Name: WideString]: Currency dispid 7005;
    property BooleanProp[const Name: WideString]: WordBool dispid 7006;
    property Int64Prop[const Name: WideString]: {??Int64}OleVariant dispid 7007;
    property DateProp[const Name: WideString]: TDateTime dispid 7008;
    function ListProps: OleVariant; dispid 7009;
    function PropType(const PropName: WideString): lgcPropertyType; dispid 7010;
    function ObjectPropClass(const PropName: WideString): WideString; dispid 7011;
    procedure SetObjectProp(const Name: WideString; Value: OleVariant); dispid 7012;
    function GetObjectProp(const Name: WideString): OleVariant; dispid 7013;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcKSeFBase
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {452578AC-F2AE-4771-9FCF-5F4DC66021CD}
// *********************************************************************//
  IlgcKSeFBase = interface(IlgcBaseObject)
    ['{452578AC-F2AE-4771-9FCF-5F4DC66021CD}']
    function Get_RSAEncryptClass: WideString; safecall;
    procedure Set_RSAEncryptClass(const Value: WideString); safecall;
    function Get_Base64EncoderClass: WideString; safecall;
    procedure Set_Base64EncoderClass(const Value: WideString); safecall;
    function Get_AES256EncryptClass: WideString; safecall;
    procedure Set_AES256EncryptClass(const Value: WideString); safecall;
    function Get_SHA256HashClass: WideString; safecall;
    procedure Set_SHA256HashClass(const Value: WideString); safecall;
    function Get_RandomGeneratorClass: WideString; safecall;
    procedure Set_RandomGeneratorClass(const Value: WideString); safecall;
    function Get_XAdES: IDispatch; safecall;
    procedure Set_XAdES(const Value: IDispatch); safecall;
    function Get_HTTPClient: IDispatch; safecall;
    procedure Set_HTTPClient(const Value: IDispatch); safecall;
    function Get_GateType: lgcKSeFGateType; safecall;
    procedure Set_GateType(Value: lgcKSeFGateType); safecall;
    function Get_Nip: WideString; safecall;
    procedure Set_Nip(const Value: WideString); safecall;
    function Get_FormCode: Integer; safecall;
    procedure Set_FormCode(Value: Integer); safecall;
    function Get_FormCodeSystemCode: WideString; safecall;
    procedure Set_FormCodeSystemCode(const Value: WideString); safecall;
    function Get_FormCodeSchemaVersion: WideString; safecall;
    procedure Set_FormCodeSchemaVersion(const Value: WideString); safecall;
    function Get_FormCodeTargetNamespace: WideString; safecall;
    procedure Set_FormCodeTargetNamespace(const Value: WideString); safecall;
    function Get_FormCodeValue: WideString; safecall;
    procedure Set_FormCodeValue(const Value: WideString); safecall;
    function Get_Certificate: IDispatch; safecall;
    procedure Set_Certificate(const Value: IDispatch); safecall;
    function Get_CertificateAuthType: lgcKSeFGateType; safecall;
    procedure Set_CertificateAuthType(Value: lgcKSeFGateType); safecall;
    function Get_Token: WideString; safecall;
    procedure Set_Token(const Value: WideString); safecall;
    function Get_Encryption: WordBool; safecall;
    procedure Set_Encryption(Value: WordBool); safecall;
    function Get_SessionToken: WideString; safecall;
    function Get_SessionActive: WordBool; safecall;
    function Get_RSAKeyProd: IDispatch; safecall;
    procedure Set_RSAKeyProd(const Value: IDispatch); safecall;
    function Get_RSAKeyDemo: IDispatch; safecall;
    procedure Set_RSAKeyDemo(const Value: IDispatch); safecall;
    function Get_RSAKeyTest: IDispatch; safecall;
    procedure Set_RSAKeyTest(const Value: IDispatch); safecall;
    procedure GenerateAESKey; safecall;
    function CreateKSeFObject(const ClsName: WideString): IDispatch; safecall;
    property RSAEncryptClass: WideString read Get_RSAEncryptClass write Set_RSAEncryptClass;
    property Base64EncoderClass: WideString read Get_Base64EncoderClass write Set_Base64EncoderClass;
    property AES256EncryptClass: WideString read Get_AES256EncryptClass write Set_AES256EncryptClass;
    property SHA256HashClass: WideString read Get_SHA256HashClass write Set_SHA256HashClass;
    property RandomGeneratorClass: WideString read Get_RandomGeneratorClass write Set_RandomGeneratorClass;
    property XAdES: IDispatch read Get_XAdES write Set_XAdES;
    property HTTPClient: IDispatch read Get_HTTPClient write Set_HTTPClient;
    property GateType: lgcKSeFGateType read Get_GateType write Set_GateType;
    property Nip: WideString read Get_Nip write Set_Nip;
    property FormCode: Integer read Get_FormCode write Set_FormCode;
    property FormCodeSystemCode: WideString read Get_FormCodeSystemCode write Set_FormCodeSystemCode;
    property FormCodeSchemaVersion: WideString read Get_FormCodeSchemaVersion write Set_FormCodeSchemaVersion;
    property FormCodeTargetNamespace: WideString read Get_FormCodeTargetNamespace write Set_FormCodeTargetNamespace;
    property FormCodeValue: WideString read Get_FormCodeValue write Set_FormCodeValue;
    property Certificate: IDispatch read Get_Certificate write Set_Certificate;
    property CertificateAuthType: lgcKSeFGateType read Get_CertificateAuthType write Set_CertificateAuthType;
    property Token: WideString read Get_Token write Set_Token;
    property Encryption: WordBool read Get_Encryption write Set_Encryption;
    property SessionToken: WideString read Get_SessionToken;
    property SessionActive: WordBool read Get_SessionActive;
    property RSAKeyProd: IDispatch read Get_RSAKeyProd write Set_RSAKeyProd;
    property RSAKeyDemo: IDispatch read Get_RSAKeyDemo write Set_RSAKeyDemo;
    property RSAKeyTest: IDispatch read Get_RSAKeyTest write Set_RSAKeyTest;
  end;

// *********************************************************************//
// DispIntf:  IlgcKSeFBaseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {452578AC-F2AE-4771-9FCF-5F4DC66021CD}
// *********************************************************************//
  IlgcKSeFBaseDisp = dispinterface
    ['{452578AC-F2AE-4771-9FCF-5F4DC66021CD}']
    property RSAEncryptClass: WideString dispid 29001;
    property Base64EncoderClass: WideString dispid 29002;
    property AES256EncryptClass: WideString dispid 29003;
    property SHA256HashClass: WideString dispid 29004;
    property RandomGeneratorClass: WideString dispid 29005;
    property XAdES: IDispatch dispid 29006;
    property HTTPClient: IDispatch dispid 29007;
    property GateType: lgcKSeFGateType dispid 29008;
    property Nip: WideString dispid 29009;
    property FormCode: Integer dispid 29010;
    property FormCodeSystemCode: WideString dispid 29011;
    property FormCodeSchemaVersion: WideString dispid 29012;
    property FormCodeTargetNamespace: WideString dispid 29013;
    property FormCodeValue: WideString dispid 29014;
    property Certificate: IDispatch dispid 29015;
    property CertificateAuthType: lgcKSeFGateType dispid 29016;
    property Token: WideString dispid 29017;
    property Encryption: WordBool dispid 29018;
    property SessionToken: WideString readonly dispid 29019;
    property SessionActive: WordBool readonly dispid 29020;
    property RSAKeyProd: IDispatch dispid 29021;
    property RSAKeyDemo: IDispatch dispid 29022;
    property RSAKeyTest: IDispatch dispid 29023;
    procedure GenerateAESKey; dispid 29024;
    function CreateKSeFObject(const ClsName: WideString): IDispatch; dispid 29025;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcKSeF_2_6_0
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C44AAC54-CE22-421C-B159-B864DF2EB753}
// *********************************************************************//
  IlgcKSeF_2_6_0 = interface(IlgcKSeFBase)
    ['{C44AAC54-CE22-421C-B159-B864DF2EB753}']
    function SessionInitSigned: IDispatch; safecall;
    function SessionInitToken: IDispatch; safecall;
    function SessionChalangePZ: WideString; safecall;
    function SessionInitPZ(const SignedInit: WideString): IDispatch; safecall;
    function SessionStatus(const ReferenceNumber: WideString; PageSize: Integer; 
                           PageOffset: Integer; IncludeDetails: WordBool): IDispatch; safecall;
    function SessionTerminate(Force: WordBool): IDispatch; safecall;
    function SessionGenerateInternalIdentifier(const InputDigitsSequence: WideString): IDispatch; safecall;
    procedure InvoiceGet(const KSeFReferenceNumber: WideString; OutputStream: OleVariant); safecall;
    function InvoiceSend(DataStream: OleVariant): IDispatch; safecall;
    function InvoiceStatus(const InvoiceElementReferenceNumber: WideString; 
                           KSeFNumberVariant: lgcKSeFNumberVariant): IDispatch; safecall;
    function InvoiceVisibilityHide(const KSeFReferenceNumber: WideString; 
                                   const HidingReason: WideString): IDispatch; safecall;
    function InvoiceVisibilityShow(const KSeFReferenceNumber: WideString; 
                                   const HidingCancelationReason: WideString): IDispatch; safecall;
    function InvoiceVisibilityStatus(const HidingElementReferenceNumber: WideString; 
                                     KSeFNumberVariant: lgcKSeFNumberVariant): IDispatch; safecall;
    function InvoiceVisibility(const KSeFReferenceNumber: WideString; 
                               KSeFNumberVariant: lgcKSeFNumberVariant): IDispatch; safecall;
    function InvoiceScamCancel(const KSeFReferenceNumber: WideString; 
                               const ReportCancelationReason: WideString): IDispatch; safecall;
    function InvoiceScamReport(const KSeFReferenceNumber: WideString; const ReportReason: WideString): IDispatch; safecall;
    function InvoiceScamStatus(const ScamElementReferenceNumber: WideString): IDispatch; safecall;
    function InvoiceScam(const KSeFReferenceNumber: WideString): IDispatch; safecall;
    function CredentialsAccountingGrant(const GrantAccountingCredentialsRequest: IDispatch): IDispatch; safecall;
    function CredentialsAccountingRevoke(const RevokeAccountingCredentialsRequest: IDispatch): IDispatch; safecall;
    function CredentialsContextGrant(const GrantContextCredentialsRequest: IDispatch): IDispatch; safecall;
    function CredentialsContextRevoke(const RevokeContextCredentialsRequest: IDispatch): IDispatch; safecall;
    function CredentialsGenerateToken(const GenerateTokenRequest: IDispatch): IDispatch; safecall;
    function CredentialsGrant(const GrantCredentialsRequest: IDispatch): IDispatch; safecall;
    function CredentialsRevoke(const RevokeCredentialsRequest: IDispatch): IDispatch; safecall;
    function CredentialsRevokeToken(const RevokeTokenRequest: IDispatch): IDispatch; safecall;
    function CredentialsStatus(const CredentialsElementReferenceNumber: WideString): IDispatch; safecall;
    function QueryCredentialContextSync(const ContextNip: WideString; 
                                        const SourceIdentifier: WideString; 
                                        const TargetIdentifier: WideString): IDispatch; safecall;
    function QueryCredentialSync(const QuerySyncCredentialsRequest: IDispatch): IDispatch; safecall;
    function QueryInvoiceSync(const QueryCriteria: IDispatch; PageSize: Integer; PageOffset: Integer): IDispatch; safecall;
    function QueryInvoiceAsyncInit(const QueryCriteria: IDispatch): IDispatch; safecall;
    function QueryInvoiceAsyncStatus(const QueryElementReferenceNumber: WideString): IDispatch; safecall;
    procedure QueryInvoiceAsyncFetch(const QueryElementReferenceNumber: WideString; 
                                     const PartElementReferenceNumber: WideString; 
                                     Response: OleVariant); safecall;
    procedure QueryInvoiceAsyncFetch2(const StatusResponse: IDispatch; PartIndex: Integer; 
                                      Response: OleVariant); safecall;
    function PaymentIdentifierGetReferenceNumbers(const PaymentIdentifier: WideString): IDispatch; safecall;
    function PaymentIdentifierRequest(KsefReferenceNumberList: OleVariant): IDispatch; safecall;
    procedure CommonInvoiceKSeF(const InvoiceRequest: IDispatch; OutStream: OleVariant; 
                                GateType: lgcKSeFGateType); safecall;
    procedure CommonDownload(const KSeFReferenceNumber: WideString; 
                             const DownloadRequest: IDispatch; OutStream: OleVariant; 
                             GateType: lgcKSeFGateType); safecall;
    function CommonStatus(const ReferenceNumber: WideString; GateType: lgcKSeFGateType): IDispatch; safecall;
    function CommonVerification(const KSeFReferenceNumber: WideString; 
                                const VerificationRequest: IDispatch; GateType: lgcKSeFGateType): IDispatch; safecall;
    function BatchSign(ZIPDataStream: OleVariant; PZ: WordBool; EncryptedStream: OleVariant; 
                       const ZIPFileName: WideString; const PartFileName: WideString): WideString; safecall;
    function BatchSend(PartStream: OleVariant; const InitUpload: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcKSeF_2_6_0Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C44AAC54-CE22-421C-B159-B864DF2EB753}
// *********************************************************************//
  IlgcKSeF_2_6_0Disp = dispinterface
    ['{C44AAC54-CE22-421C-B159-B864DF2EB753}']
    function SessionInitSigned: IDispatch; dispid 29051;
    function SessionInitToken: IDispatch; dispid 29052;
    function SessionChalangePZ: WideString; dispid 29053;
    function SessionInitPZ(const SignedInit: WideString): IDispatch; dispid 29054;
    function SessionStatus(const ReferenceNumber: WideString; PageSize: Integer; 
                           PageOffset: Integer; IncludeDetails: WordBool): IDispatch; dispid 29055;
    function SessionTerminate(Force: WordBool): IDispatch; dispid 29056;
    function SessionGenerateInternalIdentifier(const InputDigitsSequence: WideString): IDispatch; dispid 29057;
    procedure InvoiceGet(const KSeFReferenceNumber: WideString; OutputStream: OleVariant); dispid 29058;
    function InvoiceSend(DataStream: OleVariant): IDispatch; dispid 29059;
    function InvoiceStatus(const InvoiceElementReferenceNumber: WideString; 
                           KSeFNumberVariant: lgcKSeFNumberVariant): IDispatch; dispid 29060;
    function InvoiceVisibilityHide(const KSeFReferenceNumber: WideString; 
                                   const HidingReason: WideString): IDispatch; dispid 29061;
    function InvoiceVisibilityShow(const KSeFReferenceNumber: WideString; 
                                   const HidingCancelationReason: WideString): IDispatch; dispid 29062;
    function InvoiceVisibilityStatus(const HidingElementReferenceNumber: WideString; 
                                     KSeFNumberVariant: lgcKSeFNumberVariant): IDispatch; dispid 29063;
    function InvoiceVisibility(const KSeFReferenceNumber: WideString; 
                               KSeFNumberVariant: lgcKSeFNumberVariant): IDispatch; dispid 29064;
    function InvoiceScamCancel(const KSeFReferenceNumber: WideString; 
                               const ReportCancelationReason: WideString): IDispatch; dispid 29065;
    function InvoiceScamReport(const KSeFReferenceNumber: WideString; const ReportReason: WideString): IDispatch; dispid 29066;
    function InvoiceScamStatus(const ScamElementReferenceNumber: WideString): IDispatch; dispid 29067;
    function InvoiceScam(const KSeFReferenceNumber: WideString): IDispatch; dispid 29068;
    function CredentialsAccountingGrant(const GrantAccountingCredentialsRequest: IDispatch): IDispatch; dispid 29069;
    function CredentialsAccountingRevoke(const RevokeAccountingCredentialsRequest: IDispatch): IDispatch; dispid 29070;
    function CredentialsContextGrant(const GrantContextCredentialsRequest: IDispatch): IDispatch; dispid 29071;
    function CredentialsContextRevoke(const RevokeContextCredentialsRequest: IDispatch): IDispatch; dispid 29072;
    function CredentialsGenerateToken(const GenerateTokenRequest: IDispatch): IDispatch; dispid 29073;
    function CredentialsGrant(const GrantCredentialsRequest: IDispatch): IDispatch; dispid 29074;
    function CredentialsRevoke(const RevokeCredentialsRequest: IDispatch): IDispatch; dispid 29075;
    function CredentialsRevokeToken(const RevokeTokenRequest: IDispatch): IDispatch; dispid 29076;
    function CredentialsStatus(const CredentialsElementReferenceNumber: WideString): IDispatch; dispid 29077;
    function QueryCredentialContextSync(const ContextNip: WideString; 
                                        const SourceIdentifier: WideString; 
                                        const TargetIdentifier: WideString): IDispatch; dispid 29078;
    function QueryCredentialSync(const QuerySyncCredentialsRequest: IDispatch): IDispatch; dispid 29079;
    function QueryInvoiceSync(const QueryCriteria: IDispatch; PageSize: Integer; PageOffset: Integer): IDispatch; dispid 29080;
    function QueryInvoiceAsyncInit(const QueryCriteria: IDispatch): IDispatch; dispid 29081;
    function QueryInvoiceAsyncStatus(const QueryElementReferenceNumber: WideString): IDispatch; dispid 29082;
    procedure QueryInvoiceAsyncFetch(const QueryElementReferenceNumber: WideString; 
                                     const PartElementReferenceNumber: WideString; 
                                     Response: OleVariant); dispid 29083;
    procedure QueryInvoiceAsyncFetch2(const StatusResponse: IDispatch; PartIndex: Integer; 
                                      Response: OleVariant); dispid 29084;
    function PaymentIdentifierGetReferenceNumbers(const PaymentIdentifier: WideString): IDispatch; dispid 29085;
    function PaymentIdentifierRequest(KsefReferenceNumberList: OleVariant): IDispatch; dispid 29086;
    procedure CommonInvoiceKSeF(const InvoiceRequest: IDispatch; OutStream: OleVariant; 
                                GateType: lgcKSeFGateType); dispid 29087;
    procedure CommonDownload(const KSeFReferenceNumber: WideString; 
                             const DownloadRequest: IDispatch; OutStream: OleVariant; 
                             GateType: lgcKSeFGateType); dispid 29088;
    function CommonStatus(const ReferenceNumber: WideString; GateType: lgcKSeFGateType): IDispatch; dispid 29089;
    function CommonVerification(const KSeFReferenceNumber: WideString; 
                                const VerificationRequest: IDispatch; GateType: lgcKSeFGateType): IDispatch; dispid 29090;
    function BatchSign(ZIPDataStream: OleVariant; PZ: WordBool; EncryptedStream: OleVariant; 
                       const ZIPFileName: WideString; const PartFileName: WideString): WideString; dispid 29091;
    function BatchSend(PartStream: OleVariant; const InitUpload: WideString): WideString; dispid 29092;
    property RSAEncryptClass: WideString dispid 29001;
    property Base64EncoderClass: WideString dispid 29002;
    property AES256EncryptClass: WideString dispid 29003;
    property SHA256HashClass: WideString dispid 29004;
    property RandomGeneratorClass: WideString dispid 29005;
    property XAdES: IDispatch dispid 29006;
    property HTTPClient: IDispatch dispid 29007;
    property GateType: lgcKSeFGateType dispid 29008;
    property Nip: WideString dispid 29009;
    property FormCode: Integer dispid 29010;
    property FormCodeSystemCode: WideString dispid 29011;
    property FormCodeSchemaVersion: WideString dispid 29012;
    property FormCodeTargetNamespace: WideString dispid 29013;
    property FormCodeValue: WideString dispid 29014;
    property Certificate: IDispatch dispid 29015;
    property CertificateAuthType: lgcKSeFGateType dispid 29016;
    property Token: WideString dispid 29017;
    property Encryption: WordBool dispid 29018;
    property SessionToken: WideString readonly dispid 29019;
    property SessionActive: WordBool readonly dispid 29020;
    property RSAKeyProd: IDispatch dispid 29021;
    property RSAKeyDemo: IDispatch dispid 29022;
    property RSAKeyTest: IDispatch dispid 29023;
    procedure GenerateAESKey; dispid 29024;
    function CreateKSeFObject(const ClsName: WideString): IDispatch; dispid 29025;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcMemoryStream
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BCF17136-365B-4AF4-9720-44EB9E4CABB0}
// *********************************************************************//
  IlgcMemoryStream = interface(IlgcBaseObject)
    ['{BCF17136-365B-4AF4-9720-44EB9E4CABB0}']
    function Get_Data: OleVariant; safecall;
    procedure Set_Data(Value: OleVariant); safecall;
    procedure Clear; safecall;
    procedure LoadFromFile(const AFileName: WideString); safecall;
    procedure SaveToFile(const AFileName: WideString); safecall;
    property Data: OleVariant read Get_Data write Set_Data;
  end;

// *********************************************************************//
// DispIntf:  IlgcMemoryStreamDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BCF17136-365B-4AF4-9720-44EB9E4CABB0}
// *********************************************************************//
  IlgcMemoryStreamDisp = dispinterface
    ['{BCF17136-365B-4AF4-9720-44EB9E4CABB0}']
    property Data: OleVariant dispid 11001;
    procedure Clear; dispid 11002;
    procedure LoadFromFile(const AFileName: WideString); dispid 11003;
    procedure SaveToFile(const AFileName: WideString); dispid 11004;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// The Class ColgcErrorInfo provides a Create and CreateRemote method to          
// create instances of the default interface IlgcErrorInfo exposed by              
// the CoClass lgcErrorInfo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcErrorInfo = class
    class function Create: IlgcErrorInfo;
    class function CreateRemote(const MachineName: string): IlgcErrorInfo;
  end;

// *********************************************************************//
// The Class ColgcBaseObject provides a Create and CreateRemote method to          
// create instances of the default interface IlgcBaseObject exposed by              
// the CoClass lgcBaseObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcBaseObject = class
    class function Create: IlgcBaseObject;
    class function CreateRemote(const MachineName: string): IlgcBaseObject;
  end;

// *********************************************************************//
// The Class ColgcBackend provides a Create and CreateRemote method to          
// create instances of the default interface IlgcBackend exposed by              
// the CoClass lgcBackend. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcBackend = class
    class function Create: IlgcBackend;
    class function CreateRemote(const MachineName: string): IlgcBackend;
  end;

// *********************************************************************//
// The Class ColgcObject provides a Create and CreateRemote method to          
// create instances of the default interface IlgcObject exposed by              
// the CoClass lgcObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcObject = class
    class function Create: IlgcObject;
    class function CreateRemote(const MachineName: string): IlgcObject;
  end;

// *********************************************************************//
// The Class ColgcList provides a Create and CreateRemote method to          
// create instances of the default interface IlgcList exposed by              
// the CoClass lgcList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcList = class
    class function Create: IlgcList;
    class function CreateRemote(const MachineName: string): IlgcList;
  end;

// *********************************************************************//
// The Class ColgcWSTBackend provides a Create and CreateRemote method to          
// create instances of the default interface IlgcWSTBackend exposed by              
// the CoClass lgcWSTBackend. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcWSTBackend = class
    class function Create: IlgcWSTBackend;
    class function CreateRemote(const MachineName: string): IlgcWSTBackend;
  end;

// *********************************************************************//
// The Class ColgcLibXMLBackend provides a Create and CreateRemote method to          
// create instances of the default interface IlgcLibXMLBackend exposed by              
// the CoClass lgcLibXMLBackend. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcLibXMLBackend = class
    class function Create: IlgcLibXMLBackend;
    class function CreateRemote(const MachineName: string): IlgcLibXMLBackend;
  end;

// *********************************************************************//
// The Class ColgcOpenSSLBackend provides a Create and CreateRemote method to          
// create instances of the default interface IlgcOpenSSLBackend exposed by              
// the CoClass lgcOpenSSLBackend. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcOpenSSLBackend = class
    class function Create: IlgcOpenSSLBackend;
    class function CreateRemote(const MachineName: string): IlgcOpenSSLBackend;
  end;

// *********************************************************************//
// The Class ColgcStringStream provides a Create and CreateRemote method to          
// create instances of the default interface IlgcStringStream exposed by              
// the CoClass lgcStringStream. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcStringStream = class
    class function Create: IlgcStringStream;
    class function CreateRemote(const MachineName: string): IlgcStringStream;
  end;

// *********************************************************************//
// The Class ColgcFileStream provides a Create and CreateRemote method to          
// create instances of the default interface IlgcFileStream exposed by              
// the CoClass lgcFileStream. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcFileStream = class
    class function Create: IlgcFileStream;
    class function CreateRemote(const MachineName: string): IlgcFileStream;
  end;

// *********************************************************************//
// The Class ColgcMemoryStream provides a Create and CreateRemote method to          
// create instances of the default interface IlgcMemoryStream exposed by              
// the CoClass lgcMemoryStream. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcMemoryStream = class
    class function Create: IlgcMemoryStream;
    class function CreateRemote(const MachineName: string): IlgcMemoryStream;
  end;

// *********************************************************************//
// The Class ColgcHTTPClient provides a Create and CreateRemote method to          
// create instances of the default interface IlgcHTTPClient exposed by              
// the CoClass lgcHTTPClient. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcHTTPClient = class
    class function Create: IlgcHTTPClient;
    class function CreateRemote(const MachineName: string): IlgcHTTPClient;
  end;

// *********************************************************************//
// The Class ColgcCertificate provides a Create and CreateRemote method to          
// create instances of the default interface IlgcCertificate exposed by              
// the CoClass lgcCertificate. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcCertificate = class
    class function Create: IlgcCertificate;
    class function CreateRemote(const MachineName: string): IlgcCertificate;
  end;

// *********************************************************************//
// The Class ColgcCertificateSigner provides a Create and CreateRemote method to          
// create instances of the default interface IlgcCertificateSigner exposed by              
// the CoClass lgcCertificateSigner. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcCertificateSigner = class
    class function Create: IlgcCertificateSigner;
    class function CreateRemote(const MachineName: string): IlgcCertificateSigner;
  end;

// *********************************************************************//
// The Class ColgcCNGCertificateSigner provides a Create and CreateRemote method to          
// create instances of the default interface IlgcCNGCertificateSigner exposed by              
// the CoClass lgcCNGCertificateSigner. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcCNGCertificateSigner = class
    class function Create: IlgcCNGCertificateSigner;
    class function CreateRemote(const MachineName: string): IlgcCNGCertificateSigner;
  end;

// *********************************************************************//
// The Class ColgcPKCS11Info provides a Create and CreateRemote method to          
// create instances of the default interface IlgcPKCS11Info exposed by              
// the CoClass lgcPKCS11Info. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcPKCS11Info = class
    class function Create: IlgcPKCS11Info;
    class function CreateRemote(const MachineName: string): IlgcPKCS11Info;
  end;

// *********************************************************************//
// The Class ColgcPKCS11TokenInfo provides a Create and CreateRemote method to          
// create instances of the default interface IlgcPKCS11TokenInfo exposed by              
// the CoClass lgcPKCS11TokenInfo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcPKCS11TokenInfo = class
    class function Create: IlgcPKCS11TokenInfo;
    class function CreateRemote(const MachineName: string): IlgcPKCS11TokenInfo;
  end;

// *********************************************************************//
// The Class ColgcPKCS11SlotInfo provides a Create and CreateRemote method to          
// create instances of the default interface IlgcPKCS11SlotInfo exposed by              
// the CoClass lgcPKCS11SlotInfo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcPKCS11SlotInfo = class
    class function Create: IlgcPKCS11SlotInfo;
    class function CreateRemote(const MachineName: string): IlgcPKCS11SlotInfo;
  end;

// *********************************************************************//
// The Class ColgcPKCS11Session provides a Create and CreateRemote method to          
// create instances of the default interface IlgcPKCS11Session exposed by              
// the CoClass lgcPKCS11Session. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcPKCS11Session = class
    class function Create: IlgcPKCS11Session;
    class function CreateRemote(const MachineName: string): IlgcPKCS11Session;
  end;

// *********************************************************************//
// The Class ColgcPKCS11Certificate provides a Create and CreateRemote method to          
// create instances of the default interface IlgcPKCS11Certificate exposed by              
// the CoClass lgcPKCS11Certificate. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcPKCS11Certificate = class
    class function Create: IlgcPKCS11Certificate;
    class function CreateRemote(const MachineName: string): IlgcPKCS11Certificate;
  end;

// *********************************************************************//
// The Class ColgcPKCS11CertificateSigner provides a Create and CreateRemote method to          
// create instances of the default interface IlgcPKCS11CertificateSigner exposed by              
// the CoClass lgcPKCS11CertificateSigner. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcPKCS11CertificateSigner = class
    class function Create: IlgcPKCS11CertificateSigner;
    class function CreateRemote(const MachineName: string): IlgcPKCS11CertificateSigner;
  end;

// *********************************************************************//
// The Class ColgcPKCS11Backend provides a Create and CreateRemote method to          
// create instances of the default interface IlgcPKCS11Backend exposed by              
// the CoClass lgcPKCS11Backend. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcPKCS11Backend = class
    class function Create: IlgcPKCS11Backend;
    class function CreateRemote(const MachineName: string): IlgcPKCS11Backend;
  end;

// *********************************************************************//
// The Class ColgcXAdES provides a Create and CreateRemote method to          
// create instances of the default interface IlgcXAdES exposed by              
// the CoClass lgcXAdES. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcXAdES = class
    class function Create: IlgcXAdES;
    class function CreateRemote(const MachineName: string): IlgcXAdES;
  end;

// *********************************************************************//
// The Class ColgcEDeklaracjaStatus provides a Create and CreateRemote method to          
// create instances of the default interface IlgcEDeklaracjaStatus exposed by              
// the CoClass lgcEDeklaracjaStatus. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcEDeklaracjaStatus = class
    class function Create: IlgcEDeklaracjaStatus;
    class function CreateRemote(const MachineName: string): IlgcEDeklaracjaStatus;
  end;

// *********************************************************************//
// The Class ColgcEDeklaracja provides a Create and CreateRemote method to          
// create instances of the default interface IlgcEDeklaracja exposed by              
// the CoClass lgcEDeklaracja. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcEDeklaracja = class
    class function Create: IlgcEDeklaracja;
    class function CreateRemote(const MachineName: string): IlgcEDeklaracja;
  end;

// *********************************************************************//
// The Class ColgcJPK provides a Create and CreateRemote method to          
// create instances of the default interface IlgcJPK exposed by              
// the CoClass lgcJPK. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcJPK = class
    class function Create: IlgcJPK;
    class function CreateRemote(const MachineName: string): IlgcJPK;
  end;

// *********************************************************************//
// The Class ColgcKSeFRequest provides a Create and CreateRemote method to          
// create instances of the default interface IlgcKSeFRequest exposed by              
// the CoClass lgcKSeFRequest. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcKSeFRequest = class
    class function Create: IlgcKSeFRequest;
    class function CreateRemote(const MachineName: string): IlgcKSeFRequest;
  end;

// *********************************************************************//
// The Class ColgcKSeFResponse provides a Create and CreateRemote method to          
// create instances of the default interface IlgcKSeFResponse exposed by              
// the CoClass lgcKSeFResponse. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcKSeFResponse = class
    class function Create: IlgcKSeFResponse;
    class function CreateRemote(const MachineName: string): IlgcKSeFResponse;
  end;

// *********************************************************************//
// The Class ColgcKSeFBase provides a Create and CreateRemote method to          
// create instances of the default interface IlgcKSeFBase exposed by              
// the CoClass lgcKSeFBase. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcKSeFBase = class
    class function Create: IlgcKSeFBase;
    class function CreateRemote(const MachineName: string): IlgcKSeFBase;
  end;

// *********************************************************************//
// The Class ColgcKSeF_2_6_0 provides a Create and CreateRemote method to          
// create instances of the default interface IlgcKSeF_2_6_0 exposed by              
// the CoClass lgcKSeF_2_6_0. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcKSeF_2_6_0 = class
    class function Create: IlgcKSeF_2_6_0;
    class function CreateRemote(const MachineName: string): IlgcKSeF_2_6_0;
  end;

implementation

uses ComObj;

class function ColgcErrorInfo.Create: IlgcErrorInfo;
begin
  Result := CreateComObject(CLASS_lgcErrorInfo) as IlgcErrorInfo;
end;

class function ColgcErrorInfo.CreateRemote(const MachineName: string): IlgcErrorInfo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcErrorInfo) as IlgcErrorInfo;
end;

class function ColgcBaseObject.Create: IlgcBaseObject;
begin
  Result := CreateComObject(CLASS_lgcBaseObject) as IlgcBaseObject;
end;

class function ColgcBaseObject.CreateRemote(const MachineName: string): IlgcBaseObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcBaseObject) as IlgcBaseObject;
end;

class function ColgcBackend.Create: IlgcBackend;
begin
  Result := CreateComObject(CLASS_lgcBackend) as IlgcBackend;
end;

class function ColgcBackend.CreateRemote(const MachineName: string): IlgcBackend;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcBackend) as IlgcBackend;
end;

class function ColgcObject.Create: IlgcObject;
begin
  Result := CreateComObject(CLASS_lgcObject) as IlgcObject;
end;

class function ColgcObject.CreateRemote(const MachineName: string): IlgcObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcObject) as IlgcObject;
end;

class function ColgcList.Create: IlgcList;
begin
  Result := CreateComObject(CLASS_lgcList) as IlgcList;
end;

class function ColgcList.CreateRemote(const MachineName: string): IlgcList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcList) as IlgcList;
end;

class function ColgcWSTBackend.Create: IlgcWSTBackend;
begin
  Result := CreateComObject(CLASS_lgcWSTBackend) as IlgcWSTBackend;
end;

class function ColgcWSTBackend.CreateRemote(const MachineName: string): IlgcWSTBackend;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcWSTBackend) as IlgcWSTBackend;
end;

class function ColgcLibXMLBackend.Create: IlgcLibXMLBackend;
begin
  Result := CreateComObject(CLASS_lgcLibXMLBackend) as IlgcLibXMLBackend;
end;

class function ColgcLibXMLBackend.CreateRemote(const MachineName: string): IlgcLibXMLBackend;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcLibXMLBackend) as IlgcLibXMLBackend;
end;

class function ColgcOpenSSLBackend.Create: IlgcOpenSSLBackend;
begin
  Result := CreateComObject(CLASS_lgcOpenSSLBackend) as IlgcOpenSSLBackend;
end;

class function ColgcOpenSSLBackend.CreateRemote(const MachineName: string): IlgcOpenSSLBackend;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcOpenSSLBackend) as IlgcOpenSSLBackend;
end;

class function ColgcStringStream.Create: IlgcStringStream;
begin
  Result := CreateComObject(CLASS_lgcStringStream) as IlgcStringStream;
end;

class function ColgcStringStream.CreateRemote(const MachineName: string): IlgcStringStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcStringStream) as IlgcStringStream;
end;

class function ColgcFileStream.Create: IlgcFileStream;
begin
  Result := CreateComObject(CLASS_lgcFileStream) as IlgcFileStream;
end;

class function ColgcFileStream.CreateRemote(const MachineName: string): IlgcFileStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcFileStream) as IlgcFileStream;
end;

class function ColgcMemoryStream.Create: IlgcMemoryStream;
begin
  Result := CreateComObject(CLASS_lgcMemoryStream) as IlgcMemoryStream;
end;

class function ColgcMemoryStream.CreateRemote(const MachineName: string): IlgcMemoryStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcMemoryStream) as IlgcMemoryStream;
end;

class function ColgcHTTPClient.Create: IlgcHTTPClient;
begin
  Result := CreateComObject(CLASS_lgcHTTPClient) as IlgcHTTPClient;
end;

class function ColgcHTTPClient.CreateRemote(const MachineName: string): IlgcHTTPClient;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcHTTPClient) as IlgcHTTPClient;
end;

class function ColgcCertificate.Create: IlgcCertificate;
begin
  Result := CreateComObject(CLASS_lgcCertificate) as IlgcCertificate;
end;

class function ColgcCertificate.CreateRemote(const MachineName: string): IlgcCertificate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcCertificate) as IlgcCertificate;
end;

class function ColgcCertificateSigner.Create: IlgcCertificateSigner;
begin
  Result := CreateComObject(CLASS_lgcCertificateSigner) as IlgcCertificateSigner;
end;

class function ColgcCertificateSigner.CreateRemote(const MachineName: string): IlgcCertificateSigner;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcCertificateSigner) as IlgcCertificateSigner;
end;

class function ColgcCNGCertificateSigner.Create: IlgcCNGCertificateSigner;
begin
  Result := CreateComObject(CLASS_lgcCNGCertificateSigner) as IlgcCNGCertificateSigner;
end;

class function ColgcCNGCertificateSigner.CreateRemote(const MachineName: string): IlgcCNGCertificateSigner;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcCNGCertificateSigner) as IlgcCNGCertificateSigner;
end;

class function ColgcPKCS11Info.Create: IlgcPKCS11Info;
begin
  Result := CreateComObject(CLASS_lgcPKCS11Info) as IlgcPKCS11Info;
end;

class function ColgcPKCS11Info.CreateRemote(const MachineName: string): IlgcPKCS11Info;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcPKCS11Info) as IlgcPKCS11Info;
end;

class function ColgcPKCS11TokenInfo.Create: IlgcPKCS11TokenInfo;
begin
  Result := CreateComObject(CLASS_lgcPKCS11TokenInfo) as IlgcPKCS11TokenInfo;
end;

class function ColgcPKCS11TokenInfo.CreateRemote(const MachineName: string): IlgcPKCS11TokenInfo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcPKCS11TokenInfo) as IlgcPKCS11TokenInfo;
end;

class function ColgcPKCS11SlotInfo.Create: IlgcPKCS11SlotInfo;
begin
  Result := CreateComObject(CLASS_lgcPKCS11SlotInfo) as IlgcPKCS11SlotInfo;
end;

class function ColgcPKCS11SlotInfo.CreateRemote(const MachineName: string): IlgcPKCS11SlotInfo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcPKCS11SlotInfo) as IlgcPKCS11SlotInfo;
end;

class function ColgcPKCS11Session.Create: IlgcPKCS11Session;
begin
  Result := CreateComObject(CLASS_lgcPKCS11Session) as IlgcPKCS11Session;
end;

class function ColgcPKCS11Session.CreateRemote(const MachineName: string): IlgcPKCS11Session;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcPKCS11Session) as IlgcPKCS11Session;
end;

class function ColgcPKCS11Certificate.Create: IlgcPKCS11Certificate;
begin
  Result := CreateComObject(CLASS_lgcPKCS11Certificate) as IlgcPKCS11Certificate;
end;

class function ColgcPKCS11Certificate.CreateRemote(const MachineName: string): IlgcPKCS11Certificate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcPKCS11Certificate) as IlgcPKCS11Certificate;
end;

class function ColgcPKCS11CertificateSigner.Create: IlgcPKCS11CertificateSigner;
begin
  Result := CreateComObject(CLASS_lgcPKCS11CertificateSigner) as IlgcPKCS11CertificateSigner;
end;

class function ColgcPKCS11CertificateSigner.CreateRemote(const MachineName: string): IlgcPKCS11CertificateSigner;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcPKCS11CertificateSigner) as IlgcPKCS11CertificateSigner;
end;

class function ColgcPKCS11Backend.Create: IlgcPKCS11Backend;
begin
  Result := CreateComObject(CLASS_lgcPKCS11Backend) as IlgcPKCS11Backend;
end;

class function ColgcPKCS11Backend.CreateRemote(const MachineName: string): IlgcPKCS11Backend;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcPKCS11Backend) as IlgcPKCS11Backend;
end;

class function ColgcXAdES.Create: IlgcXAdES;
begin
  Result := CreateComObject(CLASS_lgcXAdES) as IlgcXAdES;
end;

class function ColgcXAdES.CreateRemote(const MachineName: string): IlgcXAdES;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcXAdES) as IlgcXAdES;
end;

class function ColgcEDeklaracjaStatus.Create: IlgcEDeklaracjaStatus;
begin
  Result := CreateComObject(CLASS_lgcEDeklaracjaStatus) as IlgcEDeklaracjaStatus;
end;

class function ColgcEDeklaracjaStatus.CreateRemote(const MachineName: string): IlgcEDeklaracjaStatus;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcEDeklaracjaStatus) as IlgcEDeklaracjaStatus;
end;

class function ColgcEDeklaracja.Create: IlgcEDeklaracja;
begin
  Result := CreateComObject(CLASS_lgcEDeklaracja) as IlgcEDeklaracja;
end;

class function ColgcEDeklaracja.CreateRemote(const MachineName: string): IlgcEDeklaracja;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcEDeklaracja) as IlgcEDeklaracja;
end;

class function ColgcJPK.Create: IlgcJPK;
begin
  Result := CreateComObject(CLASS_lgcJPK) as IlgcJPK;
end;

class function ColgcJPK.CreateRemote(const MachineName: string): IlgcJPK;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcJPK) as IlgcJPK;
end;

class function ColgcKSeFRequest.Create: IlgcKSeFRequest;
begin
  Result := CreateComObject(CLASS_lgcKSeFRequest) as IlgcKSeFRequest;
end;

class function ColgcKSeFRequest.CreateRemote(const MachineName: string): IlgcKSeFRequest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcKSeFRequest) as IlgcKSeFRequest;
end;

class function ColgcKSeFResponse.Create: IlgcKSeFResponse;
begin
  Result := CreateComObject(CLASS_lgcKSeFResponse) as IlgcKSeFResponse;
end;

class function ColgcKSeFResponse.CreateRemote(const MachineName: string): IlgcKSeFResponse;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcKSeFResponse) as IlgcKSeFResponse;
end;

class function ColgcKSeFBase.Create: IlgcKSeFBase;
begin
  Result := CreateComObject(CLASS_lgcKSeFBase) as IlgcKSeFBase;
end;

class function ColgcKSeFBase.CreateRemote(const MachineName: string): IlgcKSeFBase;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcKSeFBase) as IlgcKSeFBase;
end;

class function ColgcKSeF_2_6_0.Create: IlgcKSeF_2_6_0;
begin
  Result := CreateComObject(CLASS_lgcKSeF_2_6_0) as IlgcKSeF_2_6_0;
end;

class function ColgcKSeF_2_6_0.CreateRemote(const MachineName: string): IlgcKSeF_2_6_0;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcKSeF_2_6_0) as IlgcKSeF_2_6_0;
end;

end.
