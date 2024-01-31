#include "hbdyn.ch"

#define LIB_GOV_PL_4_LIBNAME "libgovpl4.dll"

STATIC h_LibGovPL4 := NIL

FUNCTION lgpLoadLib( cLibFile )

   hb_default( @cLibFile, LIB_GOV_PL_4_LIBNAME )

   IF HB_ISNIL( h_LibGovPL4 )
      h_LibGovPL4 := hb_libLoad( cLibFile )
   ENDIF

   RETURN h_LibGovPL4

/*----------------------------------------------------------------------*/

FUNCTION lgplVersion()

   RETURN hb_dynCall( { "lgplVersion", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CTYPE_INT_UNSIGNED, HB_DYN_CALLCONV_STDCALL ) } )

/*----------------------------------------------------------------------*/

FUNCTION lgplListDrivers( nClassType )

   RETURN hb_DynCall( { "lgplListDrivers", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT }, nClassType )

/*----------------------------------------------------------------------*/

FUNCTION lgplInit()

   RETURN hb_dynCall( { "lgplInit", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CTYPE_INT_UNSIGNED, HB_DYN_CALLCONV_STDCALL ) } )

/*----------------------------------------------------------------------*/

FUNCTION lgplExit()
   RETURN hb_dynCall( { "lgplExit", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CTYPE_INT_UNSIGNED, HB_DYN_CALLCONV_STDCALL ) } )

/*----------------------------------------------------------------------*/

FUNCTION lgplSetDefaultDriver( nDriverClass, cDriverName )

   RETURN hb_DynCall( { "lgplSetDefaultDriver", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_INT ), ;
      HB_DYN_CTYPE_INT, hb_bitOr( HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      nDriverClass, cDriverName )

/*----------------------------------------------------------------------*/

FUNCTION  lgpHTTPClient_Create( cClassName, pHttpClient )

   RETURN hb_DynCall( { "lgpHTTPClient_Create", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), HB_DYN_CTYPE_VOID_PTR }, ;
      cClassName, @pHttpClient )

/*----------------------------------------------------------------------*/

FUNCTION lgpHTTPClient_GetIgnoreSSLErrors( pHTTPClientObject, lValue )

   RETURN hb_DynCall( { "lgpHTTPClient_GetIgnoreSSLErrors", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_BOOL }, ;
      pHTTPClientObject, @lValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpHTTPClient_SetIgnoreSSLErrors( pHTTPClientObject, lValue )

   RETURN hb_DynCall( { "lgpHTTPClient_SetIgnoreSSLErrors", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_BOOL }, ;
      pHTTPClientObject, lValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpRSAEncrypt_CreateKey( cClassName, pKeyStream, pRSAKey )

   RETURN hb_DynCall( { "lgpRSAEncrypt_CreateKey", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      hb_bitOr( HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_VOID_PTR }, cClassName, pKeyStream, @pRSAKey )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificate_GetDisplayName( pCertificate, pValue )

   RETURN hb_DynCall( { "lgpCertificate_GetDisplayName", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pCertificate, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificate_GetSubject( pCertificate, pValue )

   RETURN hb_DynCall( { "lgpCertificate_GetSubject", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pCertificate, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificate_GetIssuer( pCertificate, pValue )

   RETURN hb_DynCall( { "lgpCertificate_GetIssuer", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pCertificate, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificate_GetSerialNoDec( pCertificate, pValue )

   RETURN hb_DynCall( { "lgpCertificate_GetSerialNoDec", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pCertificate, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificate_GetSerialNoHex( pCertificate, pValue )

   RETURN hb_DynCall( { "lgpCertificate_GetSerialNoHex", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pCertificate, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificate_GetValidFrom( pCertificate, nValue )

   RETURN hb_DynCall( { "lgpCertificate_GetValidFrom", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_DOUBLE }, ;
      pCertificate, @nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificate_GetValidTo( pCertificate, nValue )

   RETURN hb_DynCall( { "lgpCertificate_GetValidTo", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_DOUBLE }, ;
      pCertificate, @nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpCNGCertificate_ShowCertificateInfo( pCertificate, nHWnd )

   RETURN hb_DynCall( { "lgpCNGCertificate_ShowCertificateInfo", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_LONG_UNSIGNED }, ;
      pCertificate, @nHWnd )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificateSigner_Create( cClassName, pCertSigner )

   RETURN hb_DynCall( { "lgpCertificateSigner_Create", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      hb_bitOr( HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), HB_DYN_CTYPE_VOID_PTR }, ;
      cClassName, @pCertSigner )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificateSigner_List( pCertificateSigner, pCertList )

   RETURN hb_DynCall( { "lgpCertificateSigner_List", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pCertificateSigner, @pCertList )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificateSigner_FindBySerialNumber( pCertificateSigner, cSerialNo, pCertificate )

   RETURN hb_DynCall( { "lgpCertificateSigner_FindBySerialNumber", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pCertificateSigner, cSerialNo, @pCertificate )

/*----------------------------------------------------------------------*/

FUNCTION lgpCertificateSigner_UISelect( pCertificateSigner, pCertificate )

   RETURN hb_DynCall( { "lgpCertificateSigner_UISelect", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pCertificateSigner, @pCertificate )

/*----------------------------------------------------------------------*/

FUNCTION lgpCNGCertificateSigner_SetHWnd( pCertificateSigner, nHWnd )

   RETURN hb_DynCall( { "lgpCNGCertificateSigner_SetHWnd", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_LONG_UNSIGNED }, ;
      pCertificateSigner, nHWnd )

/*----------------------------------------------------------------------*/

FUNCTION lgpEncodeDateTime( nYear, nMonth, nDay, nHour, nMinute, nSec, nMSec )

   RETURN hb_DynCall( { "lgpEncodeDateTime", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_DOUBLE ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, ;
      HB_DYN_CTYPE_INT }, nYear, nMonth, nDay, nHour, nMinute, nSec, nMSec )

/*----------------------------------------------------------------------*/

PROCEDURE lgpDecodeDateTime( nDateTime, nYear, nMonth, nDay, nHour, nMinute, nSec, nMSec )

   hb_DynCall( { "lgpDecodeDateTime", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID ), HB_DYN_CTYPE_DOUBLE, ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, ;
      HB_DYN_CTYPE_INT }, nDateTime, @nYear, @nMonth, @nDay, @nHour, ;
      @nMinute, @nSec, @nMSec )

   RETURN

/*----------------------------------------------------------------------*/

// Object
FUNCTION lgpObject_Free( pObject )

   RETURN hb_DynCall( { "lgpObject_Free", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR }, pObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_ClassName( pObject, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpObject_ClassName", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pObject, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_GetStringProp( pObject, cPropName, pValue )

   RETURN hb_DynCall( { "lgpObject_GetStringProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, pObject, cPropName, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_SetStringProp( pObject, cPropName, cValue )

   RETURN hb_DynCall( { "lgpObject_SetStringProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), },;
      pObject, cPropName, cValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_GetIntegerProp( pObject, cPropName, nValue )

   RETURN hb_DynCall( { "lgpObject_GetIntegerProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_LONG }, pObject, cPropName, @nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_SetIntegerProp( pObject, cPropName, nValue )

   RETURN hb_DynCall( { "lgpObject_SetIntegerProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_LONG }, pObject, cPropName, nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_GetDoubleProp( pObject, cPropName, nValue )

   RETURN hb_DynCall( { "lgpObject_GetDoubleProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_DOUBLE }, pObject, cPropName, @nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_SetDoubleProp( pObject, cPropName, nValue )

   RETURN hb_DynCall( { "lgpObject_SetDoubleProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_DOUBLE }, pObject, cPropName, nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_GetObjectProp( pObject, cPropName, pValue )

   RETURN hb_DynCall( { "lgpObject_GetObjectProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, pObject, cPropName, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_SetObjectProp( pObject, cPropName, pValue )

   RETURN hb_DynCall( { "lgpObject_SetObjectProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, pObject, cPropName, pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_GetCurrencyProp( pObject, cPropName, nValue )

   RETURN hb_DynCall( { "lgpObject_GetCurrencyProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_LLONG }, pObject, cPropName, @nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_SetCurrencyProp( pObject, cPropName, nValue )

   RETURN hb_DynCall( { "lgpObject_SetCurrencyProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_LLONG }, pObject, cPropName, nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_GetBooleanProp( pObject, cPropName, lValue )

   RETURN hb_DynCall( { "lgpObject_GetBooleanProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_BOOL }, pObject, cPropName, @lValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_SetBooleanProp( pObject, cPropName, lValue )

   RETURN hb_DynCall( { "lgpObject_SetBooleanProp", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_BOOL }, pObject, cPropName, lValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_GetInt64Prop( pObject, cPropName, nValue )

   RETURN hb_DynCall( { "lgpObject_GetInt64Prop", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_LLONG }, pObject, cPropName, @nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpObject_SetInt64Prop( pObject, cPropName, nValue )

   RETURN hb_DynCall( { "lgpObject_SetInt64Prop", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_LLONG }, pObject, cPropName, nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpStringObject_GetValue( pStringObject, cValue )

   LOCAL pStr, pRes

   pRes := hb_DynCall( { "lgpStringObject_GetValue", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pStringObject, @pStr )

   cValue := lgoPCharToStr( pStr )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpListObject_GetCount( pListObject, nValue )

   RETURN hb_DynCall( { "lgpListObject_GetCount", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pListObject, @nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpListObject_GetItem( pListObject, nIndex, pItem )

   RETURN hb_DynCall( { "lgpListObject_GetItem", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pListObject, nIndex, @pItem )

/*----------------------------------------------------------------------*/

FUNCTION lgpListObject_Delete( pListObject, nIndex )

   RETURN hb_DynCall( { "lgpListObject_Delete", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pListObject, nIndex )

/*----------------------------------------------------------------------*/

FUNCTION lgpListObject_Remove( pListObject, pItem )

   RETURN hb_DynCall( { "lgpListObject_Remove", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pListObject, pItem )

/*----------------------------------------------------------------------*/

FUNCTION lgpListObject_GetOwnsObjects( pListObject, lValue )

   RETURN hb_DynCall( { "lgpListObject_GetOwnsObjects", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_BOOL }, ;
      pListObject, @lValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpListObject_SetOwnsObjects( pListObject, lValue )

   RETURN hb_DynCall( { "lgpListObject_SetOwnsObjects", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_BOOL }, ;
      pListObject, lValue )

/*----------------------------------------------------------------------*/

// Stream
/* function lgpStream_Create(AStreamObject: Pointer; AReadFunc: TlgpStreamReadFunc;
  AWriteFunc: TlgpStreamWriteFunc; ASeekFunc: TlgpStreamSeekFunc;
  AGetPositionFunc: TlgpStreamGetPositionFunc; AGetSizeFunc: TlgpStreamGetSizeFunc;
  var AStream: LGP_OBJECT): LGP_EXCEPTION; stdcall; external LGP_LIBNAME; */

FUNCTION lgpFileStream_Create( cFileName, nMode, pStream )

   RETURN hb_DynCall( { "lgpFileStream_Create", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      cFileName, nMode, @pStream )

/*----------------------------------------------------------------------*/

FUNCTION lgpStringStream_Create( cData, pStream )

   RETURN hb_DynCall( { "lgpStringStream_Create", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, cData, @pStream )

/*----------------------------------------------------------------------*/

FUNCTION lgpStringStream_GetString( pStringStream, pString )

   RETURN hb_DynCall( { "lgpStringStream_GetString", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pStringStream, @pString )

/*----------------------------------------------------------------------*/

// WST EDek Gate
FUNCTION lgpWST_RegisterTransport()

   RETURN hb_DynCall( { "lgpWST_RegisterTransport", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ) } )

/*----------------------------------------------------------------------*/

FUNCTION lgpWST_GetHTTPClient( pHTTPClient )

   RETURN hb_DynCall( { "lgpWST_GetHTTPClient", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR }, @pHTTPClient )

/*----------------------------------------------------------------------*/

FUNCTION lgpWST_SetHTTPClient( pHTTPClient )

   RETURN hb_DynCall( { "lgpWST_SetHTTPClient", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR }, pHTTPClient )

/*----------------------------------------------------------------------*/

// XAdES
FUNCTION lgpXAdES_Create( cSHA1HashClass, cSHA256HashClass, cBase64EncoderClass, pSigner, pXAdESObject )

   RETURN hb_DynCall( { "lgpXAdES_Create", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, cSHA1HashClass, ;
      cSHA256HashClass, cBase64EncoderClass, pSigner, @pXAdESObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_GetSHA1HashClass( pXAdESObject, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpXAdES_GetSHA1HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pXAdESObject, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

function lgpXAdES_SetSHA1HashClass( pXAdESObject, cClassName )

   RETURN hb_DynCall( { "lgpXAdES_SetSHA1HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pXAdESObject, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_GetSHA256HashClass( pXAdESObject, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpXAdES_GetSHA256HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pXAdESObject, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_SetSHA256HashClass( pXAdESObject, cClassName )

   RETURN hb_DynCall( { "lgpXAdES_SetSHA256HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pXAdESObject, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_GetBase64EncoderClass( pXAdESObject, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpXAdES_GetBase64EncoderClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pXAdESObject, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_SetBase64EncoderClass( pXAdESObject, cClassName )

   RETURN hb_DynCall( { "lgpXAdES_SetBase64EncoderClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pXAdESObject, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_GetSigner( pXAdESObject, pSigner )

   RETURN hb_DynCall( { "lgpXAdES_GetSigner", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pXAdESObject, @pSigner )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_SetSigner( pXAdESObject, pSigner )

   RETURN hb_DynCall( { "lgpXAdES_SetSigner", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pXAdESObject, pSigner )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_GetSignType( pXAdESObject, nSignType )

   RETURN hb_DynCall( { "lgpXAdES_GetSignType", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pXAdESObject, @nSignType )

/*----------------------------------------------------------------------*/

function lgpXAdES_SetSignType( pXAdESObject, nSignType )

   RETURN hb_DynCall( { "lgpXAdES_SetSignType", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pXAdESObject, nSignType )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_GetSerialNoFormat( pXAdESObject, nSerialNoFormat )

   RETURN hb_DynCall( { "lgpXAdES_GetSerialNoFormat", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pXAdESObject, @nSerialNoFormat )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_SetSerialNoFormat( pXAdESObject, nSerialNoFormat )

   RETURN hb_DynCall( { "lgpXAdES_SetSerialNoFormat", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pXAdESObject, nSerialNoFormat )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_GetIncludeSigningTime( pXAdESObject, lIncludeSigningTime )

   RETURN hb_DynCall( { "lgpXAdES_GetIncludeSigningTime", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_BOOL }, ;
      pXAdESObject, @lIncludeSigningTime )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_SetIncludeSigningTime( pXAdESObject, lIncludeSigningTime )

   RETURN hb_DynCall( { "lgpXAdES_SetIncludeSigningTime", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_BOOL }, ;
      pXAdESObject, lIncludeSigningTime )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_GetSigningTime( pXAdESObject, nSigningTime )

   RETURN hb_DynCall( { "lgpXAdES_GetSigningTime", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_DOUBLE }, ;
      pXAdESObject, @nSigningTime )

/*----------------------------------------------------------------------*/

FUNCTION lgpXAdES_SetSigningTime( pXAdESObject, nSigningTime )

   RETURN hb_DynCall( { "lgpXAdES_SetSigningTime", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_DOUBLE }, ;
      pXAdESObject, nSigningTime )

/*----------------------------------------------------------------------*/

// EDek
FUNCTION lgpEDek_Create( cXMLCanonizator, cEDekGate, pEDekObj )

   RETURN hb_DynCall( { "lgpEDek_Create", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      cXMLCanonizator, cEDekGate, @pEDekObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_GetXAdES( pEDekObj, pXAdESObj )

   RETURN hb_DynCall( { "lgpEDek_GetXAdES", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, @pXAdESObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_SetXAdES( pEDekObj, pXAdESObj )

   RETURN hb_DynCall( { "lgpEDek_SetXAdES", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, pXAdESObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_GetXMLCanonizatorClass( pEDekObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpEDek_GetXMLCanonizatorClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_SetXMLCanonizatorClass( pEDekObj, cClassName )

   RETURN hb_DynCall( { "lgpEDek_SetXMLCanonizatorClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pEDekObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_GetEDekGateClass( pEDekObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpEDek_GetEDekGateClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_SetEDekGateClass( pEDekObj, cClassName )

   RETURN hb_DynCall( { "lgpEDek_SetEDekGateClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pEDekObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_GetCanonization( pEDekObj, lC14N )

   RETURN hb_DynCall( { "lgpEDek_GetCanonization", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_BOOL }, ;
      pEDekObj, @lC14N )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_SetCanonization( pEDekObj, lC14N )

   RETURN hb_DynCall( { "lgpEDek_SetCanonization", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_BOOL }, ;
      pEDekObj, lC14N )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_PodpiszCertyfikatem( pEDekObj, cDane, pCertyfikat, pDanePodpisane )

   RETURN hb_DynCall( { "lgpEDek_PodpiszCertyfikatem", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, cDane, pCertyfikat, @pDanePodpisane )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_PodpiszCertyfikatemStream( pEDekObj, pDane, pCertyfikat, pDanePodpisane )

   RETURN hb_DynCall( { "lgpEDek_PodpiszCertyfikatemStream", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, pDane, pCertyfikat, pDanePodpisane )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_PodpiszDanymiAut( pEDekObj, cDane, cImie, cNazwisko, cNIP, nDataUr, nKwota, pDanePodpisane )

   RETURN hb_DynCall( { "lgpEDek_PodpiszDanymiAut", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_DOUBLE, HB_DYN_CTYPE_LLONG, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, cDane, cImie, cNazwisko, cNIP, nDataUr, nKwota, @pDanePodpisane )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_PodpiszDanymiAutStream( pEDekObj, pDane, cImie, cNazwisko, cNIP, nDataUr, nKwota, pDanePodpisane )

   RETURN hb_DynCall( { "lgpEDek_PodpiszDanymiAutStream", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_DOUBLE, HB_DYN_CTYPE_LLONG, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, pDane, cImie, cNazwisko, cNIP, nDataUr, nKwota, pDanePodpisane )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_Wyslij( pEDekObj, cDanePodpisane, nRodzajBramki, nRodzajPodpisu, cNrRef, nStatus, pStatusOpis )

   RETURN hb_DynCall( { "lgpEDek_Wyslij", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, cDanePodpisane, nRodzajBramki, nRodzajPodpisu, @cNrRef, @nStatus, @pStatusOpis )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_WyslijStream( pEDekObj, pDanePodpisane, nRodzajBramki, nRodzajPodpisu, cNrRef, nStatus, pStatusOpis )

   RETURN hb_DynCall( { "lgpEDek_WyslijStream", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, pDanePodpisane, nRodzajBramki, nRodzajPodpisu, @cNrRef, @nStatus, @pStatusOpis )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_PobierzUPO( pEDekObj, cNrRef, nRodzajBramki, nStatus, pStatusOpis, pDaneUPO )

   RETURN hb_DynCall( { "lgpEDek_PobierzUPO", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, cNrRef, nRodzajBramki, @nStatus, @pStatusOpis, @pDaneUPO )

/*----------------------------------------------------------------------*/

FUNCTION lgpEDek_PobierzUPOStream( pEDekObj, cNrRef, nRodzajBramki, nStatus, pStatusOpis, pDaneUPO )

   RETURN hb_DynCall( { "lgpEDek_PobierzUPOStream", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pEDekObj, cNrRef, nRodzajBramki, @nStatus, @pStatusOpis, pDaneUPO )

/*----------------------------------------------------------------------*/

// JPK
FUNCTION lgpJPK_Create( cBase64EncoderClass, cAES256EncryptClass, cMD5HashClass, cSHA256HashClass, cZipperClass, cRSAEncryptClass, cRandomGeneratorClass, cXMLReaderClass, pJPKObj )

   RETURN hb_DynCall( { "lgpJPK_Create", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, cBase64EncoderClass, cAES256EncryptClass, ;
      cMD5HashClass, cSHA256HashClass, cZipperClass, cRSAEncryptClass, ;
      cRandomGeneratorClass, cXMLReaderClass, @pJPKObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetBase64EncoderClass( pJPKObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpJPK_GetBase64EncoderClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetBase64EncoderClass( pJPKObj, cClassName )

   RETURN hb_DynCall( { "lgpJPK_SetBase64EncoderClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pJPKObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetAES256EncryptClass( pJPKObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpJPK_GetAES256EncryptClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetAES256EncryptClass( pJPKObj, cClassName )

   RETURN hb_DynCall( { "lgpJPK_SetAES256EncryptClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pJPKObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetMD5HashClass( pJPKObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpJPK_GetMD5HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetMD5HashClass( pJPKObj, cClassName )

   RETURN hb_DynCall( { "lgpJPK_SetMD5HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pJPKObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetSHA256HashClass( pJPKObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpJPK_GetSHA256HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetSHA256HashClass( pJPKObj, cClassName )

   RETURN hb_DynCall( { "lgpJPK_SetSHA256HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pJPKObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetZipperClass( pJPKObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpJPK_GetZipperClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetZipperClass( pJPKObj, cClassName )

   RETURN hb_DynCall( { "lgpJPK_SetZipperClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pJPKObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetRSAEncryptClass( pJPKObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpJPK_GetRSAEncryptClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetRSAEncryptClass( pJPKObj, cClassName )

   RETURN hb_DynCall( { "lgpJPK_SetRSAEncryptClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pJPKObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetRandomGeneratorClass( pJPKObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpJPK_GetRandomGeneratorClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

function lgpJPK_SetRandomGeneratorClass( pJPKObj, cClassName )

   RETURN hb_DynCall( { "lgpJPK_SetRandomGeneratorClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pJPKObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetXMLReaderClass( pJPKObj, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpJPK_GetXMLReaderClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetXMLReaderClass( pJPKObj, cClassName )

   RETURN hb_DynCall( { "lgpJPK_SetXMLReaderClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pJPKObj, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetRSAKeyProd( pJPKObj, pObject )

   RETURN hb_DynCall( { "lgpJPK_GetRSAKeyProd", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetRSAKeyProd( pJPKObj, pObject )

   RETURN hb_DynCall( { "lgpJPK_SetRSAKeyProd", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, pObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetRSAKeyTest( pJPKObj, pObject )

   RETURN hb_DynCall( { "lgpJPK_GetRSAKeyTest", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetRSAKeyTest( pJPKObj, pObject )

   RETURN hb_DynCall( { "lgpJPK_SetRSAKeyTest", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, pObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetXAdES( pJPKObj, pObject )

   RETURN hb_DynCall( { "lgpJPK_GetXAdES", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetXAdES( pJPKObj, pObject )

   RETURN hb_DynCall( { "lgpJPK_SetXAdES", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, pObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_GetHTTPClient( pJPKObj, pObject )

   RETURN hb_DynCall( { "lgpJPK_GetHTTPClient", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, @pObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SetHTTPClient( pJPKObj, pObject )

   RETURN hb_DynCall( { "lgpJPK_SetHTTPClient", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, pObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SignCerificate( pJPKObj, pCertificate, nGateType, lAdHoc, pInputStream, pOutputStream, pInitUpload )

   RETURN hb_DynCall( { "lgpJPK_SignCerificate", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_BOOL, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, pCertificate, nGateType, lAdHoc, pInputStream, pOutputStream, @pInitUpload )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SignCerificateStream( pJPKObj, pCertificate, nGateType, lAdHoc, pInputStream, pOutputStream, pInitUpload )

   RETURN hb_DynCall( { "lgpJPK_SignCerificateStream", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_BOOL, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, pCertificate, nGateType, lAdHoc, pInputStream, pOutputStream, pInitUpload )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SignDataAuth( pJPKObj, cNIP, cImiePierwsze, cNazwisko, nDataUrodzenia, nKwota, nGateType, lAdHoc, pAInputStream, pOutputStream, pInitUpload )

   RETURN hb_DynCall( { "lgpJPK_SignDataAuth", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_DOUBLE, HB_DYN_CTYPE_LLONG, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_BOOL, ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, cNIP, cImiePierwsze, cNazwisko, nDataUrodzenia, nKwota, nGateType, ;
      lAdHoc, pAInputStream, pOutputStream, @pInitUpload )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SignDataAuthStream( pJPKObj, cNIP, cImiePierwsze, cNazwisko, nDataUrodzenia, nKwota, nGateType, lAdHoc, pAInputStream, pOutputStream, pInitUpload )

   RETURN hb_DynCall( { "lgpJPK_SignDataAuthStream", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_DOUBLE, HB_DYN_CTYPE_LLONG, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_BOOL, ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, cNIP, cImiePierwsze, cNazwisko, nDataUrodzenia, nKwota, nGateType, ;
      lAdHoc, pAInputStream, pOutputStream, pInitUpload )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_Send( pJPKObj, cInitUpload, pEncryptedData, pRefNo, nGateType, lVerifySign )

   hb_default( @lVerifySign, .F. )

   RETURN hb_DynCall( { "lgpJPK_Send", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_BOOL }, ;
      pJPKObj, cInitUpload, pEncryptedData, @pRefNo, nGateType, lVerifySign )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_SendStream( pJPKObj, pInitUpload, pEncryptedData, pRefNo, nGateType, lVerifySign )

   hb_default( @lVerifySign, .F. )

   RETURN hb_DynCall( { "lgpJPK_SendStream", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_BOOL }, ;
      pJPKObj, pInitUpload, pEncryptedData, @pRefNo, nGateType, lVerifySign )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_RequestUPO( pJPKObj, cRefNo, nGateType, nStatus, pStatusDesc, pDetails, pUPO, pTimeStamp )

   RETURN hb_DynCall( { "lgpJPK_RequestUPO", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, cRefNo, nGateType, @nStatus, @pStatusDesc, @pDetails, @pUPO, @pTimeStamp )

/*----------------------------------------------------------------------*/

FUNCTION lgpJPK_RequestUPOStream( pJPKObj, cRefNo, nGateType, nStatus, pStatusDesc, pDetails, pTimeStamp, pUPO )

   RETURN hb_DynCall( { "lgpJPK_RequestUPOStream", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pJPKObj, cRefNo, nGateType, @nStatus, @pStatusDesc, @pDetails, @pTimeStamp, pUPO )

/*----------------------------------------------------------------------*/

// KSeF

FUNCTION lgpKSeF_Create( pKSeFObj )

   RETURN hb_DynCall( { "lgpKSeF_Create", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR }, @pKSeFObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetRSAEncryptClass( pKSeFObject, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpKSeF_GetRSAEncryptClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetRSAEncryptClass( pKSeFObject, cClassName )

   RETURN hb_DynCall( { "lgpKSeF_SetRSAEncryptClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetBase64EncoderClass( pKSeFObject, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpKSeF_GetBase64EncoderClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetBase64EncoderClass( pKSeFObject, cClassName )

   RETURN hb_DynCall( { "lgpKSeF_SetBase64EncoderClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetAES256EncryptClass( pKSeFObject, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpKSeF_GetAES256EncryptClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetAES256EncryptClass( pKSeFObject, cClassName )

   RETURN hb_DynCall( { "lgpKSeF_SetAES256EncryptClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetSHA256HashClass( pKSeFObject, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpKSeF_GetSHA256HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetSHA256HashClass( pKSeFObject, cClassName )

   RETURN hb_DynCall( { "lgpKSeF_SetSHA256HashClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetRandomGeneratorClass( pKSeFObject, cClassName )

   LOCAL pClassName, pRes
   hb_default( @cClassName, "" )

   pRes := hb_DynCall( { "lgpKSeF_GetRandomGeneratorClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pClassName )

   cClassName := lgoSStrToStr( pClassName )

   RETURN pRes

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetRandomGeneratorClass( pKSeFObject, cClassName )

   RETURN hb_DynCall( { "lgpKSeF_SetRandomGeneratorClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cClassName )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetRSAKey( pKSeFObject, nKeyType, pKey )

   RETURN hb_DynCall( { "lgpKSeF_GetRSAKey", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, nKeyType, @pKey )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetRSAKey( pKSeFObject, nKeyType, pKey )

   RETURN hb_DynCall( { "lgpKSeF_SetRSAKey", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, nKeyType, pKey )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetXAdES( pKSeFObject, pObj )

   RETURN hb_DynCall( { "lgpKSeF_GetXAdES", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetXAdES( pKSeFObject, pObj )

   RETURN hb_DynCall( { "lgpKSeF_SetXAdES", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetHTTPClient( pKSeFObject, pObj )

   RETURN hb_DynCall( { "lgpKSeF_GetHTTPClient", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetHTTPClient( pKSeFObject, pObj )

   RETURN hb_DynCall( { "lgpKSeF_SetHTTPClient", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetGateType( pKSeFObject, nType )

   RETURN hb_DynCall( { "lgpKSeF_GetGateType", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, @nType )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetGateType( pKSeFObject, nType )

   RETURN hb_DynCall( { "lgpKSeF_SetGateType", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, nType )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetNIP( pKSeFObject, pNIP )

   RETURN hb_DynCall( { "lgpKSeF_GetNIP", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pNIP )

/*----------------------------------------------------------------------*/

function lgpKSeF_SetNIP( pKSeFObject, cNIP )

   RETURN hb_DynCall( { "lgpKSeF_SetNIP", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cNIP )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetFormCode( pKSeFObject, nFCode )

   RETURN hb_DynCall( { "lgpKSeF_GetFormCode", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, @nFCode )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetFormCode( pKSeFObject, nFCode )

   RETURN hb_DynCall( { "lgpKSeF_SetFormCode", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, nFCode )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetFormCodeSystemCode( pKSeFObject, pValue )

   RETURN hb_DynCall( { "lgpKSeF_GetFormCodeSystemCode", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetFormCodeSystemCode( pKSeFObject, cValue )

   RETURN hb_DynCall( { "lgpKSeF_SetFormCodeSystemCode", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetFormCodeSchemaVersion( pKSeFObject, pValue )

   RETURN hb_DynCall( { "lgpKSeF_GetFormCodeSchemaVersion", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetFormCodeSchemaVersion( pKSeFObject, cValue )

   RETURN hb_DynCall( { "lgpKSeF_SetFormCodeSchemaVersion", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetFormCodeTargetNamespace( pKSeFObject, pValue )

   RETURN hb_DynCall( { "lgpKSeF_GetFormCodeTargetNamespace", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetFormCodeTargetNamespace( pKSeFObject, cValue )

   RETURN hb_DynCall( { "lgpKSeF_SetFormCodeTargetNamespace", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetFormCodeValue( pKSeFObject, pValue )

   RETURN hb_DynCall( { "lgpKSeF_GetFormCodeValue", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetFormCodeValue( pKSeFObject, cValue )

   RETURN hb_DynCall( { "lgpKSeF_SetFormCodeValue", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetCertificate( pKSeFObject, pObj )

   RETURN hb_DynCall( { "lgpKSeF_GetCertificate", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetCertificate( pKSeFObject, pObj )

   RETURN hb_DynCall( { "lgpKSeF_SetCertificate", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pObj )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetCertificateAuthType( pKSeFObject, nType )

   RETURN hb_DynCall( { "lgpKSeF_GetCertificateAuthType", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, @nType )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetCertificateAuthType( pKSeFObject, nType )

   RETURN hb_DynCall( { "lgpKSeF_SetCertificateAuthType", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, nType )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetToken( pKSeFObject, pValue )

   RETURN hb_DynCall( { "lgpKSeF_GetToken", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetToken( pKSeFObject, cValue )

   RETURN hb_DynCall( { "lgpKSeF_SetToken", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, cValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetEncryption( pKSeFObject, nEnc )

   RETURN hb_DynCall( { "lgpKSeF_GetEncryption", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, @nEnc )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SetEncryption( pKSeFObject, nEnc )

   RETURN hb_DynCall( { "lgpKSeF_SetEncryption", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, nEnc )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetSessionToken( pKSeFObject, pValue )

   RETURN hb_DynCall( { "lgpKSeF_GetSessionToken", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GetSessionActive( pKSeFObject, nValue )

   RETURN hb_DynCall( { "lgpKSeF_GetSessionActive", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, @nValue )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_GenerateAESKey( pKSeFObject )

   RETURN hb_DynCall( { "lgpKSeF_GenerateAESKey", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR }, pKSeFObject )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SessionInitSigned( pKSeFObject, pInitSessionResponse )

   RETURN hb_DynCall( { "lgpKSeF_SessionInitSigned", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pInitSessionResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SessionInitToken( pKSeFObject, pInitSessionResponse )

   RETURN hb_DynCall( { "lgpKSeF_SessionInitToken", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pInitSessionResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SessionChalangePZ( pKSeFObject, pChalange )

   RETURN hb_DynCall( { "lgpKSeF_SessionChalangePZ", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, @pChalange )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SessionInitPZ( pKSeFObject, cSignedChalange, pInitSessionResponse )

   RETURN hb_DynCall( { "lgpKSeF_SessionInitPZ", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cSignedChalange, @pInitSessionResponse  )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SessionStatus( pKSeFObject, cReferenceNumber, nPageSize, nPageOffset, nIncludeDetails, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_SessionStatus", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cReferenceNumber, nPageSize, nPageOffset, nIncludeDetails, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SessionTerminate( pKSeFObject, nForce, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_SessionTerminate", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, nForce, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_SessionGenerateInternalIdentifier( pKSeFObject, cInputDigitsSequence, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_SessionGenerateInternalIdentifier", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cInputDigitsSequence, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_InvoiceGet( pKSeFObject, cKSeFReferenceNumber, pOutputStream )

   RETURN hb_DynCall( { "lgpKSeF_InvoiceGet", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cKSeFReferenceNumber, pOutputStream )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_InvoiceSend( pKSeFObject, pDataStream, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_InvoiceSend", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pDataStream, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_InvoiceStatus( pKSeFObject, cInvoiceElementReferenceNumber, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_InvoiceStatus", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cInvoiceElementReferenceNumber, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_InvoiceVisibilityHide( pKSeFObject, cKsefReferenceNumber, cHidingReason, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_InvoiceVisibilityHide", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cKsefReferenceNumber, cHidingReason, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_InvoiceVisibilityShow( pKSeFObject, cKsefReferenceNumber, cHidingCancelationReason, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_InvoiceVisibilityShow", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cKsefReferenceNumber, cHidingCancelationReason, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_QueryInvoiceSync( pKSeFObject, pQueryCriteria, nPageSize, nPageOffset, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_QueryInvoiceSync", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT, ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pQueryCriteria, nPageSize, nPageOffset, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_QueryInvoiceAsyncInit( pKSeFObject, pQueryCriteria, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_QueryInvoiceAsyncInit", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pQueryCriteria, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_QueryInvoiceAsyncStatus( pKSeFObject, cQueryElementReferenceNumber, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_QueryInvoiceAsyncStatus", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cQueryElementReferenceNumber, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_QueryInvoiceAsyncFetch( pKSeFObject, cQueryElementReferenceNumber, cPartElementReferenceNumber, pOutStream )

   RETURN hb_DynCall( { "lgpKSeF_QueryInvoiceAsyncFetch", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cQueryElementReferenceNumber, cPartElementReferenceNumber, pOutStream )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_PaymentIdentifierGetReferenceNumbers( pKSeFObject, cPaymentIdentifier, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_PaymentIdentifierGetReferenceNumbers", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cPaymentIdentifier, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_PaymentIdentifierRequest( pKSeFObject, cKsefReferenceNumberList, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_PaymentIdentifierRequest", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cKsefReferenceNumberList, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CredentialsContextGrant( pKSeFObject, pGrantContextCredentialsRequest, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_CredentialsContextGrant", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pGrantContextCredentialsRequest, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CredentialsContextRevoke( pKSeFObject, pRevokeContextCredentialsRequest, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_CredentialsContextRevoke", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pRevokeContextCredentialsRequest, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CredentialsGenerateToken( pKSeFObject, pGenerateTokenRequest, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_CredentialsGenerateToken", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pGenerateTokenRequest, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CredentialsGrant( pKSeFObject, pGrantCredentialsRequest, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_CredentialsGrant", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pGrantCredentialsRequest, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CredentialsRevoke( pKSeFObject, pRevokeCredentialsRequest, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_CredentialsGrant", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pRevokeCredentialsRequest, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CredentialsRevokeToken( pKSeFObject, pRevokeTokenRequest, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_CredentialsRevokeToken", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pRevokeTokenRequest, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CredentialsStatus( pKSeFObject, cCredentialsElementReferenceNumber, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_CredentialsStatus", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cCredentialsElementReferenceNumber, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_QueryCredentialContextSync( pKSeFObject, cContextNip, cSourceIdentifier, cTargetIdentifier, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_QueryCredentialContextSync", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cContextNip, cSourceIdentifier, cTargetIdentifier, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_QueryCredentialSync( pKSeFObject, pQuerySyncCredentialsRequest, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_QueryCredentialSync", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pQuerySyncCredentialsRequest, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CommonInvoiceKSeF( pKSeFObject, pInvoiceRequest, pOutStream, nGateType )

   RETURN hb_DynCall( { "lgpKSeF_CommonInvoiceKSeF", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, pInvoiceRequest, pOutStream, nGateType )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CommonDownload( pKSeFObject, cKsefReferenceNumber, pDownloadRequest, pOutStream, nGateType )

   RETURN hb_DynCall( { "lgpKSeF_CommonDownload", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT }, ;
      pKSeFObject, cKsefReferenceNumber, pDownloadRequest, pOutStream, nGateType )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CommonStatus( pKSeFObject, cReferenceNumber, nGateType, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_CommonStatus", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cReferenceNumber, nGateType, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_CommonVerification( pKSeFObject, cKsefReferenceNumber, pVerificationRequest, nGateType, pResponse )

   RETURN hb_DynCall( { "lgpKSeF_CommonVerification", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, cKsefReferenceNumber, pVerificationRequest, nGateType, @pResponse )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_BatchSign( pKSeFObject, pZIPDataStream, nPZ, pEncryptedStream, pInitUploadm, cAZIPFileName, cPartFileName )

   RETURN hb_DynCall( { "lgpKSeF_BatchSign", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_INT, HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      pKSeFObject, pZIPDataStream, nPZ, pEncryptedStream, @pInitUploadm, cAZIPFileName, cPartFileName )

/*----------------------------------------------------------------------*/

FUNCTION lgpKSeF_BatchSend( pKSeFObject, pPartStream, cInitUpload, pNrRef )

   RETURN hb_DynCall( { "lgpKSeF_BatchSend", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      HB_DYN_CTYPE_VOID_PTR, HB_DYN_CTYPE_VOID_PTR, ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ), ;
      HB_DYN_CTYPE_VOID_PTR }, ;
      pKSeFObject, pPartStream, cInitUpload, @pNrRef )

/*----------------------------------------------------------------------*/

// KSeFObj

FUNCTION lgpKSeF_CreateKSeFclass( cClassName )

   RETURN hb_DynCall( { "lgpKSeF_CreateKSeFClass", h_LibGovPL4, ;
      hb_bitOr( HB_DYN_CALLCONV_STDCALL, HB_DYN_CTYPE_VOID_PTR ), ;
      hb_bitOr( HB_DYN_CTYPE_CHAR_PTR, HB_DYN_ENC_UTF8, HB_DYC_OPT_NULLTERM ) }, ;
      cClassName  )

/*----------------------------------------------------------------------*/


#pragma BEGINDUMP

#include "hbapi.h"
#include "hbapistr.h"
#include "hbstack.h"

HB_FUNC( LGOPCHARTOSTR )
{
   char * pStr = ( char * ) hb_parptr( 1 );
   if ( pStr )
   {
      hb_itemPutStrUTF8( hb_stackReturnItem(), pStr );
   }
}

HB_FUNC( LGOSSTRTOSTR )
{
   char * pStr = ( char * ) hb_parptr( 1 );
   if ( pStr )
   {
      unsigned char nLen = * ( unsigned char * ) pStr;
      pStr++;
      hb_itemPutStrLenUTF8( hb_stackReturnItem(), pStr, nLen );
   }
}

#pragma ENDDUMP