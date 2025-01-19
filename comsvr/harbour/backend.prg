#require "hbwin"
#include "libgovpl4com.ch"

PROCEDURE Main()

   LOCAL oBackend, i, l
   LOCAL aTitles := { "HTTP client", "Certificate signer", "Randdom number generator", ;
      "Base64 encoder", "MD5 hash", "SHA1 hash", "SHA256 hash", "AES256 encrypt", ;
      "RSA encrypt", "Zipper", "XML reader", "XML C14N", "EdekGate" }

   oBackend := win_oleCreateObject( "LibGovPl.lgcBackend" )

   FOR i := LGC_CT_HTTPCLIENT TO LGC_CT_EDEKGATE
      ListDrivers( oBackend, i, aTitles[ i + 1 ] )
   NEXT

   l := oBackend:GetClassNames( LGC_CT_HTTPCLIENT )
   FOR i := 1 TO Len( l )
      ? l[ i ]
   NEXT

   RETURN

PROCEDURE ListDrivers( oBackend, nDriverType, cTitle )
   LOCAL i

   ? "Class type: " + cTitle
   FOR i := 0 TO oBackend:GetClassCount( nDriverType ) - 1
      ? oBackend:GetClassName( nDriverType, i )
   NEXT
   ? "---------------------------"

   RETURN NIL

/*----------------------------------------------------------------------*/

