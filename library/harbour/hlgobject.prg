#include "xhb.ch"
#include "hbclass.ch"

CREATE CLASS TlgoObject

   PROTECTED:
   VAR pExtObject   INIT NIL

   VISIBLE:
   METHOD New( pExtObj ) CONSTRUCTOR
   DESTRUCTOR Free()

   METHOD ObjClassName()

   METHOD GetIntegerProp( cName )
   METHOD SetIntegerProp( cName, nValue )
   METHOD GetStringProp( cName )
   METHOD SetStringProp( cName, cValue )
   METHOD GetDoubleProp( cName )
   METHOD SetDoubleProp( cName, nValue )
   METHOD GetObjectProp( cName )
   METHOD SetObjectProp( cName, pValue )
   METHOD GetCurrencyProp( cName )
   METHOD SetCurrencyProp( cName, nValue )
   METHOD GetBooleanProp( cName )
   METHOD SetBooleanProp( cName, lValue )
   METHOD GetInt64Prop( cName )
   METHOD SetInt64Prop( cName, nValue )

   METHOD SetExtObject( pObject )

   ACCESS ExtObject INLINE ::pExtObject

ENDCLASS

METHOD New( pExtObj ) CLASS TlgoObject

   IF HB_ISPOINTER( pExtObj )
      ::pExtObject := pExtObj
   ENDIF

   RETURN Self

DESTRUCTOR Free() CLASS TlgoObject

   IF HB_ISPOINTER( ::pExtObject ) .AND. ! Empty( ::pExtObject )
      lgoCheckResult( lgpObject_Free( ::pExtObject ), .F. )
      ::pExtObject := NIL
   ENDIF

   RETURN

METHOD ObjClassName() CLASS TlgoObject

   LOCAL cResult

   lgoCheckResult( lgpObject_ClassName( ::pExtObject, @cResult ) )

   RETURN cResult

METHOD GetIntegerProp( cName ) CLASS TlgoObject

   LOCAL nResult

   lgoCheckResult( lgpObject_GetIntegerProp( ::pExtObject, cName, @nResult ) )

   RETURN nResult

METHOD SetIntegerProp( cName, nValue ) CLASS TlgoObject

   lgoCheckResult( lgpObject_GetIntegerProp( ::pExtObject, cName, nValue ) )

   RETURN NIL

METHOD GetStringProp( cName ) CLASS TlgoObject

   LOCAL pStr

   lgoCheckResult( lgpObject_GetStringProp( ::pExtObject, cName, @pStr ) )

   RETURN lgoGetString( pStr )

METHOD SetStringProp( cName, cValue ) CLASS TlgoObject

   lgoCheckResult( lgpObject_SetStringProp( ::pExtObject, cName, cValue ) )

   RETURN NIL

METHOD GetDoubleProp( cName ) CLASS TlgoObject

   LOCAL nResult

   lgoCheckResult( lgpObject_GetDoubleProp( ::pExtObject, cName, @nResult ) )

   RETURN nResult

METHOD SetDoubleProp( cName, nValue ) CLASS TlgoObject

   lgoCheckResult( lgpObject_SetDoubleProp( ::pExtObject, cName, nValue ) )

   RETURN NIL

METHOD GetObjectProp( cName ) CLASS TlgoObject

   LOCAL pResult

   lgoCheckResult( lgpObject_GetObjectProp( ::pExtObject, cName, @pResult ) )

   RETURN pResult

METHOD SetObjectProp( cName, pValue ) CLASS TlgoObject

   lgoCheckResult( lgpObject_SetObjectProp( ::pExtObject, cName, pValue ) )

   RETURN NIL

METHOD GetCurrencyProp( cName ) CLASS TlgoObject

   LOCAL nResult

   lgoCheckResult( lgpObject_GetCurrencyProp( ::pExtObject, cName, @nResult ) )

   RETURN nResult

METHOD SetCurrencyProp( cName, nValue ) CLASS TlgoObject

   lgoCheckResult( lgpObject_SetCurrencyProp( ::pExtObject, cName, nValue ) )

   RETURN NIL

METHOD GetBooleanProp( cName ) CLASS TlgoObject

   LOCAL lResult

   lgoCheckResult( lgpObject_GetBooleanProp( ::pExtObject, cName, @lResult ) )

   RETURN lResult

METHOD SetBooleanProp( cName, lValue ) CLASS TlgoObject

   lgoCheckResult( lgpObject_SetBooleanProp( ::pExtObject, cName, lValue ) )

   RETURN NIL

METHOD GetInt64Prop( cName ) CLASS TlgoObject

   LOCAL nResult

   lgoCheckResult( lgpObject_GetInt64Prop( ::pExtObject, cName, @nResult ) )

   RETURN nResult

METHOD SetInt64Prop( cName, nValue ) CLASS TlgoObject

   lgoCheckResult( lgpObject_SetInt64Prop( ::pExtObject, cName, nValue ) )

   RETURN NIL


METHOD SetExtObject( pObject ) CLASS TlgoObject

   ::pExtObject := pObject

   RETURN NIL

/*----------------------------------------------------------------------*/


FUNCTION lgoCheckResult( pExceptionObj, lRaiseExept )

   LOCAL lResult

   hb_default( @lRaiseExept, .T. )

   IF HB_ISPOINTER( pExceptionObj ) .AND. ! Empty( pExceptionObj )
      IF lRaiseExept
         Throw( lgoCreateException( pExceptionObj ) )
      ELSE
         lgpObject_Free( pExceptionObj )
         lResult := .F.
      ENDIF
   ELSE
      lResult := .T.
   ENDIF

   RETURN lResult

/*----------------------------------------------------------------------*/

FUNCTION lgoCreateException( pException )

   LOCAL pString, oException, cString, aData, pList, aItem, nCnt, i, pListItem

   oException := ErrorNew()
   IF lgoCheckResult( lgpObject_GetStringProp( pException, 'ExceptionClass', @pString ), .F. )
      cString := lgoGetString( pString )
      oException:subsystem := cString
      IF lgoCheckResult( lgpObject_GetStringProp( pException, 'Message', @pString ), .F. )
         oException:description := lgoGetString( pString )
      ENDIF
      IF Upper( cString ) == 'EKSEFEXCEPTIONRESPONSE'
         aData := {=>}
         IF lgoCheckResult( lgpObject_GetIntegerProp( pException, 'ResponseCode', @i ), .F. )
            aData[ 'ResponseCode' ] := i
         ENDIF
         IF lgoCheckResult( lgpObject_GetStringProp( pException, 'RawData', @pString ), .F. )
            aData[ 'RawData' ] := lgoGetString( pString )
         ENDIF
         IF lgoCheckResult( lgpObject_GetStringProp( pException, 'ServiceCtx', @pString ), .F. )
            aData[ 'ServiceCtx' ] := lgoGetString( pString )
         ENDIF
         IF lgoCheckResult( lgpObject_GetStringProp( pException, 'ServiceCode', @pString ), .F. )
            aData[ 'ServiceCode' ] := lgoGetString( pString )
         ENDIF
         IF lgoCheckResult( lgpObject_GetStringProp( pException, 'ServiceName', @pString ), .F.  )
            aData[ 'ServiceName' ] := lgoGetString( pString )
         ENDIF
         IF lgoCheckResult( lgpObject_GetDoubleProp( pException, 'Timestamp', @i ), .F. )
            aData[ 'Timestamp' ] := lgoDateTimeToTimestamp( i )
         ENDIF
         IF lgoCheckResult( lgpObject_GetStringProp( pException, 'ReferenceNumber', @pString ), .F. )
            aData[ 'ReferenceNumber' ] := lgoGetString( pString )
         ENDIF
         aData[ 'ExceptionDetailList' ] := {}
         pList := lgoCheckResult( lgpObject_GetObjectProp( pException, 'ExceptionDetailList' ), .F. )
         nCnt := 0
         lgoCheckResult( lgpListObject_GetCount( pList, @nCnt ), .F. )
         FOR i := 0 TO nCnt - 1
            pListItem := lgoCheckResult( lgpListObject_GetItem( pList, @pListItem ), .F. )
            IF ! Empty( pListItem )
               aItem := {=>}
               IF lgoCheckResult( lgpObject_GetIntegerProp( pListItem, 'ExceptionCode', @pString ), .F. )
                  aItem[ 'ExceptionCode' ] := pString
               ENDIF
               IF lgoCheckResult( lgpObject_GetStringProp( pListItem, 'ExceptionDescription', @pString ) )
                  aItem[ 'ExceptionDescription' ] := lgoGetString( pString )
               ENDIF
               AAdd( aData[ 'ExceptionDetailList' ], aItem )
            ENDIF
         NEXT
         oException:Cargo := aData
      ENDIF
   ENDIF

   lgoCheckResult( lgpObject_Free( pException ), .F. )

   RETURN oException

/*----------------------------------------------------------------------*/

FUNCTION lgoGetString( pStringObj, lFreeObj )

   LOCAL cResult := ''

   hb_default( @lFreeObj, .T. )

   IF HB_ISPOINTER( pStringObj ) .AND. ! Empty( pStringObj )
      lgoCheckResult( lgpStringObject_GetValue( pStringObj, @cResult ), .F. )
      IF lFreeObj
         lgoCheckResult( lgpObject_Free( pStringObj ), .F. )
      ENDIF
   ENDIF

   RETURN cResult

/*----------------------------------------------------------------------*/

FUNCTION lgoClassName( pClass )

   LOCAL cResult

   lgoCheckResult( lgpObject_ClassName( pClass, @cResult ) )

   RETURN cResult

/*----------------------------------------------------------------------*/

FUNCTION lgoCreateObject( pObject )

   LOCAL cClassName, oRes

   IF HB_ISPOINTER( pObject ) .AND. ! Empty( pObject )

      cClassName := lgoClassName( pObject ) + "()"
      oRes := &cClassName:New( pObject )

   ELSE

      oRes := NIL

   ENDIF

   RETURN oRes

/*----------------------------------------------------------------------*/

