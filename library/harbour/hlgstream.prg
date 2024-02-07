#include "xhb.ch"
#include "hbclass.ch"

CREATE CLASS TlgoStream INHERIT TlgoObject

   METHOD Read( pData, nSize )
   METHOD Write( pData, nSize )

   ACCESS Position METHOD GetPosition()
   ASSIGN Position METHOD SetPosition( nValue )
   ACCESS Size METHOD GetSize()

ENDCLASS

METHOD Read( pData, nSize ) CLASS TlgoStream

   LOCAL nRes

   lgoCheckResult( lgpStream_Read( ::pExtObject, pData, nSize, @nRes ) )

   RETURN nRes

METHOD Write( pData, nSize ) CLASS TlgoStream

   LOCAL nRes

   lgoCheckResult( lgpStream_Write( ::pExtObject, pData, nSize, @nRes ) )

   RETURN nRes

METHOD GetPosition() CLASS TlgoStream

   LOCAL nRes

   lgoCheckResult( lgpStream_GetPosition( ::pExtObject, @nRes ) )

   RETURN nRes

METHOD SetPosition( nValue ) CLASS TlgoStream

   lgoCheckResult( lgpStream_SetPosition( ::pExtObject, nValue ) )

   RETURN NIL

METHOD GetSize() CLASS TlgoStream

   LOCAL nRes

   lgoCheckResult( lgpStream_GetPosition( ::pExtObject, @nRes ) )

   RETURN nRes

/*----------------------------------------------------------------------*/

CREATE CLASS TlgoFileStream INHERIT TlgoStream

  METHOD New( cFileName, nMode ) CONSTRUCTOR

ENDCLASS


METHOD New( cFileName, nMode ) CLASS TlgoFileStream

   LOCAL pExtObj

   lgoCheckResult( lgpFileStream_Create( cFileName, nMode, @pExtObj ) )
   ::pExtObject := pExtObj

   RETURN Self

/*----------------------------------------------------------------------*/

CREATE CLASS TlgoStringStream INHERIT TlgoStream

   METHOD New( cData ) CONSTRUCTOR

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

CREATE CLASS TlgoMemoryStream INHERIT TlgoStream

   METHOD New() CONSTRUCTOR

   METHOD GetData()

ENDCLASS

METHOD New() CLASS TlgoMemoryStream

   LOCAL pExtObj

   lgoCheckResult( lgpMemoryStream_Create( @pExtObj ) )
   ::pExtObject := pExtObj

   RETURN Self

METHOD GetData() CLASS TlgoMemoryStream

   LOCAL pData

   lgoCheckResult( lgpMemoryStream_GetData( ::pExtObject, @pData ) )

   RETURN pData

/*----------------------------------------------------------------------*/

