#include "xhb.ch"
#include "hbclass.ch"

CREATE CLASS TlgoStream INHERIT TlgoObject

ENDCLASS

CREATE CLASS TlgoFileStream INHERIT TlgoStream

  METHOD New( cFileName, nMode )

ENDCLASS


METHOD New( cFileName, nMode ) CLASS TlgoFileStream

   LOCAL pExtObj

   lgoCheckResult( lgpFileStream_Create( cFileName, nMode, @pExtObj ) )
   ::pExtObject := pExtObj

   RETURN Self

/*----------------------------------------------------------------------*/

CREATE CLASS TlgoStringStream INHERIT TlgoStream

   METHOD New( cData )

   METHOD GetString()

ENDCLASS

METHOD New( cData ) CLASS TlgoStringStream

   LOCAL pExtObj

   lgoCheckResult( lgpStringStream_Create( cData, @pExtObj ) )
   ::pExtObject := pExtObj

   RETURN Self

METHOD GetString() CLASS TlgoStringStream

   LOCAL pString

   lgoCheckResult( lgpStringStream_GetString( ::pExtObject, @pString ) )

   RETURN lgoGetString( pString )

/*----------------------------------------------------------------------*/

