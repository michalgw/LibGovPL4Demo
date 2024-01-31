#include "hbclass.ch"

CREATE CLASS TlgoEDeklaracja INHERIT TlgoObject

   HIDDEN:
   VAR oXAdES   INIT NIL

   VISIBLE:
   METHOD New( cXMLCanonizator, cEDekGate ) CONSTRUCTOR

   METHOD PodpiszCertyfikatem( cDane, oCertyfikat, cDanePodpisane )
   METHOD PodpiszCertyfikatemStream( oDane, oCertyfikat, oDanePodpisane )
   METHOD PodpiszDanymiAut( cDane, cImie, cNazwisko, cNIP, nDataUr, nKwota, cDanePodpisane )
   METHOD PodpiszDanymiAutStream( oDane, cImie, cNazwisko, cNIP, nDataUr, nKwota, oDanePodpisane )

   METHOD Wyslij( cDanePodpisane, nRodzajBramki, nRodzajPodpisu, cNrRef, nStatus, cStatusOpis )
   METHOD WyslijStream( oDanePodpisane, nRodzajBramki, nRodzajPodpisu, cNrRef, nStatus, cStatusOpis )
   METHOD PobierzUPO( cNrRef, nRodzajBramki, nStatus, cStatusOpis, cDaneUPO )
   METHOD PobierzUPOStream( cNrRef, nRodzajBramki, nStatus, cStatusOpis, oDaneUPO )

   ACCESS XAdES METHOD GetXAdES()
   ASSIGN XAdES METHOD SetXAdES( oXAdES )
   ACCESS XMLCanonizatorClass METHOD GetXMLCanonizatorClass()
   ASSIGN XMLCanonizatorClass METHOD SetXMLCanonizatorClass( cClassName )
   ACCESS EDekGateClass METHOD GetEDekGateClass()
   ASSIGN EDekGateClass METHOD SetEDekGateClass( cClassName )
   ACCESS Canonization METHOD GetCanonization()
   ASSIGN Canonization METHOD SetCanonization( lValue )

ENDCLASS

METHOD New( cXMLCanonizator, cEDekGate ) CLASS TlgoEDeklaracja

   LOCAL pExtObj

   lgoCheckResult( lgpEDek_Create( cXMLCanonizator, cEDekGate, @pExtObj ) )
   ::pExtObject := pExtObj

   RETURN Self

METHOD PodpiszCertyfikatem( cDane, oCertyfikat, cDanePodpisane ) CLASS TlgoEDeklaracja

   LOCAL pDanePodpisane

   lgoCheckResult( lgpEDek_PodpiszCertyfikatem( ::pExtObject, cDane, oCertyfikat:ExtObject, @pDanePodpisane ) )
   cDanePodpisane := lgoGetString( pDanePodpisane )

   RETURN cDanePodpisane

METHOD PodpiszCertyfikatemStream( oDane, oCertyfikat, oDanePodpisane ) CLASS TlgoEDeklaracja

   lgoCheckResult( lgpEDek_PodpiszCertyfikatemStream( ::pExtObject, oDane:ExtObject, oCertyfikat:ExtObject, oDanePodpisane:ExtObject ) )

   RETURN NIL

METHOD PodpiszDanymiAut( cDane, cImie, cNazwisko, cNIP, nDataUr, nKwota, cDanePodpisane ) CLASS TlgoEDeklaracja

   LOCAL pDanePodpisane

   lgoCheckResult( lgpEDek_PodpiszDanymiAut( ::pExtObject, cDane, cImie, cNazwisko, cNIP, nDataUr, nKwota, @pDanePodpisane ) )
   cDanePodpisane := lgoGetString( pDanePodpisane )

   RETURN cDanePodpisane


METHOD PodpiszDanymiAutStream( oDane, cImie, cNazwisko, cNIP, nDataUr, nKwota, oDanePodpisane ) CLASS TlgoEDeklaracja

   lgoCheckResult( lgpEDek_PodpiszDanymiAutStream( ::pExtObject, oDane:ExtObject, cImie, cNazwisko, cNIP, nDataUr, nKwota, oDanePodpisane:ExtObject ) )

   RETURN NIL

METHOD Wyslij( cDanePodpisane, nRodzajBramki, nRodzajPodpisu, cNrRef, nStatus, cStatusOpis ) CLASS TlgoEDeklaracja

   LOCAL pNrRef, pStatusOpis

   lgoCheckResult( lgpEDek_Wyslij( ::pExtObject, cDanePodpisane, nRodzajBramki, nRodzajPodpisu, @pNrRef, @nStatus, @pStatusOpis ) )
   cNrRef := lgoGetString( pNrRef )
   cStatusOpis := lgoGetString( pStatusOpis )

   RETURN cNrRef

METHOD WyslijStream( oDanePodpisane, nRodzajBramki, nRodzajPodpisu, cNrRef, nStatus, cStatusOpis ) CLASS TlgoEDeklaracja

   LOCAL pNrRef, pStatusOpis

   lgoCheckResult( lgpEDek_Wyslij( ::pExtObject, oDanePodpisane:ExtObject, nRodzajBramki, nRodzajPodpisu, @pNrRef, @nStatus, @pStatusOpis ) )
   cNrRef := lgoGetString( pNrRef )
   cStatusOpis := lgoGetString( pStatusOpis )

   RETURN cNrRef

METHOD PobierzUPO( cNrRef, nRodzajBramki, nStatus, cStatusOpis, cDaneUPO ) CLASS TlgoEDeklaracja

   LOCAL pDaneUPO, pStatusOpis

   lgoCheckResult( lgpEDek_PobierzUPO( ::pExtObject, cNrRef, nRodzajBramki, @nStatus, @pStatusOpis, @pDaneUPO ) )
   cDaneUPO := lgoGetString( pDaneUPO )
   cStatusOpis := lgoGetString( pStatusOpis )

   RETURN nStatus

METHOD PobierzUPOStream( cNrRef, nRodzajBramki, nStatus, cStatusOpis, oDaneUPO ) CLASS TlgoEDeklaracja

   LOCAL pStatusOpis

   lgoCheckResult( lgpEDek_PobierzUPOStream( ::pExtObject, cNrRef, nRodzajBramki, @nStatus, @pStatusOpis, oDaneUPO:ExtObject ) )
   cStatusOpis := lgoGetString( pStatusOpis )

   RETURN nStatus


METHOD GetXAdES() CLASS TlgoEDeklaracja

   RETURN ::oXAdES

METHOD SetXAdES( oXAdES ) CLASS TlgoEDeklaracja

   lgoCheckResult( lgpEDek_SetXAdES( ::pExtObject, oXAdES:ExtObject ) )
   ::oXAdES := oXAdES

   RETURN NIL

METHOD GetXMLCanonizatorClass() CLASS TlgoEDeklaracja

   LOCAL cClassName

   lgoCheckResult( lgpEDek_GetXMLCanonizatorClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetXMLCanonizatorClass( cClassName ) CLASS TlgoEDeklaracja

   lgoCheckResult( lgpEDek_SetXMLCanonizatorClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetEDekGateClass() CLASS TlgoEDeklaracja

   LOCAL cClassName

   lgoCheckResult( lgpEDek_GetEDekGateClass( ::pExtObject, @cClassName ) )

   RETURN cClassName

METHOD SetEDekGateClass( cClassName ) CLASS TlgoEDeklaracja

   lgoCheckResult( lgpEDek_SetEDekGateClass( ::pExtObject, cClassName ) )

   RETURN NIL

METHOD GetCanonization() CLASS TlgoEDeklaracja

   LOCAL lValue

   lgoCheckResult( lgpEDek_GetCanonization( ::pExtObject, @lValue ) )

   RETURN lValue

METHOD SetCanonization( lValue ) CLASS TlgoEDeklaracja

   lgoCheckResult( lgpEDek_SetCanonization( ::pExtObject, lValue ) )

   RETURN NIL

