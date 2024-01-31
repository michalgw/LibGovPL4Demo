#include "hbclass.ch"

CREATE CLASS TlgoHTTPClient INHERIT TlgoObject

   VISIBLE:
   METHOD New( cClassName )

   ACCESS IgnoreSSLErrors METHOD GetIgnoreSSLErrors
   ASSIGN IgnoreSSLErrors METHOD SetIgnoreSSLErrors

ENDCLASS


METHOD New( cClassName ) CLASS TlgoHTTPClient

   LOCAL pHTTPClient

   lgoCheckResult( lgpHTTPClient_Create( cClassName, @pHTTPClient ) )
   ::pExtObject := pHTTPClient

   RETURN Self

METHOD GetIgnoreSSLErrors() CLASS TlgoHTTPClient

   LOCAL lRes

   lgoCheckResult( lgpHTTPClient_GetIgnoreSSLErrors( ::pExtObject, @lRes ) )

   RETURN lRes

METHOD SetIgnoreSSLErrors( lValue ) CLASS TlgoHTTPClient

   lgoCheckResult( lgpHTTPClient_SetIgnoreSSLErrors( ::pExtObject, lValue ) )

   RETURN lValue

/*----------------------------------------------------------------------*/

CREATE CLASS TlgoRSAKey INHERIT TlgoObject

ENDCLASS

/*----------------------------------------------------------------------*/

FUNCTION TlgoRSAEncrypt_CreateKey( cRSAEncryptClass, oStream )

   LOCAL oRSAKey, pRSAKey

   lgoCheckResult( lgpRSAEncrypt_CreateKey( cRSAEncryptClass, oStream:ExtObject, @pRSAKey ) )
   oRSAKey := TlgoRSAKey():New( pRSAKey )

   RETURN oRSAKey

/*----------------------------------------------------------------------*/

CREATE CLASS TlgoCertificate INHERIT TlgoObject

   ACCESS DisplayName METHOD GetDisplayName()
   ACCESS Subject METHOD GetSubject()
   ACCESS Issuer METHOD GetIssuer()
   ACCESS SerialNoDec METHOD GetSerialNoDec()
   ACCESS SerialNoHex METHOD GetSerialNoHex()
   ACCESS ValidFrom METHOD GetValidFrom()
   ACCESS ValidTo METHOD GetValidTo()

ENDCLASS

METHOD GetDisplayName() CLASS TlgoCertificate

   LOCAL pString

   lgoCheckResult( lgpCertificate_GetDisplayName( ::pExtObject, @pString ) )

   RETURN lgoGetString( pString )

METHOD GetSubject() CLASS TlgoCertificate

   LOCAL pString

   lgoCheckResult( lgpCertificate_GetSubject( ::pExtObject, @pString ) )

   RETURN lgoGetString( pString )

METHOD GetIssuer() CLASS TlgoCertificate

   LOCAL pString

   lgoCheckResult( lgpCertificate_GetIssuer( ::pExtObject, @pString ) )

   RETURN lgoGetString( pString )

METHOD GetSerialNoDec() CLASS TlgoCertificate

   LOCAL pString

   lgoCheckResult( lgpCertificate_GetSerialNoDec( ::pExtObject, @pString ) )

   RETURN lgoGetString( pString )

METHOD GetSerialNoHex() CLASS TlgoCertificate

   LOCAL pString

   lgoCheckResult( lgpCertificate_GetSerialNoHex( ::pExtObject, @pString ) )

   RETURN lgoGetString( pString )

METHOD GetValidFrom() CLASS TlgoCertificate

   LOCAL nDate

   lgoCheckResult( lgpCertificate_GetValidFrom( ::pExtObject, @nDate ) )

   RETURN lgoDateTimeToTimestamp( nDate )

METHOD GetValidTo() CLASS TlgoCertificate

   LOCAL nDate

   lgoCheckResult( lgpCertificate_GetValidTo( ::pExtObject, @nDate ) )

   RETURN lgoDateTimeToTimestamp( nDate )

/*----------------------------------------------------------------------*/

CREATE CLASS TlgoCertificates INHERIT TlgoObject

   HIDDEN:
   VAR aList      INIT {}

   VISIBLE:
   DESTRUCTOR Free()

   METHOD Count()
   METHOD GetItem( nIndex )

ENDCLASS

DESTRUCTOR Free() CLASS TlgoCertificates

   LOCAL nI

   FOR nI := 1 TO Len( ::aList )
      IF HB_ISOBJECT( ::aList[ nI ] )
         ::aList[ nI ] := NIL
      ENDIF
   NEXT
   ::aList := {}

   RETURN

METHOD Count() CLASS TlgoCertificates

   LOCAL nCount

   lgoCheckResult( lgpListObject_GetCount( ::pExtObject, @nCount ) )

   RETURN nCount

METHOD GetItem( nIndex ) CLASS TlgoCertificates

   LOCAL oItem := NIL, pCert

   IF nIndex > 0 .AND. nIndex <= ::Count()
      IF Len( ::aList ) < nIndex
         ASize( ::aList, nIndex )
      ENDIF
      IF ::aList[ nIndex ] == NIL
         lgoCheckResult( lgpListObject_GetItem( ::pExtObject, nIndex - 1, @pCert ) )
         IF ! Empty( pCert )
           ::aList[ nIndex ] := TlgoCertificate():New( pCert )
         ENDIF
      ENDIF
      oItem := ::aList[ nIndex ]
   ENDIF

   RETURN oItem

/*----------------------------------------------------------------------*/

CREATE CLASS TlgoCertificateSigner INHERIT TlgoObject

   METHOD New( cClassName ) CONSTRUCTOR
   METHOD List()
   METHOD UISelect()

ENDCLASS

METHOD New( cClassName ) CLASS TlgoCertificateSigner

   LOCAL pExtObj

   lgoCheckResult( lgpCertificateSigner_Create( cClassName, @pExtObj ) )
   ::pExtObject := pExtObj

   RETURN Self

METHOD List() CLASS TlgoCertificateSigner

   LOCAL oCerts := NIL, pCertsObj

   lgoCheckResult( lgpCertificateSigner_List( ::pExtObject, @pCertsObj ) )
   IF ! Empty( pCertsObj )
      oCerts := TlgoCertificates():New( pCertsObj )
   ENDIF

   RETURN oCerts

METHOD UISelect() CLASS TlgoCertificateSigner

   LOCAL pCert, oCert := NIL

   lgoCheckResult( lgpCertificateSigner_UISelect( ::pExtObject, @pCert ) )
   IF ! Empty( pCert )
      oCert := TlgoCertificate():New( pCert )
   ENDIF

   RETURN oCert

/*----------------------------------------------------------------------*/

FUNCTION lgoStringListToArray( cStringList )

   RETURN hb_ATokens( cStringList, ';' )

/*----------------------------------------------------------------------*/

FUNCTION lgoArrayToStringList( aArray )

   LOCAL cResult := ''

   AEval( aArray, { | cItem | cResult := cResult + iif( Len( cResult ) > 0, ';', '' ) + cItem } )

   RETURN cResult

/*----------------------------------------------------------------------*/

FUNCTION lgoListDrivers( nClassType )

   RETURN lgoStringListToArray( lgplListDrivers( nClassType ) )

/*----------------------------------------------------------------------*/

FUNCTION lgoTimestampToDateTime( dTimestamp )

   RETURN iif( HB_ISNIL( dTimestamp ), 0, lgpEncodeDateTime( Year( dTimestamp ), Month( dTimestamp ), Day( dTimestamp ), ;
      hb_Hour( dTimestamp ), hb_Minute( dTimestamp ), Int( hb_Sec( dTimestamp ) ), ;
      Int( ( hb_Sec( dTimestamp ) - Int( hb_Sec( dTimestamp ) ) ) * 1000 ) ) )

/*----------------------------------------------------------------------*/

FUNCTION lgoDateToDateTime( dDate )

   RETURN iif( HB_ISNIL( dDate ), 0, lgpEncodeDateTime( Year( dDate ), Month( dDate ), Day( dDate ), ;
      0, 0, 0, 0 ) )

/*----------------------------------------------------------------------*/

FUNCTION lgoDateTimeToTimestamp( nDateTime )

   LOCAL nYear, nMonth, nDay, nHour, nMinute, nSec, nMSec, xRes

   IF nDateTime = 0
      xRes := NIL
   ELSE
      lgpDecodeDateTime( nDateTime, @nYear, @nMonth, @nDay, @nHour, @nMinute, @nSec, @nMSec )
      xRes := hb_DateTime( nYear, nMonth, nDay, nHour, nMinute, nSec, nMSec )
   ENDIF

   RETURN xRes

/*----------------------------------------------------------------------*/

FUNCTION lgoDateTimeToDate( nDateTime )

   LOCAL nYear, nMonth, nDay, nHour, nMinute, nSec, nMSec, xRes

   IF nDateTime = 0
      xRes := NIL
   ELSE
      lgpDecodeDateTime( nDateTime, @nYear, @nMonth, @nDay, @nHour, @nMinute, @nSec, @nMSec )
      xRes := hb_Date( nYear, nMonth, nDay )
   ENDIF

   RETURN xRes

/*----------------------------------------------------------------------*/


/*----------------------------------------------------------------------*/

