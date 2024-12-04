Unit LibGovPL_1_0_TLB;

//  Imported LibGovPL on 2024-12-04 18:01:11 from D:\lazarus-projekty\libgovpl4demo\comsvr\libgovpl4com.tlb

{$mode delphi}{$H+}

interface

// Dependency: stdole v2 (stdole2.pas)
//  Warning: 'GUID' not automatable in IlgcErrorInfodisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcErrorInfodisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcErrorInfodisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcErrorInfodisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcErrorInfodisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcErrorInfodisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcErrorInfodisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcErrorInfodisp.Invoke
//  Warning: 'GUID' not automatable in IlgcBaseObjectdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcBaseObjectdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcBaseObjectdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcBaseObjectdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcBaseObjectdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcBaseObjectdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcBaseObjectdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcBaseObjectdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcBackenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcBackenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcBackenddisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcBackenddisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcBackenddisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcBackenddisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcBackenddisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcBackenddisp.Invoke
//  Warning: 'GUID' not automatable in IlgcWSTBackenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcWSTBackenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcWSTBackenddisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcWSTBackenddisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcWSTBackenddisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcWSTBackenddisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcWSTBackenddisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcWSTBackenddisp.Invoke
//  Warning: 'GUID' not automatable in IlgcLibXMLBackenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcLibXMLBackenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcLibXMLBackenddisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcLibXMLBackenddisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcLibXMLBackenddisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcLibXMLBackenddisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcLibXMLBackenddisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcLibXMLBackenddisp.Invoke
//  Warning: 'GUID' not automatable in IlgcOpenSSLBackenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcOpenSSLBackenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcOpenSSLBackenddisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcOpenSSLBackenddisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcOpenSSLBackenddisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcOpenSSLBackenddisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcOpenSSLBackenddisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcOpenSSLBackenddisp.Invoke
//  Warning: 'GUID' not automatable in IlgcObjectdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcObjectdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcObjectdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcObjectdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcObjectdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcObjectdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcObjectdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcObjectdisp.Invoke
//  Warning: 'Ppointer' not automatable in IlgcObject.ExtObject
//  Warning: 'GUID' not automatable in IlgcListdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcListdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcListdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcListdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcListdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcListdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcListdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcListdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcStringStreamdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcStringStreamdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcStringStreamdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcStringStreamdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcStringStreamdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcStringStreamdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcStringStreamdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcStringStreamdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcFileStreamdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcFileStreamdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcFileStreamdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcFileStreamdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcFileStreamdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcFileStreamdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcFileStreamdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcFileStreamdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcHTTPClientdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcHTTPClientdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcHTTPClientdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcHTTPClientdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcHTTPClientdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcHTTPClientdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcHTTPClientdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcHTTPClientdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcCertificatedisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcCertificatedisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcCertificatedisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcCertificatedisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcCertificatedisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcCertificatedisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcCertificatedisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcCertificatedisp.Invoke
//  Warning: 'GUID' not automatable in IlgcCertificateSignerdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcCertificateSignerdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcCertificateSignerdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcCertificateSignerdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcCertificateSignerdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcCertificateSignerdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcCertificateSignerdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcCertificateSignerdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcCNGCertificateSignerdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcCNGCertificateSignerdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcCNGCertificateSignerdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcCNGCertificateSignerdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcCNGCertificateSignerdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcCNGCertificateSignerdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcCNGCertificateSignerdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcCNGCertificateSignerdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcPKCS11Infodisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11Infodisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11Infodisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcPKCS11Infodisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcPKCS11Infodisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcPKCS11Infodisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcPKCS11Infodisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcPKCS11Infodisp.Invoke
//  Warning: 'GUID' not automatable in IlgcPKCS11TokenInfodisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11TokenInfodisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11TokenInfodisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcPKCS11TokenInfodisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcPKCS11TokenInfodisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcPKCS11TokenInfodisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcPKCS11TokenInfodisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcPKCS11TokenInfodisp.Invoke
//  Warning: 'GUID' not automatable in IlgcPKCS11SlotInfodisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11SlotInfodisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11SlotInfodisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcPKCS11SlotInfodisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcPKCS11SlotInfodisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcPKCS11SlotInfodisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcPKCS11SlotInfodisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcPKCS11SlotInfodisp.Invoke
//  Warning: 'GUID' not automatable in IlgcPKCS11Sessiondisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11Sessiondisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11Sessiondisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcPKCS11Sessiondisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcPKCS11Sessiondisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcPKCS11Sessiondisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcPKCS11Sessiondisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcPKCS11Sessiondisp.Invoke
//  Warning: 'GUID' not automatable in IlgcPKCS11Certificatedisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11Certificatedisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11Certificatedisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcPKCS11Certificatedisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcPKCS11Certificatedisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcPKCS11Certificatedisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcPKCS11Certificatedisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcPKCS11Certificatedisp.Invoke
//  Warning: 'GUID' not automatable in IlgcPKCS11CertificateSignerdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11CertificateSignerdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11CertificateSignerdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcPKCS11CertificateSignerdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcPKCS11CertificateSignerdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcPKCS11CertificateSignerdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcPKCS11CertificateSignerdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcPKCS11CertificateSignerdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcPKCS11Backenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11Backenddisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcPKCS11Backenddisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcPKCS11Backenddisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcPKCS11Backenddisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcPKCS11Backenddisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcPKCS11Backenddisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcPKCS11Backenddisp.Invoke
//  Warning: 'GUID' not automatable in IlgcXAdESdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcXAdESdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcXAdESdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcXAdESdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcXAdESdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcXAdESdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcXAdESdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcXAdESdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcEDeklaracjaStatusdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcEDeklaracjaStatusdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcEDeklaracjaStatusdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcEDeklaracjaStatusdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcEDeklaracjaStatusdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcEDeklaracjaStatusdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcEDeklaracjaStatusdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcEDeklaracjaStatusdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcEDeklaracjadisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcEDeklaracjadisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcEDeklaracjadisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcEDeklaracjadisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcEDeklaracjadisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcEDeklaracjadisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcEDeklaracjadisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcEDeklaracjadisp.Invoke
//  Warning: 'GUID' not automatable in IlgcJPKdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcJPKdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcJPKdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcJPKdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcJPKdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcJPKdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcJPKdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcJPKdisp.Invoke
//  Warning: 'GUID' not automatable in IlgcKSeFRequestdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcKSeFRequestdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcKSeFRequestdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcKSeFRequestdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcKSeFRequestdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcKSeFRequestdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcKSeFRequestdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcKSeFRequestdisp.Invoke
//  Warning: 'Ppointer' not automatable in IlgcKSeFRequest.ExtObject
//  Warning: 'GUID' not automatable in IlgcKSeFResponsedisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcKSeFResponsedisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcKSeFResponsedisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcKSeFResponsedisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcKSeFResponsedisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcKSeFResponsedisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcKSeFResponsedisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcKSeFResponsedisp.Invoke
//  Warning: 'Ppointer' not automatable in IlgcKSeFResponse.ExtObject
//  Warning: 'GUID' not automatable in IlgcKSeFBasedisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcKSeFBasedisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcKSeFBasedisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcKSeFBasedisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcKSeFBasedisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcKSeFBasedisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcKSeFBasedisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcKSeFBasedisp.Invoke
//  Warning: 'GUID' not automatable in IlgcKSeF_2_6_0disp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcKSeF_2_6_0disp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcKSeF_2_6_0disp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcKSeF_2_6_0disp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcKSeF_2_6_0disp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcKSeF_2_6_0disp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcKSeF_2_6_0disp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcKSeF_2_6_0disp.Invoke
//  Warning: 'GUID' not automatable in IlgcMemoryStreamdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcMemoryStreamdisp.QueryInterface
//  Warning: 'Ppointer' not automatable in IlgcMemoryStreamdisp.GetTypeInfo
//  Warning: 'GUID' not automatable in IlgcMemoryStreamdisp.GetIDsOfNames
//  Warning: 'PShortInt' not automatable in IlgcMemoryStreamdisp.GetIDsOfNames
//  Warning: 'GUID' not automatable in IlgcMemoryStreamdisp.Invoke
//  Warning: 'DISPPARAMS' not automatable in IlgcMemoryStreamdisp.Invoke
//  Warning: 'EXCEPINFO' not automatable in IlgcMemoryStreamdisp.Invoke
Uses
  Windows,ActiveX,Classes,Variants,stdole2;
Const
  LibGovPLMajorVersion = 1;
  LibGovPLMinorVersion = 0;
  LibGovPLLCID = 0;
  LIBID_LibGovPL : TGUID = '{923701A2-ECEF-4DD8-A560-51B56CB1FE75}';

  IID_IlgcErrorInfo : TGUID = '{9043B49E-3089-4FDB-9575-3DBE9AD258AE}';
  IID_IlgcBaseObject : TGUID = '{617C8313-E12F-47FA-A01E-AC0A212C8855}';
  IID_IlgcBackend : TGUID = '{393A6861-4A95-4CED-8B93-3A8FFA77F5C3}';
  IID_IlgcWSTBackend : TGUID = '{D829DEDA-20A8-4C28-9A38-7F42F599C8D7}';
  IID_IlgcLibXMLBackend : TGUID = '{D87A7A97-38CD-4172-92B0-5AA97BECB494}';
  IID_IlgcOpenSSLBackend : TGUID = '{516EC757-193C-42B4-9B5A-FE64059129AD}';
  IID_IlgcObject : TGUID = '{A7720948-5883-4F9E-8355-F57381433787}';
  IID_IlgcList : TGUID = '{F0A18AD2-8F91-4C8E-845A-B2F3524A390A}';
  IID_IlgcStringStream : TGUID = '{5F50981B-976D-4E90-A682-E2DC34115CDA}';
  IID_IlgcFileStream : TGUID = '{2B2E8876-C57E-4879-AFD6-6AF218D4705D}';
  IID_IlgcHTTPClient : TGUID = '{0587DB7A-AAFF-4900-B734-4BACE3EEE8FA}';
  IID_IlgcCertificate : TGUID = '{322D506B-4C30-43D1-A75E-F4D308D79022}';
  IID_IlgcCertificateSigner : TGUID = '{913A275A-8D26-4762-8C08-4D2CA11D214D}';
  IID_IlgcCNGCertificateSigner : TGUID = '{A1AE7A86-2200-494B-8C4D-FF5E0C97C268}';
  IID_IlgcPKCS11Info : TGUID = '{FA907E32-D103-4C20-B955-A0A6D478C7C7}';
  IID_IlgcPKCS11TokenInfo : TGUID = '{B4BB1EDB-4F32-4B0C-B390-566F02237A55}';
  IID_IlgcPKCS11SlotInfo : TGUID = '{597607F4-CA0A-4722-BBC9-EB15ECAEBA49}';
  IID_IlgcPKCS11Session : TGUID = '{BB0C246D-BA87-44C4-B614-53FB1D4AE900}';
  IID_IlgcPKCS11Certificate : TGUID = '{A14EB3D8-25C5-4C22-B6AA-3E7EA2884D78}';
  IID_IlgcPKCS11CertificateSigner : TGUID = '{02F51066-4584-476A-B0DB-CDFCA648B534}';
  IID_IlgcPKCS11Backend : TGUID = '{4B3C369B-79D4-4B26-862C-691E41E74AD1}';
  IID_IlgcXAdES : TGUID = '{50DC95DF-A1C2-460D-8A46-D90BE7016886}';
  IID_IlgcEDeklaracjaStatus : TGUID = '{79E8257A-AE97-4D81-BE00-6B69700BDFCE}';
  IID_IlgcEDeklaracja : TGUID = '{4C7E267D-D83D-4713-9120-CB57D7881F33}';
  IID_IlgcJPK : TGUID = '{5EB2F974-0D10-44D4-AA8F-E557BB91FF30}';
  IID_IlgcKSeFRequest : TGUID = '{7B4EF1CE-8FC8-433C-99E4-A446E6F62D98}';
  IID_IlgcKSeFResponse : TGUID = '{9ED3DF16-92DA-4EDC-BC63-FC17CDDF9BDC}';
  IID_IlgcKSeFBase : TGUID = '{452578AC-F2AE-4771-9FCF-5F4DC66021CD}';
  IID_IlgcKSeF_2_6_0 : TGUID = '{C44AAC54-CE22-421C-B159-B864DF2EB753}';
  IID_IlgcMemoryStream : TGUID = '{BCF17136-365B-4AF4-9720-44EB9E4CABB0}';
  CLASS_lgcErrorInfo : TGUID = '{635B56F7-B613-4E78-8AE3-B37C4591668B}';
  CLASS_lgcBaseObject : TGUID = '{2966D8CF-42F7-4AFF-9BB4-F3FA1DA714A6}';
  CLASS_lgcBackend : TGUID = '{2FAD736C-1297-4705-B19F-AD1EE260A9A2}';
  CLASS_lgcObject : TGUID = '{BCC209CD-4297-48D7-A37D-C15FAC40E5E0}';
  CLASS_lgcList : TGUID = '{8BAC56DE-067C-4302-8EB7-A6F8CF305B2A}';
  CLASS_lgcWSTBackend : TGUID = '{04CF0786-A71D-4415-930B-3F83EFDAA785}';
  CLASS_lgcLibXMLBackend : TGUID = '{9E2861C0-9FF3-48E8-9C88-6A00C8109DC2}';
  CLASS_lgcOpenSSLBackend : TGUID = '{EC4729F3-7024-45C5-84DD-F0EEE1BD0B6B}';
  CLASS_lgcStringStream : TGUID = '{ABB6BB86-F269-4E8A-98B5-E647B0CFA3EC}';
  CLASS_lgcFileStream : TGUID = '{FA48C1DA-7774-4663-837F-40E473BBF8BB}';
  CLASS_lgcMemoryStream : TGUID = '{E444DD02-F45D-4223-BD84-0BB223ABCEAF}';
  CLASS_lgcHTTPClient : TGUID = '{9CC81EAA-644D-4554-A55D-8EAB6452511A}';
  CLASS_lgcCertificate : TGUID = '{C706CFE8-C856-4D00-B0B4-0FDE4EDC3E24}';
  CLASS_lgcCertificateSigner : TGUID = '{223F3D90-F22D-4D41-8BFD-B792C1F62D94}';
  CLASS_lgcCNGCertificateSigner : TGUID = '{146721D2-FAC8-4268-B0DD-CF3281292560}';
  CLASS_lgcPKCS11Info : TGUID = '{95C1BB09-0646-43A0-927B-0D3103E0F3FA}';
  CLASS_lgcPKCS11TokenInfo : TGUID = '{3BF254C8-F3C5-4D35-B2C0-DA0C2A17C0AD}';
  CLASS_lgcPKCS11SlotInfo : TGUID = '{792248A8-5FBD-4E62-899C-6FC9B2FB34CF}';
  CLASS_lgcPKCS11Session : TGUID = '{9FE1B11E-84AE-42B4-BE72-7D67C9618F51}';
  CLASS_lgcPKCS11Certificate : TGUID = '{2C30F57F-8A42-4E99-BB74-C98B9642A069}';
  CLASS_lgcPKCS11CertificateSigner : TGUID = '{F8B3FB4E-78AC-432E-BDAC-704948690547}';
  CLASS_lgcPKCS11Backend : TGUID = '{328DF6A8-3E5D-40A8-905A-281A9571726C}';
  CLASS_lgcXAdES : TGUID = '{3C94F1FA-4A88-42FF-B2C9-B4FB9121E3E2}';
  CLASS_lgcEDeklaracjaStatus : TGUID = '{39A1AFDC-A1E7-4034-99E7-BE8FB01861BF}';
  CLASS_lgcEDeklaracja : TGUID = '{BB0AC581-5B43-4757-8625-94041A59D459}';
  CLASS_lgcJPK : TGUID = '{5BD3B376-EE5B-40AC-91F3-B6A093640651}';
  CLASS_lgcKSeFRequest : TGUID = '{3C4A4763-D416-4CF7-BBF5-FE3ED580D12B}';
  CLASS_lgcKSeFResponse : TGUID = '{A6040209-EA0A-4861-A425-B0B486CFE55B}';
  CLASS_lgcKSeFBase : TGUID = '{15C1BB69-A675-48E5-A7E8-FDF9BCBA50A8}';
  CLASS_lgcKSeF_2_6_0 : TGUID = '{448AC566-E8A4-4560-B717-6CB3526EFC49}';

//Enums

Type
  lgcClassType =LongWord;
Const
  lgcCTHTTPClient = $0000000000000000;
  lgcCTCertSigner = $0000000000000001;
  lgcCTRandGenerator = $0000000000000002;
  lgcCTBase64Encoder = $0000000000000003;
  lgcCTMD5Hash = $0000000000000004;
  lgcCTSHA1Hash = $0000000000000005;
  lgcCTSHA256Hash = $0000000000000006;
  lgcCTAES256Encrypt = $0000000000000007;
  lgcCTRSAEncrypt = $0000000000000008;
  lgcCTZipper = $0000000000000009;
  lgcCTXMLReader = $000000000000000A;
  lgcCTXMLC14N = $000000000000000B;
  lgcCTEdekGate = $000000000000000C;
Type
  lgcPropertyType =LongWord;
Const
  lgcPTUnknown = $0000000000000000;
  lgcPTString = $0000000000000001;
  lgcPTInt32 = $0000000000000002;
  lgcPTInt64 = $0000000000000003;
  lgcPTDouble = $0000000000000004;
  lgcPTCurrency = $0000000000000005;
  lgcPTBoolean = $0000000000000006;
  lgcPTDateTime = $0000000000000007;
  lgcPTObject = $0000000000000008;
  lgcPTObjectList = $0000000000000009;
Type
  lgcPKCS11UserType =LongWord;
Const
  lgcP11UTSO = $0000000000000000;
  lgcP11UTUser = $0000000000000001;
  lgcP11UTContextSpecific = $0000000000000002;
Type
  lgcPKCS11SessionState =LongWord;
Const
  lgcP11SSROPublicSession = $0000000000000000;
  lgcP11SSROUserFunctions = $0000000000000001;
  lgcP11SSRWPublicSession = $0000000000000002;
  lgcP11SSRWUserFunctions = $0000000000000003;
  lgcP11SSRWSOFunctions = $0000000000000004;
Type
  lgcSignHashType =LongWord;
Const
  lgcSHTSHA1 = $0000000000000000;
  lgcSHTSHA256 = $0000000000000001;
Type
  lgcXAdESSerialNoFormat =LongWord;
Const
  lgcXSFDecimal = $0000000000000000;
  lgcXSFHex = $0000000000000001;
Type
  lgcEDekGateType =LongWord;
Const
  lgcEGTProduction = $0000000000000000;
  lgcEGTTest = $0000000000000001;
Type
  lgcEDekSignType =LongWord;
Const
  lgcESTCertificate = $0000000000000000;
  lgcESTAuthData = $0000000000000001;
Type
  lgcKSeFGateType =LongWord;
Const
  lgcKTGProd = $0000000000000000;
  lgcKTGDemo = $0000000000000001;
  lgcKTGTest = $0000000000000002;
Type
  lgcKSeFCertificateAuthType =LongWord;
Const
  lgcCATSerialNumber = $0000000000000000;
  lgcCATFingerprint = $0000000000000001;
Type
  lgcKSeFNumberVariant =LongWord;
Const
  lgcKNVDefault = $0000000000000000;
  lgcKNV35 = $0000000000000001;
  lgcKNV36 = $0000000000000002;
Type
  lgcFileMode =LongWord;
Const
  lgcFMOpenRead = $0000000000000000;
  lgcFMOpenWrite = $0000000000000001;
  lgcFMOpenReadWrite = $0000000000000002;
  lgcFMShareCompat = $0000000000000000;
  lgcFMShareExclusive = $0000000000000010;
  lgcFMShareDenyWrite = $0000000000000020;
  lgcFMShareDenyRead = $0000000000000030;
  lgcFMShareDenyNone = $0000000000000040;
  lgcFMCreate = $000000000000FF00;
//Forward declarations

Type
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

//Map CoClass to its default interface

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

//records, unions, aliases


//interface declarations

// IlgcErrorInfo : Informacje o ostatnim bledzie/wyjatku

 IlgcErrorInfo = interface(IDispatch)
   ['{9043B49E-3089-4FDB-9575-3DBE9AD258AE}']
   function Get_ExceptionClass : WideString; safecall;
   function Get_Message : WideString; safecall;
   function Get_ExtraInfo : OleVariant; safecall;
   function Get_HandlerClass : WideString; safecall;
    // ExceptionClass : Nazwa klasy wyjatku 
   property ExceptionClass:WideString read Get_ExceptionClass;
    // Message : Komunikat bledu 
   property Message:WideString read Get_Message;
    // ExtraInfo : Dodatkowe informacje (tablica typu VARIANT) 
   property ExtraInfo:OleVariant read Get_ExtraInfo;
    // HandlerClass : Klasa obslugujaca wyjatek 
   property HandlerClass:WideString read Get_HandlerClass;
  end;


// IlgcErrorInfo : Informacje o ostatnim bledzie/wyjatku

 IlgcErrorInfoDisp = dispinterface
   ['{9043B49E-3089-4FDB-9575-3DBE9AD258AE}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // ExceptionClass : Nazwa klasy wyjatku 
   property ExceptionClass:WideString  readonly dispid 3001;
    // Message : Komunikat bledu 
   property Message:WideString  readonly dispid 3002;
    // ExtraInfo : Dodatkowe informacje (tablica typu VARIANT) 
   property ExtraInfo:OleVariant  readonly dispid 3003;
    // HandlerClass : Klasa obslugujaca wyjatek 
   property HandlerClass:WideString  readonly dispid 3004;
  end;


// IlgcBaseObject : Podstawowy obiekt biblioteki

 IlgcBaseObject = interface(IDispatch)
   ['{617C8313-E12F-47FA-A01E-AC0A212C8855}']
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;safecall;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;safecall;
   function Get_LastError : IDispatch; safecall;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch read Get_LastError;
  end;


// IlgcBaseObject : Podstawowy obiekt biblioteki

 IlgcBaseObjectDisp = dispinterface
   ['{617C8313-E12F-47FA-A01E-AC0A212C8855}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
  end;


// IlgcBackend : 

 IlgcBackend = interface(IlgcBaseObject)
   ['{393A6861-4A95-4CED-8B93-3A8FFA77F5C3}']
    // SetLicenseKey : Ustawienie danych licencji 
   procedure SetLicenseKey(Param1:WideString;Param2:WideString;Param3:WideString);safecall;
    // GetLibVersion : Pobranie wersji biblioteki 
   function GetLibVersion:WideString;safecall;
    // GetDebugInfo : Pobranie informacji i statystyk 
   function GetDebugInfo(CounterType:Integer):OleVariant;safecall;
    // GetClassCount : Pobranie liczby klas danego rodzaju sterownika 
   function GetClassCount(ClsType:lgcClassType):Integer;safecall;
    // GetClassName : Pobranie nazwy klasy sterownika 
   function GetClassName(ClsType:lgcClassType;ClassIndex:Integer):WideString;safecall;
    // GetClassNames : Pobranie listy klas sterownikow danego typu (zwracana tablica typu VARIANT z elementami typu string) 
   function GetClassNames(ClsType:lgcClassType):OleVariant;safecall;
    // CreateFileStream : Utworzenie nowego strumienia plikowego o podanej nazwie i trybie otwarcia 
   function CreateFileStream(FileName:WideString;Mode:Integer):IDispatch;safecall;
    // CreateHTTPClient : Utworzenie instancji klienta polaczen HTTP o zadanej nazwie klasy sterownika 
   function CreateHTTPClient(ClsName:WideString):IDispatch;safecall;
    // CreateRSAKey : Utworzenie instancji klucza publicznego RSA o zadanej nazwie klasy i wskazanym zrodle (nazwa pliku, lancuch z zawartoscia klucza lub obiekt implementujacy IStream) 
   function CreateRSAKey(ClsName:WideString;Source:OleVariant):IDispatch;safecall;
    // CreateCertificateSigner : Utworzenie instancji mechanizmu podpisu certyfikatem kwalifikowanym o zadanej nazwie klasy sterownika 
   function CreateCertificateSigner(ClsName:WideString):IDispatch;safecall;
    // CreateXAdES : Tworzenie instancji obiektu sygnatury XAdES 
   function CreateXAdES:IDispatch;safecall;
    // CreateEDeklaracja : Tworzenie instancji obiektu obslugi e-deklaracji 
   function CreateEDeklaracja:IDispatch;safecall;
    // CreateJPK : Tworzenie instancji obiektu obslugi JPK 
   function CreateJPK:IDispatch;safecall;
    // CreateKSeF : Tworzenie instancji obiektu obslugi KSeF 
   function CreateKSeF:IDispatch;safecall;
  end;


// IlgcBackend : 

 IlgcBackendDisp = dispinterface
   ['{393A6861-4A95-4CED-8B93-3A8FFA77F5C3}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // SetLicenseKey : Ustawienie danych licencji 
   procedure SetLicenseKey(Param1:WideString;Param2:WideString;Param3:WideString);dispid 2001;
    // GetLibVersion : Pobranie wersji biblioteki 
   function GetLibVersion:WideString;dispid 2002;
    // GetDebugInfo : Pobranie informacji i statystyk 
   function GetDebugInfo(CounterType:Integer):OleVariant;dispid 2003;
    // GetClassCount : Pobranie liczby klas danego rodzaju sterownika 
   function GetClassCount(ClsType:lgcClassType):Integer;dispid 2004;
    // GetClassName : Pobranie nazwy klasy sterownika 
   function GetClassName(ClsType:lgcClassType;ClassIndex:Integer):WideString;dispid 2005;
    // GetClassNames : Pobranie listy klas sterownikow danego typu (zwracana tablica typu VARIANT z elementami typu string) 
   function GetClassNames(ClsType:lgcClassType):OleVariant;dispid 2006;
    // CreateFileStream : Utworzenie nowego strumienia plikowego o podanej nazwie i trybie otwarcia 
   function CreateFileStream(FileName:WideString;Mode:Integer):IDispatch;dispid 2007;
    // CreateHTTPClient : Utworzenie instancji klienta polaczen HTTP o zadanej nazwie klasy sterownika 
   function CreateHTTPClient(ClsName:WideString):IDispatch;dispid 2008;
    // CreateRSAKey : Utworzenie instancji klucza publicznego RSA o zadanej nazwie klasy i wskazanym zrodle (nazwa pliku, lancuch z zawartoscia klucza lub obiekt implementujacy IStream) 
   function CreateRSAKey(ClsName:WideString;Source:OleVariant):IDispatch;dispid 2009;
    // CreateCertificateSigner : Utworzenie instancji mechanizmu podpisu certyfikatem kwalifikowanym o zadanej nazwie klasy sterownika 
   function CreateCertificateSigner(ClsName:WideString):IDispatch;dispid 2010;
    // CreateXAdES : Tworzenie instancji obiektu sygnatury XAdES 
   function CreateXAdES:IDispatch;dispid 2011;
    // CreateEDeklaracja : Tworzenie instancji obiektu obslugi e-deklaracji 
   function CreateEDeklaracja:IDispatch;dispid 2012;
    // CreateJPK : Tworzenie instancji obiektu obslugi JPK 
   function CreateJPK:IDispatch;dispid 2013;
    // CreateKSeF : Tworzenie instancji obiektu obslugi KSeF 
   function CreateKSeF:IDispatch;dispid 2014;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
  end;


// IlgcWSTBackend : Obsluga biblioteki Web Service Toolkit - SOAP dla bramki e-deklaracji

 IlgcWSTBackend = interface(IlgcBaseObject)
   ['{D829DEDA-20A8-4C28-9A38-7F42F599C8D7}']
    // RegisterTransport : Rejestracja protokolu - nalezy wywolac raz przed uzyciem bramki e-deklaracji 
   procedure RegisterTransport;safecall;
   function Get_HTTPClient : IDispatch; safecall;
   procedure Set_HTTPClient(const Value:IDispatch); safecall;
    // HTTPClient : Instancja klienta HTTP 
   property HTTPClient:IDispatch read Get_HTTPClient write Set_HTTPClient;
  end;


// IlgcWSTBackend : Obsluga biblioteki Web Service Toolkit - SOAP dla bramki e-deklaracji

 IlgcWSTBackendDisp = dispinterface
   ['{D829DEDA-20A8-4C28-9A38-7F42F599C8D7}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // RegisterTransport : Rejestracja protokolu - nalezy wywolac raz przed uzyciem bramki e-deklaracji 
   procedure RegisterTransport;dispid 4001;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // HTTPClient : Instancja klienta HTTP 
   property HTTPClient:IDispatch dispid 4002;
  end;


// IlgcLibXMLBackend : Zaplecze biblioteki LibXML2

 IlgcLibXMLBackend = interface(IlgcBaseObject)
   ['{D87A7A97-38CD-4172-92B0-5AA97BECB494}']
    // LoadLibXML : Ladowanie blblioteki libxml ze wskazanego pliku 
   procedure LoadLibXML(LibFileName:WideString);safecall;
  end;


// IlgcLibXMLBackend : Zaplecze biblioteki LibXML2

 IlgcLibXMLBackendDisp = dispinterface
   ['{D87A7A97-38CD-4172-92B0-5AA97BECB494}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LoadLibXML : Ladowanie blblioteki libxml ze wskazanego pliku 
   procedure LoadLibXML(LibFileName:WideString);dispid 5001;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
  end;


// IlgcOpenSSLBackend : Zaplecze biblioteki OpenSSL

 IlgcOpenSSLBackend = interface(IlgcBaseObject)
   ['{516EC757-193C-42B4-9B5A-FE64059129AD}']
    // LoadOpenSSL : Ladowanie bibliotek OpenSSL ze wskazanych plikow 
   procedure LoadOpenSSL(SSLName:WideString;CryptoName:WideString);safecall;
  end;


// IlgcOpenSSLBackend : Zaplecze biblioteki OpenSSL

 IlgcOpenSSLBackendDisp = dispinterface
   ['{516EC757-193C-42B4-9B5A-FE64059129AD}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LoadOpenSSL : Ladowanie bibliotek OpenSSL ze wskazanych plikow 
   procedure LoadOpenSSL(SSLName:WideString;CryptoName:WideString);dispid 6001;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
  end;


// IlgcObject : Obiekt reprezentujacy dane zadania i odpowiedzi KSeF, dostep do wlasciwosci realizowany rowniez przez pozne wiazanie (late binding)

 IlgcObject = interface(IlgcBaseObject)
   ['{A7720948-5883-4F9E-8355-F57381433787}']
   function Get_ExtObject : Ppointer; safecall;
   function Get_StringProp(Name:WideString) : WideString; safecall;
   procedure Set_StringProp(const Name:WideString; const parStringProp:WideString); safecall;
   function Get_IntegerProp(Name:WideString) : Integer; safecall;
   procedure Set_IntegerProp(const Name:WideString; const parIntegerProp:Integer); safecall;
   function Get_DoubleProp(Name:WideString) : Double; safecall;
   procedure Set_DoubleProp(const Name:WideString; const parDoubleProp:Double); safecall;
   function Get_CurrencyProp(Name:WideString) : Currency; safecall;
   procedure Set_CurrencyProp(const Name:WideString; const parCurrencyProp:Currency); safecall;
   function Get_BooleanProp(Name:WideString) : WordBool; safecall;
   procedure Set_BooleanProp(const Name:WideString; const parBooleanProp:WordBool); safecall;
   function Get_Int64Prop(Name:WideString) : Int64; safecall;
   procedure Set_Int64Prop(const Name:WideString; const parInt64Prop:Int64); safecall;
   function Get_DateProp(Name:WideString) : TDateTime; safecall;
   procedure Set_DateProp(const Name:WideString; const parDateProp:TDateTime); safecall;
    // ListProps : Pobranie listy wlasciwosci obiektu 
   function ListProps:OleVariant;safecall;
    // PropType : Pobranie typu danej wlasciwosci 
   function PropType(PropName:WideString):lgcPropertyType;safecall;
    // ObjectPropClass : Pobranie nazwy klasy zadanej wlasciwosci typu object 
   function ObjectPropClass(PropName:WideString):WideString;safecall;
    // SetObjectProp : Ustawienie wlasciwosci obiektu typu object o wskazanej nazwie 
   procedure SetObjectProp(Name:WideString;Value:OleVariant);safecall;
    // GetObjectProp : Pobranie wasiwosci obiektu typu object o wskazanej nazwie 
   function GetObjectProp(Name:WideString):OleVariant;safecall;
    // ExtObject : Pobranie wkaznika wewnetrznego obiektu 
   property ExtObject:Ppointer read Get_ExtObject;
    // StringProp : Pogranie wlasciwosci obiektu typu string o wskazanej nazwie 
   property StringProp[Name:WideString]:WideString read Get_StringProp write Set_StringProp;
    // IntegerProp : Pogranie wlasciwosci obiektu typu int32 o wskazanej nazwie 
   property IntegerProp[Name:WideString]:Integer read Get_IntegerProp write Set_IntegerProp;
    // DoubleProp : Pogranie wlasciwosci obiektu typu double o wskazanej nazwie 
   property DoubleProp[Name:WideString]:Double read Get_DoubleProp write Set_DoubleProp;
    // CurrencyProp : Pogranie wlasciwosci obiektu typu CURRENCY o wskazanej nazwie 
   property CurrencyProp[Name:WideString]:Currency read Get_CurrencyProp write Set_CurrencyProp;
    // BooleanProp : Pogranie wlasciwosci obiektu typu bool o wskazanej nazwie 
   property BooleanProp[Name:WideString]:WordBool read Get_BooleanProp write Set_BooleanProp;
    // Int64Prop : Pogranie wlasciwosci obiektu typu int64 o wskazanej nazwie 
   property Int64Prop[Name:WideString]:Int64 read Get_Int64Prop write Set_Int64Prop;
    // DateProp : Pogranie wlasciwosci obiektu typu DATE o wskazanej nazwie 
   property DateProp[Name:WideString]:TDateTime read Get_DateProp write Set_DateProp;
  end;


// IlgcObject : Obiekt reprezentujacy dane zadania i odpowiedzi KSeF, dostep do wlasciwosci realizowany rowniez przez pozne wiazanie (late binding)

 IlgcObjectDisp = dispinterface
   ['{A7720948-5883-4F9E-8355-F57381433787}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // ListProps : Pobranie listy wlasciwosci obiektu 
   function ListProps:OleVariant;dispid 7009;
    // PropType : Pobranie typu danej wlasciwosci 
   function PropType(PropName:WideString):lgcPropertyType;dispid 7010;
    // ObjectPropClass : Pobranie nazwy klasy zadanej wlasciwosci typu object 
   function ObjectPropClass(PropName:WideString):WideString;dispid 7011;
    // SetObjectProp : Ustawienie wlasciwosci obiektu typu object o wskazanej nazwie 
   procedure SetObjectProp(Name:WideString;Value:OleVariant);dispid 7012;
    // GetObjectProp : Pobranie wasiwosci obiektu typu object o wskazanej nazwie 
   function GetObjectProp(Name:WideString):OleVariant;dispid 7013;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // ExtObject : Pobranie wkaznika wewnetrznego obiektu 
   property ExtObject:{!! Ppointer !!} OleVariant  readonly dispid 7001;
    // StringProp : Pogranie wlasciwosci obiektu typu string o wskazanej nazwie 
   property StringProp[Name:WideString]:WideString dispid 7002;
    // IntegerProp : Pogranie wlasciwosci obiektu typu int32 o wskazanej nazwie 
   property IntegerProp[Name:WideString]:Integer dispid 7003;
    // DoubleProp : Pogranie wlasciwosci obiektu typu double o wskazanej nazwie 
   property DoubleProp[Name:WideString]:Double dispid 7004;
    // CurrencyProp : Pogranie wlasciwosci obiektu typu CURRENCY o wskazanej nazwie 
   property CurrencyProp[Name:WideString]:Currency dispid 7005;
    // BooleanProp : Pogranie wlasciwosci obiektu typu bool o wskazanej nazwie 
   property BooleanProp[Name:WideString]:WordBool dispid 7006;
    // Int64Prop : Pogranie wlasciwosci obiektu typu int64 o wskazanej nazwie 
   property Int64Prop[Name:WideString]:Int64 dispid 7007;
    // DateProp : Pogranie wlasciwosci obiektu typu DATE o wskazanej nazwie 
   property DateProp[Name:WideString]:TDateTime dispid 7008;
  end;


// IlgcList : Obiekt definiujacy liste

 IlgcList = interface(IlgcBaseObject)
   ['{F0A18AD2-8F91-4C8E-845A-B2F3524A390A}']
    // Add : Dodanie elementu do listy 
   procedure Add(Item:OleVariant;Key:OleVariant);safecall;
    // Remove : Usuniecie elementu z listy 
   procedure Remove(Index:OleVariant);safecall;
   function Get_Count : Integer; safecall;
   function Get_Item(Index:OleVariant) : OleVariant; safecall;
    // _NewEnum : Utworzenie nowego enumaratora implementujacego IEnumVARIANT 
   function _NewEnum:IUnknown;safecall;
    // Delete : Usuniecie danego elementu 
   procedure Delete(ObjIndex:Integer);safecall;
    // Count : Zwraca liczbe elementow listy 
   property Count:Integer read Get_Count;
    // Item : Pobranie wskazanego elementu listy 
   property Item[Index:OleVariant]:OleVariant read Get_Item; default;
  end;


// IlgcList : Obiekt definiujacy liste

 IlgcListDisp = dispinterface
   ['{F0A18AD2-8F91-4C8E-845A-B2F3524A390A}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // Add : Dodanie elementu do listy 
   procedure Add(Item:OleVariant;Key:OleVariant);dispid 1;
    // Remove : Usuniecie elementu z listy 
   procedure Remove(Index:OleVariant);dispid 2;
    // _NewEnum : Utworzenie nowego enumaratora implementujacego IEnumVARIANT 
   function _NewEnum:IUnknown;dispid -4;
    // Delete : Usuniecie danego elementu 
   procedure Delete(ObjIndex:Integer);dispid 8001;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // Count : Zwraca liczbe elementow listy 
   property Count:Integer  readonly dispid 3;
    // Item : Pobranie wskazanego elementu listy 
   property Item[Index:OleVariant]:OleVariant  readonly dispid 0; default;
  end;


// IlgcStringStream : Obiekt implementujacy IStream na podstawie string

 IlgcStringStream = interface(IlgcBaseObject)
   ['{5F50981B-976D-4E90-A682-E2DC34115CDA}']
   function Get_Data : WideString; safecall;
   procedure Set_Data(const Value:WideString); safecall;
    // Clear : Czyszczenie zawartowci strumienia 
   procedure Clear;safecall;
    // LoadFromFile : Wczytanie zawartosci ze wskazanego pliku 
   procedure LoadFromFile(AFileName:WideString);safecall;
    // SaveToFile : Zapisanie zawartosci do wskazanego pliku 
   procedure SaveToFile(AFileName:WideString);safecall;
    // Data : Pobranie aktualnej zawartosci strumienia 
   property Data:WideString read Get_Data write Set_Data;
  end;


// IlgcStringStream : Obiekt implementujacy IStream na podstawie string

 IlgcStringStreamDisp = dispinterface
   ['{5F50981B-976D-4E90-A682-E2DC34115CDA}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // Clear : Czyszczenie zawartowci strumienia 
   procedure Clear;dispid 9002;
    // LoadFromFile : Wczytanie zawartosci ze wskazanego pliku 
   procedure LoadFromFile(AFileName:WideString);dispid 9003;
    // SaveToFile : Zapisanie zawartosci do wskazanego pliku 
   procedure SaveToFile(AFileName:WideString);dispid 9004;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // Data : Pobranie aktualnej zawartosci strumienia 
   property Data:WideString dispid 9001;
  end;


// IlgcFileStream : Obiekt implementujacy IStream na podstawie pliku, tworzony za pomoca IlgcBackend

 IlgcFileStream = interface(IlgcBaseObject)
   ['{2B2E8876-C57E-4879-AFD6-6AF218D4705D}']
   function Get_FileName : WideString; safecall;
    // FileName : Nazwa otwartego pliku 
   property FileName:WideString read Get_FileName;
  end;


// IlgcFileStream : Obiekt implementujacy IStream na podstawie pliku, tworzony za pomoca IlgcBackend

 IlgcFileStreamDisp = dispinterface
   ['{2B2E8876-C57E-4879-AFD6-6AF218D4705D}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // FileName : Nazwa otwartego pliku 
   property FileName:WideString  readonly dispid 10001;
  end;


// IlgcHTTPClient : Obiekt polaczenia HTTP

 IlgcHTTPClient = interface(IlgcBaseObject)
   ['{0587DB7A-AAFF-4900-B734-4BACE3EEE8FA}']
   function Get_IgnoreSSLErrors : WordBool; safecall;
   procedure Set_IgnoreSSLErrors(const Value:WordBool); safecall;
    // IgnoreSSLErrors :  
   property IgnoreSSLErrors:WordBool read Get_IgnoreSSLErrors write Set_IgnoreSSLErrors;
  end;


// IlgcHTTPClient : Obiekt polaczenia HTTP

 IlgcHTTPClientDisp = dispinterface
   ['{0587DB7A-AAFF-4900-B734-4BACE3EEE8FA}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // IgnoreSSLErrors :  
   property IgnoreSSLErrors:WordBool dispid 12001;
  end;


// IlgcCertificate : Certyfikat dla podpisu elektronicznego

 IlgcCertificate = interface(IlgcBaseObject)
   ['{322D506B-4C30-43D1-A75E-F4D308D79022}']
   function Get_DisplayName : WideString; safecall;
   function Get_Subject : WideString; safecall;
   function Get_Issuer : WideString; safecall;
   function Get_SerialNoDec : WideString; safecall;
   function Get_SerialNoHex : WideString; safecall;
   function Get_ValidFrom : OleVariant; safecall;
   function Get_ValidTo : OleVariant; safecall;
   procedure Set_PIN(const Param1:WideString); safecall;
    // ShowCertificateInfo :  
   procedure ShowCertificateInfo(WinHandle:OleVariant);safecall;
    // DisplayName :  
   property DisplayName:WideString read Get_DisplayName;
    // Subject :  
   property Subject:WideString read Get_Subject;
    // Issuer :  
   property Issuer:WideString read Get_Issuer;
    // SerialNoDec :  
   property SerialNoDec:WideString read Get_SerialNoDec;
    // SerialNoHex :  
   property SerialNoHex:WideString read Get_SerialNoHex;
    // ValidFrom :  
   property ValidFrom:OleVariant read Get_ValidFrom;
    // ValidTo :  
   property ValidTo:OleVariant read Get_ValidTo;
    // PIN :  
   property PIN:WideString write Set_PIN;
  end;


// IlgcCertificate : Certyfikat dla podpisu elektronicznego

 IlgcCertificateDisp = dispinterface
   ['{322D506B-4C30-43D1-A75E-F4D308D79022}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // ShowCertificateInfo :  
   procedure ShowCertificateInfo(WinHandle:OleVariant);dispid 13009;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // DisplayName :  
   property DisplayName:WideString  readonly dispid 13001;
    // Subject :  
   property Subject:WideString  readonly dispid 13002;
    // Issuer :  
   property Issuer:WideString  readonly dispid 13003;
    // SerialNoDec :  
   property SerialNoDec:WideString  readonly dispid 13004;
    // SerialNoHex :  
   property SerialNoHex:WideString  readonly dispid 13005;
    // ValidFrom :  
   property ValidFrom:OleVariant  readonly dispid 13006;
    // ValidTo :  
   property ValidTo:OleVariant  readonly dispid 13007;
    // PIN :  
   property PIN:WideString writeonly dispid 13008;
  end;


// IlgcCertificateSigner : Mechanizm podpisu kwalifikowanego

 IlgcCertificateSigner = interface(IlgcBaseObject)
   ['{913A275A-8D26-4762-8C08-4D2CA11D214D}']
    // List : Pobranie listy certyfikatow 
   function List:IDispatch;safecall;
    // UISelect : Wybor certyfikatu za pomoca systemowego okna dialogowego 
   function UISelect:IDispatch;safecall;
  end;


// IlgcCertificateSigner : Mechanizm podpisu kwalifikowanego

 IlgcCertificateSignerDisp = dispinterface
   ['{913A275A-8D26-4762-8C08-4D2CA11D214D}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // List : Pobranie listy certyfikatow 
   function List:IDispatch;dispid 14001;
    // UISelect : Wybor certyfikatu za pomoca systemowego okna dialogowego 
   function UISelect:IDispatch;dispid 14002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
  end;


// IlgcCNGCertificateSigner : Mechanizm podpisu kwalifikowanego opartego o CryptAPI/CNG

 IlgcCNGCertificateSigner = interface(IlgcCertificateSigner)
   ['{A1AE7A86-2200-494B-8C4D-FF5E0C97C268}']
   function Get_WinHandle : OleVariant; safecall;
   procedure Set_WinHandle(const Value:OleVariant); safecall;
    // WinHandle :  
   property WinHandle:OleVariant read Get_WinHandle write Set_WinHandle;
  end;


// IlgcCNGCertificateSigner : Mechanizm podpisu kwalifikowanego opartego o CryptAPI/CNG

 IlgcCNGCertificateSignerDisp = dispinterface
   ['{A1AE7A86-2200-494B-8C4D-FF5E0C97C268}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // List : Pobranie listy certyfikatow 
   function List:IDispatch;dispid 14001;
    // UISelect : Wybor certyfikatu za pomoca systemowego okna dialogowego 
   function UISelect:IDispatch;dispid 14002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // WinHandle :  
   property WinHandle:OleVariant dispid 15001;
  end;


// IlgcPKCS11Info : Informacje o bibliotece PKCS#11

 IlgcPKCS11Info = interface(IlgcBaseObject)
   ['{FA907E32-D103-4C20-B955-A0A6D478C7C7}']
   function Get_CryptokitVersionStr : WideString; safecall;
   function Get_CryptokitVersionMajor : Integer; safecall;
   function Get_CryptokitVersionMinor : Integer; safecall;
   function Get_ManufacturerID : WideString; safecall;
   function Get_LibraryDescription : WideString; safecall;
   function Get_LibraryVersionStr : WideString; safecall;
   function Get_LibraryVersionMajor : Integer; safecall;
   function Get_LibraryVersionMinor : Integer; safecall;
    // CryptokitVersionStr :  
   property CryptokitVersionStr:WideString read Get_CryptokitVersionStr;
    // CryptokitVersionMajor :  
   property CryptokitVersionMajor:Integer read Get_CryptokitVersionMajor;
    // CryptokitVersionMinor :  
   property CryptokitVersionMinor:Integer read Get_CryptokitVersionMinor;
    // ManufacturerID :  
   property ManufacturerID:WideString read Get_ManufacturerID;
    // LibraryDescription :  
   property LibraryDescription:WideString read Get_LibraryDescription;
    // LibraryVersionStr :  
   property LibraryVersionStr:WideString read Get_LibraryVersionStr;
    // LibraryVersionMajor :  
   property LibraryVersionMajor:Integer read Get_LibraryVersionMajor;
    // LibraryVersionMinor :  
   property LibraryVersionMinor:Integer read Get_LibraryVersionMinor;
  end;


// IlgcPKCS11Info : Informacje o bibliotece PKCS#11

 IlgcPKCS11InfoDisp = dispinterface
   ['{FA907E32-D103-4C20-B955-A0A6D478C7C7}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // CryptokitVersionStr :  
   property CryptokitVersionStr:WideString  readonly dispid 16001;
    // CryptokitVersionMajor :  
   property CryptokitVersionMajor:Integer  readonly dispid 16002;
    // CryptokitVersionMinor :  
   property CryptokitVersionMinor:Integer  readonly dispid 16003;
    // ManufacturerID :  
   property ManufacturerID:WideString  readonly dispid 16004;
    // LibraryDescription :  
   property LibraryDescription:WideString  readonly dispid 16005;
    // LibraryVersionStr :  
   property LibraryVersionStr:WideString  readonly dispid 16006;
    // LibraryVersionMajor :  
   property LibraryVersionMajor:Integer  readonly dispid 16007;
    // LibraryVersionMinor :  
   property LibraryVersionMinor:Integer  readonly dispid 16008;
  end;


// IlgcPKCS11TokenInfo : Informacje o tokenie PKCS#11

 IlgcPKCS11TokenInfo = interface(IlgcBaseObject)
   ['{B4BB1EDB-4F32-4B0C-B390-566F02237A55}']
   function Get_TokenLabel : WideString; safecall;
   function Get_ManufacturerID : WideString; safecall;
   function Get_Model : WideString; safecall;
   function Get_SerialNumber : WideString; safecall;
   function Get_Flags : LongWord; safecall;
   function Get_MaxSessionCount : LongWord; safecall;
   function Get_SessionCount : LongWord; safecall;
   function Get_MaxRwSessionCount : LongWord; safecall;
   function Get_RwSessionCount : LongWord; safecall;
   function Get_MaxPinLen : LongWord; safecall;
   function Get_MinPinLen : LongWord; safecall;
   function Get_TotalPublicMemory : LongWord; safecall;
   function Get_FreePublicMemory : LongWord; safecall;
   function Get_TotalPrivateMemory : LongWord; safecall;
   function Get_FreePrivateMemory : LongWord; safecall;
   function Get_HardwareVersionStr : WideString; safecall;
   function Get_HardwareVersionMajor : Integer; safecall;
   function Get_HardwareVersionMinor : Integer; safecall;
   function Get_FirmwareVersionStr : WideString; safecall;
   function Get_FirmwareVersionMajor : Integer; safecall;
   function Get_FirmwareVersionMinor : Integer; safecall;
   function Get_UtcTime : WideString; safecall;
    // TokenLabel :  
   property TokenLabel:WideString read Get_TokenLabel;
    // ManufacturerID :  
   property ManufacturerID:WideString read Get_ManufacturerID;
    // Model :  
   property Model:WideString read Get_Model;
    // SerialNumber :  
   property SerialNumber:WideString read Get_SerialNumber;
    // Flags :  
   property Flags:LongWord read Get_Flags;
    // MaxSessionCount :  
   property MaxSessionCount:LongWord read Get_MaxSessionCount;
    // SessionCount :  
   property SessionCount:LongWord read Get_SessionCount;
    // MaxRwSessionCount :  
   property MaxRwSessionCount:LongWord read Get_MaxRwSessionCount;
    // RwSessionCount :  
   property RwSessionCount:LongWord read Get_RwSessionCount;
    // MaxPinLen :  
   property MaxPinLen:LongWord read Get_MaxPinLen;
    // MinPinLen :  
   property MinPinLen:LongWord read Get_MinPinLen;
    // TotalPublicMemory :  
   property TotalPublicMemory:LongWord read Get_TotalPublicMemory;
    // FreePublicMemory :  
   property FreePublicMemory:LongWord read Get_FreePublicMemory;
    // TotalPrivateMemory :  
   property TotalPrivateMemory:LongWord read Get_TotalPrivateMemory;
    // FreePrivateMemory :  
   property FreePrivateMemory:LongWord read Get_FreePrivateMemory;
    // HardwareVersionStr :  
   property HardwareVersionStr:WideString read Get_HardwareVersionStr;
    // HardwareVersionMajor :  
   property HardwareVersionMajor:Integer read Get_HardwareVersionMajor;
    // HardwareVersionMinor :  
   property HardwareVersionMinor:Integer read Get_HardwareVersionMinor;
    // FirmwareVersionStr :  
   property FirmwareVersionStr:WideString read Get_FirmwareVersionStr;
    // FirmwareVersionMajor :  
   property FirmwareVersionMajor:Integer read Get_FirmwareVersionMajor;
    // FirmwareVersionMinor :  
   property FirmwareVersionMinor:Integer read Get_FirmwareVersionMinor;
    // UtcTime :  
   property UtcTime:WideString read Get_UtcTime;
  end;


// IlgcPKCS11TokenInfo : Informacje o tokenie PKCS#11

 IlgcPKCS11TokenInfoDisp = dispinterface
   ['{B4BB1EDB-4F32-4B0C-B390-566F02237A55}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // TokenLabel :  
   property TokenLabel:WideString  readonly dispid 17001;
    // ManufacturerID :  
   property ManufacturerID:WideString  readonly dispid 17002;
    // Model :  
   property Model:WideString  readonly dispid 17003;
    // SerialNumber :  
   property SerialNumber:WideString  readonly dispid 17004;
    // Flags :  
   property Flags:LongWord  readonly dispid 17005;
    // MaxSessionCount :  
   property MaxSessionCount:LongWord  readonly dispid 17006;
    // SessionCount :  
   property SessionCount:LongWord  readonly dispid 17007;
    // MaxRwSessionCount :  
   property MaxRwSessionCount:LongWord  readonly dispid 17008;
    // RwSessionCount :  
   property RwSessionCount:LongWord  readonly dispid 17009;
    // MaxPinLen :  
   property MaxPinLen:LongWord  readonly dispid 17010;
    // MinPinLen :  
   property MinPinLen:LongWord  readonly dispid 17011;
    // TotalPublicMemory :  
   property TotalPublicMemory:LongWord  readonly dispid 17012;
    // FreePublicMemory :  
   property FreePublicMemory:LongWord  readonly dispid 17013;
    // TotalPrivateMemory :  
   property TotalPrivateMemory:LongWord  readonly dispid 17014;
    // FreePrivateMemory :  
   property FreePrivateMemory:LongWord  readonly dispid 17015;
    // HardwareVersionStr :  
   property HardwareVersionStr:WideString  readonly dispid 17016;
    // HardwareVersionMajor :  
   property HardwareVersionMajor:Integer  readonly dispid 17017;
    // HardwareVersionMinor :  
   property HardwareVersionMinor:Integer  readonly dispid 17018;
    // FirmwareVersionStr :  
   property FirmwareVersionStr:WideString  readonly dispid 17019;
    // FirmwareVersionMajor :  
   property FirmwareVersionMajor:Integer  readonly dispid 17020;
    // FirmwareVersionMinor :  
   property FirmwareVersionMinor:Integer  readonly dispid 17021;
    // UtcTime :  
   property UtcTime:WideString  readonly dispid 17022;
  end;


// IlgcPKCS11SlotInfo : Informacje o slocie PKCS#11

 IlgcPKCS11SlotInfo = interface(IlgcBaseObject)
   ['{597607F4-CA0A-4722-BBC9-EB15ECAEBA49}']
   function Get_SlotID : LongWord; safecall;
   function Get_SlotDescription : WideString; safecall;
   function Get_ManufacturerID : WideString; safecall;
   function Get_Flags : LongWord; safecall;
   function Get_HardwareVersionStr : WideString; safecall;
   function Get_HardwareVersionMajor : Integer; safecall;
   function Get_HardwareVersionMinor : Integer; safecall;
   function Get_FirmwareVersionStr : WideString; safecall;
   function Get_FirmwareVersionMajor : Integer; safecall;
   function Get_FirmwareVersionMinor : Integer; safecall;
   function Get_TokenPresent : WordBool; safecall;
   function Get_TokenInfo : IDispatch; safecall;
    // SlotID :  
   property SlotID:LongWord read Get_SlotID;
    // SlotDescription :  
   property SlotDescription:WideString read Get_SlotDescription;
    // ManufacturerID :  
   property ManufacturerID:WideString read Get_ManufacturerID;
    // Flags :  
   property Flags:LongWord read Get_Flags;
    // HardwareVersionStr :  
   property HardwareVersionStr:WideString read Get_HardwareVersionStr;
    // HardwareVersionMajor :  
   property HardwareVersionMajor:Integer read Get_HardwareVersionMajor;
    // HardwareVersionMinor :  
   property HardwareVersionMinor:Integer read Get_HardwareVersionMinor;
    // FirmwareVersionStr :  
   property FirmwareVersionStr:WideString read Get_FirmwareVersionStr;
    // FirmwareVersionMajor :  
   property FirmwareVersionMajor:Integer read Get_FirmwareVersionMajor;
    // FirmwareVersionMinor :  
   property FirmwareVersionMinor:Integer read Get_FirmwareVersionMinor;
    // TokenPresent :  
   property TokenPresent:WordBool read Get_TokenPresent;
    // TokenInfo :  
   property TokenInfo:IDispatch read Get_TokenInfo;
  end;


// IlgcPKCS11SlotInfo : Informacje o slocie PKCS#11

 IlgcPKCS11SlotInfoDisp = dispinterface
   ['{597607F4-CA0A-4722-BBC9-EB15ECAEBA49}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // SlotID :  
   property SlotID:LongWord  readonly dispid 18001;
    // SlotDescription :  
   property SlotDescription:WideString  readonly dispid 18002;
    // ManufacturerID :  
   property ManufacturerID:WideString  readonly dispid 18003;
    // Flags :  
   property Flags:LongWord  readonly dispid 18004;
    // HardwareVersionStr :  
   property HardwareVersionStr:WideString  readonly dispid 18005;
    // HardwareVersionMajor :  
   property HardwareVersionMajor:Integer  readonly dispid 18006;
    // HardwareVersionMinor :  
   property HardwareVersionMinor:Integer  readonly dispid 18007;
    // FirmwareVersionStr :  
   property FirmwareVersionStr:WideString  readonly dispid 18008;
    // FirmwareVersionMajor :  
   property FirmwareVersionMajor:Integer  readonly dispid 18009;
    // FirmwareVersionMinor :  
   property FirmwareVersionMinor:Integer  readonly dispid 18010;
    // TokenPresent :  
   property TokenPresent:WordBool  readonly dispid 18011;
    // TokenInfo :  
   property TokenInfo:IDispatch  readonly dispid 18012;
  end;


// IlgcPKCS11Session : Objekt reprezentujacy sesje PKCS#11

 IlgcPKCS11Session = interface(IlgcBaseObject)
   ['{BB0C246D-BA87-44C4-B614-53FB1D4AE900}']
    // CheckActive : Sprawdz, czy sesja jest nadal aktywna 
   function CheckActive:WordBool;safecall;
    // Login : Zaloguj uzytkownika podanym PIN 
   procedure Login(PIN:WideString;UserType:lgcPKCS11UserType);safecall;
    // Logout : Wyloguj uzytkownika 
   procedure Logout;safecall;
   function Get_Handle : LongWord; safecall;
   function Get_SlotID : LongWord; safecall;
   function Get_State : lgcPKCS11SessionState; safecall;
   function Get_Flags : LongWord; safecall;
    // Handle : Uchwyt sesji PKCS#11 
   property Handle:LongWord read Get_Handle;
    // SlotID : Nr ID slotu 
   property SlotID:LongWord read Get_SlotID;
    // State : Pobranie statusu sesji 
   property State:lgcPKCS11SessionState read Get_State;
    // Flags : Pobranie flag sesni 
   property Flags:LongWord read Get_Flags;
  end;


// IlgcPKCS11Session : Objekt reprezentujacy sesje PKCS#11

 IlgcPKCS11SessionDisp = dispinterface
   ['{BB0C246D-BA87-44C4-B614-53FB1D4AE900}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // CheckActive : Sprawdz, czy sesja jest nadal aktywna 
   function CheckActive:WordBool;dispid 19001;
    // Login : Zaloguj uzytkownika podanym PIN 
   procedure Login(PIN:WideString;UserType:lgcPKCS11UserType);dispid 19002;
    // Logout : Wyloguj uzytkownika 
   procedure Logout;dispid 19003;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // Handle : Uchwyt sesji PKCS#11 
   property Handle:LongWord  readonly dispid 19004;
    // SlotID : Nr ID slotu 
   property SlotID:LongWord  readonly dispid 19005;
    // State : Pobranie statusu sesji 
   property State:lgcPKCS11SessionState  readonly dispid 19006;
    // Flags : Pobranie flag sesni 
   property Flags:LongWord  readonly dispid 19007;
  end;


// IlgcPKCS11Certificate : Certyfikat dla mechanizmu PKCS#11

 IlgcPKCS11Certificate = interface(IlgcCertificate)
   ['{A14EB3D8-25C5-4C22-B6AA-3E7EA2884D78}']
   function Get_Session : IDispatch; safecall;
    // Session : Pobranie sesji PKCS#11 nawiazanej dla danego zertyfikatu 
   property Session:IDispatch read Get_Session;
  end;


// IlgcPKCS11Certificate : Certyfikat dla mechanizmu PKCS#11

 IlgcPKCS11CertificateDisp = dispinterface
   ['{A14EB3D8-25C5-4C22-B6AA-3E7EA2884D78}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // ShowCertificateInfo :  
   procedure ShowCertificateInfo(WinHandle:OleVariant);dispid 13009;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // DisplayName :  
   property DisplayName:WideString  readonly dispid 13001;
    // Subject :  
   property Subject:WideString  readonly dispid 13002;
    // Issuer :  
   property Issuer:WideString  readonly dispid 13003;
    // SerialNoDec :  
   property SerialNoDec:WideString  readonly dispid 13004;
    // SerialNoHex :  
   property SerialNoHex:WideString  readonly dispid 13005;
    // ValidFrom :  
   property ValidFrom:OleVariant  readonly dispid 13006;
    // ValidTo :  
   property ValidTo:OleVariant  readonly dispid 13007;
    // PIN :  
   property PIN:WideString writeonly dispid 13008;
    // Session : Pobranie sesji PKCS#11 nawiazanej dla danego zertyfikatu 
   property Session:IDispatch  readonly dispid 20001;
  end;


// IlgcPKCS11CertificateSigner : Mechanizm podpisu kwalifikowanego za pomoca biblioteki PKCS#11/CryptokiAPI

 IlgcPKCS11CertificateSigner = interface(IlgcCertificateSigner)
   ['{02F51066-4584-476A-B0DB-CDFCA648B534}']
    // LoadLibrary : Zaladowanie biblioteki PKCS#11/CryptokiAPI ze wskazanego pliku 
   procedure LoadLibrary(LibFileName:WideString);safecall;
    // FreeLibrary : Zwolnienie zaladowanej biblioteki 
   procedure FreeLibrary;safecall;
    // GetInfo : Pobranie informacji o bibliotece PKCS#11 
   function GetInfo:IDispatch;safecall;
    // GetSlots : Pobranie listy slotow (z mozliwoscia oreslenia czy tylko sloty z obecnym tokenem 
   function GetSlots(WithToken:WordBool):IDispatch;safecall;
    // SessionStart : Rozpoczecie sesji dla danego certyfikatu 
   function SessionStart(Certificate:IDispatch):IDispatch;safecall;
    // SessionClose : Zamkniecie sesji dla wskazanego sertyfikatu lub indeksu sesji 
   procedure SessionClose(IndexOrSession:OleVariant);safecall;
    // SessionCloseAll : Zamknij wszystkie otwarte sesje 
   procedure SessionCloseAll;safecall;
   function Get_LibLoaded : WordBool; safecall;
   function Get_LibFileName : WideString; safecall;
   function Get_Sessions : IDispatch; safecall;
    // LibLoaded : Sprawdz czy biblioteka PKCS#11 zostala zaladowana 
   property LibLoaded:WordBool read Get_LibLoaded;
    // LibFileName : Pobranie nazwy pliku aktualnie zaladowanej biblioteki PKCS#11 
   property LibFileName:WideString read Get_LibFileName;
    // Sessions : Pobranie listy aktywnych sesji 
   property Sessions:IDispatch read Get_Sessions;
  end;


// IlgcPKCS11CertificateSigner : Mechanizm podpisu kwalifikowanego za pomoca biblioteki PKCS#11/CryptokiAPI

 IlgcPKCS11CertificateSignerDisp = dispinterface
   ['{02F51066-4584-476A-B0DB-CDFCA648B534}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // List : Pobranie listy certyfikatow 
   function List:IDispatch;dispid 14001;
    // UISelect : Wybor certyfikatu za pomoca systemowego okna dialogowego 
   function UISelect:IDispatch;dispid 14002;
    // LoadLibrary : Zaladowanie biblioteki PKCS#11/CryptokiAPI ze wskazanego pliku 
   procedure LoadLibrary(LibFileName:WideString);dispid 21001;
    // FreeLibrary : Zwolnienie zaladowanej biblioteki 
   procedure FreeLibrary;dispid 21002;
    // GetInfo : Pobranie informacji o bibliotece PKCS#11 
   function GetInfo:IDispatch;dispid 21003;
    // GetSlots : Pobranie listy slotow (z mozliwoscia oreslenia czy tylko sloty z obecnym tokenem 
   function GetSlots(WithToken:WordBool):IDispatch;dispid 21004;
    // SessionStart : Rozpoczecie sesji dla danego certyfikatu 
   function SessionStart(Certificate:IDispatch):IDispatch;dispid 21005;
    // SessionClose : Zamkniecie sesji dla wskazanego sertyfikatu lub indeksu sesji 
   procedure SessionClose(IndexOrSession:OleVariant);dispid 21006;
    // SessionCloseAll : Zamknij wszystkie otwarte sesje 
   procedure SessionCloseAll;dispid 21007;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // LibLoaded : Sprawdz czy biblioteka PKCS#11 zostala zaladowana 
   property LibLoaded:WordBool  readonly dispid 21008;
    // LibFileName : Pobranie nazwy pliku aktualnie zaladowanej biblioteki PKCS#11 
   property LibFileName:WideString  readonly dispid 21009;
    // Sessions : Pobranie listy aktywnych sesji 
   property Sessions:IDispatch  readonly dispid 21010;
  end;


// IlgcPKCS11Backend : Zaplecze PKCS#11

 IlgcPKCS11Backend = interface(IlgcBaseObject)
   ['{4B3C369B-79D4-4B26-862C-691E41E74AD1}']
    // CheckLibrary : Sprawdz, czy wskazany plik jest biblioteka PKCS#11/CryptokiAPI 
   function CheckLibrary(LibFileName:WideString):WordBool;safecall;
    // GetLibraryInfo : Pobranie informacji o skazanej bibliotece PKCS#11/CryptokiAPI 
   function GetLibraryInfo(LibFileName:WideString):IDispatch;safecall;
  end;


// IlgcPKCS11Backend : Zaplecze PKCS#11

 IlgcPKCS11BackendDisp = dispinterface
   ['{4B3C369B-79D4-4B26-862C-691E41E74AD1}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // CheckLibrary : Sprawdz, czy wskazany plik jest biblioteka PKCS#11/CryptokiAPI 
   function CheckLibrary(LibFileName:WideString):WordBool;dispid 22001;
    // GetLibraryInfo : Pobranie informacji o skazanej bibliotece PKCS#11/CryptokiAPI 
   function GetLibraryInfo(LibFileName:WideString):IDispatch;dispid 22002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
  end;


// IlgcXAdES : Mechanizm sygnatury XAdES

 IlgcXAdES = interface(IlgcBaseObject)
   ['{50DC95DF-A1C2-460D-8A46-D90BE7016886}']
   function Get_SHA1HashClass : WideString; safecall;
   procedure Set_SHA1HashClass(const Value:WideString); safecall;
   function Get_SHA256HashClass : WideString; safecall;
   procedure Set_SHA256HashClass(const Value:WideString); safecall;
   function Get_Base64EncoderClass : WideString; safecall;
   procedure Set_Base64EncoderClass(const Value:WideString); safecall;
   function Get_Signer : IDispatch; safecall;
   procedure Set_Signer(const Value:IDispatch); safecall;
   function Get_SignType : lgcSignHashType; safecall;
   procedure Set_SignType(const Value:lgcSignHashType); safecall;
   function Get_SerialNoFormat : lgcXAdESSerialNoFormat; safecall;
   procedure Set_SerialNoFormat(const Value:lgcXAdESSerialNoFormat); safecall;
   function Get_IncludeSigningTime : WordBool; safecall;
   procedure Set_IncludeSigningTime(const Value:WordBool); safecall;
   function Get_SigningTime : OleVariant; safecall;
   procedure Set_SigningTime(const Value:OleVariant); safecall;
    // SHA1HashClass : Pobranie nazwy klasy sterownika skrotu SHA1 
   property SHA1HashClass:WideString read Get_SHA1HashClass write Set_SHA1HashClass;
    // SHA256HashClass : Pobranie nazwy klasy sterownika skrotu SHA256 
   property SHA256HashClass:WideString read Get_SHA256HashClass write Set_SHA256HashClass;
    // Base64EncoderClass : Pobranie nazwy klasy sterownika kodera Base64 
   property Base64EncoderClass:WideString read Get_Base64EncoderClass write Set_Base64EncoderClass;
    // Signer : Pobranie obiektu mechanizmu podpisu certyfikatem 
   property Signer:IDispatch read Get_Signer write Set_Signer;
    // SignType : Pobranie rodzaju funkcji skrot uzytej w sygnaturze 
   property SignType:lgcSignHashType read Get_SignType write Set_SignType;
    // SerialNoFormat : Pobranie wariantu numeru seryjnego certyfikatu w sygnaturze (dziesietnie/szesnastkowo) 
   property SerialNoFormat:lgcXAdESSerialNoFormat read Get_SerialNoFormat write Set_SerialNoFormat;
    // IncludeSigningTime : Czy dodawac date i czas podpisu do sygnatury 
   property IncludeSigningTime:WordBool read Get_IncludeSigningTime write Set_IncludeSigningTime;
    // SigningTime : Data i czas podpisu do sygnatury 
   property SigningTime:OleVariant read Get_SigningTime write Set_SigningTime;
  end;


// IlgcXAdES : Mechanizm sygnatury XAdES

 IlgcXAdESDisp = dispinterface
   ['{50DC95DF-A1C2-460D-8A46-D90BE7016886}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // SHA1HashClass : Pobranie nazwy klasy sterownika skrotu SHA1 
   property SHA1HashClass:WideString dispid 23001;
    // SHA256HashClass : Pobranie nazwy klasy sterownika skrotu SHA256 
   property SHA256HashClass:WideString dispid 23002;
    // Base64EncoderClass : Pobranie nazwy klasy sterownika kodera Base64 
   property Base64EncoderClass:WideString dispid 23003;
    // Signer : Pobranie obiektu mechanizmu podpisu certyfikatem 
   property Signer:IDispatch dispid 23004;
    // SignType : Pobranie rodzaju funkcji skrot uzytej w sygnaturze 
   property SignType:lgcSignHashType dispid 23005;
    // SerialNoFormat : Pobranie wariantu numeru seryjnego certyfikatu w sygnaturze (dziesietnie/szesnastkowo) 
   property SerialNoFormat:lgcXAdESSerialNoFormat dispid 23006;
    // IncludeSigningTime : Czy dodawac date i czas podpisu do sygnatury 
   property IncludeSigningTime:WordBool dispid 23007;
    // SigningTime : Data i czas podpisu do sygnatury 
   property SigningTime:OleVariant dispid 23008;
  end;


// IlgcEDeklaracjaStatus : Obiekt reprezentujacy status przetwarzania e-deklaracji/JPK oraz ewentualnie UPO

 IlgcEDeklaracjaStatus = interface(IlgcBaseObject)
   ['{79E8257A-AE97-4D81-BE00-6B69700BDFCE}']
   function Get_NrRef : WideString; safecall;
   function Get_Status : Integer; safecall;
   function Get_Opis : WideString; safecall;
   function Get_PobranoUPO : WordBool; safecall;
   function Get_UPO : WideString; safecall;
   function Get_Timestamp : OleVariant; safecall;
   function Get_Szczegoly : WideString; safecall;
    // NrRef : Nr referencyjny deklaracji 
   property NrRef:WideString read Get_NrRef;
    // Status : Status przetwarzania 
   property Status:Integer read Get_Status;
    // Opis : Opis statusu przetwarzania 
   property Opis:WideString read Get_Opis;
    // PobranoUPO : Czy pobrano UPO 
   property PobranoUPO:WordBool read Get_PobranoUPO;
    // UPO : Zawartosc UPO 
   property UPO:WideString read Get_UPO;
    // Timestamp : Data i czas odpowiedzi 
   property Timestamp:OleVariant read Get_Timestamp;
    // Szczegoly : Szczegolowy opis 
   property Szczegoly:WideString read Get_Szczegoly;
  end;


// IlgcEDeklaracjaStatus : Obiekt reprezentujacy status przetwarzania e-deklaracji/JPK oraz ewentualnie UPO

 IlgcEDeklaracjaStatusDisp = dispinterface
   ['{79E8257A-AE97-4D81-BE00-6B69700BDFCE}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // NrRef : Nr referencyjny deklaracji 
   property NrRef:WideString  readonly dispid 24001;
    // Status : Status przetwarzania 
   property Status:Integer  readonly dispid 24002;
    // Opis : Opis statusu przetwarzania 
   property Opis:WideString  readonly dispid 24003;
    // PobranoUPO : Czy pobrano UPO 
   property PobranoUPO:WordBool  readonly dispid 24004;
    // UPO : Zawartosc UPO 
   property UPO:WideString  readonly dispid 24005;
    // Timestamp : Data i czas odpowiedzi 
   property Timestamp:OleVariant  readonly dispid 24006;
    // Szczegoly : Szczegolowy opis 
   property Szczegoly:WideString  readonly dispid 24007;
  end;


// IlgcEDeklaracja : Mechanizm obslugi e-deklaracji

 IlgcEDeklaracja = interface(IlgcBaseObject)
   ['{4C7E267D-D83D-4713-9120-CB57D7881F33}']
    // PodpiszCertyfikatem : Podpisz deklaracje certyfikatem 
   function PodpiszCertyfikatem(Dane:WideString;Certyfikat:IDispatch):WideString;safecall;
    // PodpiszDanymiAut : Podpisz deklaracje danymi autoryzujacymi 
   function PodpiszDanymiAut(Dane:WideString;ImiePierwsze:WideString;Nazwisko:WideString;Nip:WideString;DataUr:TDateTime;Kwota:Currency):WideString;safecall;
    // Wyslij : Wyslij podpisana deklaracje na podana bramke 
   function Wyslij(DanePodpisane:WideString;RodzajBramki:lgcEDekGateType;RodzajPodpisu:lgcEDekSignType):IDispatch;safecall;
    // PobierzUPO : Sprawdz status przetwarzania / pobierz UPO 
   function PobierzUPO(NrRef:WideString;RodzajBramki:lgcEDekGateType):IDispatch;safecall;
   function Get_XAdES : IDispatch; safecall;
   procedure Set_XAdES(const Value:IDispatch); safecall;
   function Get_XMLCanonizator : WideString; safecall;
   procedure Set_XMLCanonizator(const Value:WideString); safecall;
   function Get_EDekGate : WideString; safecall;
   procedure Set_EDekGate(const Value:WideString); safecall;
   function Get_Canonization : WordBool; safecall;
   procedure Set_Canonization(const Value:WordBool); safecall;
    // XAdES : Obiekt podpisu XAdES 
   property XAdES:IDispatch read Get_XAdES write Set_XAdES;
    // XMLCanonizator : Nazwa klasy obiektu mechanizmu C14N dla danych XML (w przypadku dostarczania danych XML deklaracji w postaci innej niz kanoniczna 
   property XMLCanonizator:WideString read Get_XMLCanonizator write Set_XMLCanonizator;
    // EDekGate : Klasa obslugi komunikacji SOAP bramki e-deklaracji 
   property EDekGate:WideString read Get_EDekGate write Set_EDekGate;
    // Canonization : Czy ma byc przeprowadzana C14N na danych e-deklaracji 
   property Canonization:WordBool read Get_Canonization write Set_Canonization;
  end;


// IlgcEDeklaracja : Mechanizm obslugi e-deklaracji

 IlgcEDeklaracjaDisp = dispinterface
   ['{4C7E267D-D83D-4713-9120-CB57D7881F33}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // PodpiszCertyfikatem : Podpisz deklaracje certyfikatem 
   function PodpiszCertyfikatem(Dane:WideString;Certyfikat:IDispatch):WideString;dispid 25001;
    // PodpiszDanymiAut : Podpisz deklaracje danymi autoryzujacymi 
   function PodpiszDanymiAut(Dane:WideString;ImiePierwsze:WideString;Nazwisko:WideString;Nip:WideString;DataUr:TDateTime;Kwota:Currency):WideString;dispid 25002;
    // Wyslij : Wyslij podpisana deklaracje na podana bramke 
   function Wyslij(DanePodpisane:WideString;RodzajBramki:lgcEDekGateType;RodzajPodpisu:lgcEDekSignType):IDispatch;dispid 25003;
    // PobierzUPO : Sprawdz status przetwarzania / pobierz UPO 
   function PobierzUPO(NrRef:WideString;RodzajBramki:lgcEDekGateType):IDispatch;dispid 25004;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // XAdES : Obiekt podpisu XAdES 
   property XAdES:IDispatch dispid 25005;
    // XMLCanonizator : Nazwa klasy obiektu mechanizmu C14N dla danych XML (w przypadku dostarczania danych XML deklaracji w postaci innej niz kanoniczna 
   property XMLCanonizator:WideString dispid 25006;
    // EDekGate : Klasa obslugi komunikacji SOAP bramki e-deklaracji 
   property EDekGate:WideString dispid 25007;
    // Canonization : Czy ma byc przeprowadzana C14N na danych e-deklaracji 
   property Canonization:WordBool dispid 25008;
  end;


// IlgcJPK : Mechanizm obslugi JPK

 IlgcJPK = interface(IlgcBaseObject)
   ['{5EB2F974-0D10-44D4-AA8F-E557BB91FF30}']
    // SignCertificate : Przygotowanie i podpis dokumentu JPK podanym certyfikatem kwalifikowanym z kluczem prywatnym 
   function SignCertificate(Certificate:IDispatch;GateType:lgcEDekGateType;AdHoc:WordBool;InputStream:OleVariant;OutputStream:OleVariant):WideString;safecall;
    // SignAuthData : Przygotowanie i podpis dokumentu JPK danymi autoryzujÄ…cymi 
   function SignAuthData(Nip:WideString;ImiePierwsze:WideString;Nazwisko:WideString;DataUr:TDateTime;Kwota:Currency;GateType:lgcEDekGateType;AdHoc:WordBool;InputStream:OleVariant;OutputStream:OleVariant):WideString;safecall;
    // Send : Wyslanie wczesniej przygotowanej deklaracji JPK i struktury InitUpload 
   function Send(InitUpload:WideString;EncryptedData:OleVariant;GateType:lgcEDekGateType;VerifySign:WordBool):WideString;safecall;
    // RequestUPO : Sprawdzenie statusu przetwarzania wysĹ‚anego dokumentu JPK i ewentualnie pobranie UPO 
   function RequestUPO(RefNo:WideString;GateType:lgcEDekGateType):IDispatch;safecall;
   function Get_Base64EncoderClass : WideString; safecall;
   procedure Set_Base64EncoderClass(const Value:WideString); safecall;
   function Get_AES256EncryptClass : WideString; safecall;
   procedure Set_AES256EncryptClass(const Value:WideString); safecall;
   function Get_MD5HashClass : WideString; safecall;
   procedure Set_MD5HashClass(const Value:WideString); safecall;
   function Get_SHA256HashClass : WideString; safecall;
   procedure Set_SHA256HashClass(const Value:WideString); safecall;
   function Get_ZipperClass : WideString; safecall;
   procedure Set_ZipperClass(const Value:WideString); safecall;
   function Get_RSAEncryptClass : WideString; safecall;
   procedure Set_RSAEncryptClass(const Value:WideString); safecall;
   function Get_RandomGeneratorClass : WideString; safecall;
   procedure Set_RandomGeneratorClass(const Value:WideString); safecall;
   function Get_XMLReaderClass : WideString; safecall;
   procedure Set_XMLReaderClass(const Value:WideString); safecall;
   function Get_RSAKeyProd : IDispatch; safecall;
   procedure Set_RSAKeyProd(const Value:IDispatch); safecall;
   function Get_RSAKeyTest : IDispatch; safecall;
   procedure Set_RSAKeyTest(const Value:IDispatch); safecall;
   function Get_XAdES : IDispatch; safecall;
   procedure Set_XAdES(const Value:IDispatch); safecall;
   function Get_HTTPClient : IDispatch; safecall;
   procedure Set_HTTPClient(const Value:IDispatch); safecall;
    // Base64EncoderClass : Klasa sterownika eknodera Base64 
   property Base64EncoderClass:WideString read Get_Base64EncoderClass write Set_Base64EncoderClass;
    // AES256EncryptClass : Klasa sterownika szyfrowania AES256 
   property AES256EncryptClass:WideString read Get_AES256EncryptClass write Set_AES256EncryptClass;
    // MD5HashClass : Klasa funkcji skrotu MD5 
   property MD5HashClass:WideString read Get_MD5HashClass write Set_MD5HashClass;
    // SHA256HashClass : Klasa funkcji skrotu SHA256 
   property SHA256HashClass:WideString read Get_SHA256HashClass write Set_SHA256HashClass;
    // ZipperClass : Klasa kompresora ZIP 
   property ZipperClass:WideString read Get_ZipperClass write Set_ZipperClass;
    // RSAEncryptClass : Klasa sterownika szyfrowania RSA 
   property RSAEncryptClass:WideString read Get_RSAEncryptClass write Set_RSAEncryptClass;
    // RandomGeneratorClass : Klasa generatora liczb pseudolosowych 
   property RandomGeneratorClass:WideString read Get_RandomGeneratorClass write Set_RandomGeneratorClass;
    // XMLReaderClass : Klasa czytnika XML 
   property XMLReaderClass:WideString read Get_XMLReaderClass write Set_XMLReaderClass;
    // RSAKeyProd : Klucz szyfrowania RSA dla bramki produkcyjnej 
   property RSAKeyProd:IDispatch read Get_RSAKeyProd write Set_RSAKeyProd;
    // RSAKeyTest : Klucz szyfrowania RSA dla bramki testowej 
   property RSAKeyTest:IDispatch read Get_RSAKeyTest write Set_RSAKeyTest;
    // XAdES : Objekt XAdES 
   property XAdES:IDispatch read Get_XAdES write Set_XAdES;
    // HTTPClient : Objekt klienta HTTPS 
   property HTTPClient:IDispatch read Get_HTTPClient write Set_HTTPClient;
  end;


// IlgcJPK : Mechanizm obslugi JPK

 IlgcJPKDisp = dispinterface
   ['{5EB2F974-0D10-44D4-AA8F-E557BB91FF30}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // SignCertificate : Przygotowanie i podpis dokumentu JPK podanym certyfikatem kwalifikowanym z kluczem prywatnym 
   function SignCertificate(Certificate:IDispatch;GateType:lgcEDekGateType;AdHoc:WordBool;InputStream:OleVariant;OutputStream:OleVariant):WideString;dispid 26001;
    // SignAuthData : Przygotowanie i podpis dokumentu JPK danymi autoryzujÄ…cymi 
   function SignAuthData(Nip:WideString;ImiePierwsze:WideString;Nazwisko:WideString;DataUr:TDateTime;Kwota:Currency;GateType:lgcEDekGateType;AdHoc:WordBool;InputStream:OleVariant;OutputStream:OleVariant):WideString;dispid 26002;
    // Send : Wyslanie wczesniej przygotowanej deklaracji JPK i struktury InitUpload 
   function Send(InitUpload:WideString;EncryptedData:OleVariant;GateType:lgcEDekGateType;VerifySign:WordBool):WideString;dispid 26003;
    // RequestUPO : Sprawdzenie statusu przetwarzania wysĹ‚anego dokumentu JPK i ewentualnie pobranie UPO 
   function RequestUPO(RefNo:WideString;GateType:lgcEDekGateType):IDispatch;dispid 26004;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // Base64EncoderClass : Klasa sterownika eknodera Base64 
   property Base64EncoderClass:WideString dispid 26005;
    // AES256EncryptClass : Klasa sterownika szyfrowania AES256 
   property AES256EncryptClass:WideString dispid 26006;
    // MD5HashClass : Klasa funkcji skrotu MD5 
   property MD5HashClass:WideString dispid 26007;
    // SHA256HashClass : Klasa funkcji skrotu SHA256 
   property SHA256HashClass:WideString dispid 26008;
    // ZipperClass : Klasa kompresora ZIP 
   property ZipperClass:WideString dispid 26009;
    // RSAEncryptClass : Klasa sterownika szyfrowania RSA 
   property RSAEncryptClass:WideString dispid 26010;
    // RandomGeneratorClass : Klasa generatora liczb pseudolosowych 
   property RandomGeneratorClass:WideString dispid 26011;
    // XMLReaderClass : Klasa czytnika XML 
   property XMLReaderClass:WideString dispid 26012;
    // RSAKeyProd : Klucz szyfrowania RSA dla bramki produkcyjnej 
   property RSAKeyProd:IDispatch dispid 26013;
    // RSAKeyTest : Klucz szyfrowania RSA dla bramki testowej 
   property RSAKeyTest:IDispatch dispid 26014;
    // XAdES : Objekt XAdES 
   property XAdES:IDispatch dispid 26015;
    // HTTPClient : Objekt klienta HTTPS 
   property HTTPClient:IDispatch dispid 26016;
  end;


// IlgcKSeFRequest : Obiekt reprezentujacy zadanie KSeF

 IlgcKSeFRequest = interface(IlgcObject)
   ['{7B4EF1CE-8FC8-433C-99E4-A446E6F62D98}']
    // GetAsJSON : Pobranie zadania w formie JSON 
   function GetAsJSON:WideString;safecall;
  end;


// IlgcKSeFRequest : Obiekt reprezentujacy zadanie KSeF

 IlgcKSeFRequestDisp = dispinterface
   ['{7B4EF1CE-8FC8-433C-99E4-A446E6F62D98}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // ListProps : Pobranie listy wlasciwosci obiektu 
   function ListProps:OleVariant;dispid 7009;
    // PropType : Pobranie typu danej wlasciwosci 
   function PropType(PropName:WideString):lgcPropertyType;dispid 7010;
    // ObjectPropClass : Pobranie nazwy klasy zadanej wlasciwosci typu object 
   function ObjectPropClass(PropName:WideString):WideString;dispid 7011;
    // SetObjectProp : Ustawienie wlasciwosci obiektu typu object o wskazanej nazwie 
   procedure SetObjectProp(Name:WideString;Value:OleVariant);dispid 7012;
    // GetObjectProp : Pobranie wasiwosci obiektu typu object o wskazanej nazwie 
   function GetObjectProp(Name:WideString):OleVariant;dispid 7013;
    // GetAsJSON : Pobranie zadania w formie JSON 
   function GetAsJSON:WideString;dispid 27001;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // ExtObject : Pobranie wkaznika wewnetrznego obiektu 
   property ExtObject:{!! Ppointer !!} OleVariant  readonly dispid 7001;
    // StringProp : Pogranie wlasciwosci obiektu typu string o wskazanej nazwie 
   property StringProp[Name:WideString]:WideString dispid 7002;
    // IntegerProp : Pogranie wlasciwosci obiektu typu int32 o wskazanej nazwie 
   property IntegerProp[Name:WideString]:Integer dispid 7003;
    // DoubleProp : Pogranie wlasciwosci obiektu typu double o wskazanej nazwie 
   property DoubleProp[Name:WideString]:Double dispid 7004;
    // CurrencyProp : Pogranie wlasciwosci obiektu typu CURRENCY o wskazanej nazwie 
   property CurrencyProp[Name:WideString]:Currency dispid 7005;
    // BooleanProp : Pogranie wlasciwosci obiektu typu bool o wskazanej nazwie 
   property BooleanProp[Name:WideString]:WordBool dispid 7006;
    // Int64Prop : Pogranie wlasciwosci obiektu typu int64 o wskazanej nazwie 
   property Int64Prop[Name:WideString]:Int64 dispid 7007;
    // DateProp : Pogranie wlasciwosci obiektu typu DATE o wskazanej nazwie 
   property DateProp[Name:WideString]:TDateTime dispid 7008;
  end;


// IlgcKSeFResponse : Obiekt reprezentujacy odpowiedz KSeF

 IlgcKSeFResponse = interface(IlgcObject)
   ['{9ED3DF16-92DA-4EDC-BC63-FC17CDDF9BDC}']
    // GetRawResponse : Pobranie odpowiedzi w formie JSON 
   function GetRawResponse:WideString;safecall;
  end;


// IlgcKSeFResponse : Obiekt reprezentujacy odpowiedz KSeF

 IlgcKSeFResponseDisp = dispinterface
   ['{9ED3DF16-92DA-4EDC-BC63-FC17CDDF9BDC}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // ListProps : Pobranie listy wlasciwosci obiektu 
   function ListProps:OleVariant;dispid 7009;
    // PropType : Pobranie typu danej wlasciwosci 
   function PropType(PropName:WideString):lgcPropertyType;dispid 7010;
    // ObjectPropClass : Pobranie nazwy klasy zadanej wlasciwosci typu object 
   function ObjectPropClass(PropName:WideString):WideString;dispid 7011;
    // SetObjectProp : Ustawienie wlasciwosci obiektu typu object o wskazanej nazwie 
   procedure SetObjectProp(Name:WideString;Value:OleVariant);dispid 7012;
    // GetObjectProp : Pobranie wasiwosci obiektu typu object o wskazanej nazwie 
   function GetObjectProp(Name:WideString):OleVariant;dispid 7013;
    // GetRawResponse : Pobranie odpowiedzi w formie JSON 
   function GetRawResponse:WideString;dispid 28001;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // ExtObject : Pobranie wkaznika wewnetrznego obiektu 
   property ExtObject:{!! Ppointer !!} OleVariant  readonly dispid 7001;
    // StringProp : Pogranie wlasciwosci obiektu typu string o wskazanej nazwie 
   property StringProp[Name:WideString]:WideString dispid 7002;
    // IntegerProp : Pogranie wlasciwosci obiektu typu int32 o wskazanej nazwie 
   property IntegerProp[Name:WideString]:Integer dispid 7003;
    // DoubleProp : Pogranie wlasciwosci obiektu typu double o wskazanej nazwie 
   property DoubleProp[Name:WideString]:Double dispid 7004;
    // CurrencyProp : Pogranie wlasciwosci obiektu typu CURRENCY o wskazanej nazwie 
   property CurrencyProp[Name:WideString]:Currency dispid 7005;
    // BooleanProp : Pogranie wlasciwosci obiektu typu bool o wskazanej nazwie 
   property BooleanProp[Name:WideString]:WordBool dispid 7006;
    // Int64Prop : Pogranie wlasciwosci obiektu typu int64 o wskazanej nazwie 
   property Int64Prop[Name:WideString]:Int64 dispid 7007;
    // DateProp : Pogranie wlasciwosci obiektu typu DATE o wskazanej nazwie 
   property DateProp[Name:WideString]:TDateTime dispid 7008;
  end;


// IlgcKSeFBase : Podstawa obslugi KSeF

 IlgcKSeFBase = interface(IlgcBaseObject)
   ['{452578AC-F2AE-4771-9FCF-5F4DC66021CD}']
   function Get_RSAEncryptClass : WideString; safecall;
   procedure Set_RSAEncryptClass(const Value:WideString); safecall;
   function Get_Base64EncoderClass : WideString; safecall;
   procedure Set_Base64EncoderClass(const Value:WideString); safecall;
   function Get_AES256EncryptClass : WideString; safecall;
   procedure Set_AES256EncryptClass(const Value:WideString); safecall;
   function Get_SHA256HashClass : WideString; safecall;
   procedure Set_SHA256HashClass(const Value:WideString); safecall;
   function Get_RandomGeneratorClass : WideString; safecall;
   procedure Set_RandomGeneratorClass(const Value:WideString); safecall;
   function Get_XAdES : IDispatch; safecall;
   procedure Set_XAdES(const Value:IDispatch); safecall;
   function Get_HTTPClient : IDispatch; safecall;
   procedure Set_HTTPClient(const Value:IDispatch); safecall;
   function Get_GateType : lgcKSeFGateType; safecall;
   procedure Set_GateType(const Value:lgcKSeFGateType); safecall;
   function Get_Nip : WideString; safecall;
   procedure Set_Nip(const Value:WideString); safecall;
   function Get_FormCode : Integer; safecall;
   procedure Set_FormCode(const Value:Integer); safecall;
   function Get_FormCodeSystemCode : WideString; safecall;
   procedure Set_FormCodeSystemCode(const Value:WideString); safecall;
   function Get_FormCodeSchemaVersion : WideString; safecall;
   procedure Set_FormCodeSchemaVersion(const Value:WideString); safecall;
   function Get_FormCodeTargetNamespace : WideString; safecall;
   procedure Set_FormCodeTargetNamespace(const Value:WideString); safecall;
   function Get_FormCodeValue : WideString; safecall;
   procedure Set_FormCodeValue(const Value:WideString); safecall;
   function Get_Certificate : IDispatch; safecall;
   procedure Set_Certificate(const Value:IDispatch); safecall;
   function Get_CertificateAuthType : lgcKSeFCertificateAuthType; safecall;
   procedure Set_CertificateAuthType(const Value:lgcKSeFCertificateAuthType); safecall;
   function Get_Token : WideString; safecall;
   procedure Set_Token(const Value:WideString); safecall;
   function Get_Encryption : WordBool; safecall;
   procedure Set_Encryption(const Value:WordBool); safecall;
   function Get_SessionToken : WideString; safecall;
   function Get_SessionActive : WordBool; safecall;
   function Get_RSAKeyProd : IDispatch; safecall;
   procedure Set_RSAKeyProd(const Value:IDispatch); safecall;
   function Get_RSAKeyDemo : IDispatch; safecall;
   procedure Set_RSAKeyDemo(const Value:IDispatch); safecall;
   function Get_RSAKeyTest : IDispatch; safecall;
   procedure Set_RSAKeyTest(const Value:IDispatch); safecall;
    // GenerateAESKey : Generuj klucz AES dla dodatkowego szyfrowania. W razie potrzeby wywolywane automatycznie przy polaczeniu 
   procedure GenerateAESKey;safecall;
    // CreateKSeFObject : Tworzenie obiektu KSeF o podanej nazwie klasy 
   function CreateKSeFObject(ClsName:WideString):IDispatch;safecall;
    // RSAEncryptClass : Klasa sterownika szyfrowania RSA 
   property RSAEncryptClass:WideString read Get_RSAEncryptClass write Set_RSAEncryptClass;
    // Base64EncoderClass : Klasa enkodera Base64 
   property Base64EncoderClass:WideString read Get_Base64EncoderClass write Set_Base64EncoderClass;
    // AES256EncryptClass : Klasa sterownika szyfrowania AES256 
   property AES256EncryptClass:WideString read Get_AES256EncryptClass write Set_AES256EncryptClass;
    // SHA256HashClass : Klasa funkcji skrĂłtu SHA256 
   property SHA256HashClass:WideString read Get_SHA256HashClass write Set_SHA256HashClass;
    // RandomGeneratorClass : Klasa generatora liczb pseudolosowych 
   property RandomGeneratorClass:WideString read Get_RandomGeneratorClass write Set_RandomGeneratorClass;
    // XAdES : Objekt XAdES dla podpisu certyfikatem kwalifikowanym struktury InitUpload 
   property XAdES:IDispatch read Get_XAdES write Set_XAdES;
    // HTTPClient : Obiekt poĹ‚Ä…czenia HTTPS 
   property HTTPClient:IDispatch read Get_HTTPClient write Set_HTTPClient;
    // GateType : Rodzaj bramki (produkcyjna/demo/testowa) 
   property GateType:lgcKSeFGateType read Get_GateType write Set_GateType;
    // Nip : Nr NIP podmiotu 
   property Nip:WideString read Get_Nip write Set_Nip;
    // FormCode : Predefiniowany rodzaj FA 
   property FormCode:Integer read Get_FormCode write Set_FormCode;
    // FormCodeSystemCode :  
   property FormCodeSystemCode:WideString read Get_FormCodeSystemCode write Set_FormCodeSystemCode;
    // FormCodeSchemaVersion :  
   property FormCodeSchemaVersion:WideString read Get_FormCodeSchemaVersion write Set_FormCodeSchemaVersion;
    // FormCodeTargetNamespace :  
   property FormCodeTargetNamespace:WideString read Get_FormCodeTargetNamespace write Set_FormCodeTargetNamespace;
    // FormCodeValue :  
   property FormCodeValue:WideString read Get_FormCodeValue write Set_FormCodeValue;
    // Certificate : Certyfikat kwalifikowany z kluczem prywatnym do zainicjowania sesji interaktywnej oraz podpisania struktury InitUpload wysyĹ‚ki wsadowej 
   property Certificate:IDispatch read Get_Certificate write Set_Certificate;
    // CertificateAuthType : Rodzaj autoryzacji certyfikatu kwalifikowanego lub pieczÄ™ci elektronicznej 
   property CertificateAuthType:lgcKSeFCertificateAuthType read Get_CertificateAuthType write Set_CertificateAuthType;
    // Token : Token do nawiÄ…zania sesji interaktywnej 
   property Token:WideString read Get_Token write Set_Token;
    // Encryption : Aktywacja opcionalnego szyfrowania AES 
   property Encryption:WordBool read Get_Encryption write Set_Encryption;
    // SessionToken : Token sesji 
   property SessionToken:WideString read Get_SessionToken;
    // SessionActive : Czy sesjia aktywna 
   property SessionActive:WordBool read Get_SessionActive;
    // RSAKeyProd : Klucz szyfrowania RSA dla bramki produkcyjnej 
   property RSAKeyProd:IDispatch read Get_RSAKeyProd write Set_RSAKeyProd;
    // RSAKeyDemo : Klucz szyfrowania RSA dla bramki demo 
   property RSAKeyDemo:IDispatch read Get_RSAKeyDemo write Set_RSAKeyDemo;
    // RSAKeyTest : Klucz szyfrowania RSA dla bramki testowj 
   property RSAKeyTest:IDispatch read Get_RSAKeyTest write Set_RSAKeyTest;
  end;


// IlgcKSeFBase : Podstawa obslugi KSeF

 IlgcKSeFBaseDisp = dispinterface
   ['{452578AC-F2AE-4771-9FCF-5F4DC66021CD}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // GenerateAESKey : Generuj klucz AES dla dodatkowego szyfrowania. W razie potrzeby wywolywane automatycznie przy polaczeniu 
   procedure GenerateAESKey;dispid 29024;
    // CreateKSeFObject : Tworzenie obiektu KSeF o podanej nazwie klasy 
   function CreateKSeFObject(ClsName:WideString):IDispatch;dispid 29025;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // RSAEncryptClass : Klasa sterownika szyfrowania RSA 
   property RSAEncryptClass:WideString dispid 29001;
    // Base64EncoderClass : Klasa enkodera Base64 
   property Base64EncoderClass:WideString dispid 29002;
    // AES256EncryptClass : Klasa sterownika szyfrowania AES256 
   property AES256EncryptClass:WideString dispid 29003;
    // SHA256HashClass : Klasa funkcji skrĂłtu SHA256 
   property SHA256HashClass:WideString dispid 29004;
    // RandomGeneratorClass : Klasa generatora liczb pseudolosowych 
   property RandomGeneratorClass:WideString dispid 29005;
    // XAdES : Objekt XAdES dla podpisu certyfikatem kwalifikowanym struktury InitUpload 
   property XAdES:IDispatch dispid 29006;
    // HTTPClient : Obiekt poĹ‚Ä…czenia HTTPS 
   property HTTPClient:IDispatch dispid 29007;
    // GateType : Rodzaj bramki (produkcyjna/demo/testowa) 
   property GateType:lgcKSeFGateType dispid 29008;
    // Nip : Nr NIP podmiotu 
   property Nip:WideString dispid 29009;
    // FormCode : Predefiniowany rodzaj FA 
   property FormCode:Integer dispid 29010;
    // FormCodeSystemCode :  
   property FormCodeSystemCode:WideString dispid 29011;
    // FormCodeSchemaVersion :  
   property FormCodeSchemaVersion:WideString dispid 29012;
    // FormCodeTargetNamespace :  
   property FormCodeTargetNamespace:WideString dispid 29013;
    // FormCodeValue :  
   property FormCodeValue:WideString dispid 29014;
    // Certificate : Certyfikat kwalifikowany z kluczem prywatnym do zainicjowania sesji interaktywnej oraz podpisania struktury InitUpload wysyĹ‚ki wsadowej 
   property Certificate:IDispatch dispid 29015;
    // CertificateAuthType : Rodzaj autoryzacji certyfikatu kwalifikowanego lub pieczÄ™ci elektronicznej 
   property CertificateAuthType:lgcKSeFCertificateAuthType dispid 29016;
    // Token : Token do nawiÄ…zania sesji interaktywnej 
   property Token:WideString dispid 29017;
    // Encryption : Aktywacja opcionalnego szyfrowania AES 
   property Encryption:WordBool dispid 29018;
    // SessionToken : Token sesji 
   property SessionToken:WideString  readonly dispid 29019;
    // SessionActive : Czy sesjia aktywna 
   property SessionActive:WordBool  readonly dispid 29020;
    // RSAKeyProd : Klucz szyfrowania RSA dla bramki produkcyjnej 
   property RSAKeyProd:IDispatch dispid 29021;
    // RSAKeyDemo : Klucz szyfrowania RSA dla bramki demo 
   property RSAKeyDemo:IDispatch dispid 29022;
    // RSAKeyTest : Klucz szyfrowania RSA dla bramki testowj 
   property RSAKeyTest:IDispatch dispid 29023;
  end;


// IlgcKSeF_2_6_0 : Implementacja KSeF w wersji 2.6.0

 IlgcKSeF_2_6_0 = interface(IlgcKSeFBase)
   ['{C44AAC54-CE22-421C-B159-B864DF2EB753}']
    // SessionInitSigned : Inicjalizacja sesji za pomoca certyfikatu kwalifikowanego lub pieczeci 
   function SessionInitSigned:IDispatch;safecall;
    // SessionInitToken : Inicjalizacja sesji za pomoca tokena 
   function SessionInitToken:IDispatch;safecall;
    // SessionChalangePZ : Wygenerowanie struktury InitSession w celu podpisania przy pomocy Profilu Zaufanego 
   function SessionChalangePZ:WideString;safecall;
    // SessionInitPZ : Inicjalizacja sesji za pomoca wczeĹ›niej wygenerowanej struktury InitSession, podpisanej przy pomocy PZ 
   function SessionInitPZ(SignedInit:WideString):IDispatch;safecall;
    // SessionStatus : Sprawdzenie statusu aktywnej sesji interaktywnej 
   function SessionStatus(ReferenceNumber:WideString;PageSize:Integer;PageOffset:Integer;IncludeDetails:WordBool):IDispatch;safecall;
    // SessionTerminate : Wymuszenie zamkniÄ™cia aktywnej sesji 
   function SessionTerminate(Force:WordBool):IDispatch;safecall;
    // SessionGenerateInternalIdentifier : Wygenerowanie identyfikatora wewnetrznego 
   function SessionGenerateInternalIdentifier(InputDigitsSequence:WideString):IDispatch;safecall;
    // InvoiceGet : Pobranie faktury po numerze identyfikacyjnym KSeF 
   procedure InvoiceGet(KSeFReferenceNumber:WideString;OutputStream:OleVariant);safecall;
    // InvoiceSend : WysyĹ‚ka faktury 
   function InvoiceSend(DataStream:OleVariant):IDispatch;safecall;
    // InvoiceStatus : Sprawdzenie statusu wysĹ‚anej faktury 
   function InvoiceStatus(InvoiceElementReferenceNumber:WideString;KSeFNumberVariant:lgcKSeFNumberVariant):IDispatch;safecall;
    // InvoiceVisibilityHide : Ukrywanie wybranej faktury 
   function InvoiceVisibilityHide(KSeFReferenceNumber:WideString;HidingReason:WideString):IDispatch;safecall;
    // InvoiceVisibilityShow : Anulowanie ukrycia wybranej faktury 
   function InvoiceVisibilityShow(KSeFReferenceNumber:WideString;HidingCancelationReason:WideString):IDispatch;safecall;
    // InvoiceVisibilityStatus : Sprawdzenie statusu operacji ukrycia/odsĹ‚onienia faktury 
   function InvoiceVisibilityStatus(HidingElementReferenceNumber:WideString;KSeFNumberVariant:lgcKSeFNumberVariant):IDispatch;safecall;
    // InvoiceVisibility : Sprawdzenie statusu widocznoĹ›ci faktury 
   function InvoiceVisibility(KSeFReferenceNumber:WideString;KSeFNumberVariant:lgcKSeFNumberVariant):IDispatch;safecall;
    // InvoiceScamCancel : Wycofanie faktury scamowej 
   function InvoiceScamCancel(KSeFReferenceNumber:WideString;ReportCancelationReason:WideString):IDispatch;safecall;
    // InvoiceScamReport : ZgĹ‚oszenie faktury scamowej 
   function InvoiceScamReport(KSeFReferenceNumber:WideString;ReportReason:WideString):IDispatch;safecall;
    // InvoiceScamStatus : Pobranie statusu zgĹ‚oszenia naduĹĽycia faktury 
   function InvoiceScamStatus(ScamElementReferenceNumber:WideString):IDispatch;safecall;
    // InvoiceScam : Pobranie zgĹ‚oszenia naduĹĽycia faktury 
   function InvoiceScam(KSeFReferenceNumber:WideString):IDispatch;safecall;
    // CredentialsAccountingGrant : Nadanie poĹ›wiadczeĹ„ dla biura rachunkowego 
   function CredentialsAccountingGrant(GrantAccountingCredentialsRequest:IDispatch):IDispatch;safecall;
    // CredentialsAccountingRevoke : Odebranie poĹ›wiadczeĹ„ biur rachunkowych 
   function CredentialsAccountingRevoke(RevokeAccountingCredentialsRequest:IDispatch):IDispatch;safecall;
    // CredentialsContextGrant : Nadanie poĹ›wiadczeĹ„ kontekstowych 
   function CredentialsContextGrant(GrantContextCredentialsRequest:IDispatch):IDispatch;safecall;
    // CredentialsContextRevoke : Odebranie poĹ›wiadczeĹ„ kontekstowych 
   function CredentialsContextRevoke(RevokeContextCredentialsRequest:IDispatch):IDispatch;safecall;
    // CredentialsGenerateToken : Generowanie tokena autoryzacyjnego 
   function CredentialsGenerateToken(GenerateTokenRequest:IDispatch):IDispatch;safecall;
    // CredentialsGrant : Nadanie poĹ›wiadczeĹ„ 
   function CredentialsGrant(GrantCredentialsRequest:IDispatch):IDispatch;safecall;
    // CredentialsRevoke : Odebranie poĹ›wiadczeĹ„ 
   function CredentialsRevoke(RevokeCredentialsRequest:IDispatch):IDispatch;safecall;
    // CredentialsRevokeToken : UsuniÄ™cie tokena autoryzacyjnego 
   function CredentialsRevokeToken(RevokeTokenRequest:IDispatch):IDispatch;safecall;
    // CredentialsStatus : Sprawdzenie statusu poĹ›wiadczeĹ„ 
   function CredentialsStatus(CredentialsElementReferenceNumber:WideString):IDispatch;safecall;
    // QueryCredentialContextSync : Zapytanie o poĹ›wiadczenia nadane przez jednostkÄ™ nadrzÄ™dnÄ… 
   function QueryCredentialContextSync(ContextNip:WideString;SourceIdentifier:WideString;TargetIdentifier:WideString):IDispatch;safecall;
    // QueryCredentialSync : Zapytanie o poĹ›wiadczenia 
   function QueryCredentialSync(QuerySyncCredentialsRequest:IDispatch):IDispatch;safecall;
    // QueryInvoiceSync : Zapytanie o faktury (synchroniczne) 
   function QueryInvoiceSync(QueryCriteria:IDispatch;PageSize:Integer;PageOffset:Integer):IDispatch;safecall;
    // QueryInvoiceAsyncInit : Inicjalizacja asynchronicznego zapytania o faktury 
   function QueryInvoiceAsyncInit(QueryCriteria:IDispatch):IDispatch;safecall;
    // QueryInvoiceAsyncStatus : Sprawdzenie statusu asynchronicznego zapytania o faktury 
   function QueryInvoiceAsyncStatus(QueryElementReferenceNumber:WideString):IDispatch;safecall;
    // QueryInvoiceAsyncFetch : Pobranie wynikĂłw asynchronicznego zapytania o faktury 
   procedure QueryInvoiceAsyncFetch(QueryElementReferenceNumber:WideString;PartElementReferenceNumber:WideString;Response:OleVariant);safecall;
    // QueryInvoiceAsyncFetch2 : Pobranie wynikĂłw asynchronicznego zapytania o faktury 
   procedure QueryInvoiceAsyncFetch2(StatusResponse:IDispatch;PartIndex:Integer;Response:OleVariant);safecall;
    // PaymentIdentifierGetReferenceNumbers : Pobranie listy faktur dla identyfikatora pĹ‚atnoĹ›ci 
   function PaymentIdentifierGetReferenceNumbers(PaymentIdentifier:WideString):IDispatch;safecall;
    // PaymentIdentifierRequest : Wygenerowanie identyfikatora pĹ‚atnoĹ›ci 
   function PaymentIdentifierRequest(KsefReferenceNumberList:OleVariant):IDispatch;safecall;
    // CommonInvoiceKSeF : Pobranie faktury z repozytorium KSeF - kryteria oparte o numer KSeF 
   procedure CommonInvoiceKSeF(InvoiceRequest:IDispatch;OutStream:OleVariant;GateType:lgcKSeFGateType);safecall;
    // CommonDownload : Pobranie faktury z repozytorium KSeF na podstawie kryteriĂłw opartych o numer KSeF i skrĂłt dokumentu 
   procedure CommonDownload(KSeFReferenceNumber:WideString;DownloadRequest:IDispatch;OutStream:OleVariant;GateType:lgcKSeFGateType);safecall;
    // CommonStatus : Interfejs wspĂłlny pobrania statusu przetwarzania wsadowego 
   function CommonStatus(ReferenceNumber:WideString;GateType:lgcKSeFGateType):IDispatch;safecall;
    // CommonVerification : Weryfikacja faktury 
   function CommonVerification(KSeFReferenceNumber:WideString;VerificationRequest:IDispatch;GateType:lgcKSeFGateType):IDispatch;safecall;
    // BatchSign : Przygotowanie danych i podpisanie struktury InitUpload 
   function BatchSign(ZIPDataStream:OleVariant;PZ:WordBool;EncryptedStream:OleVariant;ZIPFileName:WideString;PartFileName:WideString):WideString;safecall;
    // BatchSend : WysĹ‚anie uprzednio przygotowanych danych faktur i podpisanej struktury InitUpload 
   function BatchSend(PartStream:OleVariant;InitUpload:WideString):WideString;safecall;
  end;


// IlgcKSeF_2_6_0 : Implementacja KSeF w wersji 2.6.0

 IlgcKSeF_2_6_0Disp = dispinterface
   ['{C44AAC54-CE22-421C-B159-B864DF2EB753}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // GenerateAESKey : Generuj klucz AES dla dodatkowego szyfrowania. W razie potrzeby wywolywane automatycznie przy polaczeniu 
   procedure GenerateAESKey;dispid 29024;
    // CreateKSeFObject : Tworzenie obiektu KSeF o podanej nazwie klasy 
   function CreateKSeFObject(ClsName:WideString):IDispatch;dispid 29025;
    // SessionInitSigned : Inicjalizacja sesji za pomoca certyfikatu kwalifikowanego lub pieczeci 
   function SessionInitSigned:IDispatch;dispid 29051;
    // SessionInitToken : Inicjalizacja sesji za pomoca tokena 
   function SessionInitToken:IDispatch;dispid 29052;
    // SessionChalangePZ : Wygenerowanie struktury InitSession w celu podpisania przy pomocy Profilu Zaufanego 
   function SessionChalangePZ:WideString;dispid 29053;
    // SessionInitPZ : Inicjalizacja sesji za pomoca wczeĹ›niej wygenerowanej struktury InitSession, podpisanej przy pomocy PZ 
   function SessionInitPZ(SignedInit:WideString):IDispatch;dispid 29054;
    // SessionStatus : Sprawdzenie statusu aktywnej sesji interaktywnej 
   function SessionStatus(ReferenceNumber:WideString;PageSize:Integer;PageOffset:Integer;IncludeDetails:WordBool):IDispatch;dispid 29055;
    // SessionTerminate : Wymuszenie zamkniÄ™cia aktywnej sesji 
   function SessionTerminate(Force:WordBool):IDispatch;dispid 29056;
    // SessionGenerateInternalIdentifier : Wygenerowanie identyfikatora wewnetrznego 
   function SessionGenerateInternalIdentifier(InputDigitsSequence:WideString):IDispatch;dispid 29057;
    // InvoiceGet : Pobranie faktury po numerze identyfikacyjnym KSeF 
   procedure InvoiceGet(KSeFReferenceNumber:WideString;OutputStream:OleVariant);dispid 29058;
    // InvoiceSend : WysyĹ‚ka faktury 
   function InvoiceSend(DataStream:OleVariant):IDispatch;dispid 29059;
    // InvoiceStatus : Sprawdzenie statusu wysĹ‚anej faktury 
   function InvoiceStatus(InvoiceElementReferenceNumber:WideString;KSeFNumberVariant:lgcKSeFNumberVariant):IDispatch;dispid 29060;
    // InvoiceVisibilityHide : Ukrywanie wybranej faktury 
   function InvoiceVisibilityHide(KSeFReferenceNumber:WideString;HidingReason:WideString):IDispatch;dispid 29061;
    // InvoiceVisibilityShow : Anulowanie ukrycia wybranej faktury 
   function InvoiceVisibilityShow(KSeFReferenceNumber:WideString;HidingCancelationReason:WideString):IDispatch;dispid 29062;
    // InvoiceVisibilityStatus : Sprawdzenie statusu operacji ukrycia/odsĹ‚onienia faktury 
   function InvoiceVisibilityStatus(HidingElementReferenceNumber:WideString;KSeFNumberVariant:lgcKSeFNumberVariant):IDispatch;dispid 29063;
    // InvoiceVisibility : Sprawdzenie statusu widocznoĹ›ci faktury 
   function InvoiceVisibility(KSeFReferenceNumber:WideString;KSeFNumberVariant:lgcKSeFNumberVariant):IDispatch;dispid 29064;
    // InvoiceScamCancel : Wycofanie faktury scamowej 
   function InvoiceScamCancel(KSeFReferenceNumber:WideString;ReportCancelationReason:WideString):IDispatch;dispid 29065;
    // InvoiceScamReport : ZgĹ‚oszenie faktury scamowej 
   function InvoiceScamReport(KSeFReferenceNumber:WideString;ReportReason:WideString):IDispatch;dispid 29066;
    // InvoiceScamStatus : Pobranie statusu zgĹ‚oszenia naduĹĽycia faktury 
   function InvoiceScamStatus(ScamElementReferenceNumber:WideString):IDispatch;dispid 29067;
    // InvoiceScam : Pobranie zgĹ‚oszenia naduĹĽycia faktury 
   function InvoiceScam(KSeFReferenceNumber:WideString):IDispatch;dispid 29068;
    // CredentialsAccountingGrant : Nadanie poĹ›wiadczeĹ„ dla biura rachunkowego 
   function CredentialsAccountingGrant(GrantAccountingCredentialsRequest:IDispatch):IDispatch;dispid 29069;
    // CredentialsAccountingRevoke : Odebranie poĹ›wiadczeĹ„ biur rachunkowych 
   function CredentialsAccountingRevoke(RevokeAccountingCredentialsRequest:IDispatch):IDispatch;dispid 29070;
    // CredentialsContextGrant : Nadanie poĹ›wiadczeĹ„ kontekstowych 
   function CredentialsContextGrant(GrantContextCredentialsRequest:IDispatch):IDispatch;dispid 29071;
    // CredentialsContextRevoke : Odebranie poĹ›wiadczeĹ„ kontekstowych 
   function CredentialsContextRevoke(RevokeContextCredentialsRequest:IDispatch):IDispatch;dispid 29072;
    // CredentialsGenerateToken : Generowanie tokena autoryzacyjnego 
   function CredentialsGenerateToken(GenerateTokenRequest:IDispatch):IDispatch;dispid 29073;
    // CredentialsGrant : Nadanie poĹ›wiadczeĹ„ 
   function CredentialsGrant(GrantCredentialsRequest:IDispatch):IDispatch;dispid 29074;
    // CredentialsRevoke : Odebranie poĹ›wiadczeĹ„ 
   function CredentialsRevoke(RevokeCredentialsRequest:IDispatch):IDispatch;dispid 29075;
    // CredentialsRevokeToken : UsuniÄ™cie tokena autoryzacyjnego 
   function CredentialsRevokeToken(RevokeTokenRequest:IDispatch):IDispatch;dispid 29076;
    // CredentialsStatus : Sprawdzenie statusu poĹ›wiadczeĹ„ 
   function CredentialsStatus(CredentialsElementReferenceNumber:WideString):IDispatch;dispid 29077;
    // QueryCredentialContextSync : Zapytanie o poĹ›wiadczenia nadane przez jednostkÄ™ nadrzÄ™dnÄ… 
   function QueryCredentialContextSync(ContextNip:WideString;SourceIdentifier:WideString;TargetIdentifier:WideString):IDispatch;dispid 29078;
    // QueryCredentialSync : Zapytanie o poĹ›wiadczenia 
   function QueryCredentialSync(QuerySyncCredentialsRequest:IDispatch):IDispatch;dispid 29079;
    // QueryInvoiceSync : Zapytanie o faktury (synchroniczne) 
   function QueryInvoiceSync(QueryCriteria:IDispatch;PageSize:Integer;PageOffset:Integer):IDispatch;dispid 29080;
    // QueryInvoiceAsyncInit : Inicjalizacja asynchronicznego zapytania o faktury 
   function QueryInvoiceAsyncInit(QueryCriteria:IDispatch):IDispatch;dispid 29081;
    // QueryInvoiceAsyncStatus : Sprawdzenie statusu asynchronicznego zapytania o faktury 
   function QueryInvoiceAsyncStatus(QueryElementReferenceNumber:WideString):IDispatch;dispid 29082;
    // QueryInvoiceAsyncFetch : Pobranie wynikĂłw asynchronicznego zapytania o faktury 
   procedure QueryInvoiceAsyncFetch(QueryElementReferenceNumber:WideString;PartElementReferenceNumber:WideString;Response:OleVariant);dispid 29083;
    // QueryInvoiceAsyncFetch2 : Pobranie wynikĂłw asynchronicznego zapytania o faktury 
   procedure QueryInvoiceAsyncFetch2(StatusResponse:IDispatch;PartIndex:Integer;Response:OleVariant);dispid 29084;
    // PaymentIdentifierGetReferenceNumbers : Pobranie listy faktur dla identyfikatora pĹ‚atnoĹ›ci 
   function PaymentIdentifierGetReferenceNumbers(PaymentIdentifier:WideString):IDispatch;dispid 29085;
    // PaymentIdentifierRequest : Wygenerowanie identyfikatora pĹ‚atnoĹ›ci 
   function PaymentIdentifierRequest(KsefReferenceNumberList:OleVariant):IDispatch;dispid 29086;
    // CommonInvoiceKSeF : Pobranie faktury z repozytorium KSeF - kryteria oparte o numer KSeF 
   procedure CommonInvoiceKSeF(InvoiceRequest:IDispatch;OutStream:OleVariant;GateType:lgcKSeFGateType);dispid 29087;
    // CommonDownload : Pobranie faktury z repozytorium KSeF na podstawie kryteriĂłw opartych o numer KSeF i skrĂłt dokumentu 
   procedure CommonDownload(KSeFReferenceNumber:WideString;DownloadRequest:IDispatch;OutStream:OleVariant;GateType:lgcKSeFGateType);dispid 29088;
    // CommonStatus : Interfejs wspĂłlny pobrania statusu przetwarzania wsadowego 
   function CommonStatus(ReferenceNumber:WideString;GateType:lgcKSeFGateType):IDispatch;dispid 29089;
    // CommonVerification : Weryfikacja faktury 
   function CommonVerification(KSeFReferenceNumber:WideString;VerificationRequest:IDispatch;GateType:lgcKSeFGateType):IDispatch;dispid 29090;
    // BatchSign : Przygotowanie danych i podpisanie struktury InitUpload 
   function BatchSign(ZIPDataStream:OleVariant;PZ:WordBool;EncryptedStream:OleVariant;ZIPFileName:WideString;PartFileName:WideString):WideString;dispid 29091;
    // BatchSend : WysĹ‚anie uprzednio przygotowanych danych faktur i podpisanej struktury InitUpload 
   function BatchSend(PartStream:OleVariant;InitUpload:WideString):WideString;dispid 29092;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // RSAEncryptClass : Klasa sterownika szyfrowania RSA 
   property RSAEncryptClass:WideString dispid 29001;
    // Base64EncoderClass : Klasa enkodera Base64 
   property Base64EncoderClass:WideString dispid 29002;
    // AES256EncryptClass : Klasa sterownika szyfrowania AES256 
   property AES256EncryptClass:WideString dispid 29003;
    // SHA256HashClass : Klasa funkcji skrĂłtu SHA256 
   property SHA256HashClass:WideString dispid 29004;
    // RandomGeneratorClass : Klasa generatora liczb pseudolosowych 
   property RandomGeneratorClass:WideString dispid 29005;
    // XAdES : Objekt XAdES dla podpisu certyfikatem kwalifikowanym struktury InitUpload 
   property XAdES:IDispatch dispid 29006;
    // HTTPClient : Obiekt poĹ‚Ä…czenia HTTPS 
   property HTTPClient:IDispatch dispid 29007;
    // GateType : Rodzaj bramki (produkcyjna/demo/testowa) 
   property GateType:lgcKSeFGateType dispid 29008;
    // Nip : Nr NIP podmiotu 
   property Nip:WideString dispid 29009;
    // FormCode : Predefiniowany rodzaj FA 
   property FormCode:Integer dispid 29010;
    // FormCodeSystemCode :  
   property FormCodeSystemCode:WideString dispid 29011;
    // FormCodeSchemaVersion :  
   property FormCodeSchemaVersion:WideString dispid 29012;
    // FormCodeTargetNamespace :  
   property FormCodeTargetNamespace:WideString dispid 29013;
    // FormCodeValue :  
   property FormCodeValue:WideString dispid 29014;
    // Certificate : Certyfikat kwalifikowany z kluczem prywatnym do zainicjowania sesji interaktywnej oraz podpisania struktury InitUpload wysyĹ‚ki wsadowej 
   property Certificate:IDispatch dispid 29015;
    // CertificateAuthType : Rodzaj autoryzacji certyfikatu kwalifikowanego lub pieczÄ™ci elektronicznej 
   property CertificateAuthType:lgcKSeFCertificateAuthType dispid 29016;
    // Token : Token do nawiÄ…zania sesji interaktywnej 
   property Token:WideString dispid 29017;
    // Encryption : Aktywacja opcionalnego szyfrowania AES 
   property Encryption:WordBool dispid 29018;
    // SessionToken : Token sesji 
   property SessionToken:WideString  readonly dispid 29019;
    // SessionActive : Czy sesjia aktywna 
   property SessionActive:WordBool  readonly dispid 29020;
    // RSAKeyProd : Klucz szyfrowania RSA dla bramki produkcyjnej 
   property RSAKeyProd:IDispatch dispid 29021;
    // RSAKeyDemo : Klucz szyfrowania RSA dla bramki demo 
   property RSAKeyDemo:IDispatch dispid 29022;
    // RSAKeyTest : Klucz szyfrowania RSA dla bramki testowj 
   property RSAKeyTest:IDispatch dispid 29023;
  end;


// IlgcMemoryStream : Obiekt implementujacy IStream na podstawie bufora w pamieci

 IlgcMemoryStream = interface(IlgcBaseObject)
   ['{BCF17136-365B-4AF4-9720-44EB9E4CABB0}']
   function Get_Data : OleVariant; safecall;
   procedure Set_Data(const Value:OleVariant); safecall;
    // Clear : Czyszczenie bufora 
   procedure Clear;safecall;
    // LoadFromFile : Ladowanie zawartosci bufora ze wskazanego pliku 
   procedure LoadFromFile(AFileName:WideString);safecall;
    // SaveToFile : Zapisanie zawartosci bufora do wskazanego pliku 
   procedure SaveToFile(AFileName:WideString);safecall;
    // Data : Pobranie zawartosci bufora danych - zwraca tablice VARIANT z elementami typu unsigned char (VT_UI1) 
   property Data:OleVariant read Get_Data write Set_Data;
  end;


// IlgcMemoryStream : Obiekt implementujacy IStream na podstawie bufora w pamieci

 IlgcMemoryStreamDisp = dispinterface
   ['{BCF17136-365B-4AF4-9720-44EB9E4CABB0}']
    // QueryInterface :  
   procedure QueryInterface(var riid:{!! GUID !!} OleVariant;out ppvObj:{!! Ppointer !!} OleVariant);dispid 1610612736;
    // AddRef :  
   function AddRef:LongWord;dispid 1610612737;
    // Release :  
   function Release:LongWord;dispid 1610612738;
    // GetTypeInfoCount :  
   procedure GetTypeInfoCount(out pctinfo:UInt);dispid 1610678272;
    // GetTypeInfo :  
   procedure GetTypeInfo(itinfo:UInt;lcid:LongWord;out pptinfo:{!! Ppointer !!} OleVariant);dispid 1610678273;
    // GetIDsOfNames :  
   procedure GetIDsOfNames(var riid:{!! GUID !!} OleVariant;var rgszNames:{!! PShortInt !!} OleVariant;cNames:UInt;lcid:LongWord;out rgdispid:Integer);dispid 1610678274;
    // Invoke :  
   procedure Invoke(dispidMember:Integer;var riid:{!! GUID !!} OleVariant;lcid:LongWord;wFlags:Word;var pdispparams:{!! DISPPARAMS !!} OleVariant;out pvarResult:OleVariant;out pexcepinfo:{!! EXCEPINFO !!} OleVariant;out puArgErr:UInt);dispid 1610678275;
    // GetObjClassName : Pobranie nazwy pierwotnej klasy 
   function GetObjClassName:WideString;dispid 1001;
    // ClearLastError : Usuwanie informacji o ostatnim bledzie 
   procedure ClearLastError;dispid 1002;
    // Clear : Czyszczenie bufora 
   procedure Clear;dispid 11002;
    // LoadFromFile : Ladowanie zawartosci bufora ze wskazanego pliku 
   procedure LoadFromFile(AFileName:WideString);dispid 11003;
    // SaveToFile : Zapisanie zawartosci bufora do wskazanego pliku 
   procedure SaveToFile(AFileName:WideString);dispid 11004;
    // LastError : Informacja o ostatnim bledzie (typ IlgcErrorInfo) 
   property LastError:IDispatch  readonly dispid 1003;
    // Data : Pobranie zawartosci bufora danych - zwraca tablice VARIANT z elementami typu unsigned char (VT_UI1) 
   property Data:OleVariant dispid 11001;
  end;

//CoClasses
  ColgcErrorInfo = Class
  Public
    Class Function Create: IlgcErrorInfo;
    Class Function CreateRemote(const MachineName: string): IlgcErrorInfo;
  end;

  ColgcBaseObject = Class
  Public
    Class Function Create: IlgcBaseObject;
    Class Function CreateRemote(const MachineName: string): IlgcBaseObject;
  end;

  ColgcBackend = Class
  Public
    Class Function Create: IlgcBackend;
    Class Function CreateRemote(const MachineName: string): IlgcBackend;
  end;

  ColgcObject = Class
  Public
    Class Function Create: IlgcObject;
    Class Function CreateRemote(const MachineName: string): IlgcObject;
  end;

  ColgcList = Class
  Public
    Class Function Create: IlgcList;
    Class Function CreateRemote(const MachineName: string): IlgcList;
  end;

  ColgcWSTBackend = Class
  Public
    Class Function Create: IlgcWSTBackend;
    Class Function CreateRemote(const MachineName: string): IlgcWSTBackend;
  end;

  ColgcLibXMLBackend = Class
  Public
    Class Function Create: IlgcLibXMLBackend;
    Class Function CreateRemote(const MachineName: string): IlgcLibXMLBackend;
  end;

  ColgcOpenSSLBackend = Class
  Public
    Class Function Create: IlgcOpenSSLBackend;
    Class Function CreateRemote(const MachineName: string): IlgcOpenSSLBackend;
  end;

  ColgcStringStream = Class
  Public
    Class Function Create: IlgcStringStream;
    Class Function CreateRemote(const MachineName: string): IlgcStringStream;
  end;

  ColgcFileStream = Class
  Public
    Class Function Create: IlgcFileStream;
    Class Function CreateRemote(const MachineName: string): IlgcFileStream;
  end;

  ColgcMemoryStream = Class
  Public
    Class Function Create: IlgcMemoryStream;
    Class Function CreateRemote(const MachineName: string): IlgcMemoryStream;
  end;

  ColgcHTTPClient = Class
  Public
    Class Function Create: IlgcHTTPClient;
    Class Function CreateRemote(const MachineName: string): IlgcHTTPClient;
  end;

  ColgcCertificate = Class
  Public
    Class Function Create: IlgcCertificate;
    Class Function CreateRemote(const MachineName: string): IlgcCertificate;
  end;

  ColgcCertificateSigner = Class
  Public
    Class Function Create: IlgcCertificateSigner;
    Class Function CreateRemote(const MachineName: string): IlgcCertificateSigner;
  end;

  ColgcCNGCertificateSigner = Class
  Public
    Class Function Create: IlgcCNGCertificateSigner;
    Class Function CreateRemote(const MachineName: string): IlgcCNGCertificateSigner;
  end;

  ColgcPKCS11Info = Class
  Public
    Class Function Create: IlgcPKCS11Info;
    Class Function CreateRemote(const MachineName: string): IlgcPKCS11Info;
  end;

  ColgcPKCS11TokenInfo = Class
  Public
    Class Function Create: IlgcPKCS11TokenInfo;
    Class Function CreateRemote(const MachineName: string): IlgcPKCS11TokenInfo;
  end;

  ColgcPKCS11SlotInfo = Class
  Public
    Class Function Create: IlgcPKCS11SlotInfo;
    Class Function CreateRemote(const MachineName: string): IlgcPKCS11SlotInfo;
  end;

  ColgcPKCS11Session = Class
  Public
    Class Function Create: IlgcPKCS11Session;
    Class Function CreateRemote(const MachineName: string): IlgcPKCS11Session;
  end;

  ColgcPKCS11Certificate = Class
  Public
    Class Function Create: IlgcPKCS11Certificate;
    Class Function CreateRemote(const MachineName: string): IlgcPKCS11Certificate;
  end;

  ColgcPKCS11CertificateSigner = Class
  Public
    Class Function Create: IlgcPKCS11CertificateSigner;
    Class Function CreateRemote(const MachineName: string): IlgcPKCS11CertificateSigner;
  end;

  ColgcPKCS11Backend = Class
  Public
    Class Function Create: IlgcPKCS11Backend;
    Class Function CreateRemote(const MachineName: string): IlgcPKCS11Backend;
  end;

  ColgcXAdES = Class
  Public
    Class Function Create: IlgcXAdES;
    Class Function CreateRemote(const MachineName: string): IlgcXAdES;
  end;

  ColgcEDeklaracjaStatus = Class
  Public
    Class Function Create: IlgcEDeklaracjaStatus;
    Class Function CreateRemote(const MachineName: string): IlgcEDeklaracjaStatus;
  end;

  ColgcEDeklaracja = Class
  Public
    Class Function Create: IlgcEDeklaracja;
    Class Function CreateRemote(const MachineName: string): IlgcEDeklaracja;
  end;

  ColgcJPK = Class
  Public
    Class Function Create: IlgcJPK;
    Class Function CreateRemote(const MachineName: string): IlgcJPK;
  end;

  ColgcKSeFRequest = Class
  Public
    Class Function Create: IlgcKSeFRequest;
    Class Function CreateRemote(const MachineName: string): IlgcKSeFRequest;
  end;

  ColgcKSeFResponse = Class
  Public
    Class Function Create: IlgcKSeFResponse;
    Class Function CreateRemote(const MachineName: string): IlgcKSeFResponse;
  end;

  ColgcKSeFBase = Class
  Public
    Class Function Create: IlgcKSeFBase;
    Class Function CreateRemote(const MachineName: string): IlgcKSeFBase;
  end;

  ColgcKSeF_2_6_0 = Class
  Public
    Class Function Create: IlgcKSeF_2_6_0;
    Class Function CreateRemote(const MachineName: string): IlgcKSeF_2_6_0;
  end;

implementation

uses comobj;

Class Function ColgcErrorInfo.Create: IlgcErrorInfo;
begin
  Result := CreateComObject(CLASS_lgcErrorInfo) as IlgcErrorInfo;
end;

Class Function ColgcErrorInfo.CreateRemote(const MachineName: string): IlgcErrorInfo;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcErrorInfo) as IlgcErrorInfo;
end;

Class Function ColgcBaseObject.Create: IlgcBaseObject;
begin
  Result := CreateComObject(CLASS_lgcBaseObject) as IlgcBaseObject;
end;

Class Function ColgcBaseObject.CreateRemote(const MachineName: string): IlgcBaseObject;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcBaseObject) as IlgcBaseObject;
end;

Class Function ColgcBackend.Create: IlgcBackend;
begin
  Result := CreateComObject(CLASS_lgcBackend) as IlgcBackend;
end;

Class Function ColgcBackend.CreateRemote(const MachineName: string): IlgcBackend;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcBackend) as IlgcBackend;
end;

Class Function ColgcObject.Create: IlgcObject;
begin
  Result := CreateComObject(CLASS_lgcObject) as IlgcObject;
end;

Class Function ColgcObject.CreateRemote(const MachineName: string): IlgcObject;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcObject) as IlgcObject;
end;

Class Function ColgcList.Create: IlgcList;
begin
  Result := CreateComObject(CLASS_lgcList) as IlgcList;
end;

Class Function ColgcList.CreateRemote(const MachineName: string): IlgcList;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcList) as IlgcList;
end;

Class Function ColgcWSTBackend.Create: IlgcWSTBackend;
begin
  Result := CreateComObject(CLASS_lgcWSTBackend) as IlgcWSTBackend;
end;

Class Function ColgcWSTBackend.CreateRemote(const MachineName: string): IlgcWSTBackend;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcWSTBackend) as IlgcWSTBackend;
end;

Class Function ColgcLibXMLBackend.Create: IlgcLibXMLBackend;
begin
  Result := CreateComObject(CLASS_lgcLibXMLBackend) as IlgcLibXMLBackend;
end;

Class Function ColgcLibXMLBackend.CreateRemote(const MachineName: string): IlgcLibXMLBackend;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcLibXMLBackend) as IlgcLibXMLBackend;
end;

Class Function ColgcOpenSSLBackend.Create: IlgcOpenSSLBackend;
begin
  Result := CreateComObject(CLASS_lgcOpenSSLBackend) as IlgcOpenSSLBackend;
end;

Class Function ColgcOpenSSLBackend.CreateRemote(const MachineName: string): IlgcOpenSSLBackend;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcOpenSSLBackend) as IlgcOpenSSLBackend;
end;

Class Function ColgcStringStream.Create: IlgcStringStream;
begin
  Result := CreateComObject(CLASS_lgcStringStream) as IlgcStringStream;
end;

Class Function ColgcStringStream.CreateRemote(const MachineName: string): IlgcStringStream;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcStringStream) as IlgcStringStream;
end;

Class Function ColgcFileStream.Create: IlgcFileStream;
begin
  Result := CreateComObject(CLASS_lgcFileStream) as IlgcFileStream;
end;

Class Function ColgcFileStream.CreateRemote(const MachineName: string): IlgcFileStream;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcFileStream) as IlgcFileStream;
end;

Class Function ColgcMemoryStream.Create: IlgcMemoryStream;
begin
  Result := CreateComObject(CLASS_lgcMemoryStream) as IlgcMemoryStream;
end;

Class Function ColgcMemoryStream.CreateRemote(const MachineName: string): IlgcMemoryStream;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcMemoryStream) as IlgcMemoryStream;
end;

Class Function ColgcHTTPClient.Create: IlgcHTTPClient;
begin
  Result := CreateComObject(CLASS_lgcHTTPClient) as IlgcHTTPClient;
end;

Class Function ColgcHTTPClient.CreateRemote(const MachineName: string): IlgcHTTPClient;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcHTTPClient) as IlgcHTTPClient;
end;

Class Function ColgcCertificate.Create: IlgcCertificate;
begin
  Result := CreateComObject(CLASS_lgcCertificate) as IlgcCertificate;
end;

Class Function ColgcCertificate.CreateRemote(const MachineName: string): IlgcCertificate;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcCertificate) as IlgcCertificate;
end;

Class Function ColgcCertificateSigner.Create: IlgcCertificateSigner;
begin
  Result := CreateComObject(CLASS_lgcCertificateSigner) as IlgcCertificateSigner;
end;

Class Function ColgcCertificateSigner.CreateRemote(const MachineName: string): IlgcCertificateSigner;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcCertificateSigner) as IlgcCertificateSigner;
end;

Class Function ColgcCNGCertificateSigner.Create: IlgcCNGCertificateSigner;
begin
  Result := CreateComObject(CLASS_lgcCNGCertificateSigner) as IlgcCNGCertificateSigner;
end;

Class Function ColgcCNGCertificateSigner.CreateRemote(const MachineName: string): IlgcCNGCertificateSigner;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcCNGCertificateSigner) as IlgcCNGCertificateSigner;
end;

Class Function ColgcPKCS11Info.Create: IlgcPKCS11Info;
begin
  Result := CreateComObject(CLASS_lgcPKCS11Info) as IlgcPKCS11Info;
end;

Class Function ColgcPKCS11Info.CreateRemote(const MachineName: string): IlgcPKCS11Info;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcPKCS11Info) as IlgcPKCS11Info;
end;

Class Function ColgcPKCS11TokenInfo.Create: IlgcPKCS11TokenInfo;
begin
  Result := CreateComObject(CLASS_lgcPKCS11TokenInfo) as IlgcPKCS11TokenInfo;
end;

Class Function ColgcPKCS11TokenInfo.CreateRemote(const MachineName: string): IlgcPKCS11TokenInfo;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcPKCS11TokenInfo) as IlgcPKCS11TokenInfo;
end;

Class Function ColgcPKCS11SlotInfo.Create: IlgcPKCS11SlotInfo;
begin
  Result := CreateComObject(CLASS_lgcPKCS11SlotInfo) as IlgcPKCS11SlotInfo;
end;

Class Function ColgcPKCS11SlotInfo.CreateRemote(const MachineName: string): IlgcPKCS11SlotInfo;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcPKCS11SlotInfo) as IlgcPKCS11SlotInfo;
end;

Class Function ColgcPKCS11Session.Create: IlgcPKCS11Session;
begin
  Result := CreateComObject(CLASS_lgcPKCS11Session) as IlgcPKCS11Session;
end;

Class Function ColgcPKCS11Session.CreateRemote(const MachineName: string): IlgcPKCS11Session;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcPKCS11Session) as IlgcPKCS11Session;
end;

Class Function ColgcPKCS11Certificate.Create: IlgcPKCS11Certificate;
begin
  Result := CreateComObject(CLASS_lgcPKCS11Certificate) as IlgcPKCS11Certificate;
end;

Class Function ColgcPKCS11Certificate.CreateRemote(const MachineName: string): IlgcPKCS11Certificate;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcPKCS11Certificate) as IlgcPKCS11Certificate;
end;

Class Function ColgcPKCS11CertificateSigner.Create: IlgcPKCS11CertificateSigner;
begin
  Result := CreateComObject(CLASS_lgcPKCS11CertificateSigner) as IlgcPKCS11CertificateSigner;
end;

Class Function ColgcPKCS11CertificateSigner.CreateRemote(const MachineName: string): IlgcPKCS11CertificateSigner;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcPKCS11CertificateSigner) as IlgcPKCS11CertificateSigner;
end;

Class Function ColgcPKCS11Backend.Create: IlgcPKCS11Backend;
begin
  Result := CreateComObject(CLASS_lgcPKCS11Backend) as IlgcPKCS11Backend;
end;

Class Function ColgcPKCS11Backend.CreateRemote(const MachineName: string): IlgcPKCS11Backend;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcPKCS11Backend) as IlgcPKCS11Backend;
end;

Class Function ColgcXAdES.Create: IlgcXAdES;
begin
  Result := CreateComObject(CLASS_lgcXAdES) as IlgcXAdES;
end;

Class Function ColgcXAdES.CreateRemote(const MachineName: string): IlgcXAdES;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcXAdES) as IlgcXAdES;
end;

Class Function ColgcEDeklaracjaStatus.Create: IlgcEDeklaracjaStatus;
begin
  Result := CreateComObject(CLASS_lgcEDeklaracjaStatus) as IlgcEDeklaracjaStatus;
end;

Class Function ColgcEDeklaracjaStatus.CreateRemote(const MachineName: string): IlgcEDeklaracjaStatus;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcEDeklaracjaStatus) as IlgcEDeklaracjaStatus;
end;

Class Function ColgcEDeklaracja.Create: IlgcEDeklaracja;
begin
  Result := CreateComObject(CLASS_lgcEDeklaracja) as IlgcEDeklaracja;
end;

Class Function ColgcEDeklaracja.CreateRemote(const MachineName: string): IlgcEDeklaracja;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcEDeklaracja) as IlgcEDeklaracja;
end;

Class Function ColgcJPK.Create: IlgcJPK;
begin
  Result := CreateComObject(CLASS_lgcJPK) as IlgcJPK;
end;

Class Function ColgcJPK.CreateRemote(const MachineName: string): IlgcJPK;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcJPK) as IlgcJPK;
end;

Class Function ColgcKSeFRequest.Create: IlgcKSeFRequest;
begin
  Result := CreateComObject(CLASS_lgcKSeFRequest) as IlgcKSeFRequest;
end;

Class Function ColgcKSeFRequest.CreateRemote(const MachineName: string): IlgcKSeFRequest;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcKSeFRequest) as IlgcKSeFRequest;
end;

Class Function ColgcKSeFResponse.Create: IlgcKSeFResponse;
begin
  Result := CreateComObject(CLASS_lgcKSeFResponse) as IlgcKSeFResponse;
end;

Class Function ColgcKSeFResponse.CreateRemote(const MachineName: string): IlgcKSeFResponse;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcKSeFResponse) as IlgcKSeFResponse;
end;

Class Function ColgcKSeFBase.Create: IlgcKSeFBase;
begin
  Result := CreateComObject(CLASS_lgcKSeFBase) as IlgcKSeFBase;
end;

Class Function ColgcKSeFBase.CreateRemote(const MachineName: string): IlgcKSeFBase;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcKSeFBase) as IlgcKSeFBase;
end;

Class Function ColgcKSeF_2_6_0.Create: IlgcKSeF_2_6_0;
begin
  Result := CreateComObject(CLASS_lgcKSeF_2_6_0) as IlgcKSeF_2_6_0;
end;

Class Function ColgcKSeF_2_6_0.CreateRemote(const MachineName: string): IlgcKSeF_2_6_0;
begin
  Result := CreateRemoteComObject(MachineName,CLASS_lgcKSeF_2_6_0) as IlgcKSeF_2_6_0;
end;

end.
