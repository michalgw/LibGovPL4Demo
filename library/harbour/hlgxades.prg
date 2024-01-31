#include "hbclass.ch"

CREATE CLASS TlgoXAdES INHERIT TlgoObject

   HIDDEN:
   VAR oSigner   INIT NIL

   VISIBLE:
   METHOD New( cSHA1HashClass, cHA256HashClass, cBase64EncoderClass, oSigner ) CONSTRUCTOR

   ACCESS SHA1HashClass METHOD GetSHA1HashClass()
   ASSIGN SHA1HashClass METHOD SetSHA1HashClass( cClassName )
   ACCESS SHA256HashClass METHOD GetSHA256HashClass()
   ASSIGN SHA256HashClass METHOD SetSHA256HashClass( cClassName )
   ACCESS Base64EncoderClass METHOD GetBase64EncoderClass()
   ASSIGN Base64EncoderClass METHOD SetBase64EncoderClass( cClassName )
   ACCESS Signer METHOD GetSigner()
   ASSIGN Signer METHOD SetSigner( oSigner )
   ACCESS SignType METHOD GetSignType()
   ASSIGN SignType METHOD SetSignType( nSignType )
   ACCESS SerialNoFormat METHOD GetSerialNoFormat()
   ASSIGN SerialNoFormat METHOD SetSerialNoFormat( nFormat )
   ACCESS IncludeSigningTime METHOD GetIncludeSigningTime()
   ASSIGN IncludeSigningTime METHOD SetIncludeSigningTime( lValue )
   ACCESS SigningTime METHOD GetSigningTime()
   ASSIGN SigningTime METHOD SetSigningTime( tSignTimestamp )

ENDCLASS

METHOD New( cSHA1HashClass, cHA256HashClass, cBase64EncoderClass, oSigner ) CLASS TlgoXAdES

   LOCAL pExtObj, pSignerObj

   pSignerObj := iif( HB_ISOBJECT( oSigner ), oSigner:ExtObject, NIL )

   lgoCheckResult( lgpXAdES_Create( cSHA1HashClass, cHA256HashClass, cBase64EncoderClass, pSignerObj, @pExtObj ) )
   ::pExtObject := pExtObj

   RETURN Self

METHOD GetSHA1HashClass() CLASS TlgoXAdES

   LOCAL cClassName

   lgoCheckResult( lgpXAdES_GetSHA1HashClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetSHA1HashClass( cClassName ) CLASS TlgoXAdES

   lgoCheckResult( lgpXAdES_SetSHA1HashClass( ::pExtObject, @cClassName ) )

   RETURN NIL

METHOD GetSHA256HashClass() CLASS TlgoXAdES

   LOCAL cClassName

   lgoCheckResult( lgpXAdES_GetSHA256HashClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetSHA256HashClass( cClassName ) CLASS TlgoXAdES

   lgoCheckResult( lgpXAdES_SetSHA256HashClass( ::pExtObject, @cClassName ) )

   RETURN NIL

METHOD GetBase64EncoderClass() CLASS TlgoXAdES

   LOCAL cClassName

   lgoCheckResult( lgpXAdES_GetBase64EncoderClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetBase64EncoderClass( cClassName ) CLASS TlgoXAdES

   lgoCheckResult( lgpXAdES_SetBase64EncoderClass( ::pExtObject, @cClassName ) )

   RETURN NIL

METHOD GetSigner() CLASS TlgoXAdES

   /*
   LOCAL pSigner
   lgoCheckResult( lgpXAdES_GetSigner( ::pExtObject, @pSigner ) )
   RETURN pSigner
   */

   RETURN ::oSigner

METHOD SetSigner( oSigner ) CLASS TlgoXAdES

   LOCAL pSigner

   IF HB_ISOBJECT( oSigner )
      pSigner := oSigner:ExtObject
   ELSEIF HB_ISPOINTER( oSigner )
      pSigner := oSigner
   ELSE
      pSigner := NIL
   ENDIF

   lgoCheckResult( lgpXAdES_SetSigner( ::pExtObject, pSigner ) )

   ::oSigner := oSigner

   RETURN NIL

METHOD GetSignType() CLASS TlgoXAdES

   LOCAL nSignType

   lgoCheckResult( lgpXAdES_GetSignType( ::pExtObject, @nSignType ) )

   RETURN nSignType

METHOD SetSignType( nSignType ) CLASS TlgoXAdES

   lgoCheckResult( lgpXAdES_SetSignType( ::pExtObject, nSignType ) )

   RETURN NIL

METHOD GetSerialNoFormat() CLASS TlgoXAdES

   LOCAL nFormat

   lgoCheckResult( lgpXAdES_GetSerialNoFormat( ::pExtObject, @nFormat ) )

   RETURN nFormat

METHOD SetSerialNoFormat( nFormat ) CLASS TlgoXAdES

   lgoCheckResult( lgpXAdES_SetSerialNoFormat( ::pExtObject, nFormat ) )

   RETURN NIL

METHOD GetIncludeSigningTime() CLASS TlgoXAdES

   LOCAL lValue

   lgoCheckResult( lgpXAdES_GetIncludeSigningTime( ::pExtObject, @lValue ) )

   RETURN lValue

METHOD SetIncludeSigningTime( lValue ) CLASS TlgoXAdES

   lgoCheckResult( lgpXAdES_SetIncludeSigningTime( ::pExtObject, lValue ) )

   RETURN NIL

METHOD GetSigningTime() CLASS TlgoXAdES

   LOCAL nValue

   lgoCheckResult( lgpXAdES_GetSigningTime( ::pExtObject, @nValue ) )

   RETURN lgoDateTimeToTimestamp( nValue )


METHOD SetSigningTime( tSignTimestamp ) CLASS TlgoXAdES

   lgoCheckResult( lgpXAdES_SetSigningTime( ::pExtObject, lgoTimestampToDateTime( tSignTimestamp ) ) )

   RETURN NIL

