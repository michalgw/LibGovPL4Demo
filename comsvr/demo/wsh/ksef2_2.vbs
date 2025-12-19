'
'   KSeF 2.0
'   Autoryzacja tokenem KSeF,
'   wyslanie faktury, sprawdzenie statusu przetwarzania, poranie UPO
'
Dim Backend, KSeF, Response, SessionRefNo, FaRefNo
Dim Przerwij, Filtr, Request, El, Klawisz

' Tworzenie obiektu zaplecza
Set Backend = CreateObject("LibGovPl.lgcBackend")

' Napisz wersje biblioteki
WSH.echo "Wersja biblioteki: ", Backend.GetLibVersion()

' Tworzenie obiektu komunikacji KSeF 2.0
Set KSeF = Backend.CreateKSeF2()

' Tworzenie obiektu klienta HTTP
KSeF.HTTPClient = Backend.CreateHTTPClient("")

' Token KSeF do autoryzacji
KSeF.KsefToken = "20251024-BB-1111222333-4455666444-33|nip-1111111111|1111111112222222222333333333344444444444555555555556666666677777"

' Ustawiamy parametry podmiotu
' Rodzaj identyfikatora - NIP
KSeF.IdentifierType = 2
' Wartosc identyfikatora, tutaj NIP
KSeF.Identifier = "1111111111"
' Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
KSeF.GateType = 2

' Autoryzacja wybranym certyfikatem
Set Response = KSeF.AuthKsefToken()

' Napisz nr referencyjny sesji
WSH.echo "Nr referencyjny sesji: ", Response.ReferenceNumber
' Napisz token autoryzacji i date waznosci
WSH.echo "Token autoryzacyjny: ", Response.AuthenticationToken.Token
WSH.echo "Token wazny do: ", Response.AuthenticationToken.ValidUntil
' Napisz odpowiedz w postaci surowego JSON
WSH.echo "Surowa odpowiedz JSON: ", Response.RawResponse

Przerwij = False
Do Until Przerwij
    ' Sprawdz status autoryzacji (dla aktualnie nawiazywanej sesji i tokena)
    Set Response = KSeF.AuthStatus("", "")

    ' Wyswietl otrzymany status
    WSH.echo "Status: ", Response.Status.Code
    WSH.echo "Opis statusu: ", Response.Status.Description
    WSH.echo "Surowa odpowiedz JSON: ", Response.RawResponse

    ' Jesli autoryzowano (status = 200) lub
    ' jesli autoryzacja sie nie powiodla (status >= 300)
    ' to zakoncz
    Przerwij = Response.Status.Code = 200 Or Response.Status.Code >= 300

    If Przerwij = False Then
       WSH.echo "sprawdzic ponownie? (T/N)"
       Klawisz = WScript.StdIn.Read(1)
       Przerwij = Klawisz = "N" Or Klawisz = "n"
    End If
Loop

' Jesli autoryzowano (status = 200)
If Response.Status.Code = 200 Then

    ' Pobierz tokeny Access Token i Refresh Token
    Set Response = KSeF.AuthTokenRedem("")
    WSH.echo "Pobrano tokeny:"
    WSH.echo "AccessToken:Token: ", Response.AccessToken.Token
    WSH.echo "AccessToken:ValidUntil: ", Response.AccessToken.ValidUntil
    WSH.echo "RefreshToken:Token: ", Response.RefreshToken.Token
    WSH.echo "RefreshToken:ValidUntil: ", Response.RefreshToken.ValidUntil

    ' Otworz sesje interaktywna i zwroc jej numer referencyjny
    SessionRefNo = KSeF.InteractiveOpenSimple()
    WSH.echo "Otwarto sesje interaktywna nr: ", SessionRefNo

    ' Wyslij plik faktury w otwartej sesji i pobierz nr referencyjny
    ' P.1. Plik xml z faktura do wyslania
    ' P.2. Czy wysylamy w trybie offline
    ' P.3. Skrot dokumentu pierwotnego w trybie offline w przypadku korekty technicznej
    FaRefNo = KSeF.InteractiveSend("PlikFA.xml", False, "")
    WSH.echo "Wyslano fakture, nr ref: ", FaRefNo

    ' Zamykamy aktualna sesje interaktywna
    tmp = KSeF.InteractiveClose("", "")
    WSH.echo "Zamknieto sesje interaktywna"

    Przerwij = False
    Do While Przerwij = False

        ' Sprawdz status przetwarzania faktury
        Set Response = KSeF.StatusSessionInvoice(SessionRefNo, FaRefNo, "")

        ' Wyswietl otrzymany status
        WSH.echo "Status: ", Response.Status.Code
        WSH.echo "Opis statusu: ", Response.Status.Description
        WSH.echo "Surowa odpowiedz JSON: ", Response.RawResponse

        ' Jesli autoryzowano (status = 200) lub
        ' jesli autoryzacja sie nie powiodla (status >= 300)
        ' to zakoncz
        Przerwij = Response.Status.Code = 200 Or Response.Status.Code >= 300

        If Przerwij = False Then
            WSH.echo "sprawdzic ponownie? (T/N)"
            Klawisz = WScript.StdIn.Read(1)
            Przerwij = Klawisz = "N" Or Klawisz = "n"
        End If

    Loop

    ' Jesli zatwierdzono to pobierz UPO dla wyslanej faktury
    IF Response.Status.Code = 200 Then

        WSH.echo "Faktura zatwierdzona, nr KSeF: ", Response.KsefNumber
        WSH.echo "Surowa odpowiedz JSON: ", Response.RawResponse

        WSH.echo "Pobieram UPO dla faktury z sesji"
        tmp = KSeF.StatusUpoSessionInvoice(SessionRefNo, FaRefNo, "PobranyPlikUPO.xml", "")

    End If

    ' Zamykamy sesje
    KSeF.AuthSessionTerminateCurrent("")
    WSH.echo "Sesja zamknieta"

End If
