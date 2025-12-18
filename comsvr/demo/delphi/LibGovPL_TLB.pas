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
// File generated on 2025-12-18 23:06:21 from Type Library described below.

// ************************************************************************  //
// Type Lib: d:\lazarus-projekty\libgovpl4demo\binw32\libgovpl4com.dll (1)
// LIBID: {923701A2-ECEF-4DD8-A560-51B56CB1FE75}
// LCID: 0
// Helpfile: 
// HelpString: LibGovPL COM/OLE Automation library
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
  IID_IlgcObject2: TGUID = '{0843F691-F9A5-4762-9261-790E111CAC33}';
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
  IID_IlgcXMLReader: TGUID = '{58A611B0-0289-43F6-8452-E4513A68C6A0}';
  IID_IlgcXMLValidationError: TGUID = '{87BD38C1-4A49-44A1-91A0-90A41F3008FA}';
  IID_IlgcXMLValidator: TGUID = '{DBF692FB-D430-4214-ABCA-69903927B349}';
  IID_IlgcXMLXSLTransformation: TGUID = '{0A7F7305-FB5C-40FE-A1E9-8408D6C45B1C}';
  IID_IlgcViesCheckVatResponse: TGUID = '{92194BC6-A566-4783-BB67-13FD91450C1A}';
  IID_IlgcViesCountryStatus: TGUID = '{92283D36-304C-49D5-9A4E-6E163403776E}';
  IID_IlgcViesStatusInformationResponse: TGUID = '{3BD250F9-8F41-435F-BE76-734A0B4FDFFC}';
  IID_IlgcViesService: TGUID = '{0779A838-D9CC-4D00-B40C-E5CAD9599619}';
  IID_IlgcKSeF2Request: TGUID = '{92A8D7F5-32ED-4B1E-8714-27F6751E5D62}';
  IID_IlgcKSeF2Response: TGUID = '{56B4DD5D-21E4-43B6-B202-AE0234076006}';
  IID_IlgcKSeF2: TGUID = '{A640B36B-E2C8-4253-BD95-AA2FD75E92EB}';
  IID_IlgcKSeF2VerificationLinkService: TGUID = '{25702B7C-71EA-4536-83E1-FF79B12C5932}';
  IID_IlgcHash: TGUID = '{D207DD82-D710-4935-B6AB-B562250514D9}';
  IID_IlgcKSeF2Utils: TGUID = '{76D4D70C-6FA0-44E7-9762-D54C180CD298}';
  IID_IlgcMemoryStream: TGUID = '{BCF17136-365B-4AF4-9720-44EB9E4CABB0}';
  CLASS_lgcErrorInfo: TGUID = '{635B56F7-B613-4E78-8AE3-B37C4591668B}';
  CLASS_lgcBaseObject: TGUID = '{2966D8CF-42F7-4AFF-9BB4-F3FA1DA714A6}';
  CLASS_lgcBackend: TGUID = '{2FAD736C-1297-4705-B19F-AD1EE260A9A2}';
  CLASS_lgcObject: TGUID = '{BCC209CD-4297-48D7-A37D-C15FAC40E5E0}';
  CLASS_lgcObject2: TGUID = '{CC7CFC1E-2421-4AA4-AAF2-C3765819CD72}';
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
  CLASS_lgcXMLReader: TGUID = '{AA86DB95-050E-4EF1-B52E-A61C9E207C03}';
  CLASS_lgcXMLValidationError: TGUID = '{98197903-7883-41EE-BB4F-92249CCE89E4}';
  CLASS_lgcXMLValidator: TGUID = '{4D41D696-5F71-4D88-839B-70A76DFAC1AE}';
  CLASS_lgcXMLXSLTransformation: TGUID = '{94E6CC10-1EAA-406C-84E5-02C42DA06EA3}';
  CLASS_lgcViesCheckVatResponse: TGUID = '{ED639E66-D7B5-4A29-A167-00AAACB139F7}';
  CLASS_lgcViesCountryStatus: TGUID = '{82EF6C75-DAE6-4663-AB78-F99E3B8C2524}';
  CLASS_lgcViesStatusInformationResponse: TGUID = '{83D1C325-91A6-4303-98A7-178E80CB4A38}';
  CLASS_lgcViesService: TGUID = '{79E69563-82EE-43C0-A469-AA21BE8C670F}';
  CLASS_lgcKSeF2Request: TGUID = '{088FBE72-0106-4FA8-9CDB-0D984067B824}';
  CLASS_lgcKSeF2Response: TGUID = '{CF102B8B-3D1A-4096-A9FF-0B22EFAA8F78}';
  CLASS_lgcKSeF2: TGUID = '{3BD8F73E-330D-4F4E-B5D8-A3F58DB9FA0D}';
  CLASS_lgcKSeF2VerificationLinkService: TGUID = '{A198F1D7-E40E-4DA4-A327-7042ED519A7D}';
  CLASS_lgcHash: TGUID = '{9FEC8D19-5C4F-49D3-A4A6-1197CD57D318}';
  CLASS_lgcKSeF2Utils: TGUID = '{6D4435A3-FB82-466F-B283-AD32103573E4}';

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
  lgcCTXMLValidator = $0000000D;
  lgcCTXMLXSLT = $0000000E;

// Constants for enum lgcEncodingType
type
  lgcEncodingType = TOleEnum;
const
  lgcETPEM = $00000000;
  lgcETDER = $00000001;
  lgcETPFX = $00000002;

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

// Constants for enum lgcKSeFCertificateAuthType
type
  lgcKSeFCertificateAuthType = TOleEnum;
const
  lgcCATSerialNumber = $00000000;
  lgcCATFingerprint = $00000001;

// Constants for enum lgcKSeFNumberVariant
type
  lgcKSeFNumberVariant = TOleEnum;
const
  lgcKNVDefault = $00000000;
  lgcKNV35 = $00000001;
  lgcKNV36 = $00000002;

// Constants for enum lgcViesMatchType
type
  lgcViesMatchType = TOleEnum;
const
  lgcVMTValid = $00000000;
  lgcVMTInvalid = $00000001;
  lgcVMTNot_Processed = $00000002;

// Constants for enum lgcViesAvailabilityStatus
type
  lgcViesAvailabilityStatus = TOleEnum;
const
  lgcVASAvailable = $00000000;
  lgcVASUnavailable = $00000001;
  lgcVASMonitoringDisabled = $00000002;

// Constants for enum lgcKSeFIdentifierType
type
  lgcKSeFIdentifierType = TOleEnum;
const
  itNone = $00000000;
  itAllPartners = $00000001;
  itNip = $00000002;
  itInternalId = $00000003;
  itNipVatUe = $00000004;
  itPeppolId = $00000005;

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
  lgcFMCreate = $0000FF00;

// Constants for enum lgcCertificateKeyUsage
type
  lgcCertificateKeyUsage = TOleEnum;
const
  lgcCKUDigitalSignature = $00000001;
  lgcCKUNonRepudiation = $00000002;
  lgcCKUKeyEncipherment = $00000004;
  lgcCKUDataEncipherment = $00000008;
  lgcCKUKeyAgreement = $00000010;
  lgcCKUKeyCertSign = $00000020;
  lgcCKUCRLSign = $00000040;
  lgcCKUEncipherOnly = $00000080;
  lgcCKUDecipherOnly = $00000100;

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
  IlgcObject2 = interface;
  IlgcObject2Disp = dispinterface;
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
  IlgcXMLReader = interface;
  IlgcXMLReaderDisp = dispinterface;
  IlgcXMLValidationError = interface;
  IlgcXMLValidationErrorDisp = dispinterface;
  IlgcXMLValidator = interface;
  IlgcXMLValidatorDisp = dispinterface;
  IlgcXMLXSLTransformation = interface;
  IlgcXMLXSLTransformationDisp = dispinterface;
  IlgcViesCheckVatResponse = interface;
  IlgcViesCheckVatResponseDisp = dispinterface;
  IlgcViesCountryStatus = interface;
  IlgcViesCountryStatusDisp = dispinterface;
  IlgcViesStatusInformationResponse = interface;
  IlgcViesStatusInformationResponseDisp = dispinterface;
  IlgcViesService = interface;
  IlgcViesServiceDisp = dispinterface;
  IlgcKSeF2Request = interface;
  IlgcKSeF2RequestDisp = dispinterface;
  IlgcKSeF2Response = interface;
  IlgcKSeF2ResponseDisp = dispinterface;
  IlgcKSeF2 = interface;
  IlgcKSeF2Disp = dispinterface;
  IlgcKSeF2VerificationLinkService = interface;
  IlgcKSeF2VerificationLinkServiceDisp = dispinterface;
  IlgcHash = interface;
  IlgcHashDisp = dispinterface;
  IlgcKSeF2Utils = interface;
  IlgcKSeF2UtilsDisp = dispinterface;
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
  lgcObject2 = IlgcObject2;
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
  lgcXMLReader = IlgcXMLReader;
  lgcXMLValidationError = IlgcXMLValidationError;
  lgcXMLValidator = IlgcXMLValidator;
  lgcXMLXSLTransformation = IlgcXMLXSLTransformation;
  lgcViesCheckVatResponse = IlgcViesCheckVatResponse;
  lgcViesCountryStatus = IlgcViesCountryStatus;
  lgcViesStatusInformationResponse = IlgcViesStatusInformationResponse;
  lgcViesService = IlgcViesService;
  lgcKSeF2Request = IlgcKSeF2Request;
  lgcKSeF2Response = IlgcKSeF2Response;
  lgcKSeF2 = IlgcKSeF2;
  lgcKSeF2VerificationLinkService = IlgcKSeF2VerificationLinkService;
  lgcHash = IlgcHash;
  lgcKSeF2Utils = IlgcKSeF2Utils;


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
    procedure SetLicenseKey(const Param1: WideString; const Param2: WideString; 
                            const Param3: WideString); safecall;
    function GetLibVersion: WideString; safecall;
    function GetDebugInfo(CounterType: Integer): OleVariant; safecall;
    function GetClassCount(ClsType: lgcClassType): Integer; safecall;
    function GetClassName(ClsType: lgcClassType; ClassIndex: Integer): WideString; safecall;
    function GetClassNames(ClsType: lgcClassType): OleVariant; safecall;
    function GetClassNamesStr(ClsType: lgcClassType): WideString; safecall;
    function CreateFileStream(const FileName: WideString; Mode: Integer): IDispatch; safecall;
    function CreateHTTPClient(const ClsName: WideString): IDispatch; safecall;
    function CreateRSAPublicKey(const ClsName: WideString; Source: OleVariant; 
                                Encoding: lgcEncodingType): IDispatch; safecall;
    function CreateCertificateSigner(const ClsName: WideString): IDispatch; safecall;
    function CreateXAdES: IDispatch; safecall;
    function CreateEDeklaracja: IDispatch; safecall;
    function CreateJPK: IDispatch; safecall;
    function CreateKSeF: IDispatch; safecall;
    function CreateXMLReader(const ClsName: WideString; Source: OleVariant): IDispatch; safecall;
    function CreateXMLValidator(const ClsName: WideString): IDispatch; safecall;
    function CreateXMLXSLTranformation(const ClsName: WideString): IDispatch; safecall;
    function CreateKSeF2: IDispatch; safecall;
    function CreateHash(const ClsName: WideString): IDispatch; safecall;
    function CreateKSeF2VerLinkSvc: IDispatch; safecall;
    function CreateKSeF2Utils: IDispatch; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcBackendDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {393A6861-4A95-4CED-8B93-3A8FFA77F5C3}
// *********************************************************************//
  IlgcBackendDisp = dispinterface
    ['{393A6861-4A95-4CED-8B93-3A8FFA77F5C3}']
    procedure SetLicenseKey(const Param1: WideString; const Param2: WideString; 
                            const Param3: WideString); dispid 2001;
    function GetLibVersion: WideString; dispid 2002;
    function GetDebugInfo(CounterType: Integer): OleVariant; dispid 2003;
    function GetClassCount(ClsType: lgcClassType): Integer; dispid 2004;
    function GetClassName(ClsType: lgcClassType; ClassIndex: Integer): WideString; dispid 2005;
    function GetClassNames(ClsType: lgcClassType): OleVariant; dispid 2006;
    function GetClassNamesStr(ClsType: lgcClassType): WideString; dispid 2018;
    function CreateFileStream(const FileName: WideString; Mode: Integer): IDispatch; dispid 2007;
    function CreateHTTPClient(const ClsName: WideString): IDispatch; dispid 2008;
    function CreateRSAPublicKey(const ClsName: WideString; Source: OleVariant; 
                                Encoding: lgcEncodingType): IDispatch; dispid 2009;
    function CreateCertificateSigner(const ClsName: WideString): IDispatch; dispid 2010;
    function CreateXAdES: IDispatch; dispid 2011;
    function CreateEDeklaracja: IDispatch; dispid 2012;
    function CreateJPK: IDispatch; dispid 2013;
    function CreateKSeF: IDispatch; dispid 2014;
    function CreateXMLReader(const ClsName: WideString; Source: OleVariant): IDispatch; dispid 2015;
    function CreateXMLValidator(const ClsName: WideString): IDispatch; dispid 2016;
    function CreateXMLXSLTranformation(const ClsName: WideString): IDispatch; dispid 2017;
    function CreateKSeF2: IDispatch; dispid 2019;
    function CreateHash(const ClsName: WideString): IDispatch; dispid 2020;
    function CreateKSeF2VerLinkSvc: IDispatch; dispid 2021;
    function CreateKSeF2Utils: IDispatch; dispid 2022;
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
    function LibXMLLoaded: WordBool; safecall;
    function LibXSLTLoaded: WordBool; safecall;
    function LoadLibXML(const LibFileName: WideString): WordBool; safecall;
    function LoadLibXSLT(const LibXSLTFileName: WideString; const LibEXSLTFileName: WideString): WordBool; safecall;
    function Get_CacheExternals: WordBool; safecall;
    procedure Set_CacheExternals(Value: WordBool); safecall;
    function Get_CacheDir: WideString; safecall;
    procedure Set_CacheDir(const Value: WideString); safecall;
    function Get_HTTPClient: IDispatch; safecall;
    procedure Set_HTTPClient(const Value: IDispatch); safecall;
    property CacheExternals: WordBool read Get_CacheExternals write Set_CacheExternals;
    property CacheDir: WideString read Get_CacheDir write Set_CacheDir;
    property HTTPClient: IDispatch read Get_HTTPClient write Set_HTTPClient;
  end;

// *********************************************************************//
// DispIntf:  IlgcLibXMLBackendDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D87A7A97-38CD-4172-92B0-5AA97BECB494}
// *********************************************************************//
  IlgcLibXMLBackendDisp = dispinterface
    ['{D87A7A97-38CD-4172-92B0-5AA97BECB494}']
    function LibXMLLoaded: WordBool; dispid 5001;
    function LibXSLTLoaded: WordBool; dispid 5002;
    function LoadLibXML(const LibFileName: WideString): WordBool; dispid 5003;
    function LoadLibXSLT(const LibXSLTFileName: WideString; const LibEXSLTFileName: WideString): WordBool; dispid 5004;
    property CacheExternals: WordBool dispid 5005;
    property CacheDir: WideString dispid 5006;
    property HTTPClient: IDispatch dispid 5007;
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
// Interface: IlgcObject2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0843F691-F9A5-4762-9261-790E111CAC33}
// *********************************************************************//
  IlgcObject2 = interface(IlgcObject)
    ['{0843F691-F9A5-4762-9261-790E111CAC33}']
    function Get_Owner: IDispatch; safecall;
    procedure InsertObject(const Obj: IDispatch); safecall;
    procedure RemoveObject(const Obj: IDispatch); safecall;
    property Owner: IDispatch read Get_Owner;
  end;

// *********************************************************************//
// DispIntf:  IlgcObject2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0843F691-F9A5-4762-9261-790E111CAC33}
// *********************************************************************//
  IlgcObject2Disp = dispinterface
    ['{0843F691-F9A5-4762-9261-790E111CAC33}']
    property Owner: IDispatch readonly dispid 39001;
    procedure InsertObject(const Obj: IDispatch); dispid 39002;
    procedure RemoveObject(const Obj: IDispatch); dispid 39003;
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
    function Get__NewEnum: IUnknown; safecall;
    procedure Delete(ObjIndex: Integer); safecall;
    property Count: Integer read Get_Count;
    property Item[Index: OleVariant]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
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
    property _NewEnum: IUnknown readonly dispid -4;
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
    function Get_Version: Integer; safecall;
    function Get_DisplayName: WideString; safecall;
    function Get_Subject: WideString; safecall;
    function Get_SubjectFields(const Field: WideString): WideString; safecall;
    function Get_Issuer: WideString; safecall;
    function Get_IssuerFields(const Field: WideString): WideString; safecall;
    function Get_SerialNoDec: WideString; safecall;
    function Get_SerialNoHex: WideString; safecall;
    function Get_ValidFrom: OleVariant; safecall;
    function Get_ValidTo: OleVariant; safecall;
    function Get_Signature: WideString; safecall;
    function Get_KeyUsage: Integer; safecall;
    function Get_PublicKeyAlgorithm: WideString; safecall;
    procedure Set_PIN(const Param1: WideString); safecall;
    procedure ShowCertificateInfo(WinHandle: OleVariant); safecall;
    property Version: Integer read Get_Version;
    property DisplayName: WideString read Get_DisplayName;
    property Subject: WideString read Get_Subject;
    property SubjectFields[const Field: WideString]: WideString read Get_SubjectFields;
    property Issuer: WideString read Get_Issuer;
    property IssuerFields[const Field: WideString]: WideString read Get_IssuerFields;
    property SerialNoDec: WideString read Get_SerialNoDec;
    property SerialNoHex: WideString read Get_SerialNoHex;
    property ValidFrom: OleVariant read Get_ValidFrom;
    property ValidTo: OleVariant read Get_ValidTo;
    property Signature: WideString read Get_Signature;
    property KeyUsage: Integer read Get_KeyUsage;
    property PublicKeyAlgorithm: WideString read Get_PublicKeyAlgorithm;
    property PIN: WideString write Set_PIN;
  end;

// *********************************************************************//
// DispIntf:  IlgcCertificateDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {322D506B-4C30-43D1-A75E-F4D308D79022}
// *********************************************************************//
  IlgcCertificateDisp = dispinterface
    ['{322D506B-4C30-43D1-A75E-F4D308D79022}']
    property Version: Integer readonly dispid 13001;
    property DisplayName: WideString readonly dispid 13002;
    property Subject: WideString readonly dispid 13003;
    property SubjectFields[const Field: WideString]: WideString readonly dispid 13004;
    property Issuer: WideString readonly dispid 13005;
    property IssuerFields[const Field: WideString]: WideString readonly dispid 13006;
    property SerialNoDec: WideString readonly dispid 13007;
    property SerialNoHex: WideString readonly dispid 13008;
    property ValidFrom: OleVariant readonly dispid 13009;
    property ValidTo: OleVariant readonly dispid 13010;
    property Signature: WideString readonly dispid 13011;
    property KeyUsage: Integer readonly dispid 13012;
    property PublicKeyAlgorithm: WideString readonly dispid 13013;
    property PIN: WideString writeonly dispid 13014;
    procedure ShowCertificateInfo(WinHandle: OleVariant); dispid 13015;
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
    function LoadFromStream(CertificateStream: OleVariant; CertificateFormat: lgcEncodingType; 
                            PrivateKeyStream: OleVariant; PrivateKeyFormat: lgcEncodingType; 
                            const Password: WideString): IDispatch; safecall;
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
    function LoadFromStream(CertificateStream: OleVariant; CertificateFormat: lgcEncodingType; 
                            PrivateKeyStream: OleVariant; PrivateKeyFormat: lgcEncodingType; 
                            const Password: WideString): IDispatch; dispid 14003;
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
    function LoadFromStream(CertificateStream: OleVariant; CertificateFormat: lgcEncodingType; 
                            PrivateKeyStream: OleVariant; PrivateKeyFormat: lgcEncodingType; 
                            const Password: WideString): IDispatch; dispid 14003;
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
    property Version: Integer readonly dispid 13001;
    property DisplayName: WideString readonly dispid 13002;
    property Subject: WideString readonly dispid 13003;
    property SubjectFields[const Field: WideString]: WideString readonly dispid 13004;
    property Issuer: WideString readonly dispid 13005;
    property IssuerFields[const Field: WideString]: WideString readonly dispid 13006;
    property SerialNoDec: WideString readonly dispid 13007;
    property SerialNoHex: WideString readonly dispid 13008;
    property ValidFrom: OleVariant readonly dispid 13009;
    property ValidTo: OleVariant readonly dispid 13010;
    property Signature: WideString readonly dispid 13011;
    property KeyUsage: Integer readonly dispid 13012;
    property PublicKeyAlgorithm: WideString readonly dispid 13013;
    property PIN: WideString writeonly dispid 13014;
    procedure ShowCertificateInfo(WinHandle: OleVariant); dispid 13015;
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
    function LoadFromStream(CertificateStream: OleVariant; CertificateFormat: lgcEncodingType; 
                            PrivateKeyStream: OleVariant; PrivateKeyFormat: lgcEncodingType; 
                            const Password: WideString): IDispatch; dispid 14003;
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
    function Get_CertificateAuthType: lgcKSeFCertificateAuthType; safecall;
    procedure Set_CertificateAuthType(Value: lgcKSeFCertificateAuthType); safecall;
    function Get_Token: WideString; safecall;
    procedure Set_Token(const Value: WideString); safecall;
    function Get_Encryption: WordBool; safecall;
    procedure Set_Encryption(Value: WordBool); safecall;
    function Get_SessionToken: WideString; safecall;
    procedure Set_SessionToken(const Value: WideString); safecall;
    function Get_SessionActive: WordBool; safecall;
    function Get_RSAKeyProd: IDispatch; safecall;
    procedure Set_RSAKeyProd(const Value: IDispatch); safecall;
    function Get_RSAKeyDemo: IDispatch; safecall;
    procedure Set_RSAKeyDemo(const Value: IDispatch); safecall;
    function Get_RSAKeyTest: IDispatch; safecall;
    procedure Set_RSAKeyTest(const Value: IDispatch); safecall;
    procedure GenerateAESKey; safecall;
    function CreateKSeFObject(const ClsName: WideString): IDispatch; safecall;
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
    property CertificateAuthType: lgcKSeFCertificateAuthType read Get_CertificateAuthType write Set_CertificateAuthType;
    property Token: WideString read Get_Token write Set_Token;
    property Encryption: WordBool read Get_Encryption write Set_Encryption;
    property SessionToken: WideString read Get_SessionToken write Set_SessionToken;
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
    property CertificateAuthType: lgcKSeFCertificateAuthType dispid 29016;
    property Token: WideString dispid 29017;
    property Encryption: WordBool dispid 29018;
    property SessionToken: WideString dispid 29019;
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
    property CertificateAuthType: lgcKSeFCertificateAuthType dispid 29016;
    property Token: WideString dispid 29017;
    property Encryption: WordBool dispid 29018;
    property SessionToken: WideString dispid 29019;
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
// Interface: IlgcXMLReader
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {58A611B0-0289-43F6-8452-E4513A68C6A0}
// *********************************************************************//
  IlgcXMLReader = interface(IlgcBaseObject)
    ['{58A611B0-0289-43F6-8452-E4513A68C6A0}']
    function SimpleReadValue(const XPath: WideString): WideString; safecall;
    function ReadValue(const XPatch: WideString; out Value: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcXMLReaderDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {58A611B0-0289-43F6-8452-E4513A68C6A0}
// *********************************************************************//
  IlgcXMLReaderDisp = dispinterface
    ['{58A611B0-0289-43F6-8452-E4513A68C6A0}']
    function SimpleReadValue(const XPath: WideString): WideString; dispid 30001;
    function ReadValue(const XPatch: WideString; out Value: WideString): WordBool; dispid 30002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcXMLValidationError
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {87BD38C1-4A49-44A1-91A0-90A41F3008FA}
// *********************************************************************//
  IlgcXMLValidationError = interface(IlgcBaseObject)
    ['{87BD38C1-4A49-44A1-91A0-90A41F3008FA}']
    function Get_ErrorCode: Integer; safecall;
    function Get_Message: WideString; safecall;
    function Get_Line: Integer; safecall;
    function Get_Path: WideString; safecall;
    function Get_SimplePath: WideString; safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property Message: WideString read Get_Message;
    property Line: Integer read Get_Line;
    property Path: WideString read Get_Path;
    property SimplePath: WideString read Get_SimplePath;
  end;

// *********************************************************************//
// DispIntf:  IlgcXMLValidationErrorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {87BD38C1-4A49-44A1-91A0-90A41F3008FA}
// *********************************************************************//
  IlgcXMLValidationErrorDisp = dispinterface
    ['{87BD38C1-4A49-44A1-91A0-90A41F3008FA}']
    property ErrorCode: Integer readonly dispid 31001;
    property Message: WideString readonly dispid 31002;
    property Line: Integer readonly dispid 31003;
    property Path: WideString readonly dispid 31004;
    property SimplePath: WideString readonly dispid 31005;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcXMLValidator
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DBF692FB-D430-4214-ABCA-69903927B349}
// *********************************************************************//
  IlgcXMLValidator = interface(IlgcBaseObject)
    ['{DBF692FB-D430-4214-ABCA-69903927B349}']
    procedure AddSchema(const NameSpace: WideString; Source: OleVariant); safecall;
    function Validate(Source: OleVariant): IDispatch; safecall;
    function Validate2(Source: OleVariant; out Errors: IDispatch): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcXMLValidatorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DBF692FB-D430-4214-ABCA-69903927B349}
// *********************************************************************//
  IlgcXMLValidatorDisp = dispinterface
    ['{DBF692FB-D430-4214-ABCA-69903927B349}']
    procedure AddSchema(const NameSpace: WideString; Source: OleVariant); dispid 32001;
    function Validate(Source: OleVariant): IDispatch; dispid 32002;
    function Validate2(Source: OleVariant; out Errors: IDispatch): WordBool; dispid 32003;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcXMLXSLTransformation
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0A7F7305-FB5C-40FE-A1E9-8408D6C45B1C}
// *********************************************************************//
  IlgcXMLXSLTransformation = interface(IlgcBaseObject)
    ['{0A7F7305-FB5C-40FE-A1E9-8408D6C45B1C}']
    procedure AddStyle(const NameSpace: WideString; Source: OleVariant); safecall;
    procedure Transform(Source: OleVariant; OutStream: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcXMLXSLTransformationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0A7F7305-FB5C-40FE-A1E9-8408D6C45B1C}
// *********************************************************************//
  IlgcXMLXSLTransformationDisp = dispinterface
    ['{0A7F7305-FB5C-40FE-A1E9-8408D6C45B1C}']
    procedure AddStyle(const NameSpace: WideString; Source: OleVariant); dispid 33001;
    procedure Transform(Source: OleVariant; OutStream: OleVariant); dispid 33002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcViesCheckVatResponse
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {92194BC6-A566-4783-BB67-13FD91450C1A}
// *********************************************************************//
  IlgcViesCheckVatResponse = interface(IlgcBaseObject)
    ['{92194BC6-A566-4783-BB67-13FD91450C1A}']
    function Get_CountryCode: WideString; safecall;
    function Get_VatNumber: WideString; safecall;
    function Get_RequestDate: OleVariant; safecall;
    function Get_Valid: WordBool; safecall;
    function Get_RequestIdentifier: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_Address: WideString; safecall;
    function Get_TraderName: WideString; safecall;
    function Get_TraderStreet: WideString; safecall;
    function Get_TraderPostalCode: WideString; safecall;
    function Get_TraderCity: WideString; safecall;
    function Get_TraderCompanyType: WideString; safecall;
    function Get_TraderNameMatch: lgcViesMatchType; safecall;
    function Get_TraderStreetMatch: lgcViesMatchType; safecall;
    function Get_TraderPostalCodeMatch: lgcViesMatchType; safecall;
    function Get_TraderCityMatch: lgcViesMatchType; safecall;
    function Get_TraderCompanyTypeMatch: lgcViesMatchType; safecall;
    function Get_RawResponse: WideString; safecall;
    property CountryCode: WideString read Get_CountryCode;
    property VatNumber: WideString read Get_VatNumber;
    property RequestDate: OleVariant read Get_RequestDate;
    property Valid: WordBool read Get_Valid;
    property RequestIdentifier: WideString read Get_RequestIdentifier;
    property Name: WideString read Get_Name;
    property Address: WideString read Get_Address;
    property TraderName: WideString read Get_TraderName;
    property TraderStreet: WideString read Get_TraderStreet;
    property TraderPostalCode: WideString read Get_TraderPostalCode;
    property TraderCity: WideString read Get_TraderCity;
    property TraderCompanyType: WideString read Get_TraderCompanyType;
    property TraderNameMatch: lgcViesMatchType read Get_TraderNameMatch;
    property TraderStreetMatch: lgcViesMatchType read Get_TraderStreetMatch;
    property TraderPostalCodeMatch: lgcViesMatchType read Get_TraderPostalCodeMatch;
    property TraderCityMatch: lgcViesMatchType read Get_TraderCityMatch;
    property TraderCompanyTypeMatch: lgcViesMatchType read Get_TraderCompanyTypeMatch;
    property RawResponse: WideString read Get_RawResponse;
  end;

// *********************************************************************//
// DispIntf:  IlgcViesCheckVatResponseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {92194BC6-A566-4783-BB67-13FD91450C1A}
// *********************************************************************//
  IlgcViesCheckVatResponseDisp = dispinterface
    ['{92194BC6-A566-4783-BB67-13FD91450C1A}']
    property CountryCode: WideString readonly dispid 34001;
    property VatNumber: WideString readonly dispid 34002;
    property RequestDate: OleVariant readonly dispid 34003;
    property Valid: WordBool readonly dispid 34004;
    property RequestIdentifier: WideString readonly dispid 34005;
    property Name: WideString readonly dispid 34006;
    property Address: WideString readonly dispid 34007;
    property TraderName: WideString readonly dispid 34008;
    property TraderStreet: WideString readonly dispid 34009;
    property TraderPostalCode: WideString readonly dispid 34010;
    property TraderCity: WideString readonly dispid 34011;
    property TraderCompanyType: WideString readonly dispid 34012;
    property TraderNameMatch: lgcViesMatchType readonly dispid 34013;
    property TraderStreetMatch: lgcViesMatchType readonly dispid 34014;
    property TraderPostalCodeMatch: lgcViesMatchType readonly dispid 34015;
    property TraderCityMatch: lgcViesMatchType readonly dispid 34016;
    property TraderCompanyTypeMatch: lgcViesMatchType readonly dispid 34017;
    property RawResponse: WideString readonly dispid 34018;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcViesCountryStatus
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {92283D36-304C-49D5-9A4E-6E163403776E}
// *********************************************************************//
  IlgcViesCountryStatus = interface(IlgcBaseObject)
    ['{92283D36-304C-49D5-9A4E-6E163403776E}']
    function Get_CountryCode: WideString; safecall;
    function Get_Availability: lgcViesAvailabilityStatus; safecall;
    property CountryCode: WideString read Get_CountryCode;
    property Availability: lgcViesAvailabilityStatus read Get_Availability;
  end;

// *********************************************************************//
// DispIntf:  IlgcViesCountryStatusDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {92283D36-304C-49D5-9A4E-6E163403776E}
// *********************************************************************//
  IlgcViesCountryStatusDisp = dispinterface
    ['{92283D36-304C-49D5-9A4E-6E163403776E}']
    property CountryCode: WideString readonly dispid 35001;
    property Availability: lgcViesAvailabilityStatus readonly dispid 35002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcViesStatusInformationResponse
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3BD250F9-8F41-435F-BE76-734A0B4FDFFC}
// *********************************************************************//
  IlgcViesStatusInformationResponse = interface(IlgcBaseObject)
    ['{3BD250F9-8F41-435F-BE76-734A0B4FDFFC}']
    function Get_VowAvaiable: WordBool; safecall;
    function Get_Countries: IDispatch; safecall;
    property VowAvaiable: WordBool read Get_VowAvaiable;
    property Countries: IDispatch read Get_Countries;
  end;

// *********************************************************************//
// DispIntf:  IlgcViesStatusInformationResponseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3BD250F9-8F41-435F-BE76-734A0B4FDFFC}
// *********************************************************************//
  IlgcViesStatusInformationResponseDisp = dispinterface
    ['{3BD250F9-8F41-435F-BE76-734A0B4FDFFC}']
    property VowAvaiable: WordBool readonly dispid 36001;
    property Countries: IDispatch readonly dispid 36002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcViesService
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0779A838-D9CC-4D00-B40C-E5CAD9599619}
// *********************************************************************//
  IlgcViesService = interface(IlgcBaseObject)
    ['{0779A838-D9CC-4D00-B40C-E5CAD9599619}']
    function CheckVatNumber(const ACountryCode: WideString; const AVatNumber: WideString; 
                            const ARequesterMemberStateCode: WideString; 
                            const ARequesterNumber: WideString; const ATraderName: WideString; 
                            const ATraderStreet: WideString; const ATraderPostalCode: WideString; 
                            const ATraderCity: WideString; const ATraderCompanyType: WideString; 
                            const AHTTPClient: IDispatch): IDispatch; safecall;
    function CheckVatTestService(const ACountryCode: WideString; const AVatNumber: WideString; 
                                 const ARequesterMemberStateCode: WideString; 
                                 const ARequesterNumber: WideString; const ATraderName: WideString; 
                                 const ATraderStreet: WideString; 
                                 const ATraderPostalCode: WideString; 
                                 const ATraderCity: WideString; 
                                 const ATraderCompanyType: WideString; const AHTTPClient: IDispatch): IDispatch; safecall;
    function CheckStatus(const AHTTPClient: IDispatch): IDispatch; safecall;
    function Get_HTTPClient: IDispatch; safecall;
    procedure Set_HTTPClient(const Value: IDispatch); safecall;
    property HTTPClient: IDispatch read Get_HTTPClient write Set_HTTPClient;
  end;

// *********************************************************************//
// DispIntf:  IlgcViesServiceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0779A838-D9CC-4D00-B40C-E5CAD9599619}
// *********************************************************************//
  IlgcViesServiceDisp = dispinterface
    ['{0779A838-D9CC-4D00-B40C-E5CAD9599619}']
    function CheckVatNumber(const ACountryCode: WideString; const AVatNumber: WideString; 
                            const ARequesterMemberStateCode: WideString; 
                            const ARequesterNumber: WideString; const ATraderName: WideString; 
                            const ATraderStreet: WideString; const ATraderPostalCode: WideString; 
                            const ATraderCity: WideString; const ATraderCompanyType: WideString; 
                            const AHTTPClient: IDispatch): IDispatch; dispid 37001;
    function CheckVatTestService(const ACountryCode: WideString; const AVatNumber: WideString; 
                                 const ARequesterMemberStateCode: WideString; 
                                 const ARequesterNumber: WideString; const ATraderName: WideString; 
                                 const ATraderStreet: WideString; 
                                 const ATraderPostalCode: WideString; 
                                 const ATraderCity: WideString; 
                                 const ATraderCompanyType: WideString; const AHTTPClient: IDispatch): IDispatch; dispid 37002;
    function CheckStatus(const AHTTPClient: IDispatch): IDispatch; dispid 37003;
    property HTTPClient: IDispatch dispid 37004;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcKSeF2Request
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {92A8D7F5-32ED-4B1E-8714-27F6751E5D62}
// *********************************************************************//
  IlgcKSeF2Request = interface(IlgcObject2)
    ['{92A8D7F5-32ED-4B1E-8714-27F6751E5D62}']
    function GetAsJSON: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcKSeF2RequestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {92A8D7F5-32ED-4B1E-8714-27F6751E5D62}
// *********************************************************************//
  IlgcKSeF2RequestDisp = dispinterface
    ['{92A8D7F5-32ED-4B1E-8714-27F6751E5D62}']
    function GetAsJSON: WideString; dispid 40001;
    property Owner: IDispatch readonly dispid 39001;
    procedure InsertObject(const Obj: IDispatch); dispid 39002;
    procedure RemoveObject(const Obj: IDispatch); dispid 39003;
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
// Interface: IlgcKSeF2Response
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {56B4DD5D-21E4-43B6-B202-AE0234076006}
// *********************************************************************//
  IlgcKSeF2Response = interface(IlgcObject2)
    ['{56B4DD5D-21E4-43B6-B202-AE0234076006}']
    function GetRawResponse: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcKSeF2ResponseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {56B4DD5D-21E4-43B6-B202-AE0234076006}
// *********************************************************************//
  IlgcKSeF2ResponseDisp = dispinterface
    ['{56B4DD5D-21E4-43B6-B202-AE0234076006}']
    function GetRawResponse: WideString; dispid 41001;
    property Owner: IDispatch readonly dispid 39001;
    procedure InsertObject(const Obj: IDispatch); dispid 39002;
    procedure RemoveObject(const Obj: IDispatch); dispid 39003;
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
// Interface: IlgcKSeF2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A640B36B-E2C8-4253-BD95-AA2FD75E92EB}
// *********************************************************************//
  IlgcKSeF2 = interface(IlgcBaseObject)
    ['{A640B36B-E2C8-4253-BD95-AA2FD75E92EB}']
    function Get_RSAPublicKeyClass: WideString; safecall;
    procedure Set_RSAPublicKeyClass(const Value: WideString); safecall;
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
    function Get_Identifier: WideString; safecall;
    procedure Set_Identifier(const Value: WideString); safecall;
    function Get_IdentifierType: lgcKSeFIdentifierType; safecall;
    procedure Set_IdentifierType(Value: lgcKSeFIdentifierType); safecall;
    function Get_AuthCertificate: IDispatch; safecall;
    procedure Set_AuthCertificate(const Value: IDispatch); safecall;
    function Get_AuthCertificateSubject: lgcKSeFCertificateAuthType; safecall;
    procedure Set_AuthCertificateSubject(Value: lgcKSeFCertificateAuthType); safecall;
    function Get_KsefToken: WideString; safecall;
    procedure Set_KsefToken(const Value: WideString); safecall;
    function Get_FormCode: Integer; safecall;
    procedure Set_FormCode(Value: Integer); safecall;
    function Get_FormCodeSystemCode: WideString; safecall;
    procedure Set_FormCodeSystemCode(const Value: WideString); safecall;
    function Get_FormCodeSchemaVersion: WideString; safecall;
    procedure Set_FormCodeSchemaVersion(const Value: WideString); safecall;
    function Get_FormCodeValue: WideString; safecall;
    procedure Set_FormCodeValue(const Value: WideString); safecall;
    function Get_SessionToken: WideString; safecall;
    procedure Set_SessionToken(const Value: WideString); safecall;
    function Get_RSATokenEncKey(AGateType: lgcKSeFGateType): IDispatch; safecall;
    procedure Set_RSATokenEncKey(AGateType: lgcKSeFGateType; const Value: IDispatch); safecall;
    function Get_RSATokenEncKeyProd: IDispatch; safecall;
    procedure Set_RSATokenEncKeyProd(const Value: IDispatch); safecall;
    function Get_RSATokenEncKeyDemo: IDispatch; safecall;
    procedure Set_RSATokenEncKeyDemo(const Value: IDispatch); safecall;
    function Get_RSATokenEncKeyTest: IDispatch; safecall;
    procedure Set_RSATokenEncKeyTest(const Value: IDispatch); safecall;
    function Get_RSASymmetricEncKey(AGateType: lgcKSeFGateType): IDispatch; safecall;
    procedure Set_RSASymmetricEncKey(AGateType: lgcKSeFGateType; const Value: IDispatch); safecall;
    function Get_RSASymmetricEncKeyProd: IDispatch; safecall;
    procedure Set_RSASymmetricEncKeyProd(const Value: IDispatch); safecall;
    function Get_RSASymmetricEncKeyDemo: IDispatch; safecall;
    procedure Set_RSASymmetricEncKeyDemo(const Value: IDispatch); safecall;
    function Get_RSASymmetricEncKeyTest: IDispatch; safecall;
    procedure Set_RSASymmetricEncKeyTest(const Value: IDispatch); safecall;
    function Get_AuthenticationToken: WideString; safecall;
    procedure Set_AuthenticationToken(const Value: WideString); safecall;
    function Get_AuthenticationTokenValidUntil: TDateTime; safecall;
    procedure Set_AuthenticationTokenValidUntil(Value: TDateTime); safecall;
    function Get_AuthenticationRefNo: WideString; safecall;
    procedure Set_AuthenticationRefNo(const Value: WideString); safecall;
    function Get_AccessToken: WideString; safecall;
    procedure Set_AccessToken(const Value: WideString); safecall;
    function Get_AccessTokenValidUntil: TDateTime; safecall;
    procedure Set_AccessTokenValidUntil(Value: TDateTime); safecall;
    function Get_RefreshToken: WideString; safecall;
    procedure Set_RefreshToken(const Value: WideString); safecall;
    function Get_RefreshTokenValidUntil: TDateTime; safecall;
    procedure Set_RefreshTokenValidUntil(Value: TDateTime); safecall;
    function Get_InteractiveEncryptionKey: OleVariant; safecall;
    procedure Set_InteractiveEncryptionKey(Value: OleVariant); safecall;
    function Get_InteractiveVector: OleVariant; safecall;
    procedure Set_InteractiveVector(Value: OleVariant); safecall;
    function Get_InteractiveReferenceNumber: WideString; safecall;
    procedure Set_InteractiveReferenceNumber(const Value: WideString); safecall;
    function Get_InteractiveValidUntil: TDateTime; safecall;
    procedure Set_InteractiveValidUntil(Value: TDateTime); safecall;
    function Get_BatchReferenceNumber: WideString; safecall;
    procedure Set_BatchReferenceNumber(const Value: WideString); safecall;
    function Get_BatchPartSize: Integer; safecall;
    procedure Set_BatchPartSize(Value: Integer); safecall;
    function Get_InvoiceExportEncryptionKey: OleVariant; safecall;
    procedure Set_InvoiceExportEncryptionKey(Value: OleVariant); safecall;
    function Get_InvoiceExportVector: OleVariant; safecall;
    procedure Set_InvoiceExportVector(Value: OleVariant); safecall;
    function Get_InvoiceExportReferenceNumber: WideString; safecall;
    procedure Set_InvoiceExportReferenceNumber(const Value: WideString); safecall;
    function Get_AutoRefreshToken: WordBool; safecall;
    procedure Set_AutoRefreshToken(Value: WordBool); safecall;
    function CreateKSeFObject(const ClsName: WideString): IDispatch; safecall;
    function AuthChallenge: IDispatch; safecall;
    function AuthXadesSignatureGenerate: WideString; safecall;
    function AuthXadesSignatureGenerate2(SubjectIdType: lgcKSeFCertificateAuthType; 
                                         const Identifier: WideString; 
                                         IdentifierType: lgcKSeFIdentifierType): WideString; safecall;
    function AuthXadesSignature: IDispatch; safecall;
    function AuthXadesSignature2(const Certificate: IDispatch; 
                                 SubjectIdType: lgcKSeFCertificateAuthType; 
                                 const Identifier: WideString; IdentifierType: lgcKSeFIdentifierType): IDispatch; safecall;
    function AuthXadesSignature3(const SignedAuthData: WideString): IDispatch; safecall;
    function AuthKsefToken: IDispatch; safecall;
    function AuthKsefToken2(const Token: WideString; const Identifier: WideString; 
                            IdentifierType: lgcKSeFIdentifierType): IDispatch; safecall;
    function AuthStatus(const ReferenceNumber: WideString; const AuthenticationToken: WideString): IDispatch; safecall;
    function AuthTokenRedem(const AuthenticationToken: WideString): IDispatch; safecall;
    function AuthTokenRefresh(const RefreshToken: WideString): IDispatch; safecall;
    function AuthSessions(const ContinuationToken: WideString; PageSize: Integer; 
                          const AccessToken: WideString): IDispatch; safecall;
    procedure AuthSessionTerminateCurrent(const Token: WideString); safecall;
    procedure AuthSessionTerminate(const ReferenceNumber: WideString; const AccessToken: WideString); safecall;
    function SecurityPublicKeyCertificates(GateType: lgcKSeFGateType): IDispatch; safecall;
    procedure SecurityLoadKeys; safecall;
    function InteractiveOpen: IDispatch; safecall;
    function InteractiveOpenSimple: WideString; safecall;
    function InteractiveOpen2(FormCode: Integer; EncryptionSymetricKey: OleVariant; 
                              InitializationVector: OleVariant; 
                              const FormCodeSystemCode: WideString; 
                              const FormCodeSchemaVersion: WideString; 
                              const FormCodeValue: WideString; const AccessToken: WideString): IDispatch; safecall;
    function InteractiveOpen3(const Request: IDispatch; const AccessToken: WideString): IDispatch; safecall;
    function InteractiveCreateSendRequest(InvoiceStream: OleVariant; OfflineMode: WordBool; 
                                          const HashOfCorrectedInvoice: WideString; 
                                          const SessionReferenceNumber: WideString; 
                                          EncryptionSymetricKey: OleVariant; 
                                          InitializationVector: OleVariant): IDispatch; safecall;
    function InteractiveSend(InvoiceStream: OleVariant; OfflineMode: WordBool; 
                             const HashOfCorrectedInvoice: WideString): WideString; safecall;
    function InteractiveSend2(const Request: IDispatch; OfflineMode: WordBool; 
                              const SessionReferenceNumber: WideString; 
                              const AccessToken: WideString): IDispatch; safecall;
    function InteractiveSend3(InvoiceStream: OleVariant; OfflineMode: WordBool; 
                              const HashOfCorrectedInvoice: WideString; 
                              const SessionReferenceNumber: WideString; 
                              EncryptionSymetricKey: OleVariant; InitializationVector: OleVariant; 
                              const AccessToken: WideString): WideString; safecall;
    procedure InteractiveClose(const SessionReferenceNumber: WideString; 
                               const AccessToken: WideString); safecall;
    function BatchPrepare(ZIPFileStream: OleVariant; OutputStream: OleVariant; PartSize: Integer): IDispatch; safecall;
    function BatchPrepare2(ZIPFileStream: OleVariant; OutputStream: OleVariant; FormCode: Integer; 
                           EncryptionSymetricKey: OleVariant; InitializationVector: OleVariant; 
                           const FormCodeSystemCode: WideString; 
                           const FormCodeSchemaVersion: WideString; 
                           const FormCodeValue: WideString; PartSize: Integer): IDispatch; safecall;
    function BatchOpen(const Request: IDispatch; const AccessToken: WideString): IDispatch; safecall;
    procedure BatchSendPart(const PartUploadRequest: IDispatch; DataStream: OleVariant); safecall;
    procedure BatchClose(const SessionReferenceNumber: WideString; const AccessToken: WideString); safecall;
    function StatusSessions(SessionType: Integer; const ContinuationToken: WideString; 
                            PageSize: Integer; const ReferenceNumber: WideString; 
                            DateCreatedFrom: OleVariant; DateCreatedTo: OleVariant; 
                            DateClosedFrom: OleVariant; DateClosedTo: OleVariant; 
                            DateModifiedFrom: OleVariant; DateModifiedTo: OleVariant; 
                            Statuses: OleVariant; const AccessToken: WideString): IDispatch; safecall;
    function StatusSession(const SessionReferenceNumber: WideString; const AccessToken: WideString): IDispatch; safecall;
    function StatusInvoices(const SessionReferenceNumber: WideString; 
                            const ContinuationToken: WideString; PageSize: Integer; 
                            const AccessToken: WideString): IDispatch; safecall;
    function StatusSessionInvoice(const SessionReferenceNumber: WideString; 
                                  const InvoiceReferenceNumber: WideString; 
                                  const AccessToken: WideString): IDispatch; safecall;
    function StatusInvoicesFailed(const SessionReferenceNumber: WideString; 
                                  const ContinuationToken: WideString; PageSize: Integer; 
                                  const AccessToken: WideString): IDispatch; safecall;
    procedure StatusUpoKsef(const SessionReferenceNumber: WideString; const KsefNumber: WideString; 
                            OutStream: OleVariant; const AccessToken: WideString); safecall;
    function StatusUpoKsefSimpe(const SessionReferenceNumber: WideString; 
                                const KsefNumber: WideString; const AccessToken: WideString): WideString; safecall;
    procedure StatusUpoSessionInvoice(const SessionReferenceNumber: WideString; 
                                      const InvoiceReferenceNumber: WideString; 
                                      OutStream: OleVariant; const AccessToken: WideString); safecall;
    function StatusUpoSessionInvoiceSimpe(const SessionReferenceNumber: WideString; 
                                          const InvoiceReferenceNumber: WideString; 
                                          const AccessToken: WideString): WideString; safecall;
    procedure StatusUpoSession(const SessionReferenceNumber: WideString; 
                               const UpoReferenceNumber: WideString; OutStream: OleVariant; 
                               const AccessToken: WideString); safecall;
    function StatusUpoSessionSimpe(const SessionReferenceNumber: WideString; 
                                   const UpoReferenceNumber: WideString; 
                                   const AccessToken: WideString): WideString; safecall;
    procedure InvoicesKsef(const KsefNumber: WideString; OutStream: OleVariant; 
                           const AccessToken: WideString); safecall;
    function InvoicesKsefSimple(const KsefNumber: WideString; OutStream: OleVariant; 
                                const AccessToken: WideString): WideString; safecall;
    function InvoicesQueryMetadata(const Request: IDispatch; PageOffset: Integer; 
                                   PageSize: Integer; SortOrder: Integer; 
                                   const AccessToken: WideString): IDispatch; safecall;
    function InvoicesExport(const Request: IDispatch; EncryptionSymetricKey: OleVariant; 
                            InitializationVector: OleVariant; const AccessToken: WideString): IDispatch; safecall;
    function InvoicesExport2(const Request: IDispatch; const AccessToken: WideString): IDispatch; safecall;
    function InvoicesExportSimple(const Request: IDispatch; EncryptionSymetricKey: OleVariant; 
                                  InitializationVector: OleVariant; const AccessToken: WideString): WideString; safecall;
    function InvoicesExportSimple2(const Request: IDispatch; const AccessToken: WideString): WideString; safecall;
    function InvoicesExportStatus(const OperationReferenceNumber: WideString; 
                                  const AccessToken: WideString): IDispatch; safecall;
    procedure InvoicesExportDownload(const StatusResponse: IDispatch; OutputStream: OleVariant; 
                                     EncryptionSymetricKey: OleVariant; 
                                     InitializationVector: OleVariant); safecall;
    function TokensGenerate(Permissions: OleVariant; const Description: WideString; 
                            const AccessToken: WideString): IDispatch; safecall;
    function TokensGenerate2(const Request: IDispatch; const AccessToken: WideString): IDispatch; safecall;
    function TokensList(Status: OleVariant; const Description: WideString; 
                        const AuthorIdentifier: WideString; AuthorIdentifierType: OleVariant; 
                        PageSize: Integer; const ContinuationToken: WideString; 
                        const AccessToken: WideString): IDispatch; safecall;
    function TokensStatus(const ReferenceNumber: WideString; const AccessToken: WideString): IDispatch; safecall;
    procedure TokensRevoke(const ReferenceNumber: WideString; const AccessToken: WideString); safecall;
    procedure TestdataSubject(const Request: IDispatch); safecall;
    procedure TestdataSubjectRemove(const SubjectNip: WideString); safecall;
    procedure TestdataPerson(const Request: IDispatch); safecall;
    procedure TestdataPersonRemove(const Nip: WideString); safecall;
    property RSAPublicKeyClass: WideString read Get_RSAPublicKeyClass write Set_RSAPublicKeyClass;
    property Base64EncoderClass: WideString read Get_Base64EncoderClass write Set_Base64EncoderClass;
    property AES256EncryptClass: WideString read Get_AES256EncryptClass write Set_AES256EncryptClass;
    property SHA256HashClass: WideString read Get_SHA256HashClass write Set_SHA256HashClass;
    property RandomGeneratorClass: WideString read Get_RandomGeneratorClass write Set_RandomGeneratorClass;
    property XAdES: IDispatch read Get_XAdES write Set_XAdES;
    property HTTPClient: IDispatch read Get_HTTPClient write Set_HTTPClient;
    property GateType: lgcKSeFGateType read Get_GateType write Set_GateType;
    property Identifier: WideString read Get_Identifier write Set_Identifier;
    property IdentifierType: lgcKSeFIdentifierType read Get_IdentifierType write Set_IdentifierType;
    property AuthCertificate: IDispatch read Get_AuthCertificate write Set_AuthCertificate;
    property AuthCertificateSubject: lgcKSeFCertificateAuthType read Get_AuthCertificateSubject write Set_AuthCertificateSubject;
    property KsefToken: WideString read Get_KsefToken write Set_KsefToken;
    property FormCode: Integer read Get_FormCode write Set_FormCode;
    property FormCodeSystemCode: WideString read Get_FormCodeSystemCode write Set_FormCodeSystemCode;
    property FormCodeSchemaVersion: WideString read Get_FormCodeSchemaVersion write Set_FormCodeSchemaVersion;
    property FormCodeValue: WideString read Get_FormCodeValue write Set_FormCodeValue;
    property SessionToken: WideString read Get_SessionToken write Set_SessionToken;
    property RSATokenEncKey[AGateType: lgcKSeFGateType]: IDispatch read Get_RSATokenEncKey write Set_RSATokenEncKey;
    property RSATokenEncKeyProd: IDispatch read Get_RSATokenEncKeyProd write Set_RSATokenEncKeyProd;
    property RSATokenEncKeyDemo: IDispatch read Get_RSATokenEncKeyDemo write Set_RSATokenEncKeyDemo;
    property RSATokenEncKeyTest: IDispatch read Get_RSATokenEncKeyTest write Set_RSATokenEncKeyTest;
    property RSASymmetricEncKey[AGateType: lgcKSeFGateType]: IDispatch read Get_RSASymmetricEncKey write Set_RSASymmetricEncKey;
    property RSASymmetricEncKeyProd: IDispatch read Get_RSASymmetricEncKeyProd write Set_RSASymmetricEncKeyProd;
    property RSASymmetricEncKeyDemo: IDispatch read Get_RSASymmetricEncKeyDemo write Set_RSASymmetricEncKeyDemo;
    property RSASymmetricEncKeyTest: IDispatch read Get_RSASymmetricEncKeyTest write Set_RSASymmetricEncKeyTest;
    property AuthenticationToken: WideString read Get_AuthenticationToken write Set_AuthenticationToken;
    property AuthenticationTokenValidUntil: TDateTime read Get_AuthenticationTokenValidUntil write Set_AuthenticationTokenValidUntil;
    property AuthenticationRefNo: WideString read Get_AuthenticationRefNo write Set_AuthenticationRefNo;
    property AccessToken: WideString read Get_AccessToken write Set_AccessToken;
    property AccessTokenValidUntil: TDateTime read Get_AccessTokenValidUntil write Set_AccessTokenValidUntil;
    property RefreshToken: WideString read Get_RefreshToken write Set_RefreshToken;
    property RefreshTokenValidUntil: TDateTime read Get_RefreshTokenValidUntil write Set_RefreshTokenValidUntil;
    property InteractiveEncryptionKey: OleVariant read Get_InteractiveEncryptionKey write Set_InteractiveEncryptionKey;
    property InteractiveVector: OleVariant read Get_InteractiveVector write Set_InteractiveVector;
    property InteractiveReferenceNumber: WideString read Get_InteractiveReferenceNumber write Set_InteractiveReferenceNumber;
    property InteractiveValidUntil: TDateTime read Get_InteractiveValidUntil write Set_InteractiveValidUntil;
    property BatchReferenceNumber: WideString read Get_BatchReferenceNumber write Set_BatchReferenceNumber;
    property BatchPartSize: Integer read Get_BatchPartSize write Set_BatchPartSize;
    property InvoiceExportEncryptionKey: OleVariant read Get_InvoiceExportEncryptionKey write Set_InvoiceExportEncryptionKey;
    property InvoiceExportVector: OleVariant read Get_InvoiceExportVector write Set_InvoiceExportVector;
    property InvoiceExportReferenceNumber: WideString read Get_InvoiceExportReferenceNumber write Set_InvoiceExportReferenceNumber;
    property AutoRefreshToken: WordBool read Get_AutoRefreshToken write Set_AutoRefreshToken;
  end;

// *********************************************************************//
// DispIntf:  IlgcKSeF2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A640B36B-E2C8-4253-BD95-AA2FD75E92EB}
// *********************************************************************//
  IlgcKSeF2Disp = dispinterface
    ['{A640B36B-E2C8-4253-BD95-AA2FD75E92EB}']
    property RSAPublicKeyClass: WideString dispid 38001;
    property Base64EncoderClass: WideString dispid 38002;
    property AES256EncryptClass: WideString dispid 38003;
    property SHA256HashClass: WideString dispid 38004;
    property RandomGeneratorClass: WideString dispid 38005;
    property XAdES: IDispatch dispid 38006;
    property HTTPClient: IDispatch dispid 38007;
    property GateType: lgcKSeFGateType dispid 38008;
    property Identifier: WideString dispid 38009;
    property IdentifierType: lgcKSeFIdentifierType dispid 38010;
    property AuthCertificate: IDispatch dispid 38011;
    property AuthCertificateSubject: lgcKSeFCertificateAuthType dispid 38012;
    property KsefToken: WideString dispid 38013;
    property FormCode: Integer dispid 38014;
    property FormCodeSystemCode: WideString dispid 38015;
    property FormCodeSchemaVersion: WideString dispid 38016;
    property FormCodeValue: WideString dispid 38017;
    property SessionToken: WideString dispid 38018;
    property RSATokenEncKey[AGateType: lgcKSeFGateType]: IDispatch dispid 38019;
    property RSATokenEncKeyProd: IDispatch dispid 38020;
    property RSATokenEncKeyDemo: IDispatch dispid 38021;
    property RSATokenEncKeyTest: IDispatch dispid 38022;
    property RSASymmetricEncKey[AGateType: lgcKSeFGateType]: IDispatch dispid 38023;
    property RSASymmetricEncKeyProd: IDispatch dispid 38024;
    property RSASymmetricEncKeyDemo: IDispatch dispid 38025;
    property RSASymmetricEncKeyTest: IDispatch dispid 38026;
    property AuthenticationToken: WideString dispid 38027;
    property AuthenticationTokenValidUntil: TDateTime dispid 38028;
    property AuthenticationRefNo: WideString dispid 38029;
    property AccessToken: WideString dispid 38030;
    property AccessTokenValidUntil: TDateTime dispid 38031;
    property RefreshToken: WideString dispid 38032;
    property RefreshTokenValidUntil: TDateTime dispid 38033;
    property InteractiveEncryptionKey: OleVariant dispid 38034;
    property InteractiveVector: OleVariant dispid 38035;
    property InteractiveReferenceNumber: WideString dispid 38036;
    property InteractiveValidUntil: TDateTime dispid 38037;
    property BatchReferenceNumber: WideString dispid 38038;
    property BatchPartSize: Integer dispid 38039;
    property InvoiceExportEncryptionKey: OleVariant dispid 38040;
    property InvoiceExportVector: OleVariant dispid 38041;
    property InvoiceExportReferenceNumber: WideString dispid 38042;
    property AutoRefreshToken: WordBool dispid 38043;
    function CreateKSeFObject(const ClsName: WideString): IDispatch; dispid 38044;
    function AuthChallenge: IDispatch; dispid 38045;
    function AuthXadesSignatureGenerate: WideString; dispid 38046;
    function AuthXadesSignatureGenerate2(SubjectIdType: lgcKSeFCertificateAuthType; 
                                         const Identifier: WideString; 
                                         IdentifierType: lgcKSeFIdentifierType): WideString; dispid 38047;
    function AuthXadesSignature: IDispatch; dispid 38048;
    function AuthXadesSignature2(const Certificate: IDispatch; 
                                 SubjectIdType: lgcKSeFCertificateAuthType; 
                                 const Identifier: WideString; IdentifierType: lgcKSeFIdentifierType): IDispatch; dispid 38049;
    function AuthXadesSignature3(const SignedAuthData: WideString): IDispatch; dispid 38050;
    function AuthKsefToken: IDispatch; dispid 38051;
    function AuthKsefToken2(const Token: WideString; const Identifier: WideString; 
                            IdentifierType: lgcKSeFIdentifierType): IDispatch; dispid 38052;
    function AuthStatus(const ReferenceNumber: WideString; const AuthenticationToken: WideString): IDispatch; dispid 38053;
    function AuthTokenRedem(const AuthenticationToken: WideString): IDispatch; dispid 38054;
    function AuthTokenRefresh(const RefreshToken: WideString): IDispatch; dispid 38055;
    function AuthSessions(const ContinuationToken: WideString; PageSize: Integer; 
                          const AccessToken: WideString): IDispatch; dispid 38056;
    procedure AuthSessionTerminateCurrent(const Token: WideString); dispid 38057;
    procedure AuthSessionTerminate(const ReferenceNumber: WideString; const AccessToken: WideString); dispid 38058;
    function SecurityPublicKeyCertificates(GateType: lgcKSeFGateType): IDispatch; dispid 38059;
    procedure SecurityLoadKeys; dispid 38060;
    function InteractiveOpen: IDispatch; dispid 38061;
    function InteractiveOpenSimple: WideString; dispid 38062;
    function InteractiveOpen2(FormCode: Integer; EncryptionSymetricKey: OleVariant; 
                              InitializationVector: OleVariant; 
                              const FormCodeSystemCode: WideString; 
                              const FormCodeSchemaVersion: WideString; 
                              const FormCodeValue: WideString; const AccessToken: WideString): IDispatch; dispid 38063;
    function InteractiveOpen3(const Request: IDispatch; const AccessToken: WideString): IDispatch; dispid 38064;
    function InteractiveCreateSendRequest(InvoiceStream: OleVariant; OfflineMode: WordBool; 
                                          const HashOfCorrectedInvoice: WideString; 
                                          const SessionReferenceNumber: WideString; 
                                          EncryptionSymetricKey: OleVariant; 
                                          InitializationVector: OleVariant): IDispatch; dispid 38065;
    function InteractiveSend(InvoiceStream: OleVariant; OfflineMode: WordBool; 
                             const HashOfCorrectedInvoice: WideString): WideString; dispid 38066;
    function InteractiveSend2(const Request: IDispatch; OfflineMode: WordBool; 
                              const SessionReferenceNumber: WideString; 
                              const AccessToken: WideString): IDispatch; dispid 38067;
    function InteractiveSend3(InvoiceStream: OleVariant; OfflineMode: WordBool; 
                              const HashOfCorrectedInvoice: WideString; 
                              const SessionReferenceNumber: WideString; 
                              EncryptionSymetricKey: OleVariant; InitializationVector: OleVariant; 
                              const AccessToken: WideString): WideString; dispid 38068;
    procedure InteractiveClose(const SessionReferenceNumber: WideString; 
                               const AccessToken: WideString); dispid 38069;
    function BatchPrepare(ZIPFileStream: OleVariant; OutputStream: OleVariant; PartSize: Integer): IDispatch; dispid 38070;
    function BatchPrepare2(ZIPFileStream: OleVariant; OutputStream: OleVariant; FormCode: Integer; 
                           EncryptionSymetricKey: OleVariant; InitializationVector: OleVariant; 
                           const FormCodeSystemCode: WideString; 
                           const FormCodeSchemaVersion: WideString; 
                           const FormCodeValue: WideString; PartSize: Integer): IDispatch; dispid 38071;
    function BatchOpen(const Request: IDispatch; const AccessToken: WideString): IDispatch; dispid 38072;
    procedure BatchSendPart(const PartUploadRequest: IDispatch; DataStream: OleVariant); dispid 38073;
    procedure BatchClose(const SessionReferenceNumber: WideString; const AccessToken: WideString); dispid 38074;
    function StatusSessions(SessionType: Integer; const ContinuationToken: WideString; 
                            PageSize: Integer; const ReferenceNumber: WideString; 
                            DateCreatedFrom: OleVariant; DateCreatedTo: OleVariant; 
                            DateClosedFrom: OleVariant; DateClosedTo: OleVariant; 
                            DateModifiedFrom: OleVariant; DateModifiedTo: OleVariant; 
                            Statuses: OleVariant; const AccessToken: WideString): IDispatch; dispid 38075;
    function StatusSession(const SessionReferenceNumber: WideString; const AccessToken: WideString): IDispatch; dispid 38076;
    function StatusInvoices(const SessionReferenceNumber: WideString; 
                            const ContinuationToken: WideString; PageSize: Integer; 
                            const AccessToken: WideString): IDispatch; dispid 38077;
    function StatusSessionInvoice(const SessionReferenceNumber: WideString; 
                                  const InvoiceReferenceNumber: WideString; 
                                  const AccessToken: WideString): IDispatch; dispid 38078;
    function StatusInvoicesFailed(const SessionReferenceNumber: WideString; 
                                  const ContinuationToken: WideString; PageSize: Integer; 
                                  const AccessToken: WideString): IDispatch; dispid 38079;
    procedure StatusUpoKsef(const SessionReferenceNumber: WideString; const KsefNumber: WideString; 
                            OutStream: OleVariant; const AccessToken: WideString); dispid 38080;
    function StatusUpoKsefSimpe(const SessionReferenceNumber: WideString; 
                                const KsefNumber: WideString; const AccessToken: WideString): WideString; dispid 38081;
    procedure StatusUpoSessionInvoice(const SessionReferenceNumber: WideString; 
                                      const InvoiceReferenceNumber: WideString; 
                                      OutStream: OleVariant; const AccessToken: WideString); dispid 38082;
    function StatusUpoSessionInvoiceSimpe(const SessionReferenceNumber: WideString; 
                                          const InvoiceReferenceNumber: WideString; 
                                          const AccessToken: WideString): WideString; dispid 38083;
    procedure StatusUpoSession(const SessionReferenceNumber: WideString; 
                               const UpoReferenceNumber: WideString; OutStream: OleVariant; 
                               const AccessToken: WideString); dispid 38084;
    function StatusUpoSessionSimpe(const SessionReferenceNumber: WideString; 
                                   const UpoReferenceNumber: WideString; 
                                   const AccessToken: WideString): WideString; dispid 38085;
    procedure InvoicesKsef(const KsefNumber: WideString; OutStream: OleVariant; 
                           const AccessToken: WideString); dispid 38086;
    function InvoicesKsefSimple(const KsefNumber: WideString; OutStream: OleVariant; 
                                const AccessToken: WideString): WideString; dispid 38087;
    function InvoicesQueryMetadata(const Request: IDispatch; PageOffset: Integer; 
                                   PageSize: Integer; SortOrder: Integer; 
                                   const AccessToken: WideString): IDispatch; dispid 38088;
    function InvoicesExport(const Request: IDispatch; EncryptionSymetricKey: OleVariant; 
                            InitializationVector: OleVariant; const AccessToken: WideString): IDispatch; dispid 38089;
    function InvoicesExport2(const Request: IDispatch; const AccessToken: WideString): IDispatch; dispid 38090;
    function InvoicesExportSimple(const Request: IDispatch; EncryptionSymetricKey: OleVariant; 
                                  InitializationVector: OleVariant; const AccessToken: WideString): WideString; dispid 38091;
    function InvoicesExportSimple2(const Request: IDispatch; const AccessToken: WideString): WideString; dispid 38092;
    function InvoicesExportStatus(const OperationReferenceNumber: WideString; 
                                  const AccessToken: WideString): IDispatch; dispid 38093;
    procedure InvoicesExportDownload(const StatusResponse: IDispatch; OutputStream: OleVariant; 
                                     EncryptionSymetricKey: OleVariant; 
                                     InitializationVector: OleVariant); dispid 38094;
    function TokensGenerate(Permissions: OleVariant; const Description: WideString; 
                            const AccessToken: WideString): IDispatch; dispid 38095;
    function TokensGenerate2(const Request: IDispatch; const AccessToken: WideString): IDispatch; dispid 38096;
    function TokensList(Status: OleVariant; const Description: WideString; 
                        const AuthorIdentifier: WideString; AuthorIdentifierType: OleVariant; 
                        PageSize: Integer; const ContinuationToken: WideString; 
                        const AccessToken: WideString): IDispatch; dispid 38097;
    function TokensStatus(const ReferenceNumber: WideString; const AccessToken: WideString): IDispatch; dispid 38098;
    procedure TokensRevoke(const ReferenceNumber: WideString; const AccessToken: WideString); dispid 38099;
    procedure TestdataSubject(const Request: IDispatch); dispid 38100;
    procedure TestdataSubjectRemove(const SubjectNip: WideString); dispid 38101;
    procedure TestdataPerson(const Request: IDispatch); dispid 38102;
    procedure TestdataPersonRemove(const Nip: WideString); dispid 38103;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcKSeF2VerificationLinkService
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {25702B7C-71EA-4536-83E1-FF79B12C5932}
// *********************************************************************//
  IlgcKSeF2VerificationLinkService = interface(IlgcBaseObject)
    ['{25702B7C-71EA-4536-83E1-FF79B12C5932}']
    function BuildInvoiceVerificationUrl(const Nip: WideString; IssueDate: TDateTime; 
                                         const InvoiceHash: WideString; GateType: lgcKSeFGateType): WideString; safecall;
    function BuildCertificateVerificationUrl(const SellerNip: WideString; 
                                             ContextIdentifierType: lgcKSeFIdentifierType; 
                                             const ContextIdentifierValue: WideString; 
                                             const InvoiceHash: WideString; 
                                             const SigningCertificate: IDispatch; 
                                             GateType: lgcKSeFGateType; 
                                             const Base64EncClass: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcKSeF2VerificationLinkServiceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {25702B7C-71EA-4536-83E1-FF79B12C5932}
// *********************************************************************//
  IlgcKSeF2VerificationLinkServiceDisp = dispinterface
    ['{25702B7C-71EA-4536-83E1-FF79B12C5932}']
    function BuildInvoiceVerificationUrl(const Nip: WideString; IssueDate: TDateTime; 
                                         const InvoiceHash: WideString; GateType: lgcKSeFGateType): WideString; dispid 42001;
    function BuildCertificateVerificationUrl(const SellerNip: WideString; 
                                             ContextIdentifierType: lgcKSeFIdentifierType; 
                                             const ContextIdentifierValue: WideString; 
                                             const InvoiceHash: WideString; 
                                             const SigningCertificate: IDispatch; 
                                             GateType: lgcKSeFGateType; 
                                             const Base64EncClass: WideString): WideString; dispid 42002;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcHash
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D207DD82-D710-4935-B6AB-B562250514D9}
// *********************************************************************//
  IlgcHash = interface(IlgcBaseObject)
    ['{D207DD82-D710-4935-B6AB-B562250514D9}']
    procedure Start; safecall;
    procedure HashData(Data: OleVariant); safecall;
    function Finish(const Base64EncoderClass: WideString): WideString; safecall;
    function HashString(const Data: WideString; const Base64EncoderClass: WideString): WideString; safecall;
    function HashBytes(Data: OleVariant; const Base64EncoderClass: WideString): WideString; safecall;
    function HashStream(const DataStream: IDispatch; const Base64EncoderClass: WideString): WideString; safecall;
    function HashFile(const FileName: WideString; const Base64EncoderClass: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcHashDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D207DD82-D710-4935-B6AB-B562250514D9}
// *********************************************************************//
  IlgcHashDisp = dispinterface
    ['{D207DD82-D710-4935-B6AB-B562250514D9}']
    procedure Start; dispid 42001;
    procedure HashData(Data: OleVariant); dispid 42002;
    function Finish(const Base64EncoderClass: WideString): WideString; dispid 42003;
    function HashString(const Data: WideString; const Base64EncoderClass: WideString): WideString; dispid 42004;
    function HashBytes(Data: OleVariant; const Base64EncoderClass: WideString): WideString; dispid 42005;
    function HashStream(const DataStream: IDispatch; const Base64EncoderClass: WideString): WideString; dispid 42006;
    function HashFile(const FileName: WideString; const Base64EncoderClass: WideString): WideString; dispid 42007;
    function GetObjClassName: WideString; dispid 1001;
    procedure ClearLastError; dispid 1002;
    property LastError: IDispatch readonly dispid 1003;
  end;

// *********************************************************************//
// Interface: IlgcKSeF2Utils
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {76D4D70C-6FA0-44E7-9762-D54C180CD298}
// *********************************************************************//
  IlgcKSeF2Utils = interface(IlgcBaseObject)
    ['{76D4D70C-6FA0-44E7-9762-D54C180CD298}']
    function IsKsefNumberValid(const AKsefNumber: WideString): WordBool; safecall;
    function LoadInvoiceMetadataFromStream(AStream: OleVariant): IDispatch; safecall;
  end;

// *********************************************************************//
// DispIntf:  IlgcKSeF2UtilsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {76D4D70C-6FA0-44E7-9762-D54C180CD298}
// *********************************************************************//
  IlgcKSeF2UtilsDisp = dispinterface
    ['{76D4D70C-6FA0-44E7-9762-D54C180CD298}']
    function IsKsefNumberValid(const AKsefNumber: WideString): WordBool; dispid 43001;
    function LoadInvoiceMetadataFromStream(AStream: OleVariant): IDispatch; dispid 43002;
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
// The Class ColgcObject2 provides a Create and CreateRemote method to          
// create instances of the default interface IlgcObject2 exposed by              
// the CoClass lgcObject2. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcObject2 = class
    class function Create: IlgcObject2;
    class function CreateRemote(const MachineName: string): IlgcObject2;
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

// *********************************************************************//
// The Class ColgcXMLReader provides a Create and CreateRemote method to          
// create instances of the default interface IlgcXMLReader exposed by              
// the CoClass lgcXMLReader. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcXMLReader = class
    class function Create: IlgcXMLReader;
    class function CreateRemote(const MachineName: string): IlgcXMLReader;
  end;

// *********************************************************************//
// The Class ColgcXMLValidationError provides a Create and CreateRemote method to          
// create instances of the default interface IlgcXMLValidationError exposed by              
// the CoClass lgcXMLValidationError. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcXMLValidationError = class
    class function Create: IlgcXMLValidationError;
    class function CreateRemote(const MachineName: string): IlgcXMLValidationError;
  end;

// *********************************************************************//
// The Class ColgcXMLValidator provides a Create and CreateRemote method to          
// create instances of the default interface IlgcXMLValidator exposed by              
// the CoClass lgcXMLValidator. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcXMLValidator = class
    class function Create: IlgcXMLValidator;
    class function CreateRemote(const MachineName: string): IlgcXMLValidator;
  end;

// *********************************************************************//
// The Class ColgcXMLXSLTransformation provides a Create and CreateRemote method to          
// create instances of the default interface IlgcXMLXSLTransformation exposed by              
// the CoClass lgcXMLXSLTransformation. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcXMLXSLTransformation = class
    class function Create: IlgcXMLXSLTransformation;
    class function CreateRemote(const MachineName: string): IlgcXMLXSLTransformation;
  end;

// *********************************************************************//
// The Class ColgcViesCheckVatResponse provides a Create and CreateRemote method to          
// create instances of the default interface IlgcViesCheckVatResponse exposed by              
// the CoClass lgcViesCheckVatResponse. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcViesCheckVatResponse = class
    class function Create: IlgcViesCheckVatResponse;
    class function CreateRemote(const MachineName: string): IlgcViesCheckVatResponse;
  end;

// *********************************************************************//
// The Class ColgcViesCountryStatus provides a Create and CreateRemote method to          
// create instances of the default interface IlgcViesCountryStatus exposed by              
// the CoClass lgcViesCountryStatus. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcViesCountryStatus = class
    class function Create: IlgcViesCountryStatus;
    class function CreateRemote(const MachineName: string): IlgcViesCountryStatus;
  end;

// *********************************************************************//
// The Class ColgcViesStatusInformationResponse provides a Create and CreateRemote method to          
// create instances of the default interface IlgcViesStatusInformationResponse exposed by              
// the CoClass lgcViesStatusInformationResponse. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcViesStatusInformationResponse = class
    class function Create: IlgcViesStatusInformationResponse;
    class function CreateRemote(const MachineName: string): IlgcViesStatusInformationResponse;
  end;

// *********************************************************************//
// The Class ColgcViesService provides a Create and CreateRemote method to          
// create instances of the default interface IlgcViesService exposed by              
// the CoClass lgcViesService. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcViesService = class
    class function Create: IlgcViesService;
    class function CreateRemote(const MachineName: string): IlgcViesService;
  end;

// *********************************************************************//
// The Class ColgcKSeF2Request provides a Create and CreateRemote method to          
// create instances of the default interface IlgcKSeF2Request exposed by              
// the CoClass lgcKSeF2Request. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcKSeF2Request = class
    class function Create: IlgcKSeF2Request;
    class function CreateRemote(const MachineName: string): IlgcKSeF2Request;
  end;

// *********************************************************************//
// The Class ColgcKSeF2Response provides a Create and CreateRemote method to          
// create instances of the default interface IlgcKSeF2Response exposed by              
// the CoClass lgcKSeF2Response. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcKSeF2Response = class
    class function Create: IlgcKSeF2Response;
    class function CreateRemote(const MachineName: string): IlgcKSeF2Response;
  end;

// *********************************************************************//
// The Class ColgcKSeF2 provides a Create and CreateRemote method to          
// create instances of the default interface IlgcKSeF2 exposed by              
// the CoClass lgcKSeF2. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcKSeF2 = class
    class function Create: IlgcKSeF2;
    class function CreateRemote(const MachineName: string): IlgcKSeF2;
  end;

// *********************************************************************//
// The Class ColgcKSeF2VerificationLinkService provides a Create and CreateRemote method to          
// create instances of the default interface IlgcKSeF2VerificationLinkService exposed by              
// the CoClass lgcKSeF2VerificationLinkService. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcKSeF2VerificationLinkService = class
    class function Create: IlgcKSeF2VerificationLinkService;
    class function CreateRemote(const MachineName: string): IlgcKSeF2VerificationLinkService;
  end;

// *********************************************************************//
// The Class ColgcHash provides a Create and CreateRemote method to          
// create instances of the default interface IlgcHash exposed by              
// the CoClass lgcHash. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcHash = class
    class function Create: IlgcHash;
    class function CreateRemote(const MachineName: string): IlgcHash;
  end;

// *********************************************************************//
// The Class ColgcKSeF2Utils provides a Create and CreateRemote method to          
// create instances of the default interface IlgcKSeF2Utils exposed by              
// the CoClass lgcKSeF2Utils. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  ColgcKSeF2Utils = class
    class function Create: IlgcKSeF2Utils;
    class function CreateRemote(const MachineName: string): IlgcKSeF2Utils;
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

class function ColgcObject2.Create: IlgcObject2;
begin
  Result := CreateComObject(CLASS_lgcObject2) as IlgcObject2;
end;

class function ColgcObject2.CreateRemote(const MachineName: string): IlgcObject2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcObject2) as IlgcObject2;
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

class function ColgcXMLReader.Create: IlgcXMLReader;
begin
  Result := CreateComObject(CLASS_lgcXMLReader) as IlgcXMLReader;
end;

class function ColgcXMLReader.CreateRemote(const MachineName: string): IlgcXMLReader;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcXMLReader) as IlgcXMLReader;
end;

class function ColgcXMLValidationError.Create: IlgcXMLValidationError;
begin
  Result := CreateComObject(CLASS_lgcXMLValidationError) as IlgcXMLValidationError;
end;

class function ColgcXMLValidationError.CreateRemote(const MachineName: string): IlgcXMLValidationError;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcXMLValidationError) as IlgcXMLValidationError;
end;

class function ColgcXMLValidator.Create: IlgcXMLValidator;
begin
  Result := CreateComObject(CLASS_lgcXMLValidator) as IlgcXMLValidator;
end;

class function ColgcXMLValidator.CreateRemote(const MachineName: string): IlgcXMLValidator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcXMLValidator) as IlgcXMLValidator;
end;

class function ColgcXMLXSLTransformation.Create: IlgcXMLXSLTransformation;
begin
  Result := CreateComObject(CLASS_lgcXMLXSLTransformation) as IlgcXMLXSLTransformation;
end;

class function ColgcXMLXSLTransformation.CreateRemote(const MachineName: string): IlgcXMLXSLTransformation;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcXMLXSLTransformation) as IlgcXMLXSLTransformation;
end;

class function ColgcViesCheckVatResponse.Create: IlgcViesCheckVatResponse;
begin
  Result := CreateComObject(CLASS_lgcViesCheckVatResponse) as IlgcViesCheckVatResponse;
end;

class function ColgcViesCheckVatResponse.CreateRemote(const MachineName: string): IlgcViesCheckVatResponse;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcViesCheckVatResponse) as IlgcViesCheckVatResponse;
end;

class function ColgcViesCountryStatus.Create: IlgcViesCountryStatus;
begin
  Result := CreateComObject(CLASS_lgcViesCountryStatus) as IlgcViesCountryStatus;
end;

class function ColgcViesCountryStatus.CreateRemote(const MachineName: string): IlgcViesCountryStatus;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcViesCountryStatus) as IlgcViesCountryStatus;
end;

class function ColgcViesStatusInformationResponse.Create: IlgcViesStatusInformationResponse;
begin
  Result := CreateComObject(CLASS_lgcViesStatusInformationResponse) as IlgcViesStatusInformationResponse;
end;

class function ColgcViesStatusInformationResponse.CreateRemote(const MachineName: string): IlgcViesStatusInformationResponse;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcViesStatusInformationResponse) as IlgcViesStatusInformationResponse;
end;

class function ColgcViesService.Create: IlgcViesService;
begin
  Result := CreateComObject(CLASS_lgcViesService) as IlgcViesService;
end;

class function ColgcViesService.CreateRemote(const MachineName: string): IlgcViesService;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcViesService) as IlgcViesService;
end;

class function ColgcKSeF2Request.Create: IlgcKSeF2Request;
begin
  Result := CreateComObject(CLASS_lgcKSeF2Request) as IlgcKSeF2Request;
end;

class function ColgcKSeF2Request.CreateRemote(const MachineName: string): IlgcKSeF2Request;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcKSeF2Request) as IlgcKSeF2Request;
end;

class function ColgcKSeF2Response.Create: IlgcKSeF2Response;
begin
  Result := CreateComObject(CLASS_lgcKSeF2Response) as IlgcKSeF2Response;
end;

class function ColgcKSeF2Response.CreateRemote(const MachineName: string): IlgcKSeF2Response;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcKSeF2Response) as IlgcKSeF2Response;
end;

class function ColgcKSeF2.Create: IlgcKSeF2;
begin
  Result := CreateComObject(CLASS_lgcKSeF2) as IlgcKSeF2;
end;

class function ColgcKSeF2.CreateRemote(const MachineName: string): IlgcKSeF2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcKSeF2) as IlgcKSeF2;
end;

class function ColgcKSeF2VerificationLinkService.Create: IlgcKSeF2VerificationLinkService;
begin
  Result := CreateComObject(CLASS_lgcKSeF2VerificationLinkService) as IlgcKSeF2VerificationLinkService;
end;

class function ColgcKSeF2VerificationLinkService.CreateRemote(const MachineName: string): IlgcKSeF2VerificationLinkService;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcKSeF2VerificationLinkService) as IlgcKSeF2VerificationLinkService;
end;

class function ColgcHash.Create: IlgcHash;
begin
  Result := CreateComObject(CLASS_lgcHash) as IlgcHash;
end;

class function ColgcHash.CreateRemote(const MachineName: string): IlgcHash;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcHash) as IlgcHash;
end;

class function ColgcKSeF2Utils.Create: IlgcKSeF2Utils;
begin
  Result := CreateComObject(CLASS_lgcKSeF2Utils) as IlgcKSeF2Utils;
end;

class function ColgcKSeF2Utils.CreateRemote(const MachineName: string): IlgcKSeF2Utils;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_lgcKSeF2Utils) as IlgcKSeF2Utils;
end;

end.
