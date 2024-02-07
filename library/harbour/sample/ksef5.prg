/*

  LibGovPL 4

  KSeF - wysylka wsadowa - przygotowanie paczki i podpisanie paczki,
  wyslanie paczki

*/

#include "hlibgovpl4.ch"
#include "xhb.ch"

REQUEST HB_LANG_PL
REQUEST HB_CODEPAGE_PL852

FUNCTION Main()

   LOCAL nI, nC, cInput
   // Listy klas sterownikow
   LOCAL aHTTPClientClasses, aCertificateSignerClasses, aRSAEncClasses
   // Klient HTTPS
   LOCAL oHTTPClient
   // Obiekt sterownika podpisu kwalifikowanego
   LOCAL oCertSigner
   // Lista certyfikatow
   LOCAL oCertList
   // Certyfikat
   LOCAL oCert
   // Obiekt sygnatury XAdES
   LOCAL oXAdES
   // Klucz publiczny RSA szyfrowania dokumentow przesylanych do KSeF
   LOCAL oRSAKey
   // Strumien plikowy
   LOCAL oFileStream, oMemoryStream
   // Obiekt klinta KSeF
   LOCAL oKSeF
   LOCAL oResponse, cInitUpload, cRefNum //, oException

   HB_LANGSELECT( 'PL' )
   hb_cdpSelect( 'PL852' )

//#ifdef LGP_DEBUG
   SetMode( 25, 80 )
   AltD(1)
   AltD()
//#endif

   // Ladowanie biblioteki
   IF Empty( lgpLoadLib() )
      ? "Nie mozna zaladowac bibloteki."
      __Quit()
   ENDIF
   // Inicjacja biblioteki
   lgplInit()
   // Napisz wersje
   ? "Wersja biblioteki: " + DecToHexa( lgplVersion() )

   // Pobierz liste klas sterownikow
   aHTTPClientClasses := lgoListDrivers( LGP_CLSTYPE_HTTP_CLIENT )
   aCertificateSignerClasses := lgoListDrivers( LGP_CLSTYPE_CERT_SIGNER )
   aRSAEncClasses := lgoListDrivers( LGP_CLSTYPE_RSA_ENC )

   // Utworz obiekt klienta HTTPS uzywajac pierwszej klasy strownika
   oHTTPClient := TlgoHTTPClient():New( aHTTPClientClasses[ 1 ] )
   oHTTPClient:IgnoreSSLErrors := .T.

   // Utworz klase sterownika podpisu kwalifikowanego
   oCertSigner := TlgoCertificateSigner():New( aCertificateSignerClasses[ 1 ] )
   // Pobierz liste certyfikatow
   oCertList := oCertSigner:List()

   // Utworz obiekt sygnatury XAdES
   oXAdES := TlgoXAdES():New()
   // Ustaw obiekt podpisu kwalifikowanego
   oXAdES:Signer := oCertSigner

   // Wczytanie klucza publicznego RSA ze wskazanego pliku uzywajac pierwszego na liscie sterownika
   oFileStream := TlgoFileStream():New( "kseftest.pem", LGP_FM_OPEN_READ )
   oRSAKey := TlgoRSAEncrypt_CreateKey( aRSAEncClasses[ 1 ], oFileStream )
   oFileStream := NIL

   // Utworz obiekt klienta KSeF
   oKSeF := TlgoKSeF():New()
   // Podlacz obiekt sygnatury XAdES
   oKSeF:XAdES := oXAdES
   // Podlacz klucz RSA
   oKSeF:RSAKeyTest := oRSAKey
   // Podlacz klienta HTTPS
   oKSeF:HTTPClient := oHTTPClient
   // Ustaw bramke testowa
   oKSeF:GateType := LGP_KSEF_GATETYPE_TEST
   // Ustaw kod przesylanych faktur - FA(2)
   oKSeF:FormCode := LGP_KSEF_FORM_CODE_FA2

   // Pobierz i przypisz nr NIP dla klienta KSeF
   cInput := __Accept( "Wprowad« NIP:" )
   IF cInput == ""
      __Quit()
   ENDIF
   oKSeF:NIP := cInput

   // Wyswietl liste certyfikatow
   ? "Certyfikaty: " + Str( oCertList:Count() )
   nC := oCertList:Count()
   FOR nI := 1 TO nC
      oCert := oCertList:GetItem( nI )
      ? Str( nI ) + " - " + oCert:DisplayName + " (" + DToC( oCert:ValidFrom ) + " - " + DToC( oCert:ValidTo ) + ")"
   NEXT

   // Wybierz certyfikat do podpisu struktury InitUpload
   cInput := __Accept( "Wybierz certyfikat (1,2,3...):" )
   IF cInput == ""
      __Quit()
   ENDIF
   oKSeF:Certificate := oCertList:GetItem( Val( cInput ) )

   // Nazwa pliku zip z fakturami do wyslania
   cInput := __Accept( "Wprowadz nazwe pliku paczki ZIP z fakturami:" )
   IF cInput == ""
      __Quit()
   ENDIF

//   TRY
      // Przygotowanie paczki i podpis
      ? "Szyfrowanie i podpis"
      // Otwarcie pliku z paczka ZIP
      oFileStream := TlgoFileStream():New( cInput, LGP_FM_OPEN_READ )
      // Utworzenie strumienia wyjsciowego z zaszyrowana paczka ZIP
      oMemoryStream := TlgoMemoryStream():New()

      // Przygotuj - zaszyfruj paczke. utworz strukture InitUpload z podanymi nazwami plikow
      oKSeF:BatchSign( oFileStream, .F., oMemoryStream, @cInitUpload, 'in.zip', 'out.enc' )
      // Zwolnij plik wejsciowy ZIP
      oFileStream := NIL

      // Wyslanie przygotowanych danych na serwer KSeF i pobranie nr referencyjnego
      ? "Wysylanie paczki"
      oMemoryStream:Position := 0
      cRefNum := oKSeF:BatchSend( oMemoryStream, cInitUpload )
      ? "Wyslano, nr ref: " + cRefNum

      oMemoryStream := NIL

      cInput := ""
      DO WHILE Upper( cInput ) <> "N"

         ? "Sprawdzam status przetwarzania"
         // Srpawdz status przetwarzania wyslanej paczki
         oResponse := oKSeF:CommonStatus( cRefNum, LGP_KSEF_GATETYPE_TEST )

         ? "Kod przetwarzania: " + Str( oResponse:ProcessingCode )
         ? "Opis: " + oResponse:ProcessingDescription

         cInput := __Accept( "Czy sprawdzic ponownie? (T/N)" )
      ENDDO

      IF oResponse:ProcessingCode == 200 .AND. Len( oResponse:Upo ) > 0
        // UPO dostepne, zapisz do pliku
        ? "UPO dostepne. Zapisuje do pliku upo.xml"
        MemoWrit( "upo.xml", oResponse:Upo )
        ? "UPO zapisano"
      ENDIF

/*   CATCH oException
      IF HB_ISCHAR( oException:subsystem ) .AND. Upper( oException:subsystem ) == 'EABORT'
         // Anulowano wprowadzanie nr PIN - kliknieto przycisk "Anuluj" w oknie wprowadzanie nr PIN
         ? "Anulowano"
      ELSE
         Throw( oException )
      ENDIF
   END
*/
   // Zwolnij obiety przed wywolaniem lgpExit()
   oHTTPClient := NIL
   oCertSigner := NIL
   oCertList := NIL
   oCert := NIL
   oXAdES := NIL
   oRSAKey := NIL
   oFileStream := NIL
   oKSeF := NIL
   oResponse := NIL

   // Zakoncz biblioteke
   lgplExit()

   RETURN NIL

/*----------------------------------------------------------------------*/
