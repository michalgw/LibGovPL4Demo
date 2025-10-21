object Form1: TForm1
  Left = 270
  Top = 12
  Width = 931
  Height = 825
  Caption = 'LibGovPL 4 Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 17
  object Splitter1: TSplitter
    Left = 0
    Top = 633
    Width = 913
    Height = 7
    Cursor = crVSplit
    Align = alBottom
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 913
    Height = 633
    ActivePage = TabSheetSetup
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheetSetup: TTabSheet
      Caption = 'Setup'
      object Panel1: TScrollBox
        Left = 0
        Top = 0
        Width = 905
        Height = 542
        Align = alClient
        TabOrder = 0
        DesignSize = (
          880
          538)
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 70
          Height = 17
          Caption = 'HTTP Client'
        end
        object Label2: TLabel
          Left = 0
          Top = 30
          Width = 160
          Height = 17
          Caption = 'Random nmber generator'
        end
        object Label11: TLabel
          Left = 0
          Top = 60
          Width = 99
          Height = 17
          Caption = 'Base64 Encoder'
        end
        object Label3: TLabel
          Left = 0
          Top = 90
          Width = 62
          Height = 17
          Caption = 'MD5 Hash'
        end
        object Label4: TLabel
          Left = 0
          Top = 120
          Width = 67
          Height = 17
          Caption = 'SHA1 Hash'
        end
        object Label5: TLabel
          Left = 0
          Top = 150
          Width = 88
          Height = 17
          Caption = 'SHA-256 Hash'
        end
        object Label6: TLabel
          Left = 0
          Top = 180
          Width = 38
          Height = 17
          Caption = 'Signer'
        end
        object Label7: TLabel
          Left = 0
          Top = 211
          Width = 108
          Height = 17
          Caption = 'eDeklaracja SOAP'
        end
        object Label8: TLabel
          Left = 0
          Top = 241
          Width = 63
          Height = 17
          Caption = 'XML C14N'
        end
        object Label9: TLabel
          Left = 0
          Top = 271
          Width = 72
          Height = 17
          Caption = 'XML Reader'
        end
        object Label10: TLabel
          Left = 0
          Top = 301
          Width = 37
          Height = 17
          Caption = 'Zip file'
        end
        object Label12: TLabel
          Left = 0
          Top = 331
          Width = 119
          Height = 17
          Caption = 'AES256 Encryption'
        end
        object Label13: TLabel
          Left = 0
          Top = 361
          Width = 95
          Height = 17
          Caption = 'RSA encryption'
        end
        object Label24: TLabel
          Left = 0
          Top = 391
          Width = 124
          Height = 17
          Caption = 'XAdES - Rodzaj SHA'
        end
        object Label25: TLabel
          Left = 0
          Top = 421
          Width = 160
          Height = 17
          Caption = 'XAdES - Dolacz date i czas'
        end
        object Label26: TLabel
          Left = 0
          Top = 443
          Width = 170
          Height = 17
          Caption = 'eDeklaracja - kanonizuj XML'
        end
        object Label33: TLabel
          Left = 0
          Top = 466
          Width = 178
          Height = 17
          Caption = 'JPK - Klucz RSA produkcyjny'
        end
        object Label34: TLabel
          Left = 0
          Top = 496
          Width = 148
          Height = 17
          Caption = 'JPK - Klucz RSA testowy'
        end
        object Label55: TLabel
          Left = 0
          Top = 526
          Width = 185
          Height = 17
          Caption = 'KSeF - klucz RSA produkcyjny'
        end
        object Label56: TLabel
          Left = 0
          Top = 556
          Width = 141
          Height = 17
          Caption = 'KSeF - klucz RSA demo'
        end
        object Label57: TLabel
          Left = 0
          Top = 586
          Width = 149
          Height = 17
          Caption = 'KSeF - klucz RSA tetowy'
        end
        object Label115: TLabel
          Left = -1
          Top = 617
          Width = 136
          Height = 17
          Caption = 'Plik biblioteki libxml2.dll'
        end
        object SBFileNameEditJPKRSAProd: TSpeedButton
          Tag = 1
          Left = 843
          Top = 466
          Width = 31
          Height = 28
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object SBFileNameEditJPKRSATest: TSpeedButton
          Tag = 2
          Left = 843
          Top = 496
          Width = 31
          Height = 28
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object SBFileNameEditKSeFRSAProd: TSpeedButton
          Tag = 3
          Left = 845
          Top = 526
          Width = 30
          Height = 28
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object SBFileNameEditKSeFRSADemo: TSpeedButton
          Tag = 4
          Left = 845
          Top = 556
          Width = 30
          Height = 29
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object SBFileNameEditKSeFRSATest: TSpeedButton
          Tag = 5
          Left = 845
          Top = 586
          Width = 30
          Height = 29
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object SBFilenameEditLibXML2: TSpeedButton
          Tag = 6
          Left = 845
          Top = 617
          Width = 30
          Height = 29
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object Label120: TLabel
          Left = -2
          Top = 651
          Width = 137
          Height = 17
          Caption = 'Plik biblioteki PKCS#11'
        end
        object SpeedButton28: TSpeedButton
          Tag = 34
          Left = 845
          Top = 647
          Width = 30
          Height = 29
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object ComboBoxHTTPCli: TComboBox
          Left = 472
          Top = 0
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 0
        end
        object ComboBoxRandGen: TComboBox
          Left = 472
          Top = 30
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 1
        end
        object ComboBoxBase64: TComboBox
          Left = 472
          Top = 60
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 2
        end
        object ComboBoxMD5: TComboBox
          Left = 472
          Top = 90
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 3
        end
        object ComboBoxSHA1: TComboBox
          Left = 472
          Top = 120
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 4
        end
        object ComboBoxSHA256: TComboBox
          Left = 472
          Top = 150
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 5
        end
        object ComboBoxSign: TComboBox
          Left = 472
          Top = 180
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 6
        end
        object ComboBoxEDek: TComboBox
          Left = 472
          Top = 211
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 7
        end
        object ComboBoxXMLC14N: TComboBox
          Left = 472
          Top = 241
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 8
        end
        object ComboBoxXMLRead: TComboBox
          Left = 472
          Top = 271
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 9
        end
        object ComboBoxZip: TComboBox
          Left = 471
          Top = 301
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 10
        end
        object ComboBoxAES256: TComboBox
          Left = 472
          Top = 331
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 11
        end
        object ComboBoxRSAEnc: TComboBox
          Left = 472
          Top = 361
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          TabOrder = 12
        end
        object ComboBoxXAdESSHA: TComboBox
          Left = 472
          Top = 391
          Width = 403
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 17
          ItemIndex = 1
          TabOrder = 13
          Text = 'SHA256'
          Items.Strings = (
            'SHA1'
            'SHA256')
        end
        object CheckBoxXAdESCzas: TCheckBox
          Left = 472
          Top = 421
          Width = 403
          Height = 22
          TabOrder = 14
        end
        object CheckBoxEDekC14N: TCheckBox
          Left = 472
          Top = 443
          Width = 403
          Height = 23
          Checked = True
          State = cbChecked
          TabOrder = 15
        end
        object FileNameEditJPKRSAProd: TEdit
          Left = 472
          Top = 466
          Width = 371
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 16
          Text = '..\pem\prod.pem'
        end
        object FileNameEditJPKRSATest: TEdit
          Left = 472
          Top = 496
          Width = 371
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 17
          Text = '..\pem\test.pem'
        end
        object FileNameEditKSeFRSAProd: TEdit
          Left = 472
          Top = 526
          Width = 371
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 18
          Text = '..\pem\ksefprod.pem'
        end
        object FileNameEditKSeFRSADemo: TEdit
          Left = 472
          Top = 556
          Width = 371
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 19
          Text = '..\pem\ksefdemo.pem'
        end
        object FileNameEditKSeFRSATest: TEdit
          Left = 472
          Top = 586
          Width = 371
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 20
          Text = '..\pem\kseftest.pem'
        end
        object FilenameEditLibXML2: TEdit
          Left = 471
          Top = 617
          Width = 371
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 21
        end
        object FileNameEditLibPKCS11: TEdit
          Left = 471
          Top = 647
          Width = 371
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 22
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 542
        Width = 905
        Height = 59
        Align = alBottom
        TabOrder = 1
        object ButtonSetup: TButton
          Left = 25
          Top = 14
          Width = 98
          Height = 33
          Caption = 'Setup'
          TabOrder = 0
          OnClick = ButtonSetupClick
        end
      end
    end
    object TabSheetCert: TTabSheet
      Caption = 'Certyfikaty'
      TabVisible = False
      object ListViewCert: TListView
        Left = 0
        Top = 0
        Width = 905
        Height = 535
        Align = alClient
        Columns = <
          item
            Caption = 'Index'
            Width = 78
          end
          item
            Caption = 'Subject name'
            Width = 262
          end
          item
            Caption = 'Valid from'
            Width = 118
          end
          item
            Caption = 'Valid to'
            Width = 118
          end
          item
            Caption = 'Serial number'
            Width = 262
          end
          item
            Caption = 'Issuer'
            Width = 392
          end
          item
            Caption = 'Subject'
            Width = 392
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel3: TPanel
        Left = 0
        Top = 535
        Width = 905
        Height = 66
        Align = alBottom
        TabOrder = 1
        object ButtonShowCert: TButton
          Left = 18
          Top = 16
          Width = 161
          Height = 32
          Caption = 'Pokaz szczeg'#243'ly'
          TabOrder = 0
          OnClick = ButtonShowCertClick
        end
        object ButtonCertWybierz: TButton
          Left = 209
          Top = 16
          Width = 304
          Height = 32
          Caption = 'Wybierz certyfikat i pokaz informacje'
          TabOrder = 1
          OnClick = ButtonCertWybierzClick
        end
        object ButtonCertReload: TButton
          Left = 544
          Top = 16
          Width = 251
          Height = 32
          Caption = 'Odswierz liste certyfikat'#243'w'
          TabOrder = 2
          OnClick = ButtonCertReloadClick
        end
      end
    end
    object TabSheetPKCS11: TTabSheet
      Caption = 'PKCS#11'
      ImageIndex = 13
      TabVisible = False
      object GroupBox23: TGroupBox
        Left = 0
        Top = 0
        Width = 905
        Height = 97
        Align = alTop
        Caption = 'Informacje'
        TabOrder = 0
        object ButtonPKCS11Info: TButton
          Left = 17
          Top = 25
          Width = 248
          Height = 25
          Caption = 'Pokaz informacje o bibliotece PKCS11'
          TabOrder = 0
          OnClick = ButtonPKCS11InfoClick
        end
        object ButtonPKCS11Slots: TButton
          Left = 17
          Top = 59
          Width = 136
          Height = 25
          Caption = 'Pokaz liste slotow'
          TabOrder = 1
          OnClick = ButtonPKCS11SlotsClick
        end
      end
      object GroupBox24: TGroupBox
        Left = 0
        Top = 97
        Width = 905
        Height = 123
        Align = alTop
        Caption = 'Sesja'
        TabOrder = 1
        DesignSize = (
          905
          123)
        object Label124: TLabel
          Left = 8
          Top = 28
          Width = 59
          Height = 17
          Caption = 'Certyfikat'
          Color = clBtnFace
          ParentColor = False
        end
        object Label125: TLabel
          Left = 48
          Top = 59
          Width = 21
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'PIN'
          Color = clBtnFace
          ParentColor = False
        end
        object Label126: TLabel
          Left = 331
          Top = 59
          Width = 122
          Height = 17
          Caption = 'Rodzaj uzytkownika'
          Color = clBtnFace
          ParentColor = False
        end
        object ComboBoxPKCS11Cert: TComboBox
          Left = 75
          Top = 24
          Width = 611
          Height = 25
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 0
          TabOrder = 0
        end
        object EditPKCS11PIN: TEdit
          Left = 75
          Top = 55
          Width = 232
          Height = 25
          PasswordChar = '*'
          TabOrder = 1
        end
        object ButtonPKCS11SesStart: TButton
          Left = 75
          Top = 86
          Width = 111
          Height = 25
          Caption = 'Rozpocznij sesje'
          TabOrder = 2
          OnClick = ButtonPKCS11SesStartClick
        end
        object ButtonPKCS11SesLogin: TButton
          Left = 194
          Top = 86
          Width = 66
          Height = 25
          Caption = 'Zaloguj'
          TabOrder = 3
          OnClick = ButtonPKCS11SesLoginClick
        end
        object ButtonPKCS11SesLogout: TButton
          Left = 268
          Top = 86
          Width = 70
          Height = 25
          Caption = 'Wyloguj'
          TabOrder = 4
          OnClick = ButtonPKCS11SesLogoutClick
        end
        object ButtonPKCS11SesClose: TButton
          Left = 346
          Top = 86
          Width = 98
          Height = 25
          Caption = 'Zakoncz sesje'
          TabOrder = 5
          OnClick = ButtonPKCS11SesCloseClick
        end
        object ButtonPKCS11SesInfo: TButton
          Left = 452
          Top = 86
          Width = 116
          Height = 25
          Caption = 'Pokaz info o sesji'
          TabOrder = 6
          OnClick = ButtonPKCS11SesInfoClick
        end
        object ComboBoxPKCS11UserType: TComboBox
          Left = 459
          Top = 55
          Width = 140
          Height = 25
          Style = csDropDownList
          ItemHeight = 17
          ItemIndex = 1
          TabOrder = 7
          Text = 'User'
          Items.Strings = (
            'SO'
            'User'
            'Context Specific')
        end
      end
    end
    object TabSheetEDekPodpisCert: TTabSheet
      Caption = 'eDeklaracja podpis certyfikatem'
      TabVisible = False
      DesignSize = (
        905
        601)
      object Label16: TLabel
        Left = 27
        Top = 25
        Width = 59
        Height = 17
        Caption = 'Certyfikat'
      end
      object Label14: TLabel
        Left = 10
        Top = 84
        Width = 85
        Height = 17
        Caption = 'Plik wejsciowy'
      end
      object Label15: TLabel
        Left = 10
        Top = 136
        Width = 84
        Height = 17
        Caption = 'Plik wynikowy'
      end
      object SpeedButton3: TSpeedButton
        Tag = 9
        Left = 868
        Top = 82
        Width = 30
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object SpeedButton4: TSpeedButton
        Tag = 10
        Left = 868
        Top = 135
        Width = 30
        Height = 28
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object ComboBoxEdekCert: TComboBox
        Left = 123
        Top = 21
        Width = 764
        Height = 25
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 0
        TabOrder = 0
      end
      object FileNameEditEDPCWej: TEdit
        Left = 123
        Top = 82
        Width = 737
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object FileNameEditEDPCWyj: TEdit
        Left = 123
        Top = 136
        Width = 737
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object ButtonEdekPodpiszCert: TButton
        Left = 123
        Top = 209
        Width = 98
        Height = 33
        Caption = 'Podpisz'
        TabOrder = 3
        OnClick = ButtonEdekPodpiszCertClick
      end
    end
    object TabSheetEDekPodpisAut: TTabSheet
      Caption = 'eDeklaracja podpis danymi aut.'
      TabVisible = False
      DesignSize = (
        905
        601)
      object Label17: TLabel
        Left = 10
        Top = 231
        Width = 85
        Height = 17
        Caption = 'Plik wejsciowy'
      end
      object Label18: TLabel
        Left = 10
        Top = 284
        Width = 84
        Height = 17
        Caption = 'Plik wynikowy'
      end
      object Label19: TLabel
        Left = 10
        Top = 21
        Width = 21
        Height = 17
        Caption = 'NIP'
      end
      object Label20: TLabel
        Left = 10
        Top = 60
        Width = 25
        Height = 17
        Caption = 'Imie'
      end
      object Label21: TLabel
        Left = 10
        Top = 105
        Width = 55
        Height = 17
        Caption = 'Nazwisko'
      end
      object Label22: TLabel
        Left = 10
        Top = 146
        Width = 92
        Height = 17
        Caption = 'Data urodzenia'
      end
      object Label23: TLabel
        Left = 10
        Top = 188
        Width = 108
        Height = 17
        Caption = 'Kwota przychodu'
      end
      object SpeedButton5: TSpeedButton
        Tag = 11
        Left = 858
        Top = 229
        Width = 30
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object SpeedButton6: TSpeedButton
        Tag = 12
        Left = 858
        Top = 282
        Width = 30
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object FileNameEditEDPAWyj: TEdit
        Left = 146
        Top = 284
        Width = 704
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object FileNameEditEDPAWej: TEdit
        Left = 146
        Top = 230
        Width = 704
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object ButtonEdekPodpiszAut: TButton
        Left = 146
        Top = 347
        Width = 99
        Height = 32
        Caption = 'Podpisz'
        TabOrder = 2
        OnClick = ButtonEdekPodpiszAutClick
      end
      object EditEDPNIP: TEdit
        Left = 146
        Top = 21
        Width = 262
        Height = 21
        TabOrder = 3
      end
      object EditEDPImie: TEdit
        Left = 146
        Top = 63
        Width = 262
        Height = 21
        TabOrder = 4
      end
      object EditEDPNazwisko: TEdit
        Left = 146
        Top = 105
        Width = 262
        Height = 21
        TabOrder = 5
      end
      object DateTimePickerEDPDataU: TDateTimePicker
        Left = 146
        Top = 146
        Width = 109
        Height = 25
        Date = 45117.890734849530000000
        Time = 45117.890734849530000000
        MaxDate = 2958465.000000000000000000
        MinDate = -53780.000000000000000000
        TabOrder = 6
      end
      object FloatSpinEditEDPKwota: TEdit
        Left = 146
        Top = 188
        Width = 265
        Height = 21
        TabOrder = 7
        Text = '0'
      end
    end
    object TabSheetEDekBramka: TTabSheet
      Caption = 'eDeklaracja bramka'
      TabVisible = False
      DesignSize = (
        905
        601)
      object GroupBox1: TGroupBox
        Left = 10
        Top = 4
        Width = 877
        Height = 237
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Wyslij podpisana eDeklaracje'
        TabOrder = 0
        DesignSize = (
          877
          237)
        object Label27: TLabel
          Left = 21
          Top = 25
          Width = 79
          Height = 17
          Caption = 'Plik deklaracji'
        end
        object Label28: TLabel
          Left = 21
          Top = 59
          Width = 94
          Height = 17
          Caption = 'Rodzaj podpisu'
        end
        object Label29: TLabel
          Left = 21
          Top = 105
          Width = 46
          Height = 17
          Caption = 'Bramka'
        end
        object SpeedButton1: TSpeedButton
          Tag = 7
          Left = 842
          Top = 22
          Width = 30
          Height = 29
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object FileNameEditEDBPlikWej: TEdit
          Left = 146
          Top = 22
          Width = 688
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ComboBoxEDBRodzPodp: TComboBox
          Left = 146
          Top = 54
          Width = 220
          Height = 25
          Style = csDropDownList
          ItemHeight = 17
          TabOrder = 1
          Items.Strings = (
            'Certyfikat'
            'Dane autoryzujace')
        end
        object ComboBoxEDBRodzBram: TComboBox
          Left = 146
          Top = 101
          Width = 220
          Height = 25
          Style = csDropDownList
          ItemHeight = 17
          ItemIndex = 1
          TabOrder = 2
          Text = 'Testowa'
          Items.Strings = (
            'Produkcyjna'
            'Testowa')
        end
        object ButtonEDBWyslij: TButton
          Left = 146
          Top = 146
          Width = 99
          Height = 33
          Caption = 'Wyslij'
          TabOrder = 3
          OnClick = ButtonEDBWyslijClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 10
        Top = 252
        Width = 878
        Height = 219
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Sprawdz status / pobierz UPO'
        TabOrder = 1
        DesignSize = (
          878
          219)
        object Label30: TLabel
          Left = 21
          Top = 31
          Width = 65
          Height = 17
          Caption = 'Numer ref.'
        end
        object Label31: TLabel
          Left = 21
          Top = 63
          Width = 46
          Height = 17
          Caption = 'Bramka'
        end
        object Label32: TLabel
          Left = 21
          Top = 105
          Width = 88
          Height = 17
          Caption = 'Zapisz UPO do'
        end
        object SpeedButton2: TSpeedButton
          Tag = 8
          Left = 843
          Top = 95
          Width = 31
          Height = 29
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object EditEDBNrRef: TEdit
          Left = 146
          Top = 21
          Width = 709
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ComboBoxEDBRodzBramUPO: TComboBox
          Left = 146
          Top = 52
          Width = 220
          Height = 25
          Style = csDropDownList
          ItemHeight = 17
          ItemIndex = 1
          TabOrder = 1
          Text = 'Testowa'
          Items.Strings = (
            'Produkcyjna'
            'Testowa')
        end
        object ButtonEDBUPO: TButton
          Left = 146
          Top = 136
          Width = 241
          Height = 33
          Caption = 'Sprawdz status / pobierz UPO'
          TabOrder = 2
          OnClick = ButtonEDBUPOClick
        end
        object FileNameEditEDBPlikWyj: TEdit
          Left = 146
          Top = 94
          Width = 688
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Text = 'upo.xml'
        end
      end
    end
    object TabSheetJPKPodpisCert: TTabSheet
      Caption = 'JPK podpis certyfikatem'
      TabVisible = False
      DesignSize = (
        905
        601)
      object Label35: TLabel
        Left = 27
        Top = 25
        Width = 59
        Height = 17
        Caption = 'Certyfikat'
      end
      object Label36: TLabel
        Left = 10
        Top = 84
        Width = 85
        Height = 17
        Caption = 'Plik wejsciowy'
      end
      object Label37: TLabel
        Left = 10
        Top = 220
        Width = 205
        Height = 17
        Caption = 'Plik wynikowy (zaszyfrowany ZIP)'
      end
      object Label38: TLabel
        Left = 10
        Top = 272
        Width = 159
        Height = 17
        Caption = 'Plik wynikowy (InitUpload)'
      end
      object Label39: TLabel
        Left = 10
        Top = 140
        Width = 46
        Height = 17
        Caption = 'Bramka'
      end
      object SpeedButton7: TSpeedButton
        Tag = 13
        Left = 867
        Top = 82
        Width = 30
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object SpeedButton8: TSpeedButton
        Tag = 14
        Left = 867
        Top = 220
        Width = 30
        Height = 28
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object SpeedButton9: TSpeedButton
        Tag = 15
        Left = 867
        Top = 272
        Width = 30
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object ComboBoxJPKCert: TComboBox
        Left = 123
        Top = 21
        Width = 764
        Height = 25
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 0
        TabOrder = 0
      end
      object FileNameEditJPKPCWej: TEdit
        Left = 259
        Top = 82
        Width = 600
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object FileNameEditJPKPCEnc: TEdit
        Left = 259
        Top = 220
        Width = 600
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object ButtonJPKPodpiszCert: TButton
        Left = 259
        Top = 324
        Width = 98
        Height = 33
        Caption = 'Podpisz'
        TabOrder = 3
        OnClick = ButtonJPKPodpiszCertClick
      end
      object FileNameEditJPKPCInitUpload: TEdit
        Left = 259
        Top = 272
        Width = 600
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object CheckBoxJPKPCAdHoc: TCheckBox
        Left = 259
        Top = 178
        Width = 162
        Height = 25
        Caption = 'Na zadanie (AdHoc)'
        TabOrder = 5
      end
      object ComboBoxJPKPCRodzBram: TComboBox
        Left = 259
        Top = 136
        Width = 220
        Height = 25
        Style = csDropDownList
        ItemHeight = 17
        ItemIndex = 1
        TabOrder = 6
        Text = 'Testowa'
        Items.Strings = (
          'Produkcyjna'
          'Testowa')
      end
    end
    object TabSheetJPKPodpisAut: TTabSheet
      Caption = 'JPK podpis danymi aut.'
      TabVisible = False
      DesignSize = (
        905
        601)
      object Label40: TLabel
        Left = 10
        Top = 252
        Width = 85
        Height = 17
        Caption = 'Plik wejsciowy'
      end
      object Label41: TLabel
        Left = 10
        Top = 309
        Width = 46
        Height = 17
        Caption = 'Bramka'
      end
      object Label42: TLabel
        Left = 10
        Top = 388
        Width = 205
        Height = 17
        Caption = 'Plik wynikowy (zaszyfrowany ZIP)'
      end
      object Label43: TLabel
        Left = 10
        Top = 441
        Width = 159
        Height = 17
        Caption = 'Plik wynikowy (InitUpload)'
      end
      object Label44: TLabel
        Left = 10
        Top = 21
        Width = 21
        Height = 17
        Caption = 'NIP'
      end
      object Label45: TLabel
        Left = 10
        Top = 60
        Width = 25
        Height = 17
        Caption = 'Imie'
      end
      object Label46: TLabel
        Left = 10
        Top = 105
        Width = 55
        Height = 17
        Caption = 'Nazwisko'
      end
      object Label47: TLabel
        Left = 10
        Top = 146
        Width = 92
        Height = 17
        Caption = 'Data urodzenia'
      end
      object Label48: TLabel
        Left = 10
        Top = 188
        Width = 108
        Height = 17
        Caption = 'Kwota przychodu'
      end
      object SpeedButton10: TSpeedButton
        Tag = 16
        Left = 866
        Top = 251
        Width = 30
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object SpeedButton11: TSpeedButton
        Tag = 17
        Left = 866
        Top = 387
        Width = 30
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object SpeedButton12: TSpeedButton
        Tag = 18
        Left = 866
        Top = 439
        Width = 30
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '...'
        OnClick = SBFileNameEditJPKRSAProdClick
      end
      object FileNameEditJPKPAWej: TEdit
        Left = 259
        Top = 251
        Width = 599
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object ComboBoxJPKPARodzBram: TComboBox
        Left = 259
        Top = 305
        Width = 220
        Height = 25
        Style = csDropDownList
        ItemHeight = 17
        ItemIndex = 1
        TabOrder = 1
        Text = 'Testowa'
        Items.Strings = (
          'Produkcyjna'
          'Testowa')
      end
      object CheckBoxJPKPAAdHoc: TCheckBox
        Left = 259
        Top = 347
        Width = 162
        Height = 24
        Caption = 'Na zadanie (AdHoc)'
        TabOrder = 2
      end
      object FileNameEditJPKPAEnc: TEdit
        Left = 259
        Top = 388
        Width = 599
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object FileNameEditJPKPAInitUpload: TEdit
        Left = 259
        Top = 441
        Width = 599
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object ButtonJPKPodpiszAut: TButton
        Left = 259
        Top = 493
        Width = 98
        Height = 33
        Caption = 'Podpisz'
        TabOrder = 5
        OnClick = ButtonJPKPodpiszAutClick
      end
      object FloatSpinEditJPKPKwota: TEdit
        Left = 259
        Top = 188
        Width = 264
        Height = 25
        TabOrder = 6
        Text = '0'
      end
      object DateTimePickerJPKPDataU: TDateTimePicker
        Left = 259
        Top = 146
        Width = 108
        Height = 25
        Date = 45117.890734849530000000
        Time = 45117.890734849530000000
        MaxDate = 2958465.000000000000000000
        MinDate = -53780.000000000000000000
        TabOrder = 7
      end
      object EditJPKPNazwisko: TEdit
        Left = 259
        Top = 105
        Width = 261
        Height = 25
        TabOrder = 8
      end
      object EditJPKPImie: TEdit
        Left = 259
        Top = 63
        Width = 261
        Height = 25
        TabOrder = 9
      end
      object EditJPKPNIP: TEdit
        Left = 259
        Top = 21
        Width = 261
        Height = 25
        TabOrder = 10
      end
    end
    object TabSheetJPKBramka: TTabSheet
      Caption = 'JPK bramka'
      TabVisible = False
      DesignSize = (
        905
        601)
      object GroupBox3: TGroupBox
        Left = 7
        Top = 5
        Width = 882
        Height = 257
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Wysylanie'
        TabOrder = 0
        DesignSize = (
          882
          257)
        object Label49: TLabel
          Left = 21
          Top = 33
          Width = 84
          Height = 17
          Caption = 'Plik InitUpload'
        end
        object Label50: TLabel
          Left = 21
          Top = 73
          Width = 106
          Height = 17
          Caption = 'Plik zaszyfrowany'
        end
        object Label51: TLabel
          Left = 21
          Top = 109
          Width = 46
          Height = 17
          Caption = 'Bramka'
        end
        object SpeedButton13: TSpeedButton
          Tag = 19
          Left = 840
          Top = 26
          Width = 30
          Height = 29
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object SpeedButton14: TSpeedButton
          Tag = 20
          Left = 840
          Top = 63
          Width = 30
          Height = 29
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object FileNameEditJPKBIU: TEdit
          Left = 157
          Top = 25
          Width = 675
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object FileNameEditJPKBEnc: TEdit
          Left = 157
          Top = 63
          Width = 675
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object CheckBoxJPKBCert: TCheckBox
          Left = 157
          Top = 157
          Width = 675
          Height = 25
          Caption = 
            'Zweryfikuj czy przeslany plik podpisano poprawnym certyfikatem z' +
            ' wymaganymi parametrami'
          TabOrder = 2
        end
        object ButtonJPKBWyslij: TButton
          Left = 157
          Top = 199
          Width = 98
          Height = 32
          Caption = 'Wyslij'
          TabOrder = 3
          OnClick = ButtonJPKBWyslijClick
        end
        object ComboBoxJPKBRodzBram: TComboBox
          Left = 157
          Top = 105
          Width = 220
          Height = 25
          Style = csDropDownList
          ItemHeight = 17
          ItemIndex = 1
          TabOrder = 4
          Text = 'Testowa'
          Items.Strings = (
            'Produkcyjna'
            'Testowa')
        end
      end
      object GroupBox4: TGroupBox
        Left = 7
        Top = 272
        Width = 882
        Height = 220
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Sprawdz status / pobierz UPO'
        TabOrder = 1
        DesignSize = (
          882
          220)
        object Label52: TLabel
          Left = 21
          Top = 42
          Width = 65
          Height = 17
          Caption = 'Numer ref.'
        end
        object Label53: TLabel
          Left = 21
          Top = 84
          Width = 46
          Height = 17
          Caption = 'Bramka'
        end
        object Label54: TLabel
          Left = 21
          Top = 126
          Width = 88
          Height = 17
          Caption = 'Zapisz UPO do'
        end
        object SpeedButton15: TSpeedButton
          Tag = 21
          Left = 840
          Top = 115
          Width = 30
          Height = 29
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = SBFileNameEditJPKRSAProdClick
        end
        object EditJPKBNrRef: TEdit
          Left = 146
          Top = 31
          Width = 724
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ComboBoxJPKBRodzBramUPO: TComboBox
          Left = 146
          Top = 73
          Width = 220
          Height = 25
          Style = csDropDownList
          ItemHeight = 17
          ItemIndex = 1
          TabOrder = 1
          Text = 'Testowa'
          Items.Strings = (
            'Produkcyjna'
            'Testowa')
        end
        object FileNameEditJPKBPlikWyj: TEdit
          Left = 146
          Top = 115
          Width = 690
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Text = 'upo.xml'
        end
        object ButtonJPKBUPO: TButton
          Left = 146
          Top = 157
          Width = 241
          Height = 33
          Caption = 'Sprawdz status / pobierz UPO'
          TabOrder = 3
          OnClick = ButtonJPKBUPOClick
        end
      end
    end
    object TabSheetKSeFCommon: TTabSheet
      Caption = 'KSeF - Wsp'#243'lne'
      TabVisible = False
      object ScrollBox3: TScrollBox
        Left = 0
        Top = 0
        Width = 905
        Height = 601
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object GroupBox15: TGroupBox
          Left = 0
          Top = 65
          Width = 884
          Height = 565
          Align = alTop
          Caption = 'Pobranie faktury'
          TabOrder = 0
          DesignSize = (
            884
            565)
          object Label93: TLabel
            Left = 31
            Top = 13
            Width = 134
            Height = 17
            Caption = 'ksefReferenceNumber'
          end
          object Label94: TLabel
            Left = 115
            Top = 44
            Width = 55
            Height = 17
            Caption = 'dueValue'
          end
          object Label95: TLabel
            Left = 12
            Top = 84
            Width = 141
            Height = 17
            Caption = 'invoiceOryginalNumber'
          end
          object Label99: TLabel
            Left = 13
            Top = 463
            Width = 84
            Height = 17
            Caption = 'Plik wynikowy'
          end
          object SpeedButton20: TSpeedButton
            Tag = 26
            Left = 841
            Top = 460
            Width = 30
            Height = 29
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object EditKSeFCInvRefNum: TEdit
            Left = 199
            Top = 7
            Width = 661
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object FloatSpinEditKSeFCInvDueValue: TEdit
            Left = 199
            Top = 42
            Width = 170
            Height = 21
            TabOrder = 1
            Text = '0'
          end
          object EditKSeFCInvOrgNum: TEdit
            Left = 199
            Top = 80
            Width = 439
            Height = 21
            TabOrder = 2
          end
          object GroupBox16: TGroupBox
            Left = 12
            Top = 115
            Width = 867
            Height = 137
            Caption = 'subjectToIdentifier'
            TabOrder = 3
            DesignSize = (
              867
              137)
            object Label96: TLabel
              Left = 24
              Top = 93
              Width = 50
              Height = 17
              Caption = 'identifier'
            end
            object RadioGroupKSeFCInvSubToType: TRadioGroup
              Left = 17
              Top = 21
              Width = 838
              Height = 54
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Type'
              Columns = 3
              Items.Strings = (
                'none'
                'onip'
                'other')
              TabOrder = 0
            end
            object EditKSeFCInvSubToIdent: TEdit
              Left = 94
              Top = 85
              Width = 485
              Height = 21
              TabOrder = 1
            end
          end
          object GroupBox17: TGroupBox
            Left = 12
            Top = 260
            Width = 867
            Height = 179
            Caption = 'subjectToName'
            TabOrder = 4
            object Label97: TLabel
              Left = 17
              Top = 26
              Width = 67
              Height = 17
              Caption = 'tradeName'
            end
            object Label98: TLabel
              Left = 25
              Top = 111
              Width = 51
              Height = 17
              Caption = 'fullName'
            end
            object firstName: TLabel
              Left = 469
              Top = 107
              Width = 57
              Height = 17
              Caption = 'firstName'
            end
            object surname: TLabel
              Left = 468
              Top = 139
              Width = 53
              Height = 17
              Caption = 'surname'
            end
            object EditKSeFCInvSubToTradeName: TEdit
              Left = 112
              Top = 21
              Width = 743
              Height = 21
              TabOrder = 0
            end
            object RadioButtonKSeFCInvSubToFullName: TRadioButton
              Left = 25
              Top = 69
              Width = 90
              Height = 25
              Caption = 'FullName'
              TabOrder = 1
            end
            object EditKSeFCInvSubToFullName: TEdit
              Left = 105
              Top = 105
              Width = 324
              Height = 21
              TabOrder = 2
            end
            object RadioButtonKSeFCInvSubToPersonName: TRadioButton
              Left = 469
              Top = 69
              Width = 113
              Height = 25
              Caption = 'PersonName'
              TabOrder = 3
            end
            object EditKSeFCInvSubToFirstName: TEdit
              Left = 549
              Top = 105
              Width = 298
              Height = 21
              TabOrder = 4
            end
            object EditKSeFCInvSubToSurname: TEdit
              Left = 549
              Top = 136
              Width = 298
              Height = 21
              TabOrder = 5
            end
          end
          object FileNameEditKSeFCInvFN: TEdit
            Left = 131
            Top = 460
            Width = 707
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object ButtonKSeFCInvGet: TButton
            Left = 25
            Top = 509
            Width = 98
            Height = 32
            Caption = 'Pobierz'
            TabOrder = 6
            OnClick = ButtonKSeFCInvGetClick
          end
          object ButtonKSeFCInvClear: TButton
            Left = 165
            Top = 509
            Width = 98
            Height = 32
            Caption = 'Czysc'
            TabOrder = 7
            OnClick = ButtonKSeFCInvClearClick
          end
        end
        object GroupBox18: TGroupBox
          Left = 0
          Top = 630
          Width = 884
          Height = 157
          Align = alTop
          Caption = 'Sprawdz status / pobierz UPO'
          TabOrder = 1
          DesignSize = (
            884
            157)
          object Label100: TLabel
            Left = 33
            Top = 31
            Width = 114
            Height = 17
            Caption = 'ReferenceNumber '
          end
          object Label101: TLabel
            Left = 24
            Top = 69
            Width = 125
            Height = 17
            Caption = 'Plik wynikowy z UPO'
          end
          object SpeedButton21: TSpeedButton
            Tag = 27
            Left = 837
            Top = 63
            Width = 30
            Height = 29
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object EditKSeFStatusReferenceNumber: TEdit
            Left = 173
            Top = 27
            Width = 698
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object FileNameEditKSeFUPO: TEdit
            Left = 153
            Top = 63
            Width = 664
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFStatusUPO: TButton
            Left = 174
            Top = 105
            Width = 246
            Height = 32
            Caption = 'Sprawdz status / pobierz UPO'
            TabOrder = 2
            OnClick = ButtonKSeFStatusUPOClick
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 884
          Height = 65
          Align = alTop
          TabOrder = 2
          object Label102: TLabel
            Left = 24
            Top = 26
            Width = 46
            Height = 17
            Caption = 'Bramka'
          end
          object ComboBoxKSeFComBramka: TComboBox
            Left = 109
            Top = 21
            Width = 230
            Height = 25
            Style = csDropDownList
            ItemHeight = 17
            ItemIndex = 2
            TabOrder = 0
            Text = 'Testowa'
            Items.Strings = (
              'Produkcyjna'
              'Demo'
              'Testowa')
          end
        end
      end
    end
    object TabSheetKsefSession: TTabSheet
      Caption = 'KSeF - Sesja'
      TabVisible = False
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 905
        Height = 601
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object GroupBoxKSeFSesPar: TGroupBox
          Left = 0
          Top = 0
          Width = 884
          Height = 127
          Align = alTop
          Caption = 'Parametry sesji'
          TabOrder = 0
          object Label58: TLabel
            Left = 31
            Top = 34
            Width = 21
            Height = 17
            Caption = 'NIP'
          end
          object Label59: TLabel
            Left = 31
            Top = 76
            Width = 46
            Height = 17
            Caption = 'Bramka'
          end
          object Label68: TLabel
            Left = 416
            Top = 76
            Width = 92
            Height = 17
            Caption = 'Kod formularza'
          end
          object EditKSeFNIP: TEdit
            Left = 116
            Top = 27
            Width = 160
            Height = 21
            TabOrder = 0
          end
          object ComboBoxKSeFBramka: TComboBox
            Left = 116
            Top = 72
            Width = 231
            Height = 25
            Style = csDropDownList
            ItemHeight = 17
            ItemIndex = 2
            TabOrder = 1
            Text = 'Testowa'
            Items.Strings = (
              'Produkcyjna'
              'Demo'
              'Testowa')
          end
          object CheckBoxKSeFEncrypt: TCheckBox
            Left = 416
            Top = 34
            Width = 243
            Height = 25
            Caption = 'Szyfrowanie dokument'#243'w (AES)'
            TabOrder = 2
          end
          object ComboBoxKSeFInitFormCode: TComboBox
            Left = 545
            Top = 72
            Width = 100
            Height = 25
            Style = csDropDownList
            ItemHeight = 17
            ItemIndex = 0
            TabOrder = 3
            Text = 'FA(1)'
            Items.Strings = (
              'FA(1)'
              'FA(2)')
          end
        end
        object GroupBoxKSeFSesInitCert: TGroupBox
          Left = 0
          Top = 127
          Width = 884
          Height = 161
          Align = alTop
          Caption = 'Inicjuj certyfikatem'
          TabOrder = 1
          DesignSize = (
            884
            161)
          object Label60: TLabel
            Left = 25
            Top = 30
            Width = 59
            Height = 17
            Caption = 'Certyfikat'
          end
          object Label67: TLabel
            Left = 25
            Top = 71
            Width = 113
            Height = 17
            Caption = 'Rodzaj autoryzacji'
          end
          object ComboBoxKSeFCert: TComboBox
            Left = 165
            Top = 24
            Width = 694
            Height = 25
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 0
            TabOrder = 0
          end
          object ButtonKSeFInitSigned: TButton
            Left = 165
            Top = 105
            Width = 98
            Height = 32
            Caption = 'Inicjuj'
            TabOrder = 1
            OnClick = ButtonKSeFInitSignedClick
          end
          object ComboBoxKSeFCertAuthType: TComboBox
            Left = 165
            Top = 67
            Width = 214
            Height = 25
            Style = csDropDownList
            ItemHeight = 17
            ItemIndex = 0
            TabOrder = 2
            Text = 'Numer seryjny'
            Items.Strings = (
              'Numer seryjny'
              'Odcisk palca certyfikatu')
          end
        end
        object GroupBoxKSeFSesInitTok: TGroupBox
          Left = 0
          Top = 288
          Width = 884
          Height = 115
          Align = alTop
          Caption = 'Inicjuj tokenem'
          TabOrder = 2
          DesignSize = (
            884
            115)
          object Label61: TLabel
            Left = 31
            Top = 31
            Width = 38
            Height = 17
            Caption = 'Token'
          end
          object EditKSeFToken: TEdit
            Left = 112
            Top = 29
            Width = 745
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFIniToken: TButton
            Left = 112
            Top = 63
            Width = 99
            Height = 32
            Caption = 'Inicjuj'
            TabOrder = 1
            OnClick = ButtonKSeFIniTokenClick
          end
        end
        object GroupBoxKSeFSesInitPZ: TGroupBox
          Left = 0
          Top = 403
          Width = 884
          Height = 210
          Align = alTop
          Caption = 'Inicjuj profilem zaufanym'
          TabOrder = 3
          DesignSize = (
            884
            210)
          object Label62: TLabel
            Left = 16
            Top = 30
            Width = 160
            Height = 17
            Caption = 'Wynikowy plik do podpisu'
          end
          object Label63: TLabel
            Left = 16
            Top = 126
            Width = 120
            Height = 17
            Caption = 'Podpisany w PZ plik'
          end
          object SpeedButton18: TSpeedButton
            Tag = 24
            Left = 837
            Top = 31
            Width = 30
            Height = 29
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object SpeedButton19: TSpeedButton
            Tag = 25
            Left = 836
            Top = 126
            Width = 30
            Height = 28
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object FileNameEditKSeFInitPZOut: TEdit
            Left = 224
            Top = 31
            Width = 605
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFInitPZZapisz: TButton
            Left = 224
            Top = 73
            Width = 98
            Height = 33
            Caption = 'Zapisz'
            TabOrder = 1
            OnClick = ButtonKSeFInitPZZapiszClick
          end
          object ButtonKSeFInitPZ: TButton
            Left = 224
            Top = 167
            Width = 98
            Height = 33
            Caption = 'Inicjuj'
            TabOrder = 2
            OnClick = ButtonKSeFInitPZClick
          end
          object FileNameEditKSeFInitPZIn: TEdit
            Left = 224
            Top = 126
            Width = 604
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
        end
        object GroupBoxKSeFSesStat: TGroupBox
          Left = 0
          Top = 613
          Width = 884
          Height = 159
          Align = alTop
          Caption = 'Status'
          Enabled = False
          TabOrder = 4
          object Label64: TLabel
            Left = 24
            Top = 30
            Width = 242
            Height = 17
            Caption = 'Nr ref lub puste dla statusu sesji og'#243'lnej'
          end
          object Label65: TLabel
            Left = 24
            Top = 65
            Width = 53
            Height = 17
            Caption = 'PageSize'
          end
          object Label66: TLabel
            Left = 224
            Top = 65
            Width = 66
            Height = 17
            Caption = 'PageOffset'
          end
          object EditKSeFSesStatRef: TEdit
            Left = 318
            Top = 25
            Width = 503
            Height = 21
            TabOrder = 0
          end
          object ButtonkSeFSesStat: TButton
            Left = 18
            Top = 105
            Width = 147
            Height = 32
            Caption = 'Sprawdz status'
            TabOrder = 1
            OnClick = ButtonkSeFSesStatClick
          end
          object CheckBoxKSeFStatDet: TCheckBox
            Left = 454
            Top = 65
            Width = 90
            Height = 25
            Caption = 'Szczeg'#243'ly'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object SpinEditKSeFSesPgSz: TSpinEdit
            Left = 98
            Top = 63
            Width = 93
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 3
            Value = 10
          end
          object SpinEditKSeFSesPgOf: TSpinEdit
            Left = 318
            Top = 63
            Width = 91
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 4
            Value = 0
          end
        end
        object GroupBoxKSeFSesTerm: TGroupBox
          Left = 0
          Top = 772
          Width = 884
          Height = 79
          Align = alTop
          Caption = 'Zakonczenie sesji'
          Enabled = False
          TabOrder = 5
          object ButtonKSeFSesTerm: TButton
            Left = 31
            Top = 27
            Width = 161
            Height = 33
            Caption = 'Zakoncz sesjie'
            TabOrder = 0
            OnClick = ButtonKSeFSesTermClick
          end
        end
        object GroupBoxKSeFSesGenIntId: TGroupBox
          Left = 0
          Top = 851
          Width = 884
          Height = 85
          Align = alTop
          Caption = 'Wygenerowanie identyfikatora wewnetrznego'
          Enabled = False
          TabOrder = 6
          DesignSize = (
            884
            85)
          object Label92: TLabel
            Left = 16
            Top = 39
            Width = 128
            Height = 17
            Caption = 'inputDigitsSequence '
          end
          object EditKSeFinputDigitsSequence: TEdit
            Left = 167
            Top = 35
            Width = 586
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFGenIntId: TButton
            Left = 774
            Top = 31
            Width = 98
            Height = 33
            Anchors = [akTop, akRight]
            Caption = 'Generuj'
            TabOrder = 1
            OnClick = ButtonKSeFGenIntIdClick
          end
        end
      end
    end
    object TabSheetKSeFFaktury: TTabSheet
      Caption = 'KSeF - Faktury'
      TabVisible = False
      object ScrollBox5: TScrollBox
        Left = 0
        Top = 0
        Width = 905
        Height = 601
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object GroupBox7: TGroupBox
          Left = 0
          Top = 126
          Width = 884
          Height = 156
          Align = alTop
          Caption = 'Pobieranie faktury'
          TabOrder = 0
          DesignSize = (
            884
            156)
          object Label71: TLabel
            Left = 4
            Top = 39
            Width = 148
            Height = 17
            Caption = 'KSeF Reference Number'
          end
          object Label72: TLabel
            Left = 42
            Top = 80
            Width = 113
            Height = 17
            Caption = 'Plik wynikowy XML'
          end
          object SpeedButton17: TSpeedButton
            Tag = 23
            Left = 840
            Top = 73
            Width = 30
            Height = 29
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object EditKSeFInvGetNr: TEdit
            Left = 188
            Top = 38
            Width = 675
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object FileNameEditKSeFGetFN: TEdit
            Left = 188
            Top = 73
            Width = 644
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFInvGet: TButton
            Left = 188
            Top = 115
            Width = 98
            Height = 33
            Caption = 'Pobierz'
            TabOrder = 2
            OnClick = ButtonKSeFInvGetClick
          end
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 282
          Width = 884
          Height = 126
          Align = alTop
          Caption = 'Sprawdz status faktury'
          TabOrder = 1
          DesignSize = (
            884
            126)
          object Label70: TLabel
            Left = 10
            Top = 33
            Width = 215
            Height = 17
            Caption = 'Invoice Element Reference Number'
          end
          object EditKSeFInvStatNr: TEdit
            Left = 263
            Top = 29
            Width = 592
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFInvStat: TButton
            Left = 263
            Top = 73
            Width = 98
            Height = 33
            Caption = 'Sprawdz'
            TabOrder = 1
            OnClick = ButtonKSeFInvStatClick
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 884
          Height = 126
          Align = alTop
          Caption = 'Wysylanie faktury'
          TabOrder = 2
          DesignSize = (
            884
            126)
          object Label69: TLabel
            Left = 4
            Top = 31
            Width = 96
            Height = 17
            Caption = 'Plik XML faktury'
          end
          object SpeedButton16: TSpeedButton
            Tag = 22
            Left = 851
            Top = 26
            Width = 30
            Height = 29
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object FileNameEditKSeFInvSend: TEdit
            Left = 129
            Top = 27
            Width = 714
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFInvSend: TButton
            Left = 129
            Top = 73
            Width = 99
            Height = 33
            Caption = 'Wyslij'
            TabOrder = 1
            OnClick = ButtonKSeFInvSendClick
          end
        end
        object GroupBox21: TGroupBox
          Left = 0
          Top = 408
          Width = 884
          Height = 152
          Align = alTop
          Caption = 'Ukrywanie wybranej faktury'
          TabOrder = 3
          DesignSize = (
            884
            152)
          object Label116: TLabel
            Left = 20
            Top = 33
            Width = 72
            Height = 17
            Caption = 'Nr ref. KSeF'
          end
          object Label117: TLabel
            Left = 31
            Top = 67
            Width = 63
            Height = 17
            Caption = 'Przyczyna'
          end
          object EditKSeFInvHideNr: TEdit
            Left = 115
            Top = 27
            Width = 743
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object EditKSeFInvHideReason: TEdit
            Left = 115
            Top = 64
            Width = 740
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFInvHide: TButton
            Left = 115
            Top = 105
            Width = 98
            Height = 32
            Caption = 'Ukryj'
            TabOrder = 2
            OnClick = ButtonKSeFInvHideClick
          end
        end
        object GroupBox22: TGroupBox
          Left = 0
          Top = 560
          Width = 884
          Height = 151
          Align = alTop
          Caption = 'Anulowanie ukrycia wybranej faktury'
          TabOrder = 4
          DesignSize = (
            884
            151)
          object Label118: TLabel
            Left = 20
            Top = 31
            Width = 72
            Height = 17
            Caption = 'Nr ref. KSeF'
          end
          object Label119: TLabel
            Left = 31
            Top = 65
            Width = 63
            Height = 17
            Caption = 'Przyczyna'
          end
          object EditKSeFInvShowNr: TEdit
            Left = 115
            Top = 26
            Width = 743
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object EditKSeFInvShowReason: TEdit
            Left = 115
            Top = 63
            Width = 743
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFInvShow: TButton
            Left = 115
            Top = 103
            Width = 150
            Height = 33
            Caption = 'Cofnij ukrycie'
            TabOrder = 2
            OnClick = ButtonKSeFInvShowClick
          end
        end
      end
    end
    object TabSheetKSeFQueryInvoice: TTabSheet
      Caption = 'KSeF - Zapytania - Faktury'
      TabVisible = False
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 905
        Height = 601
        Align = alClient
        TabOrder = 0
        object GroupBox10: TGroupBox
          Left = 0
          Top = 609
          Width = 880
          Height = 74
          Align = alTop
          Caption = 'Zapytaj synchronicznie'
          TabOrder = 0
          object Label85: TLabel
            Left = 25
            Top = 33
            Width = 57
            Height = 17
            Caption = 'PageSize '
          end
          object Label86: TLabel
            Left = 252
            Top = 31
            Width = 66
            Height = 17
            Caption = 'PageOffset'
          end
          object SpinEditKSeFQInvAsPS: TSpinEdit
            Left = 99
            Top = 26
            Width = 112
            Height = 27
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 10
          end
          object SpinEditKSeFQInvAsPS1: TSpinEdit
            Left = 347
            Top = 26
            Width = 111
            Height = 27
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object ButtonKSeFQInvSync: TButton
            Left = 514
            Top = 26
            Width = 98
            Height = 33
            Caption = 'Zapytaj'
            TabOrder = 2
            OnClick = ButtonKSeFQInvSyncClick
          end
        end
        object GroupBox66: TGroupBox
          Left = 0
          Top = 0
          Width = 880
          Height = 609
          Align = alTop
          Caption = 'Kryteria'
          TabOrder = 1
          object Label73: TLabel
            Left = 30
            Top = 27
            Width = 105
            Height = 17
            Caption = 'Rodzaj podmiotu'
          end
          object ComboBoxKSeFQInvCrSubTyp: TComboBox
            Left = 169
            Top = 21
            Width = 176
            Height = 25
            Style = csDropDownList
            ItemHeight = 17
            ItemIndex = 0
            TabOrder = 0
            Text = 'subject1'
            Items.Strings = (
              'subject1'
              'subject2'
              'subject3'
              'subjectAuthorized')
          end
          object PageControlKSeFQInvSubjectType: TPageControl
            Left = 10
            Top = 92
            Width = 848
            Height = 502
            ActivePage = TabSheetKSeFQInvCrDetail
            TabOrder = 1
            object TabSheetKSeFQInvCrDetail: TTabSheet
              Caption = 'Szczeg'#243'lowo'
              object Label74: TLabel
                Left = 16
                Top = 25
                Width = 80
                Height = 17
                Caption = 'amountFrom'
              end
              object Label75: TLabel
                Left = 303
                Top = 25
                Width = 64
                Height = 17
                Caption = 'amountTo'
              end
              object Label76: TLabel
                Left = 586
                Top = 25
                Width = 79
                Height = 17
                Caption = 'amountType'
              end
              object Label77: TLabel
                Left = 170
                Top = 114
                Width = 91
                Height = 17
                Caption = 'invoiceNumber'
              end
              object Label78: TLabel
                Left = 16
                Top = 226
                Width = 114
                Height = 17
                Caption = 'invoicingDateFrom'
              end
              object Label79: TLabel
                Left = 387
                Top = 222
                Width = 98
                Height = 17
                Caption = 'invoicingDateTo'
              end
              object Label80: TLabel
                Left = 16
                Top = 262
                Width = 134
                Height = 17
                Caption = 'ksefReferenceNumber'
              end
              object Label87: TLabel
                Left = 16
                Top = 303
                Width = 99
                Height = 17
                Caption = 'subjectBy ident.'
              end
              object FloatSpinEditKSeFQInvCAamountFrom: TEdit
                Left = 123
                Top = 21
                Width = 139
                Height = 25
                TabOrder = 0
                Text = '0'
              end
              object FloatSpinEditKSeFQInvCAamountTo: TEdit
                Left = 387
                Top = 21
                Width = 139
                Height = 25
                TabOrder = 1
                Text = '0'
              end
              object GroupBox9: TGroupBox
                Left = 16
                Top = 56
                Width = 125
                Height = 144
                Caption = 'currencyCodes'
                TabOrder = 2
                object MemoKSeFQInvCrCurrencyCodes: TMemo
                  Left = 3
                  Top = 20
                  Width = 120
                  Height = 123
                  Align = alClient
                  TabOrder = 0
                end
              end
              object CheckBoxKSeFQInvCrFaP17Annotation: TCheckBox
                Left = 167
                Top = 75
                Width = 140
                Height = 24
                Caption = 'faP17Annotation'
                TabOrder = 3
              end
              object EditKSeFQInvCrInvoiceNumber: TEdit
                Left = 293
                Top = 110
                Width = 533
                Height = 25
                TabOrder = 4
              end
              object CheckGroupKSeFQInvCrIInvoiceTypes: TGroupBox
                Left = 174
                Top = 139
                Width = 659
                Height = 57
                Caption = 'invoiceTypes'
                TabOrder = 5
                object CheckBoxKSeFQInvCrIInvTypVAT: TCheckBox
                  Left = 10
                  Top = 21
                  Width = 54
                  Height = 22
                  Caption = 'VAT'
                  TabOrder = 0
                end
                object CheckBoxKSeFQInvCrIInvTypKOR: TCheckBox
                  Left = 95
                  Top = 21
                  Width = 61
                  Height = 22
                  Caption = 'KOR'
                  TabOrder = 1
                end
                object CheckBoxKSeFQInvCrIInvTypZAL: TCheckBox
                  Left = 174
                  Top = 21
                  Width = 57
                  Height = 22
                  Caption = 'ZAL'
                  TabOrder = 2
                end
                object CheckBoxKSeFQInvCrIInvTypROZ: TCheckBox
                  Left = 262
                  Top = 21
                  Width = 74
                  Height = 22
                  Caption = 'ROZ'
                  TabOrder = 3
                end
                object CheckBoxKSeFQInvCrIInvTypUPR: TCheckBox
                  Left = 344
                  Top = 21
                  Width = 65
                  Height = 22
                  Caption = 'UPR'
                  TabOrder = 4
                end
                object CheckBoxKSeFQInvCrIInvTypKOR_ZAL: TCheckBox
                  Left = 429
                  Top = 21
                  Width = 86
                  Height = 22
                  Caption = 'KOR_ZAL'
                  TabOrder = 5
                end
                object CheckBoxKSeFQInvCrIInvTypKOR_ROZ: TCheckBox
                  Left = 523
                  Top = 21
                  Width = 85
                  Height = 22
                  Caption = 'KOR_ROZ'
                  TabOrder = 6
                end
              end
              object DateTimePickerKSeFQInvCrDetInvFromD: TDateTimePicker
                Left = 161
                Top = 220
                Width = 104
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 6
              end
              object DateTimePickerKSeFQInvCrDetInvToD: TDateTimePicker
                Left = 513
                Top = 216
                Width = 112
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 7
              end
              object EditKSeFQInvCrRefNo: TEdit
                Left = 178
                Top = 259
                Width = 642
                Height = 25
                TabOrder = 8
              end
              object EditKSeFQInvCrSubjectByIdent: TEdit
                Left = 150
                Top = 298
                Width = 373
                Height = 25
                TabOrder = 9
              end
              object GroupBox11: TGroupBox
                Left = 14
                Top = 341
                Width = 806
                Height = 119
                Caption = 'subjectTo'
                TabOrder = 10
                object Label88: TLabel
                  Left = 43
                  Top = 81
                  Width = 34
                  Height = 17
                  Caption = 'ident.'
                end
                object RadioGroupKSeFQInvCrSubjevtToType: TRadioGroup
                  Left = 2
                  Top = 19
                  Width = 802
                  Height = 53
                  Align = alTop
                  Caption = 'SubjevtToType'
                  Columns = 4
                  Items.Strings = (
                    'none'
                    'onip'
                    'other'
                    'vatUE')
                  TabOrder = 0
                end
                object EditKSeFQInvCrSubjectToId: TEdit
                  Left = 127
                  Top = 77
                  Width = 669
                  Height = 25
                  TabOrder = 1
                end
              end
              object ComboBoxKSeFQInvCAamountType: TComboBox
                Left = 672
                Top = 21
                Width = 145
                Height = 25
                Style = csDropDownList
                ItemHeight = 17
                ItemIndex = 0
                TabOrder = 11
                Text = 'none'
                Items.Strings = (
                  'none'
                  'brutto'
                  'netto'
                  'vat')
              end
              object DateTimePickerKSeFQInvCrDetInvFromT: TDateTimePicker
                Left = 265
                Top = 220
                Width = 96
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                Kind = dtkTime
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 12
              end
              object DateTimePickerKSeFQInvCrDetInvToT: TDateTimePicker
                Left = 625
                Top = 216
                Width = 96
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                Kind = dtkTime
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 13
              end
            end
            object TabSheetKSeFQInvCrIncr: TTabSheet
              Caption = 'Narastajaco'
              object Label81: TLabel
                Left = 16
                Top = 31
                Width = 222
                Height = 17
                Caption = 'acquisitionTimestampThresholdFrom'
              end
              object Label82: TLabel
                Left = 16
                Top = 80
                Width = 206
                Height = 17
                Caption = 'acquisitionTimestampThresholdTo'
              end
              object DateTimePickerKSeFQInvCrIncInvFromD: TDateTimePicker
                Left = 282
                Top = 25
                Width = 112
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 0
              end
              object DateTimePickerKSeFQInvCrIncInvToD: TDateTimePicker
                Left = 282
                Top = 73
                Width = 112
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 1
              end
              object DateTimePickerKSeFQInvCrIncInvFromT: TDateTimePicker
                Left = 401
                Top = 25
                Width = 96
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                Kind = dtkTime
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 2
              end
              object DateTimePickerKSeFQInvCrIncInvToT: TDateTimePicker
                Left = 401
                Top = 73
                Width = 96
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                Kind = dtkTime
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 3
              end
            end
            object TabSheetKSeFQInvCrRange: TTabSheet
              Caption = 'Zakres'
              object Label83: TLabel
                Left = 10
                Top = 21
                Width = 114
                Height = 17
                Caption = 'invoicingDateFrom'
              end
              object Label84: TLabel
                Left = 387
                Top = 17
                Width = 98
                Height = 17
                Caption = 'invoicingDateTo'
              end
              object DateTimePickerKSeFQInvCrRanInvFromD: TDateTimePicker
                Left = 156
                Top = 14
                Width = 109
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 0
              end
              object DateTimePickerKSeFQInvCrRanInvToD: TDateTimePicker
                Left = 513
                Top = 10
                Width = 112
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 1
              end
              object DateTimePickerKSeFQInvCrRanInvFromT: TDateTimePicker
                Left = 273
                Top = 14
                Width = 96
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                Kind = dtkTime
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 2
              end
              object DateTimePickerKSeFQInvCrRanInvToT: TDateTimePicker
                Left = 633
                Top = 9
                Width = 95
                Height = 25
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                Kind = dtkTime
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 3
              end
            end
          end
          object ButtonKSeFQInvClear: TButton
            Left = 753
            Top = 21
            Width = 98
            Height = 33
            Caption = 'Wyczysc'
            TabOrder = 2
            OnClick = ButtonKSeFQInvClearClick
          end
          object CheckBoxKSeFQInvCrIsHidden: TCheckBox
            Left = 25
            Top = 61
            Width = 65
            Height = 20
            Caption = 'isHidden'
            TabOrder = 3
          end
          object DateTimePickerKSeFQInvCrHidingDateFromD: TDateTimePicker
            Left = 258
            Top = 60
            Width = 103
            Height = 25
            Date = 43789.000000000000000000
            Time = 43789.000000000000000000
            MaxDate = 2958465.000000000000000000
            MinDate = -53780.000000000000000000
            TabOrder = 4
          end
          object DateTimePickerKSeFQInvCrHidingDateFromT: TDateTimePicker
            Left = 361
            Top = 60
            Width = 95
            Height = 25
            Date = 43789.000000000000000000
            Time = 43789.000000000000000000
            Kind = dtkTime
            MaxDate = 2958465.000000000000000000
            MinDate = -53780.000000000000000000
            TabOrder = 5
          end
          object DateTimePickerKSeFQInvCrHidingDateToD: TDateTimePicker
            Left = 641
            Top = 60
            Width = 104
            Height = 25
            Date = 43789.000000000000000000
            Time = 43789.000000000000000000
            MaxDate = 2958465.000000000000000000
            MinDate = -53780.000000000000000000
            TabOrder = 6
          end
          object DateTimePickerKSeFQInvCrHidingDateToT: TDateTimePicker
            Left = 745
            Top = 60
            Width = 96
            Height = 25
            Date = 43789.000000000000000000
            Time = 43789.000000000000000000
            Kind = dtkTime
            MaxDate = 2958465.000000000000000000
            MinDate = -53780.000000000000000000
            TabOrder = 7
          end
          object CheckBoxKSeFQInvCrHidingDateFrom: TCheckBox
            Left = 128
            Top = 64
            Width = 120
            Height = 17
            Caption = 'hidingDateFrom'
            TabOrder = 8
          end
          object CheckBoxKSeFQInvCrHidingDateTo: TCheckBox
            Left = 528
            Top = 64
            Width = 113
            Height = 17
            Caption = 'hidingDateTo'
            TabOrder = 9
          end
        end
        object GroupBox12: TGroupBox
          Left = 0
          Top = 683
          Width = 880
          Height = 323
          Align = alTop
          Caption = 'Zapytanie asynchroniczne'
          TabOrder = 2
          DesignSize = (
            880
            323)
          object ButtonKSeFQInvAsync: TButton
            Left = 25
            Top = 25
            Width = 98
            Height = 33
            Caption = 'Zapytaj'
            TabOrder = 0
            OnClick = ButtonKSeFQInvAsyncClick
          end
          object GroupBox13: TGroupBox
            Left = 22
            Top = 63
            Width = 841
            Height = 81
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Status zapytania'
            TabOrder = 1
            DesignSize = (
              841
              81)
            object Label89: TLabel
              Left = 17
              Top = 34
              Width = 100
              Height = 17
              Caption = 'Nr ref. zapytania'
            end
            object EditKSeFQInvAsyncQRefNo: TEdit
              Left = 143
              Top = 24
              Width = 551
              Height = 25
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object ButtonKSeFQInvAsyncStat: TButton
              Left = 702
              Top = 21
              Width = 130
              Height = 33
              Anchors = [akTop, akRight]
              Caption = 'Sprawdz status'
              TabOrder = 1
              OnClick = ButtonKSeFQInvAsyncStatClick
            end
          end
          object GroupBox14: TGroupBox
            Left = 24
            Top = 150
            Width = 847
            Height = 153
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Pobieranie wyniku zapytania'
            TabOrder = 2
            DesignSize = (
              847
              153)
            object Label90: TLabel
              Left = 20
              Top = 30
              Width = 98
              Height = 17
              Caption = 'Nr ref. elementu'
            end
            object Label91: TLabel
              Left = 20
              Top = 72
              Width = 105
              Height = 17
              Caption = 'Plik docelowy ZIP'
            end
            object SpeedButton27: TSpeedButton
              Tag = 33
              Left = 794
              Top = 64
              Width = 30
              Height = 29
              Anchors = [akTop, akRight]
              Caption = '...'
              OnClick = SBFileNameEditJPKRSAProdClick
            end
            object EditKSeFQInvAsyncERefNo: TEdit
              Left = 156
              Top = 29
              Width = 661
              Height = 25
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object FileNameEditKSeFQInvAsyncFN: TEdit
              Left = 156
              Top = 69
              Width = 630
              Height = 25
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object ButtonKSeFQInvAsyncFetch: TButton
              Left = 148
              Top = 105
              Width = 98
              Height = 32
              Caption = 'Pobierz'
              TabOrder = 2
              OnClick = ButtonKSeFQInvAsyncFetchClick
            end
          end
        end
      end
    end
    object TabSheetKSeFBatch: TTabSheet
      Caption = 'KSeF - Wysylka wsadowa'
      TabVisible = False
      object ScrollBox4: TScrollBox
        Left = 0
        Top = 0
        Width = 905
        Height = 601
        Align = alClient
        TabOrder = 0
        object GroupBox19: TGroupBox
          Left = 0
          Top = 0
          Width = 880
          Height = 387
          Align = alTop
          Caption = 'Podpis / przygotowanie'
          TabOrder = 0
          DesignSize = (
            880
            387)
          object Label103: TLabel
            Left = 5
            Top = 131
            Width = 109
            Height = 17
            Caption = 'Plik wejsciowy ZIP'
          end
          object Label104: TLabel
            Left = 5
            Top = 167
            Width = 94
            Height = 17
            Caption = 'Rodzaj podpisu'
          end
          object Label105: TLabel
            Left = 25
            Top = 76
            Width = 46
            Height = 17
            Caption = 'Bramka'
          end
          object Label106: TLabel
            Left = 409
            Top = 76
            Width = 92
            Height = 17
            Caption = 'Kod formularza'
          end
          object Label107: TLabel
            Left = 25
            Top = 34
            Width = 21
            Height = 17
            Caption = 'NIP'
          end
          object Label108: TLabel
            Left = 5
            Top = 216
            Width = 59
            Height = 17
            Caption = 'Certyfikat'
          end
          object Label109: TLabel
            Left = 5
            Top = 260
            Width = 151
            Height = 17
            Caption = 'Plik wyjsciowy InitUpload'
          end
          object Label110: TLabel
            Left = 5
            Top = 299
            Width = 150
            Height = 17
            Caption = 'Plik yjsciowy zaszyfr. ZIP'
          end
          object SpeedButton22: TSpeedButton
            Tag = 28
            Left = 838
            Top = 126
            Width = 30
            Height = 28
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object SpeedButton23: TSpeedButton
            Tag = 29
            Left = 838
            Top = 251
            Width = 30
            Height = 29
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object SpeedButton24: TSpeedButton
            Tag = 30
            Left = 838
            Top = 292
            Width = 30
            Height = 28
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object FileNameEditKSeFBatchInZIP: TEdit
            Left = 156
            Top = 126
            Width = 674
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object RadioButtonKSeFBatchCert: TRadioButton
            Left = 156
            Top = 167
            Width = 160
            Height = 25
            Caption = 'Podpis certyfikatem'
            Checked = True
            TabOrder = 2
            TabStop = True
          end
          object RadioButtonKSeFBatchPZ: TRadioButton
            Left = 424
            Top = 167
            Width = 117
            Height = 25
            Caption = 'Profil zaufany'
            TabOrder = 1
          end
          object ComboBoxKSeFBatchBramka: TComboBox
            Left = 110
            Top = 72
            Width = 230
            Height = 25
            Style = csDropDownList
            ItemHeight = 17
            ItemIndex = 2
            TabOrder = 3
            Text = 'Testowa'
            Items.Strings = (
              'Produkcyjna'
              'Demo'
              'Testowa')
          end
          object ComboBoxKSeFBatchInitFormCode: TComboBox
            Left = 539
            Top = 72
            Width = 99
            Height = 25
            Style = csDropDownList
            ItemHeight = 17
            ItemIndex = 0
            TabOrder = 4
            Text = 'FA(1)'
            Items.Strings = (
              'FA(1)'
              'FA(2)')
          end
          object EditKSeFBatchNIP: TEdit
            Left = 110
            Top = 27
            Width = 159
            Height = 21
            TabOrder = 5
          end
          object ComboBoxKSeFBatchCert: TComboBox
            Left = 156
            Top = 209
            Width = 697
            Height = 25
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 0
            TabOrder = 6
          end
          object FileNameEditKSeFBatchOutInitUp: TEdit
            Left = 204
            Top = 251
            Width = 626
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
          object FileNameEditKSeFBatchOutEncZIP: TEdit
            Left = 204
            Top = 293
            Width = 626
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
          object ButtonKSeFBatchPodp: TButton
            Left = 204
            Top = 335
            Width = 157
            Height = 32
            Caption = 'Podpisz / szyfruj'
            TabOrder = 9
            OnClick = ButtonKSeFBatchPodpClick
          end
        end
        object GroupBox20: TGroupBox
          Left = 0
          Top = 387
          Width = 880
          Height = 241
          Align = alTop
          Caption = 'Wysylka'
          TabOrder = 1
          DesignSize = (
            880
            241)
          object Label111: TLabel
            Left = 4
            Top = 37
            Width = 151
            Height = 17
            Caption = 'Podpisany plik InitUpload'
          end
          object Label112: TLabel
            Left = 5
            Top = 80
            Width = 132
            Height = 17
            Caption = 'Zaszyfrowany plik ZIP'
          end
          object Label113: TLabel
            Left = 120
            Top = 119
            Width = 46
            Height = 17
            Caption = 'Bramka'
          end
          object Label114: TLabel
            Left = 20
            Top = 205
            Width = 146
            Height = 17
            Caption = 'Nadany nr referencyjny'
          end
          object SpeedButton25: TSpeedButton
            Tag = 31
            Left = 838
            Top = 31
            Width = 30
            Height = 29
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object SpeedButton26: TSpeedButton
            Tag = 32
            Left = 838
            Top = 72
            Width = 30
            Height = 29
            Anchors = [akTop, akRight]
            Caption = '...'
            OnClick = SBFileNameEditJPKRSAProdClick
          end
          object FileNameEditKSeFBatchSendIU: TEdit
            Left = 201
            Top = 31
            Width = 650
            Height = 21
            TabOrder = 0
          end
          object FileNameEditKSeFBatchSendEnc: TEdit
            Left = 201
            Top = 73
            Width = 650
            Height = 21
            TabOrder = 1
          end
          object ComboBoxKSeFBatchSendBramka: TComboBox
            Left = 205
            Top = 115
            Width = 230
            Height = 25
            Style = csDropDownList
            ItemHeight = 17
            ItemIndex = 2
            TabOrder = 2
            Text = 'Testowa'
            Items.Strings = (
              'Produkcyjna'
              'Demo'
              'Testowa')
          end
          object ButtonKSeFBatchSend: TButton
            Left = 201
            Top = 157
            Width = 98
            Height = 33
            Caption = 'Wyslij'
            TabOrder = 3
            OnClick = ButtonKSeFBatchSendClick
          end
          object EditKSeFBatchNrRef: TEdit
            Left = 201
            Top = 199
            Width = 475
            Height = 21
            TabOrder = 4
          end
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 640
    Width = 913
    Height = 140
    Align = alBottom
    Caption = 'Panel5'
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 281
      Top = 1
      Height = 138
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 280
      Height = 138
      Align = alLeft
      Caption = 'Panel6'
      TabOrder = 0
      DesignSize = (
        280
        138)
      object ListViewObj: TListView
        Left = 2
        Top = 34
        Width = 273
        Height = 99
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = 'Obiekt'
            Width = 500
          end>
        HideSelection = False
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = ButtonObjShowClick
      end
      object ButtonObjShow: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Pokaz'
        TabOrder = 1
        OnClick = ButtonObjShowClick
      end
      object ButtonObjClea: TButton
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Czysc'
        TabOrder = 2
        OnClick = ButtonObjCleaClick
      end
      object ButtonObjCount: TButton
        Left = 168
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Ilosc obj.'
        TabOrder = 3
        OnClick = ButtonObjCountClick
      end
    end
    object MemoLog: TMemo
      Left = 284
      Top = 1
      Width = 628
      Height = 138
      Align = alClient
      Lines.Strings = (
        'MemoLog')
      TabOrder = 1
      WordWrap = False
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 240
    Top = 312
  end
  object SaveDialog1: TSaveDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 272
    Top = 312
  end
end
