{ **************************************************************************** }
{                                                                              }
{ LibGovPl4                                                                    }
{                                                                              }
{ Copyright (c) 2016 - 2023 GM Systems Michał Gawrycki                         }
{                                                                              }
{ **************************************************************************** }

library libgovpl4;

{$mode objfpc}{$H+}

uses
  LazUTF8, Classes, uBackend, uException, uObject, uStream, uTypes, uXAdES, uKSeF,
  uKSeFObj, uJPK, uEDeklar, uWSTEDG
  { you can add units after this }
{$IFDEF LGP_LEGACY}
  , uLegacy
{$ENDIF}
{$IFDEF LGP_ENABLE_WINCNG}
  , lgCNG
{$ENDIF}
{$IFDEF LGP_ENABLE_LIBXML2}
  , lgLibXML2
{$ENDIF}
{$IFDEF LGP_ENABLE_MSXML}
  , lgMSXML
{$ENDIF}
{$IFDEF LGP_ENABLE_WINHTTP}
  , lgWinHTTP
{$ENDIF}
{$IFDEF LGP_ENABLE_FPC}
  , lgFPC
{$ENDIF}
{$IFDEF LGP_ENABLE_WST}
  , lgWSTEDekGate
{$ENDIF}
{$IFDEF LGP_ENABLE_DCPCRYPT}
  , lgDCPCrypt
{$ENDIF}
  ;


exports
  // Backend
  lgplVersion,
  lgplListDrivers,
  lgplInit,
  lgplExit,
  lgplSetDefaultDriver,

  lgpHTTPClient_Create,
  lgpHTTPClient_GetIgnoreSSLErrors,
  lgpHTTPClient_SetIgnoreSSLErrors,

  lgpRSAEncrypt_CreateKey,

  lgpCertificate_GetDisplayName,
  lgpCertificate_GetSubject,
  lgpCertificate_GetIssuer,
  lgpCertificate_GetSerialNoDec,
  lgpCertificate_GetSerialNoHex,
  lgpCertificate_GetValidFrom,
  lgpCertificate_GetValidTo,

  lgpCNGCertificate_ShowCertificateInfo,

  lgpCertificateSigner_Create,
  lgpCertificateSigner_List,
  lgpCertificateSigner_FindBySerialNumber,
  lgpCertificateSigner_UISelect,

  lgpCNGCertificateSigner_SetHWnd,

  lgpEncodeDateTime,
  lgpDecodeDateTime,

  lgpLoadLibXML2,

  // Object
  lgpObject_Free,
  lgpObject_ClassName,
  lgpObject_GetStringProp,
  lgpObject_SetStringProp,
  lgpObject_GetIntegerProp,
  lgpObject_SetIntegerProp,
  lgpObject_GetDoubleProp,
  lgpObject_SetDoubleProp,
  lgpObject_GetObjectProp,
  lgpObject_SetObjectProp,
  lgpObject_GetCurrencyProp,
  lgpObject_SetCurrencyProp,
  lgpObject_GetBooleanProp,
  lgpObject_SetBooleanProp,
  lgpObject_GetInt64Prop,
  lgpObject_SetInt64Prop,

  lgpStringObject_GetValue,
  lgpStringObject_GetValueAndLen,

  lgpListObject_GetCount,
  lgpListObject_GetItem,
  lgpListObject_Delete,
  lgpListObject_Remove,
  lgpListObject_GetOwnsObjects,
  lgpListObject_SetOwnsObjects,

  // Stream
  lgpStream_Create,

  lgpFileStream_Create,

  lgpStringStream_Create,
  lgpStringStream_GetString,

// WST EDek Gate
  lgpWST_RegisterTransport,
  lgpWST_GetHTTPClient,
  lgpWST_SetHTTPClient,

  // XAdES
  lgpXAdES_Create,
  lgpXAdES_GetSHA1HashClass,
  lgpXAdES_SetSHA1HashClass,
  lgpXAdES_GetSHA256HashClass,
  lgpXAdES_SetSHA256HashClass,
  lgpXAdES_GetBase64EncoderClass,
  lgpXAdES_SetBase64EncoderClass,
  lgpXAdES_GetSigner,
  lgpXAdES_SetSigner,
  lgpXAdES_GetSignType,
  lgpXAdES_SetSignType,
  lgpXAdES_GetSerialNoFormat,
  lgpXAdES_SetSerialNoFormat,
  lgpXAdES_GetIncludeSigningTime,
  lgpXAdES_SetIncludeSigningTime,
  lgpXAdES_GetSigningTime,
  lgpXAdES_SetSigningTime,

  // EDek
  lgpEDek_Create,
  lgpEDek_GetXAdES,
  lgpEDek_SetXAdES,
  lgpEDek_GetXMLCanonizatorClass,
  lgpEDek_SetXMLCanonizatorClass,
  lgpEDek_GetEDekGateClass,
  lgpEDek_SetEDekGateClass,
  lgpEDek_GetCanonization,
  lgpEDek_SetCanonization,
  lgpEDek_PodpiszCertyfikatem,
  lgpEDek_PodpiszCertyfikatemStream,
  lgpEDek_PodpiszDanymiAut,
  lgpEDek_PodpiszDanymiAutStream,
  lgpEDek_Wyslij,
  lgpEDek_WyslijStream,
  lgpEDek_PobierzUPO,
  lgpEDek_PobierzUPOStream,

  // JPK
  lgpJPK_Create,

  lgpJPK_GetBase64EncoderClass,
  lgpJPK_SetBase64EncoderClass,
  lgpJPK_GetAES256EncryptClass,
  lgpJPK_SetAES256EncryptClass,
  lgpJPK_GetMD5HashClass,
  lgpJPK_SetMD5HashClass,
  lgpJPK_GetSHA256HashClass,
  lgpJPK_SetSHA256HashClass,
  lgpJPK_GetZipperClass,
  lgpJPK_SetZipperClass,
  lgpJPK_GetRSAEncryptClass,
  lgpJPK_SetRSAEncryptClass,
  lgpJPK_GetRandomGeneratorClass,
  lgpJPK_SetRandomGeneratorClass,
  lgpJPK_GetXMLReaderClass,
  lgpJPK_SetXMLReaderClass,

  lgpJPK_GetRSAKeyProd,
  lgpJPK_SetRSAKeyProd,
  lgpJPK_GetRSAKeyTest,
  lgpJPK_SetRSAKeyTest,
  lgpJPK_GetXAdES,
  lgpJPK_SetXAdES,
  lgpJPK_GetHTTPClient,
  lgpJPK_SetHTTPClient,

  lgpJPK_SignCerificate,
  lgpJPK_SignCerificateStream,
  lgpJPK_SignDataAuth,
  lgpJPK_SignDataAuthStream,
  lgpJPK_Send,
  lgpJPK_SendStream,
  lgpJPK_RequestUPO,
  lgpJPK_RequestUPOStream,

  // KSeF
  lgpKSeF_Create,
  lgpKSeF_GetRSAEncryptClass,
  lgpKSeF_SetRSAEncryptClass,
  lgpKSeF_GetBase64EncoderClass,
  lgpKSeF_SetBase64EncoderClass,
  lgpKSeF_GetAES256EncryptClass,
  lgpKSeF_SetAES256EncryptClass,
  lgpKSeF_GetSHA256HashClass,
  lgpKSeF_SetSHA256HashClass,
  lgpKSeF_GetRandomGeneratorClass,
  lgpKSeF_SetRandomGeneratorClass,
  lgpKSeF_GetRSAKey,
  lgpKSeF_SetRSAKey,
  lgpKSeF_GetXAdES,
  lgpKSeF_SetXAdES,
  lgpKSeF_GetHTTPClient,
  lgpKSeF_SetHTTPClient,
  lgpKSeF_GetGateType,
  lgpKSeF_SetGateType,
  lgpKSeF_GetNIP,
  lgpKSeF_SetNIP,
  lgpKSeF_GetFormCode,
  lgpKSeF_SetFormCode,
  lgpKSeF_GetFormCodeSystemCode,
  lgpKSeF_SetFormCodeSystemCode,
  lgpKSeF_GetFormCodeSchemaVersion,
  lgpKSeF_SetFormCodeSchemaVersion,
  lgpKSeF_GetFormCodeTargetNamespace,
  lgpKSeF_SetFormCodeTargetNamespace,
  lgpKSeF_GetFormCodeValue,
  lgpKSeF_SetFormCodeValue,
  lgpKSeF_GetCertificate,
  lgpKSeF_SetCertificate,
  lgpKSeF_GetCertificateAuthType,
  lgpKSeF_SetCertificateAuthType,
  lgpKSeF_GetToken,
  lgpKSeF_SetToken,
  lgpKSeF_GetEncryption,
  lgpKSeF_SetEncryption,
  lgpKSeF_GetSessionToken,
  lgpKSeF_GetSessionActive,

  lgpKSeF_GenerateAESKey,

  lgpKSeF_SessionInitSigned,
  lgpKSeF_SessionInitToken,
  lgpKSeF_SessionChalangePZ,
  lgpKSeF_SessionInitPZ,
  lgpKSeF_SessionStatus,
  lgpKSeF_SessionTerminate,
  lgpKSeF_SessionGenerateInternalIdentifier,

  lgpKSeF_InvoiceGet,
  lgpKSeF_InvoiceSend,
  lgpKSeF_InvoiceStatus,

  lgpKSeF_QueryInvoiceSync,
  lgpKSeF_QueryInvoiceAsyncInit,
  lgpKSeF_QueryInvoiceAsyncStatus,
  lgpKSeF_QueryInvoiceAsyncFetch,

  lgpKSeF_PaymentIdentifierGetReferenceNumbers,
  lgpKSeF_PaymentIdentifierRequest,

  lgpKSeF_CommonInvoiceKSeF,
  lgpKSeF_CommonStatus,

  lgpKSeF_BatchSign,
  lgpKSeF_BatchSend,

  // KSeF Obj
  lgpKSeF_CreateKSeFClass

  // Zgodność z poprzednią wersją biblioteki
{$IFDEF LGP_LEGACY}
  ,
  edekInicjuj,
  edekOstatniBladTekst,
  edekZwolnijTekst,
  edekCertyfikatIlosc,
  edekCertyfikatDane,
  edekCertyfikatPokaz,
  edekPodpisz,
  edekPodpiszAut,
  edekWyslij,
  edekPobierzUPO,
  jpkPodpisz,
  jpkPodpisz2,
  jpkPodpiszAut,
  jpkWyslij,
  jpkWyslij2,
  jpkPobierzUPO,
  edekWeryfikuj,
  jpkMicroPodpisz,
  jpkMicroWyslij,
  jpkMicroPobierzUPO,
  mfSprawdzVAT
{$ENDIF}
  ;

begin
end.

