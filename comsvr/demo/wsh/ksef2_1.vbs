'
'   KSeF 2.0
'   Autoryzacja certyfikatem i kluczem prywatnym wygenerowanym w KSeF (XAdES),
'   pobranie metadanych faktur, pobranie faktury
'

Dim backend
Dim ksef
Dim response
Dim certSigner
Dim cert
Dim xades
Dim tmp
Dim przerwij
Dim klawisz

' Tworzenie obiektu zaplecza
Set backend = CreateObject("LibGovPl.lgcBackend")

' Napisz wersje biblioteki
WSH.echo "Wersja biblioteki: " & backend.GetLibVersion

' Tworzenie obiektu podpisu certyfikatem kwalifikowanym lub pieczecia
Set certSigner = backend.CreateCertificateSigner("")

' Wczytaj certyfikat i klucz prywatny ze wskazanych plikow w formacie PEM
Set cert = certSigner.LoadFromStream("PlikCertyfikatuKSeF.crt", 0, "PlikKluczaPrywatnegoKSeF.key", 0, "HasloDoKluczaPrywatnego")

' Napisz info o certyfikacie
WSH.echo "Nazwa certyfikatu: ", cert.DisplayName
WSH.echo "Wazny od: ", cert.ValidFrom
WSH.echo "Wazny do: ", cert.ValidTo

' Tworzymy obiekt obslugi podpisu XAdES
Set xades = backend.CreateXAdES()

' Tworzenie obiektu komunikacji KSeF 2.0
Set ksef = backend.CreateKSeF2()

' Tworzenie obiektu klienta HTTP
ksef.HTTPClient = backend.CreateHTTPClient("")

' Ustawiamy obiekt sygnatury XAdES
ksef.XAdES = xades

' Uzywamy wybranego certyfikatu do autoryzacji
ksef.AuthCertificate = cert

' Ustawiamy parametry podmiotu
' Rodzaj identyfikatora - NIP
ksef.IdentifierType = 2
' Wartosc identyfikatora, tutaj NIP
ksef.Identifier = "1111111111"
' Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
ksef.GateType = 2

' Autoryzacja wybranym certyfikatem
Set response = ksef.AuthXadesSignature()

' Napisz nr referencyjny sesji
WSH.echo "Nr referencyjny sesji: ", response.ReferenceNumber
' Napisz token autoryzacji i date waznosci
WSH.echo "Token autoryzacyjny: ", response.AuthenticationToken.Token
WSH.echo "Token wazny do: ", response.AuthenticationToken.ValidUntil
' Napisz odpowiedz w postaci surowego JSON
WSH.echo "Surowa odpowiedz JSON: ", response.RawResponse

przerwij = False
Do Until przerwij
    ' Sprawdz status autoryzacji (dla aktualnie nawiazywanej sesji i tokena)
    Set response = ksef.AuthStatus("", "")

    ' Wyswietl otrzymany status
    WSH.echo "Status: ", response.Status.Code
    WSH.echo "Opis statusu: ", response.Status.Description
    WSH.echo "Surowa odpowiedz JSON: ", response.RawResponse

    ' Jesli autoryzowano (status = 200) lub
    ' jesli autoryzacja sie nie powiodla (status >= 300)
    ' to zakoncz
    przerwij = response.Status.Code = 200 Or response.Status.Code >= 300

    If przerwij = False Then
       WSH.echo "sprawdzic ponownie? (T/N)"
       klawisz = WScript.StdIn.Read(1)
       przerwij = klawisz = "N" Or klawisz = "n"
    End If
Loop

' Jesli autoryzowano (status = 200)
If response.Status.Code = 200 Then

    ' Pobierz tokeny Access Token i Refresh Token
    Set response = ksef.AuthTokenRedem("")
    WSH.echo "Pobrano tokeny:"
    WSH.echo "AccessToken:Token: ", response.AccessToken.Token
    WSH.echo "AccessToken:ValidUntil: ", response.AccessToken.ValidUntil
    WSH.echo "RefreshToken:Token: ", response.RefreshToken.Token
    WSH.echo "RefreshToken:ValidUntil: ", response.RefreshToken.ValidUntil

    ' Tworzenie obiektu filtra dla zapytania o metadane
    Set filtr = ksef.CreateKSeFObject("TKSeF2InvoiceQueryFilters")
    ' Wyszukaj faktury sprzedazowe (gdzie w fa wystepujamy jako "Podmiot1")
    filtr.SubjectType = 0 ' 0 - subject1, 1 - subject2, 2 - subject3, ...
    ' Okres wystawienia wysukiwanych faktur
    ' Rodzaj daty 0 - Issue, 1 - Invoicing, 2 - PermanentStorage
    filtr.DateRange.DateType = 0
    ' Data od
    filtr.DateRange.From = DateAdd("m", -1, Now())
    ' Data do
    filtr.DateRange.To = Now()
    ' Tylko wystawione w walucie PLN i EUR
    filtr.CurrencyCodesStr = "PLN,EUR"

    WSH.echo "Wyszukiwanie..."
    ' Pobieramy strone metadanych wg filtra
    ' P.1. Obiekt z kryteriami filtra
    ' P.2. Od strony (0 - pierwsza strona)
    ' P.3. Ilosc elementow na strone
    ' P.4. Sortowanie (0 - nie podano / domyslnie, 1 - narastajaco, 2 - malejaco
    ' P.5. Token dostepowy (puste - uzyj aktualnego tokena)
    Set response = ksef.InvoicesQueryMetadata(filtr, 0, 10, 0, "")

    ' Wypisz znalezione metadane faktur
    For Each el In response.Invoices
        ' Wypisz numery znalezionych faktur
        WSH.echo "Nr fa: ", el.InvoiceNumber
        WSH.echo "Nr KSeF: ", el.KsefNumber
        WSH.echo "------------"
    Next

    ' Jesli istnieje faktura to pobierz pierwsza do pliku
    If response.Invoices.Count > 0 Then
        WSH.echo "Pobieram FA nr ", response.Invoices.Item(0).InvoiceNumber
        ksef.InvoicesKsef response.Invoices.Item(0).KsefNumber, "DocelowyPlikFA.xml", ""
    End If

    ' Zamykamy sesje
    ksef.AuthSessionTerminateCurrent("")
    WSH.echo "Sesja zamknieta"

End If

