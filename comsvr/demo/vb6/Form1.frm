VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "LibGovPL 4 COM\Automation VB6 Demo"
   ClientHeight    =   9765
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12465
   LinkTopic       =   "Form1"
   ScaleHeight     =   9765
   ScaleWidth      =   12465
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame FrameStatus 
      Caption         =   "Status"
      Enabled         =   0   'False
      Height          =   3015
      Left            =   0
      TabIndex        =   24
      Top             =   3720
      Width           =   4095
      Begin VB.CommandButton CommandSInvStat 
         Caption         =   "SpawdŸ status faktury"
         Height          =   375
         Left            =   120
         TabIndex        =   30
         Top             =   1800
         Width           =   3855
      End
      Begin VB.CommandButton CommandSSesStat 
         Caption         =   "Sprawdz status sesji"
         Height          =   375
         Left            =   120
         TabIndex        =   29
         Top             =   1320
         Width           =   3855
      End
      Begin VB.TextBox TextSInvRefNo 
         Height          =   375
         Left            =   1440
         TabIndex        =   28
         Top             =   720
         Width           =   2535
      End
      Begin VB.TextBox TextSSesRefNo 
         Height          =   375
         Left            =   1440
         TabIndex        =   26
         Top             =   240
         Width           =   2535
      End
      Begin VB.Label Label9 
         Caption         =   "Nr ref. faktury"
         Height          =   255
         Left            =   120
         TabIndex        =   27
         Top             =   840
         Width           =   1215
      End
      Begin VB.Label Label8 
         Caption         =   "Nr ref. sesji"
         Height          =   255
         Left            =   120
         TabIndex        =   25
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.Frame FrameIteractive 
      Caption         =   "Wysy³ka interaktywna"
      Enabled         =   0   'False
      Height          =   3615
      Left            =   7320
      TabIndex        =   22
      Top             =   0
      Width           =   5055
      Begin VB.CommandButton CommandIClose 
         Caption         =   "Zamknij sesjê interaktywn¹"
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         TabIndex        =   37
         Top             =   2880
         Width           =   2295
      End
      Begin VB.CommandButton CommandISend 
         Caption         =   "Wyœlij wskazan¹ fakturê"
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         TabIndex        =   36
         Top             =   2400
         Width           =   2295
      End
      Begin VB.TextBox TextIHashKor 
         Height          =   375
         Left            =   1560
         TabIndex        =   34
         Top             =   1800
         Width           =   3375
      End
      Begin VB.CheckBox CheckIOffline 
         Caption         =   "Tryb Offline"
         Height          =   255
         Left            =   1560
         TabIndex        =   33
         Top             =   1440
         Width           =   3255
      End
      Begin VB.TextBox TextIPlik 
         Height          =   405
         Left            =   1560
         TabIndex        =   32
         Top             =   960
         Width           =   3375
      End
      Begin VB.CommandButton CommandIOpen 
         Caption         =   "Otwórz sesjê interaktywn¹"
         Height          =   375
         Left            =   120
         TabIndex        =   23
         Top             =   240
         Width           =   2295
      End
      Begin VB.Label Label11 
         Caption         =   "Skrót SHA kor."
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Top             =   1920
         Width           =   1215
      End
      Begin VB.Label Label10 
         Caption         =   "Plik XML faktury"
         Height          =   255
         Left            =   120
         TabIndex        =   31
         Top             =   960
         Width           =   1215
      End
   End
   Begin VB.Frame FrameAuth 
      Caption         =   "Uwierzytelnienie"
      Enabled         =   0   'False
      Height          =   3615
      Left            =   4200
      TabIndex        =   15
      Top             =   0
      Width           =   3015
      Begin VB.CommandButton CommandACert 
         Caption         =   "Uwierzytelnij certyfikatem"
         Height          =   375
         Left            =   120
         TabIndex        =   19
         Top             =   240
         Width           =   2775
      End
      Begin VB.CommandButton CommandAClose 
         Caption         =   "Uniewa¿nij sesjê"
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         TabIndex        =   18
         Top             =   2640
         Width           =   2775
      End
      Begin VB.CommandButton CommandAStatus 
         Caption         =   "SpawdŸ status uwierzytelnienia"
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         TabIndex        =   17
         Top             =   1200
         Width           =   2775
      End
      Begin VB.CommandButton CommandAToken 
         Caption         =   "Uwierzytelnij tokenem KSeF"
         Height          =   375
         Left            =   120
         TabIndex        =   16
         Top             =   720
         Width           =   2775
      End
   End
   Begin VB.TextBox TextLog 
      Height          =   1695
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   12
      Text            =   "Form1.frx":0000
      Top             =   7920
      Width           =   12255
   End
   Begin VB.Frame FrameSetup 
      Caption         =   "Setup"
      Height          =   3615
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4095
      Begin VB.ComboBox ComboSGate 
         Height          =   315
         ItemData        =   "Form1.frx":0018
         Left            =   1440
         List            =   "Form1.frx":0025
         Style           =   2  'Dropdown List
         TabIndex        =   20
         Top             =   600
         Width           =   2535
      End
      Begin VB.TextBox TextSHaslo 
         Height          =   285
         Left            =   1440
         TabIndex        =   14
         Top             =   2160
         Width           =   2535
      End
      Begin VB.CommandButton CommandSetup 
         Caption         =   "Setup"
         Height          =   375
         Left            =   2760
         TabIndex        =   11
         Top             =   3120
         Width           =   1215
      End
      Begin VB.TextBox TextSTokenKSeF 
         Height          =   285
         Left            =   1440
         TabIndex        =   10
         Top             =   2640
         Width           =   2535
      End
      Begin VB.TextBox TextSPlikKlucz 
         Height          =   285
         Left            =   1440
         TabIndex        =   8
         Top             =   1800
         Width           =   2535
      End
      Begin VB.TextBox TextSPlikCert 
         Height          =   285
         Left            =   1440
         TabIndex        =   6
         Top             =   1440
         Width           =   2535
      End
      Begin VB.TextBox TextSNip 
         Height          =   285
         Left            =   1440
         TabIndex        =   4
         Top             =   1080
         Width           =   2535
      End
      Begin VB.ComboBox ComboSDrv 
         Height          =   315
         ItemData        =   "Form1.frx":0045
         Left            =   1440
         List            =   "Form1.frx":004F
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   240
         Width           =   2535
      End
      Begin VB.Label Label7 
         Caption         =   "Bramka"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   600
         Width           =   1335
      End
      Begin VB.Label Label6 
         Caption         =   "Has³o klucza pry."
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   2160
         Width           =   1335
      End
      Begin VB.Label Label5 
         Caption         =   "Token KSeF"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   2640
         Width           =   1095
      End
      Begin VB.Label Label4 
         Caption         =   "Plik klucza pryw."
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   1800
         Width           =   1335
      End
      Begin VB.Label Label3 
         Caption         =   "Plik cert. KSeF"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   1560
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "NIP"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   1080
         Width           =   1215
      End
      Begin VB.Label Label1 
         Caption         =   "Rodzaj zaplecza"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   1335
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Obiekt zaplecza
Private lgBackend As LibGovPL.lgcBackend
' Obiekt sygnatury XAdES
Private lgXAdES As LibGovPL.lgcXAdES
' Obiekt klienta HTTPS
Private lgHTTPClient As LibGovPL.lgcHTTPClient
' Obiekt klienta KSeF 2.0
Private lgKSeF As LibGovPL.lgcKSeF2
' Obiekt zaplecza certyfikatow i podpisu kluczem prywatnym
Private lgSigner As LibGovPL.lgcCertificateSigner
' Obiekt certyfikatu klucza prywatnego
Private lgCert As LibGovPL.lgcCertificate

Private Sub Log(Text As String, Optional DoPrintLine As Boolean = False)
    Text = Chr(13) & Chr(10) & Text
    If DoPrintLine = True Then
        Text = Chr(13) & Chr(10) & "---------" & Text
    End If
    TextLog.Text = TextLog.Text & Text
    TextLog.SelStart = Len(TextLog.Text)
End Sub

Private Sub LogError()
    Dim Blad As LibGovPL.lgcErrorInfo
    Dim i As Integer

    Log ("B³¹d: " & Err.Description)
    If IsEmpty(lgBackend) = False And IsEmpty(lgBackend.LastError) = False Then
        Set Blad = lgBackend.LastError
        Log ("Klasa wyj¹tku: " & Blad.ExceptionClass)
        Log ("Klasa obiektu wewnêtrznego: " & Blad.HandlerClass)
        If IsArray(Blad.ExtraInfo) Then
            For i = LBound(Blad.ExtraInfo) To UBound(Blad.ExtraInfo)
                Log ("ExtraInfo[" & CStr(i) & "]: " & CStr(Blad.ExtraInfo(i)))
            Next i
        End If
    End If
    MsgBox ("B³¹d: " & Err.Description)
End Sub


Private Sub CommandACert_Click()
    On Error GoTo HError

    Dim Response As Object

    Log "Uwierzytelnianie certyfikatem", True
    Set Response = lgKSeF.AuthXadesSignature()
    
    Log ("Uwierzytelnianie rozpoczête, nr sesji: " & Response.ReferenceNumber)
    
    CommandAStatus.Enabled = True
    CommandACert.Enabled = False
    CommandAToken.Enabled = False
    Exit Sub
    
HError:
    LogError
End Sub

Private Sub CommandAClose_Click()
    On Error GoTo HError

    Log "Zamykanie sesji", True
    
    ' Uniewaznij sesje (wyloguj z KSeF)
    lgKSeF.AuthSessionTerminateCurrent
    Log ("Sesja zostala zamknieta")
    
    CommandACert.Enabled = True
    CommandAToken.Enabled = True
    CommandAStatus.Enabled = True
    FrameIteractive.Enabled = False
    FrameStatus.Enabled = False
    
    Exit Sub

HError:
    LogError
End Sub

Private Sub CommandAStatus_Click()
    On Error GoTo HError

    Dim Response As Object
    
    Log "Sprawdzam status sesji", True
    
    ' Sprawdz status uwierzytelnienia
    Set Response = lgKSeF.AuthStatus
    
    ' Napisz informacje o statusie
    Log ("Status: " & CStr(Response.Status.Code))
    Log ("Opis: " & Response.Status.Description)
    
    If Response.Status.Code < 200 Then
        ' Jesli kod < 200 to uwierzytelnienie jest w trakcie
        Log ("Sprawdz ponownie")
    ElseIf Response.Status.Code >= 400 Then
        ' Jesli kod >= 400 to uwierzytelnienie zakonczone niepowodzeniem
        Log ("Uwierzytelnienie nie powiodlo sie")
    ElseIf Response.Status.Code = 200 Then
        ' Jesli kod = 200 to uwierzytelnienie zakonczone sukcesem
        Log ("Uwierzytelniono, pobieram tokeny dostepowe")
        ' Pobieramy tokeny dostepowe
        lgKSeF.AuthTokenRedem
        ' Napisz informacje o tokenach
        Log ("RefreshToken wazny do: " & CStr(lgKSeF.RefreshTokenValidUntil))
        Log ("AccessToken wazny do: " & CStr(lgKSeF.AccessTokenValidUntil))
        
        CommandAStatus.Enabled = False
        CommandAClose.Enabled = True
        FrameIteractive.Enabled = True
        FrameStatus.Enabled = True
        
    End If
    Exit Sub

HError:
    LogError
End Sub

Private Sub CommandAToken_Click()
    On Error GoTo HError

    Dim Response As Object

    Log "Uwierzytelnianie tokenem KSeF", True
    ' Uwierzytelnij tokenem KSeF.
    ' Otrzymamy obiekt odpowiedzi
    Set Response = lgKSeF.AuthKsefToken()
    
    Log ("Uwierzytelnianie rozpoczête, nr sesji: " & Response.ReferenceNumber)
    
    CommandAStatus.Enabled = True
    CommandACert.Enabled = False
    CommandAToken.Enabled = False
    Exit Sub
    
HError:
    LogError
End Sub

Private Sub CommandIClose_Click()
    On Error GoTo HError

    Log "Zamykam sesjê interaktywn¹", True
    lgKSeF.InteractiveClose
    Log ("Sesja interaktywna zamkniêta")
    
    CommandISend.Enabled = False
    CommandIClose.Enabled = False
    Exit Sub
    
HError:
    LogError
End Sub

Private Sub CommandIOpen_Click()
    On Error GoTo HError

    Dim RefNo As String
    
    Log "Otwarcie sesji interaktywnej", True
    ' Otwieramy sesjê interaktywn¹.
    ' Otrzymamy nr referencyjny sesji
    RefNo = lgKSeF.InteractiveOpenSimple()
    
    Log ("Sesja interaktywna otwarta, nr ref: " & RefNo)
    TextSSesRefNo.Text = RefNo
    
    CommandIClose.Enabled = True
    CommandISend.Enabled = True
    Exit Sub

HError:
    LogError
End Sub

Private Sub CommandISend_Click()
    On Error GoTo HError
    
    Dim RefNo As String

    Log "Wysy³am plik faktury: " & TextIPlik.Text, True
    
    ' Wyœlij fakturê ze wskazanygo pliku
    ' Otrzymamy nr referencyjny wys³anej faktury
    RefNo = lgKSeF.InteractiveSend(TextIPlik.Text, CheckIOffline.Value, TextIHashKor.Text)
    
    Log ("Wys³ano faktuê, nr ref: " & RefNo)
    TextSInvRefNo.Text = RefNo
    Exit Sub

HError:
    LogError
End Sub

Private Sub CommandSetup_Click()
    On Error GoTo HError

    If ComboSDrv.ListIndex = -1 Then
        MsgBox ("Wybierz rodzaj sterowników zaplecza")
        Exit Sub
    End If
    
    Log "Setup...", True
    
    ' Tworzymy obiekt klienta KSeF 2.0
    Set lgKSeF = lgBackend.CreateKSeF2()
    ' Tworzymy obiekt XAdES (przy autoryzacji certyfikatem)
    Set lgXAdES = lgBackend.CreateXAdES()
    ' Przypisujemy obiekt XAdES do klienta KSeF
    lgKSeF.XAdES = lgXAdES

    ' Ustawiamy odpowiednie sterowniki zaplecza
    If ComboSDrv.ListIndex = 0 Then
        ' Klient HTTP oparty o WinHTTP
        Set lgHTTPClient = lgBackend.CreateHTTPClient("TlgWinHTTPClient")
        ' Kryptografia oparta o Windows CNG
        lgKSeF.RSAPublicKeyClass = "TlgCNGRSAPublicKey"
        lgKSeF.Base64EncoderClass = "TlgCNGBase64Encoder"
        lgKSeF.AES256EncryptClass = "TlgCNGAES256Encrypt"
        lgKSeF.SHA256HashClass = "TlgCNGSHA256Hash"
        lgKSeF.RandomGeneratorClass = "TlgCNGRandomGenerator"
        lgXAdES.SHA256HashClass = "TlgCNGSHA256Hash"
        ' Tworzymy obiekt certyfikatow i podpisu oparty o Windows CNG
        Set lgSigner = lgBackend.CreateCertificateSigner("TlgCNGCertificateSigner")
    Else
        ' Klient HTTP oparty o OpenSSL
        Set lgHTTPClient = lgBackend.CreateHTTPClient("TlgFPCHTTPClient")
        ' Kryptografia oparta o OpenSSL
        lgKSeF.RSAPublicKeyClass = "TlgOSSLRSAPublicKey"
        lgKSeF.Base64EncoderClass = "TlgFPCBase64Encoder"
        lgKSeF.AES256EncryptClass = "TlgOSSLAES256Encrypt"
        lgKSeF.SHA256HashClass = "TlgOSSLSHA256Hash"
        lgKSeF.RandomGeneratorClass = "TlgOSSLRandomGenerator"
        lgXAdES.SHA256HashClass = "TlgOSSLSHA256Hash"
        ' Tworzymy obiekt certyfikatow i podpisu oparty o OpenSSL
        Set lgSigner = lgBackend.CreateCertificateSigner("TlgOSSLCertificateSigner")
    End If
    ' Przypisujem klient HTTP do obiektu KSeF
    lgKSeF.HTTPClient = lgHTTPClient
    
    ' Ustawiamy rodzaj bramki
    lgKSeF.GateType = ComboSGate.ListIndex
    ' Ustawiamy rodzaj identyfikatora (1 - AllPartners,2 - NIP, 3 - InternalId, 4 - NipVatUe, 5 - PeppolId)
    lgKSeF.IdentifierType = 2
    ' Ustawiamy identyfikator (czyli NIP podmiotu)
    lgKSeF.Identifier = TextSNip.Text
    ' Klient sam odswieza token dostepowy
    lgKSeF.AutoRefreshToken = True
    
    ' Jesli podano plik certyfikatu do autoryzacji KSeF to wczytaj
    If IsEmpty(TextSPlikCert.Text) = False Then
        ' Wczytaj certyfikat autoryzacji i klucz prywatny z podanych plikow
        ' w formacie PEM. Klucz zabezpieczony podanym haslem
        Set lgCert = lgSigner.LoadFromStream(TextSPlikCert.Text, LibGovPL.lgcETPEM, TextSPlikKlucz.Text, LibGovPL.lgcETPEM, TextSHaslo.Text)
        ' Napisz informacje o certyfikacie
        Log ("Wczytano certyfikat: " & lgCert.DisplayName)
        Log ("Wa¿ny od: " & CStr(lgCert.ValidFrom) & " do: " & CStr(lgCert.ValidTo))
        ' Przyposz certyfikat do obiektu klienta KSeF
        lgKSeF.AuthCertificate = lgCert
    End If
        
    ' Jesli podano to ustaw token KSeF do autoryzacji
    lgKSeF.KsefToken = TextSTokenKSeF
    
    FrameSetup.Enabled = False
    FrameAuth.Enabled = True
    Exit Sub

HError:
    LogError
End Sub

Private Sub CommandSInvStat_Click()
    On Error GoTo HError

    Dim Response As Object
    
    Log "Sprawdzam status faktury nr ref: " & TextSInvRefNo.Text & " i nr ref sesji: " & TextSSesRefNo.Text, True
    ' Sprawdz status faktury w danej sesji o podanym nr referencyjnym
    ' W odpowiedzi dostajemy obiekt statusu
    Set Response = lgKSeF.StatusSessionInvoice(TextSSesRefNo.Text, TextSInvRefNo.Text)
    
    ' Napisz zawartosc obiektu odpowiedzi
    Log ("Status.Code: " & CStr(Response.Status.Code))
    Log ("Status.Description: " & Response.Status.Description)
    Log ("Status.Details: " & Response.Status.DetailsStr)
    Log ("OrdinalNumber: " & CStr(Response.OrdinalNumber))
    Log ("InvoiceNumber: " & Response.InvoiceNumber)
    Log ("KsefNumber: " & Response.KsefNumber)
    Log ("ReferenceNumber: " & Response.ReferenceNumber)
    Log ("InvoiceHash: " & Response.InvoiceHash)
    Log ("InvoiceFileName: " & Response.InvoiceFileName)
    Log ("AcquisitionDate: " & CStr(Response.AcquisitionDate))
    Log ("InvoicingDate: " & CStr(Response.InvoicingDate))
    Log ("PermanentStorageDate: " & CStr(Response.PermanentStorageDate))
    Log ("UpoDownloadUrl: " & Response.UpoDownloadUrl)
    Log ("UpoDownloadUrlExpirationDate: " & CStr(Response.UpoDownloadUrlExpirationDate))
    
    Exit Sub

HError:
    LogError
End Sub

Private Sub CommandSSesStat_Click()
    On Error GoTo HError

    Dim Response As Object
    
    Log "Sprawdzam status sesji nr: " & TextSSesRefNo.Text, True
    ' Sprawdz status sesji o podanym nr referencyjnym
    ' W odpowiedzi dostajemy obiekt statusu
    Set Response = lgKSeF.StatusSession(TextSSesRefNo.Text)
    
    ' Napisz zawartosc obiektu odpowiedzi
    Log ("Status.Code: " & CStr(Response.Status.Code))
    Log ("Status.Description: " & Response.Status.Description)
    Log ("Status.Details: " & Response.Status.DetailsStr)
    Log ("DateCreated: " & CStr(Response.DateCreated))
    Log ("DateUpdated: " & CStr(Response.DateUpdated))
    Log ("ValidUntil: " & CStr(Response.ValidUntil))
    Log ("InvoiceCount: " & CStr(Response.InvoiceCount))
    Log ("SuccessfulInvoiceCount: " & CStr(Response.SuccessfulInvoiceCount))
    Log ("FailedInvoiceCount: " & CStr(Response.FailedInvoiceCount))
    
    Exit Sub

HError:
    LogError
End Sub

Private Sub Form_Load()
    ' Utworz obiekt zaplecza
    Set lgBackend = New LibGovPL.lgcBackend
    ' Napisz wersje biblioteki
    Log ("Wrsja biblioteki:" & lgBackend.GetLibVersion())
    ComboSGate.ListIndex = 2
End Sub

