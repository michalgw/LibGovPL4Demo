#include "hbclass.ch"

CREATE CLASS TlgoJPK INHERIT TlgoObject

   HIDDEN:
   VAR oRSAKeyProd   INIT NIL
   VAR oRSAKeyTest   INIT NIL
   VAR oXAdES        INIT NIL
   VAR oHTTPClient   INIT NIL

   VISIBLE:
   METHOD New( cBase64EncoderClass, cAES256EncryptClass, cMD5HashClass, cSHA256HashClass, cZipperClass, cRSAEncryptClass, cRandomGeneratorClass, cXMLReaderClass ) CONSTRUCTOR

   METHOD SignCerificate( oCertificate, nGateType, lAdHoc, oInputStream, oOutputStream, cInitUpload )
   METHOD SignCerificateStream( oCertificate, nGateType, lAdHoc, oInputStream, oOutputStream, oInitUpload )
   METHOD SignDataAuth( cNIP, cImiePierwsze, cNazwisko, dDataUrodzenia, nKwota, nGateType, lAdHoc, oInputStream, oOutputStream, cInitUpload )
   METHOD SignDataAuthStream( cNIP, cImiePierwsze, cNazwisko, dDataUrodzenia, nKwota, nGateType, lAdHoc, oInputStream, oOutputStream, oInitUpload )
   METHOD Send( cInitUpload, oEncryptedData, cRefNo, nGateType, lVerifySign )
   METHOD SendStream( oInitUpload, oEncryptedData, cRefNo, nGateType, lVerifySign )
   METHOD RequestUPO( cRefNo, nGateType, nStatus, cStatusDesc, cDetails, cUPO, cTimeStamp )
   METHOD RequestUPOStream( cRefNo, nGateType, nStatus, cStatusDesc, cDetails, cTimeStamp, oUPO )

   ACCESS Base64EncoderClass METHOD GetBase64EncoderClass()
   ASSIGN Base64EncoderClass METHOD SetBase64EncoderClass( cClassName )
   ACCESS AES256EncryptClass METHOD GetAES256EncryptClass()
   ASSIGN AES256EncryptClass METHOD SetAES256EncryptClass( cClassName )
   ACCESS MD5HashClass METHOD GetMD5HashClass()
   ASSIGN MD5HashClass METHOD SetMD5HashClass( cClassName )
   ACCESS SHA256HashClass METHOD GetSHA256HashClass()
   ASSIGN SHA256HashClass METHOD SetSHA256HashClass( cClassName )
   ACCESS ZipperClass METHOD GetZipperClass()
   ASSIGN ZipperClass METHOD SetZipperClass( cClassName )
   ACCESS RSAEncryptClass METHOD GetRSAEncryptClass()
   ASSIGN RSAEncryptClass METHOD SetRSAEncryptClass( cClassName )
   ACCESS RandomGeneratorClass METHOD GetRandomGeneratorClass()
   ASSIGN RandomGeneratorClass METHOD SetRandomGeneratorClass( cClassName )
   ACCESS XMLReaderClass METHOD GetXMLReaderClass()
   ASSIGN XMLReaderClass METHOD SetXMLReaderClass( cClassName )

   ACCESS RSAKeyProd METHOD GetRSAKeyProd()
   ASSIGN RSAKeyProd METHOD SetRSAKeyProd( oObject )
   ACCESS RSAKeyTest METHOD GetRSAKeyTest()
   ASSIGN RSAKeyTest METHOD SetRSAKeyTest( oObject )
   ACCESS XAdES METHOD GetXAdES()
   ASSIGN XAdES METHOD SetXAdES( oObject )
   ACCESS HTTPClient METHOD GetHTTPClient()
   ASSIGN HTTPClient METHOD SetHTTPClient( oObject )

ENDCLASS


METHOD New( cBase64EncoderClass, cAES256EncryptClass, cMD5HashClass, cSHA256HashClass, cZipperClass, cRSAEncryptClass, cRandomGeneratorClass, cXMLReaderClass ) CLASS TlgoJPK

   LOCAL pExtObj

   lgoCheckResult( lgpJPK_Create( cBase64EncoderClass, cAES256EncryptClass, cMD5HashClass, cSHA256HashClass, cZipperClass, cRSAEncryptClass, cRandomGeneratorClass, cXMLReaderClass, @pExtObj ) )
   ::pExtObject := pExtObj

   RETURN Self

METHOD SignCerificate( oCertificate, nGateType, lAdHoc, oInputStream, oOutputStream, cInitUpload ) CLASS TlgoJPK

   LOCAL pInitUpload

   lgoCheckResult( lgpJPK_SignCerificate( ::pExtObject, oCertificate:ExtObject, ;
      nGateType, lAdHoc, oInputStream:ExtObject, oOutputStream:ExtObject, @pInitUpload ) )
   cInitUpload := lgoGetString( pInitUpload )

   RETURN .T.

METHOD SignCerificateStream( oCertificate, nGateType, lAdHoc, oInputStream, oOutputStream, oInitUpload ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SignCerificateStream( ::pExtObject, oCertificate:ExtObject, ;
      nGateType, lAdHoc, oInputStream:ExtObject, oOutputStream:ExtObject, oInitUpload:ExtObject ) )

   RETURN .T.

METHOD SignDataAuth( cNIP, cImiePierwsze, cNazwisko, dDataUrodzenia, nKwota, nGateType, lAdHoc, oInputStream, oOutputStream, cInitUpload ) CLASS TlgoJPK

   LOCAL pInitUpload

   lgoCheckResult( lgpJPK_SignDataAuth( ::pExtObject, cNIP, cImiePierwsze, ;
      cNazwisko, dDataUrodzenia, nKwota, nGateType, lAdHoc, oInputStream:ExtObject, ;
      oOutputStream:ExtObject, @pInitUpload ) )
   cInitUpload := lgoGetString( pInitUpload )

   RETURN .T.

METHOD SignDataAuthStream( cNIP, cImiePierwsze, cNazwisko, dDataUrodzenia, nKwota, nGateType, lAdHoc, oInputStream, oOutputStream, oInitUpload ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SignDataAuthStream( ::pExtObject, cNIP, cImiePierwsze, ;
      cNazwisko, dDataUrodzenia, nKwota, nGateType, lAdHoc, oInputStream:ExtObject, ;
      oOutputStream:ExtObject, oInitUpload:ExtObject ) )

   RETURN .T.

METHOD Send( cInitUpload, oEncryptedData, cRefNo, nGateType, lVerifySign ) CLASS TlgoJPK

   LOCAL pRefNo

   lgoCheckResult( lgpJPK_Send( ::pExtObject, cInitUpload, oEncryptedData:ExtObject, ;
      @pRefNo, nGateType, lVerifySign ) )
   cRefNo := lgoGetString( pRefNo )

   RETURN cRefNo

METHOD SendStream( oInitUpload, oEncryptedData, cRefNo, nGateType, lVerifySign ) CLASS TlgoJPK

   LOCAL pRefNo

   lgoCheckResult( lgpJPK_SendStream( ::pExtObject, oInitUpload:ExtObject, oEncryptedData:ExtObject, ;
      @pRefNo, nGateType, lVerifySign ) )
   cRefNo := lgoGetString( pRefNo )

   RETURN cRefNo

METHOD RequestUPO( cRefNo, nGateType, nStatus, cStatusDesc, cDetails, cUPO, cTimeStamp ) CLASS TlgoJPK

   LOCAL pStatusDesc, pDetails, pUPO, pTimeStamp

   lgoCheckResult( lgpJPK_RequestUPO( ::pExtObject, cRefNo, nGateType, @nStatus, ;
      @pStatusDesc, @pDetails, @pUPO, @pTimeStamp ) )
   cStatusDesc := lgoGetString( pStatusDesc )
   cDetails  := lgoGetString( pDetails )
   cUPO := lgoGetString( pUPO )
   cTimeStamp := lgoGetString( pTimeStamp )

   RETURN nStatus

METHOD RequestUPOStream( cRefNo, nGateType, nStatus, cStatusDesc, cDetails, cTimeStamp, oUPO ) CLASS TlgoJPK

   LOCAL pStatusDesc, pDetails, pTimeStamp

   lgoCheckResult( lgpJPK_RequestUPO( ::pExtObject, cRefNo, nGateType, @nStatus, ;
      @pStatusDesc, @pDetails, @pTimeStamp, oUPO:ExtObject ) )
   cStatusDesc := lgoGetString( pStatusDesc )
   cDetails  := lgoGetString( pDetails )
   cTimeStamp := lgoGetString( pTimeStamp )

   RETURN nStatus

METHOD GetBase64EncoderClass() CLASS TlgoJPK

   LOCAL cClassName

   lgoCheckResult( lgpJPK_GetBase64EncoderClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetBase64EncoderClass( cClassName ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetBase64EncoderClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetAES256EncryptClass() CLASS TlgoJPK

   LOCAL cClassName

   lgoCheckResult( lgpJPK_GetAES256EncryptClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetAES256EncryptClass( cClassName ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetAES256EncryptClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetMD5HashClass() CLASS TlgoJPK

   LOCAL cClassName

   lgoCheckResult( lgpJPK_GetMD5HashClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetMD5HashClass( cClassName ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetMD5HashClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetSHA256HashClass() CLASS TlgoJPK

   LOCAL cClassName

   lgoCheckResult( lgpJPK_GetSHA256HashClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetSHA256HashClass( cClassName ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetSHA256HashClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetZipperClass() CLASS TlgoJPK

   LOCAL cClassName

   lgoCheckResult( lgpJPK_GetZipperClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetZipperClass( cClassName ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetZipperClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetRSAEncryptClass() CLASS TlgoJPK

   LOCAL cClassName

   lgoCheckResult( lgpJPK_GetRSAEncryptClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetRSAEncryptClass( cClassName ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetRSAEncryptClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetRandomGeneratorClass() CLASS TlgoJPK

   LOCAL cClassName

   lgoCheckResult( lgpJPK_GetRandomGeneratorClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetRandomGeneratorClass( cClassName ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetRandomGeneratorClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetXMLReaderClass() CLASS TlgoJPK

   LOCAL cClassName

   lgoCheckResult( lgpJPK_GetXMLReaderClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetXMLReaderClass( cClassName ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetXMLReaderClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetRSAKeyProd() CLASS TlgoJPK

   RETURN ::oRSAKeyProd

METHOD SetRSAKeyProd( oObject ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetRSAKeyProd( ::pExtObject, oObject:ExtObject ) )
   ::oRSAKeyProd := oObject

   RETURN NIL

METHOD GetRSAKeyTest() CLASS TlgoJPK

   RETURN ::oRSAKeyTest

METHOD SetRSAKeyTest( oObject ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetRSAKeyTest( ::pExtObject, oObject:ExtObject ) )
   ::oRSAKeyTest := oObject

   RETURN NIL

METHOD GetXAdES() CLASS TlgoJPK

   RETURN ::oXAdES

METHOD SetXAdES( oObject ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetXAdES( ::pExtObject, oObject:ExtObject ) )
   ::oXAdES := oObject

   RETURN NIL

METHOD GetHTTPClient() CLASS TlgoJPK

   RETURN ::oHTTPClient

METHOD SetHTTPClient( oObject ) CLASS TlgoJPK

   lgoCheckResult( lgpJPK_SetHTTPClient( ::pExtObject, oObject:ExtObject ) )
   ::oHTTPClient := oObject

   RETURN NIL
