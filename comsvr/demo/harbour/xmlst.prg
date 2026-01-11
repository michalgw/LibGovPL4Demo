#require "hbwin"
#require "xhb"

#include "libgovpl4com.ch"
#include "hbcompat.ch"
#include "inkey.ch"

/*

   LibGovPL
   Weryfikacja dokumentu, transformacja XSLT.
   Dokument powinien posiadac zadeklarowana przestrzen nazw.
   Automatycznie pobierane schematy i szablony z serwerow crd.gov.pl,
   obslugiwane tylko dokumenty posiadajace schemat i szablon w repozytorium crd.
   Przy obsludze innych dokumentow, nieposiadajacych schematow w crd nalezy przed operacja dodac schemat.

*/

FUNCTION Main( cPlikWej, cPlikWyj )

   LOCAL oBackend, oXVlid, oXTrans, oErrors, oError

   // Tworzenie obiektu zaplecza
   oBackend := win_oleCreateObject( "LibGovPl.lgcBackend" )

   // Napisz wersje biblioteki
   ? "Wersja biblioteki: " + oBackend:GetLibVersion()

   IF Empty( cPlikWej )
      cPlikWej := "PlikFA.xml"
   ENDIF

   TRY

      // Tworzymy obiekt weryfikatora XSD
      oXValid := oBackend:CreateXMLValidator( "" )

      // Weryfikujemy plik XML
      oErrors := oXValid:Validate( cPlikWej )

      // Jesli zworcono liste bledow to dokument nie jest poprawny
      IF ! Empty( oErrors )

         ? "Dokument NIE jest poprawny, bledy:"

         // Wypisz liste problemow
         FOR EACH oError IN oErrors
            ? "Komunikat: ", oError:Message
            ? "Nr wiersza: ", oError:Line
            ? "Element: ", oError:Path
            ? "---------"
         NEXT

      ELSE

         ? "Dokument jest poprawny"

         // Wykonaj transformacje

         // Utworz obiekt transformacji XSLT
         oXTrans := oBackend:CreateXMLXSLTranformation( "" )

         IF Empty( cPlikWyj )
            cPlikWyj := cPlikWej + '.html'
         ENDIF

         // Transformacja i zapis do pliku docelowego
         oXTrans:Transform( cPlikWej, cPlikWyj )

         ? "Utworzono plik ", cPlikWyj

      ENDIF

   CATCH oError

      ? "Blad: " + oError:description
      IF oBackend:LastError != NIL
         ? "oBackend:LastError:"
         ? "   komunikat: " + oBackend:LastError:Message
         ? "   klasa wyjatku: " + oBackend:LastError:ExceptionClass
         ? "   szczegoly:"
         oEl := oBackend:LastError:ExtraInfo
      ENDIF

   END

   RETURN NIL
