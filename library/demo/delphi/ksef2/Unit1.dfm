object Form1: TForm1
  Left = 192
  Top = 121
  Width = 808
  Height = 636
  Caption = 'LobGovPL4 Delphi - KSeF 2.0 Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 485
    Width = 792
    Height = 5
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel5: TPanel
    Left = 0
    Top = 490
    Width = 792
    Height = 107
    Align = alBottom
    Caption = 'Panel5'
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 215
      Top = 1
      Width = 2
      Height = 105
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 214
      Height = 105
      Align = alLeft
      Caption = 'Panel6'
      TabOrder = 0
      DesignSize = (
        214
        105)
      object ListViewObj: TListView
        Left = 2
        Top = 26
        Width = 208
        Height = 76
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = 'Obiekt'
            Width = 382
          end>
        HideSelection = False
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = ListViewObjDblClick
      end
      object ButtonObjShow: TButton
        Left = 6
        Top = 6
        Width = 57
        Height = 19
        Caption = 'Pokaz'
        TabOrder = 1
        OnClick = ButtonObjShowClick
      end
      object ButtonObjClea: TButton
        Left = 67
        Top = 6
        Width = 58
        Height = 19
        Caption = 'Czysc'
        TabOrder = 2
        OnClick = ButtonObjCleaClick
      end
      object ButtonObjCount: TButton
        Left = 128
        Top = 6
        Width = 58
        Height = 19
        Caption = 'Ilosc obj.'
        TabOrder = 3
        OnClick = ButtonObjCountClick
      end
    end
    object MemoLog: TMemo
      Left = 217
      Top = 1
      Width = 574
      Height = 105
      Align = alClient
      Lines.Strings = (
        'MemoLog')
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
    end
  end
  object PageControlMain: TPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 485
    ActivePage = TabSheetSetup
    Align = alClient
    MultiLine = True
    TabOrder = 1
    object TabSheetSetup: TTabSheet
      Caption = 'Setup'
      object Panel2: TPanel
        Left = 0
        Top = 412
        Width = 784
        Height = 45
        Align = alBottom
        TabOrder = 0
        object ButtonSetup: TButton
          Left = 19
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Setup'
          TabOrder = 0
          OnClick = ButtonSetupClick
        end
      end
      object GroupBoxSetupCertSign: TGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 153
        Align = alTop
        Caption = 'Sterowniki podpisu'
        TabOrder = 1
        DesignSize = (
          784
          153)
        object Label1: TLabel
          Left = 8
          Top = 123
          Width = 89
          Height = 13
          Caption = 'Biblioteka PKCS11'
        end
        object CheckListBoxSigners: TCheckListBox
          Left = 8
          Top = 16
          Width = 768
          Height = 97
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
        end
        object FileNameEditLibPKCS11: TEdit
          Left = 104
          Top = 120
          Width = 638
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object ButtonLibPKCS11Sel: TButton
          Left = 746
          Top = 120
          Width = 27
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '...'
          TabOrder = 2
        end
      end
      object GroupBoxKSeFSetup: TGroupBox
        Left = 0
        Top = 153
        Width = 784
        Height = 192
        Align = alTop
        Caption = 'W'#322'a'#347'ciwo'#347'ci KSeF'
        TabOrder = 2
        DesignSize = (
          784
          192)
        object Label2: TLabel
          Left = 16
          Top = 21
          Width = 58
          Height = 13
          Caption = 'HTTP Client'
        end
        object Label3: TLabel
          Left = 16
          Top = 43
          Width = 120
          Height = 13
          Caption = 'Random nmber generator'
        end
        object Label4: TLabel
          Left = 16
          Top = 66
          Width = 79
          Height = 13
          Caption = 'Base64 Encoder'
        end
        object Label5: TLabel
          Left = 16
          Top = 91
          Width = 71
          Height = 13
          Caption = 'SHA-256 Hash'
        end
        object Label6: TLabel
          Left = 16
          Top = 114
          Width = 92
          Height = 13
          Caption = 'AES256 Encryption'
        end
        object Label7: TLabel
          Left = 16
          Top = 137
          Width = 125
          Height = 13
          Caption = 'RSA public key encryption'
        end
        object ComboBoxHTTPCli: TComboBox
          Left = 160
          Top = 16
          Width = 617
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
        end
        object ComboBoxRandGen: TComboBox
          Left = 160
          Top = 40
          Width = 617
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 1
        end
        object ComboBoxBase64: TComboBox
          Left = 160
          Top = 64
          Width = 617
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 2
        end
        object ComboBoxSHA256: TComboBox
          Left = 160
          Top = 88
          Width = 617
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 3
        end
        object ComboBoxAES256: TComboBox
          Left = 160
          Top = 112
          Width = 617
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 4
        end
        object ComboBoxRSAEnc: TComboBox
          Left = 160
          Top = 136
          Width = 617
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 5
        end
        object CheckBoxKSeFAutoRefresh: TCheckBox
          Left = 16
          Top = 160
          Width = 225
          Height = 17
          Caption = 'Automatycznie od'#347'wie'#380' token dost'#281'powy'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
      end
    end
    object TabSheetCert: TTabSheet
      Caption = 'Certyfikaty'
      ImageIndex = 1
      TabVisible = False
      object Panel3: TPanel
        Left = 0
        Top = 406
        Width = 784
        Height = 51
        Align = alBottom
        TabOrder = 0
        object ButtonShowCert: TButton
          Left = 14
          Top = 12
          Width = 123
          Height = 25
          Caption = 'Pokaz szczeg'#243'ly'
          TabOrder = 0
          OnClick = ButtonShowCertClick
        end
        object ButtonCertWybierz: TButton
          Left = 152
          Top = 12
          Width = 232
          Height = 25
          Caption = 'Wybierz certyfikat i pokaz informacje'
          TabOrder = 1
          OnClick = ButtonCertWybierzClick
        end
        object ButtonCertReload: TButton
          Left = 392
          Top = 12
          Width = 192
          Height = 25
          Caption = 'Odswierz liste certyfikat'#243'w'
          TabOrder = 2
          OnClick = ButtonCertReloadClick
        end
        object ButtonCertLoadFromFile: TButton
          Left = 592
          Top = 12
          Width = 177
          Height = 25
          Caption = 'Wczytaj certyfikat z pliku'
          TabOrder = 3
          OnClick = ButtonCertLoadFromFileClick
        end
      end
      object ListViewCert: TListView
        Left = 0
        Top = 0
        Width = 784
        Height = 406
        Align = alClient
        Columns = <
          item
            Caption = 'Index'
            Width = 60
          end
          item
            Caption = 'Class'
            Width = 120
          end
          item
            Caption = 'Subject name'
            Width = 200
          end
          item
            Caption = 'Valid from'
            Width = 90
          end
          item
            Caption = 'Valid to'
            Width = 90
          end
          item
            Caption = 'Serial number'
            Width = 200
          end
          item
            Caption = 'Issuer'
            Width = 300
          end
          item
            Caption = 'Subject'
            Width = 300
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
    object TabSheetPKCS11: TTabSheet
      Caption = 'PKCS#11'
      ImageIndex = 2
      TabVisible = False
      object GroupBox23: TGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 74
        Align = alTop
        Caption = 'Informacje'
        TabOrder = 0
        object ButtonPKCS11Info: TButton
          Left = 13
          Top = 19
          Width = 190
          Height = 19
          Caption = 'Pokaz informacje o bibliotece PKCS11'
          TabOrder = 0
        end
        object ButtonPKCS11Slots: TButton
          Left = 13
          Top = 45
          Width = 104
          Height = 19
          Caption = 'Pokaz liste slotow'
          TabOrder = 1
        end
      end
      object GroupBox24: TGroupBox
        Left = 0
        Top = 74
        Width = 784
        Height = 94
        Align = alTop
        Caption = 'Sesja'
        TabOrder = 1
        DesignSize = (
          784
          94)
        object Label124: TLabel
          Left = 6
          Top = 21
          Width = 44
          Height = 13
          Caption = 'Certyfikat'
          Color = clBtnFace
          ParentColor = False
        end
        object Label125: TLabel
          Left = 37
          Top = 45
          Width = 18
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'PIN'
          Color = clBtnFace
          ParentColor = False
        end
        object Label126: TLabel
          Left = 253
          Top = 45
          Width = 95
          Height = 13
          Caption = 'Rodzaj uzytkownika'
          Color = clBtnFace
          ParentColor = False
        end
        object ComboBoxPKCS11Cert: TComboBox
          Left = 57
          Top = 18
          Width = 468
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
        end
        object EditPKCS11PIN: TEdit
          Left = 57
          Top = 42
          Width = 178
          Height = 21
          PasswordChar = '*'
          TabOrder = 1
        end
        object ButtonPKCS11SesStart: TButton
          Left = 57
          Top = 66
          Width = 85
          Height = 19
          Caption = 'Rozpocznij sesje'
          TabOrder = 2
        end
        object ButtonPKCS11SesLogin: TButton
          Left = 148
          Top = 66
          Width = 51
          Height = 19
          Caption = 'Zaloguj'
          TabOrder = 3
        end
        object ButtonPKCS11SesLogout: TButton
          Left = 205
          Top = 66
          Width = 53
          Height = 19
          Caption = 'Wyloguj'
          TabOrder = 4
        end
        object ButtonPKCS11SesClose: TButton
          Left = 265
          Top = 66
          Width = 75
          Height = 19
          Caption = 'Zakoncz sesje'
          TabOrder = 5
        end
        object ButtonPKCS11SesInfo: TButton
          Left = 346
          Top = 66
          Width = 88
          Height = 19
          Caption = 'Pokaz info o sesji'
          TabOrder = 6
        end
        object ComboBoxPKCS11UserType: TComboBox
          Left = 351
          Top = 42
          Width = 107
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
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
    object TabSheetKSeF2Auth: TTabSheet
      Caption = 'KSeF2 - Uwierzytelnianie'
      ImageIndex = 3
      TabVisible = False
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 784
        Height = 457
        Align = alClient
        TabOrder = 0
        object GroupBoxKSeFA1: TGroupBox
          Left = 0
          Top = 0
          Width = 763
          Height = 169
          Align = alTop
          Caption = 'Dane autoryzacyjne'
          TabOrder = 0
          DesignSize = (
            763
            169)
          object Label60: TLabel
            Left = 8
            Top = 28
            Width = 36
            Height = 13
            Caption = 'Bramka'
          end
          object Label18: TLabel
            Left = 8
            Top = 59
            Width = 58
            Height = 13
            Caption = 'Identyfikator'
          end
          object Label19: TLabel
            Left = 8
            Top = 90
            Width = 99
            Height = 13
            Caption = 'Rodzaj identyfikatora'
          end
          object ComboBoxKSeFABramka: TComboBox
            Left = 56
            Top = 24
            Width = 219
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 2
            TabOrder = 0
            Text = 'Testowa'
            Items.Strings = (
              'Produkcyjna'
              'Demo'
              'Testowa')
          end
          object EditKSeFAIdentifier: TEdit
            Left = 83
            Top = 55
            Width = 192
            Height = 21
            TabOrder = 1
          end
          object ComboBoxKSeFAIdentifierType: TComboBox
            Left = 127
            Top = 86
            Width = 148
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 2
            TabOrder = 2
            Text = 'Nip'
            Items.Strings = (
              'None'
              'AllPartners'
              'Nip'
              'InternalId'
              'NipVatUe'
              'PeppolId')
          end
          object GroupBox21: TGroupBox
            Left = 283
            Top = 8
            Width = 477
            Height = 152
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Sesja'
            TabOrder = 3
            DesignSize = (
              477
              152)
            object Label69: TLabel
              Left = 16
              Top = 28
              Width = 65
              Height = 13
              Caption = 'Access token'
            end
            object Label71: TLabel
              Left = 16
              Top = 59
              Width = 80
              Height = 13
              Caption = 'Access token do'
            end
            object Label72: TLabel
              Left = 16
              Top = 90
              Width = 67
              Height = 13
              Caption = 'Refresh token'
            end
            object Label73: TLabel
              Left = 16
              Top = 121
              Width = 82
              Height = 13
              Caption = 'Refresh token do'
            end
            object EditKSeFAAccessToken: TEdit
              Left = 93
              Top = 24
              Width = 314
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object ButtonKSeFASessionSet: TButton
              Left = 415
              Top = 8
              Width = 58
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Ustaw'
              TabOrder = 1
              OnClick = ButtonKSeFASessionSetClick
            end
            object EditKSeFARefreshToken: TEdit
              Left = 96
              Top = 86
              Width = 311
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object DateTimePickerKSeFAAccessTokenValidUntil: TDateTimePicker
              Left = 110
              Top = 55
              Width = 137
              Height = 23
              Date = 45963.851435162040000000
              Time = 45963.851435162040000000
              TabOrder = 3
            end
            object DateTimePickerKSeFARefreshTokenValidUntil: TDateTimePicker
              Left = 113
              Top = 117
              Width = 137
              Height = 23
              Date = 45963.851435277780000000
              Time = 45963.851435277780000000
              TabOrder = 4
            end
          end
        end
        object GroupBoxKSeFA2: TGroupBox
          Left = 0
          Top = 169
          Width = 763
          Height = 123
          Align = alTop
          Caption = 'Uwierzytelnienie z wykorzystaniem podpisu XAdES'
          TabOrder = 1
          DesignSize = (
            763
            123)
          object Label20: TLabel
            Left = 8
            Top = 28
            Width = 44
            Height = 13
            Caption = 'Certyfikat'
          end
          object Label21: TLabel
            Left = 8
            Top = 59
            Width = 94
            Height = 13
            Caption = 'Spos'#243'b identyfikacji'
          end
          object ComboBoxACertificate: TComboBox
            Left = 67
            Top = 24
            Width = 685
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
          end
          object ComboBoxKSeFASubjectType: TComboBox
            Left = 122
            Top = 55
            Width = 172
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Text = 'Podmiot certyfikatu'
            Items.Strings = (
              'Podmiot certyfikatu'
              'Odcisk palca')
          end
          object ButtonKSeFAXAdES: TButton
            Left = 8
            Top = 86
            Width = 93
            Height = 25
            Caption = 'Uwierzytelnij'
            TabOrder = 2
            OnClick = ButtonKSeFAXAdESClick
          end
        end
        object GroupBoxKSeFA3: TGroupBox
          Left = 0
          Top = 292
          Width = 763
          Height = 235
          Align = alTop
          Caption = 
            'Uwierzytelnienie z wykorzystaniem zewn'#281'trznego podpisu XAdES (np' +
            '. Profil Zaufany)'
          TabOrder = 2
          object GroupBox12: TGroupBox
            Left = 2
            Top = 15
            Width = 759
            Height = 123
            Align = alTop
            Caption = 'Generowanie struktury XML Auth'
            TabOrder = 0
            object Label23: TLabel
              Left = 8
              Top = 28
              Width = 94
              Height = 13
              Caption = 'Spos'#243'b identyfikacji'
            end
            object Label24: TLabel
              Left = 8
              Top = 59
              Width = 65
              Height = 13
              Caption = 'Plik docelowy'
            end
            object ComboBoxKSeFASubjectTypeExt: TComboBox
              Left = 122
              Top = 24
              Width = 172
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = 'Podmiot certyfikatu'
              Items.Strings = (
                'Podmiot certyfikatu'
                'Odcisk palca')
            end
            object FileNameEditKSeFAOutXades: TEdit
              Left = 89
              Top = 55
              Width = 632
              Height = 21
              TabOrder = 1
              Text = 'auth.xml'
            end
            object ButtonKSeFAXAdESSave: TButton
              Left = 8
              Top = 86
              Width = 59
              Height = 25
              Caption = 'Zapisz'
              TabOrder = 2
              OnClick = ButtonKSeFAXAdESSaveClick
            end
          end
          object GroupBox13: TGroupBox
            Left = 2
            Top = 138
            Width = 759
            Height = 92
            Align = alTop
            Caption = 'Uwierzytelnianie zewn'#281'trznie podpisan'#261' struktur'#261' XML Auth'
            TabOrder = 1
            DesignSize = (
              759
              92)
            object Label25: TLabel
              Left = 8
              Top = 28
              Width = 146
              Height = 13
              Caption = 'Plik z podpisan'#261' struktur'#261' Auth'
            end
            object FileNameEditKSeFAInXades: TEdit
              Left = 180
              Top = 24
              Width = 541
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object ButtonKSeFAXAdESExt: TButton
              Left = 8
              Top = 55
              Width = 93
              Height = 25
              Caption = 'Uwierzytelnij'
              TabOrder = 1
              OnClick = ButtonKSeFAXAdESExtClick
            end
          end
        end
        object GroupBoxKSeFA5: TGroupBox
          Left = 0
          Top = 619
          Width = 763
          Height = 57
          Align = alTop
          Caption = 
            'Pobranie statusu uwierzytelniania / Pobranie token'#243'w dost'#281'powych' +
            ' / Od'#347'wie'#380'enie tokena dost'#281'powego'
          Enabled = False
          TabOrder = 3
          object ButtonKSeFAStatus: TButton
            Left = 8
            Top = 24
            Width = 187
            Height = 25
            Caption = 'Pobierz status uwierzytelniania'
            TabOrder = 0
            OnClick = ButtonKSeFAStatusClick
          end
          object ButtonKSeFATokenRedem: TButton
            Left = 203
            Top = 24
            Width = 165
            Height = 25
            Caption = 'Pobierz tokeny dost'#281'powe'
            TabOrder = 1
            OnClick = ButtonKSeFATokenRedemClick
          end
          object ButtonKSeFATokenRefresh: TButton
            Left = 376
            Top = 24
            Width = 164
            Height = 25
            Caption = 'Od'#347'wie'#380' token dost'#281'powy'
            TabOrder = 2
            OnClick = ButtonKSeFATokenRefreshClick
          end
        end
        object GroupBoxKSeFA6: TGroupBox
          Left = 0
          Top = 676
          Width = 763
          Height = 94
          Align = alTop
          Caption = 'Aktywne sesje'
          Enabled = False
          TabOrder = 4
          DesignSize = (
            763
            94)
          object Label26: TLabel
            Left = 8
            Top = 61
            Width = 171
            Height = 13
            Caption = 'Nr referencyjny sesji uwierzytelniania'
          end
          object ButtonKSeFASessions: TButton
            Left = 8
            Top = 24
            Width = 174
            Height = 25
            Caption = 'Pobierz list'#281' aktywnych sesji'
            TabOrder = 0
            OnClick = ButtonKSeFASessionsClick
          end
          object ButtonKSeFASessionTermCur: TButton
            Left = 190
            Top = 24
            Width = 159
            Height = 25
            Caption = 'Uniewa'#380'nij aktualn'#261' sesj'#281
            TabOrder = 1
            OnClick = ButtonKSeFASessionTermCurClick
          end
          object EditKSeFASessionRefNo: TEdit
            Left = 210
            Top = 57
            Width = 423
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object ButtonKSeFASessionTerm: TButton
            Left = 639
            Top = 57
            Width = 111
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Uniewa'#380'nij sesj'#281
            TabOrder = 3
            OnClick = ButtonKSeFASessionTermClick
          end
        end
        object GroupBoxKSeFA4: TGroupBox
          Left = 0
          Top = 527
          Width = 763
          Height = 92
          Align = alTop
          Caption = 'Uwierzytelnienie z wykorzystaniem tokena KSeF'
          TabOrder = 5
          DesignSize = (
            763
            92)
          object Label22: TLabel
            Left = 8
            Top = 28
            Width = 60
            Height = 13
            Caption = 'Token KSeF'
          end
          object EditKSeFATokenKsef: TEdit
            Left = 75
            Top = 24
            Width = 678
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFATokenKsef: TButton
            Left = 8
            Top = 55
            Width = 93
            Height = 25
            Caption = 'Uwierzytelnij'
            TabOrder = 1
            OnClick = ButtonKSeFATokenKsefClick
          end
        end
      end
    end
    object TabSheetKSeFInteractive: TTabSheet
      Caption = 'KSeF2 - Wysy'#322'ka interaktywna'
      ImageIndex = 4
      TabVisible = False
      object ScrollBox4: TScrollBox
        Left = 0
        Top = 0
        Width = 784
        Height = 457
        Align = alClient
        TabOrder = 0
        object GroupBox9: TGroupBox
          Left = 0
          Top = 335
          Width = 780
          Height = 61
          Align = alTop
          Caption = 'Zamkni'#281'cie sesji interaktywnej'
          TabOrder = 0
          object ButtonKSeFIClose: TButton
            Left = 8
            Top = 24
            Width = 168
            Height = 25
            Caption = 'Zamknij sesj'#281' interaktywn'#261
            TabOrder = 0
            OnClick = ButtonKSeFICloseClick
          end
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 185
          Width = 780
          Height = 150
          Align = alTop
          Caption = 'Wys'#322'anie faktury'
          TabOrder = 1
          DesignSize = (
            780
            150)
          object Label31: TLabel
            Left = 8
            Top = 28
            Width = 86
            Height = 13
            Caption = 'Plik XML z faktur'#261
          end
          object Label32: TLabel
            Left = 8
            Top = 86
            Width = 277
            Height = 13
            Caption = 'Skr'#243't SHA256 korygowanej faktury (puste je'#347'li nie dotyczy)'
          end
          object FileNameEditKSeFIDoc: TEdit
            Left = 110
            Top = 24
            Width = 627
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object CheckBoxKSeFIOffline: TCheckBox
            Left = 8
            Top = 55
            Width = 78
            Height = 19
            Caption = 'Tryb offline'
            TabOrder = 1
          end
          object EditKSeFIHashOfCorrectedInvoice: TEdit
            Left = 324
            Top = 82
            Width = 403
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object ButtonKSeFISend: TButton
            Left = 8
            Top = 113
            Width = 57
            Height = 25
            Caption = 'Wy'#347'lij'
            TabOrder = 3
            OnClick = ButtonKSeFISendClick
          end
          object ButtonFileNameEditKSeFIDoc: TButton
            Left = 744
            Top = 24
            Width = 26
            Height = 21
            Caption = '...'
            TabOrder = 4
            OnClick = ButtonFileNameEditKSeFIDocClick
          end
        end
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 780
          Height = 185
          Align = alTop
          Caption = 'Otwarcie sesji interaktywnej'
          TabOrder = 2
          DesignSize = (
            780
            185)
          object Label27: TLabel
            Left = 8
            Top = 28
            Width = 72
            Height = 13
            Caption = 'Schemat faktur'
          end
          object Label28: TLabel
            Left = 8
            Top = 59
            Width = 59
            Height = 13
            Caption = 'SystemCode'
          end
          object Label29: TLabel
            Left = 8
            Top = 90
            Width = 74
            Height = 13
            Caption = 'SchemaVersion'
          end
          object Label30: TLabel
            Left = 8
            Top = 121
            Width = 27
            Height = 13
            Caption = 'Value'
          end
          object ComboBoxIFormCode: TComboBox
            Left = 96
            Top = 24
            Width = 190
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 3
            TabOrder = 0
            Text = 'FA (3)'
            Items.Strings = (
              'W'#322'asny (wpisany poni'#380'ej)'
              'FA (1)'
              'FA (2)'
              'FA (3)'
              'FA_PEF (3)'
              'FA_KOR_PEF (3)')
          end
          object EditKSeFIFormCodeSystemCode: TEdit
            Left = 82
            Top = 55
            Width = 685
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object EditKSeFIFormCodeSchemaVersion: TEdit
            Left = 96
            Top = 86
            Width = 671
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object EditKSeFIFormCodeValue: TEdit
            Left = 44
            Top = 117
            Width = 723
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object ButtonKSeFIOpen: TButton
            Left = 8
            Top = 148
            Width = 163
            Height = 25
            Caption = 'Otw'#243'rz sesj'#281' interaktywn'#261
            TabOrder = 4
            OnClick = ButtonKSeFIOpenClick
          end
        end
      end
    end
    object TabSheetKSeFBatch: TTabSheet
      Caption = 'KSeF2 - Wysy'#322'ka wsadowa'
      ImageIndex = 5
      TabVisible = False
      object ScrollBox7: TScrollBox
        Left = 0
        Top = 0
        Width = 784
        Height = 457
        Align = alClient
        TabOrder = 0
        object GroupBoxKSeFB1: TGroupBox
          Left = 0
          Top = 0
          Width = 763
          Height = 360
          Align = alTop
          Caption = 'Przygotwanie paczki faktur'
          TabOrder = 0
          DesignSize = (
            763
            360)
          object Label63: TLabel
            Left = 8
            Top = 59
            Width = 72
            Height = 13
            Caption = 'Schemat faktur'
          end
          object Label64: TLabel
            Left = 8
            Top = 90
            Width = 59
            Height = 13
            Caption = 'SystemCode'
          end
          object Label65: TLabel
            Left = 8
            Top = 121
            Width = 74
            Height = 13
            Caption = 'SchemaVersion'
          end
          object Label66: TLabel
            Left = 8
            Top = 152
            Width = 27
            Height = 13
            Caption = 'Value'
          end
          object Label67: TLabel
            Left = 8
            Top = 28
            Width = 183
            Height = 13
            Caption = 'Wej'#347'ciowy plik ZIP zawieraj'#261'cy faktury'
          end
          object Label68: TLabel
            Left = 8
            Top = 183
            Width = 227
            Height = 13
            Caption = 'Rozmiar cz'#281#347'ci w bajtach (0 - domy'#347'lnie 100MB)'
          end
          object ComboBoxBFormCode: TComboBox
            Left = 96
            Top = 55
            Width = 190
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 3
            TabOrder = 0
            Text = 'FA (3)'
            Items.Strings = (
              'W'#322'asny (wpisany poni'#380'ej)'
              'FA (1)'
              'FA (2)'
              'FA (3)'
              'FA_PEF (3)'
              'FA_KOR_PEF (3)')
          end
          object EditKSeFBFormCodeSystemCode: TEdit
            Left = 82
            Top = 86
            Width = 673
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object EditKSeFBFormCodeSchemaVersion: TEdit
            Left = 96
            Top = 117
            Width = 659
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object EditKSeFBFormCodeValue: TEdit
            Left = 44
            Top = 148
            Width = 711
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object ButtonKSeFBPrepare: TButton
            Left = 8
            Top = 323
            Width = 149
            Height = 25
            Caption = 'Przygotuj paczk'#281' faktur'
            TabOrder = 4
            OnClick = ButtonKSeFBPrepareClick
          end
          object FileNameEditKSeFBZIPIn: TEdit
            Left = 217
            Top = 24
            Width = 511
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object GroupBox20: TGroupBox
            Left = 8
            Top = 210
            Width = 747
            Height = 105
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Wynikowe pliki z zaszyfrowanymi cze'#281#347'ciami packi'
            TabOrder = 6
            object StringGridKSeFBEncOutFiles: TStringGrid
              Left = 2
              Top = 15
              Width = 743
              Height = 88
              Align = alClient
              ColCount = 1
              DefaultColWidth = 710
              FixedCols = 0
              RowCount = 2
              TabOrder = 0
            end
          end
          object SpinEditKSeFBPartSize: TSpinEdit
            Left = 269
            Top = 179
            Width = 138
            Height = 22
            MaxValue = 104857584
            MinValue = 0
            TabOrder = 7
            Value = 0
          end
          object ButtonFileNameEditKSeFBZIPIn: TButton
            Left = 729
            Top = 24
            Width = 26
            Height = 21
            Caption = '...'
            TabOrder = 8
            OnClick = ButtonFileNameEditKSeFBZIPInClick
          end
        end
        object GroupBoxKSeFB2: TGroupBox
          Left = 0
          Top = 360
          Width = 763
          Height = 61
          Align = alTop
          Caption = 'Otwarcie sesji wsadowej'
          Enabled = False
          TabOrder = 1
          object ButtonKSeFBOpen: TButton
            Left = 8
            Top = 24
            Width = 280
            Height = 25
            Caption = 'Otw'#243'rz sesj'#281' wsadow'#261' dla przygotowanej paczki'
            TabOrder = 0
            OnClick = ButtonKSeFBOpenClick
          end
        end
        object GroupBoxKSeFB3: TGroupBox
          Left = 0
          Top = 421
          Width = 763
          Height = 92
          Align = alTop
          Caption = 'Wy'#347'lij paczk'#281
          Enabled = False
          TabOrder = 2
          object Label70: TLabel
            Left = 8
            Top = 28
            Width = 221
            Height = 13
            Caption = 'Numer paczki do wys'#322'ania (0 - wy'#347'lij wszystkie)'
          end
          object ButtonKSeFBSend: TButton
            Left = 8
            Top = 55
            Width = 57
            Height = 25
            Caption = 'Wy'#347'lij'
            TabOrder = 0
            OnClick = ButtonKSeFBSendClick
          end
          object SpinEditKSeFBPartNumber: TSpinEdit
            Left = 263
            Top = 24
            Width = 86
            Height = 22
            MaxValue = 50
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
        object GroupBoxKSeFB4: TGroupBox
          Left = 0
          Top = 513
          Width = 763
          Height = 61
          Align = alTop
          Caption = 'Zamkni'#281'cie sesji wsadowej'
          Enabled = False
          TabOrder = 3
          object Button2: TButton
            Left = 8
            Top = 24
            Width = 149
            Height = 25
            Caption = 'Zamknij sesj'#281' wsadow'#261
            TabOrder = 0
            OnClick = Button2Click
          end
        end
      end
    end
    object TabSheetKSeFStatus: TTabSheet
      Caption = 'KSeF2 - Status wysy'#322'ki'
      ImageIndex = 6
      TabVisible = False
      object ScrollBox5: TScrollBox
        Left = 0
        Top = 0
        Width = 784
        Height = 457
        Align = alClient
        TabOrder = 0
        object GroupBox10: TGroupBox
          Left = 0
          Top = 0
          Width = 763
          Height = 337
          Align = alTop
          Caption = 'Pobranie listy sesji'
          TabOrder = 0
          DesignSize = (
            763
            337)
          object Label33: TLabel
            Left = 8
            Top = 28
            Width = 41
            Height = 13
            Caption = 'Typ sesji'
          end
          object Label34: TLabel
            Left = 8
            Top = 59
            Width = 69
            Height = 13
            Caption = 'Rozmiar strony'
          end
          object Label35: TLabel
            Left = 8
            Top = 90
            Width = 114
            Height = 13
            Caption = 'Numer referencyjny sesji'
          end
          object Label36: TLabel
            Left = 8
            Top = 121
            Width = 115
            Height = 13
            Caption = 'Data utworzenia sesji od'
          end
          object Label37: TLabel
            Left = 288
            Top = 121
            Width = 12
            Height = 13
            Caption = 'do'
          end
          object Label38: TLabel
            Left = 8
            Top = 152
            Width = 117
            Height = 13
            Caption = 'Data zamkni'#281'cia sesji od'
          end
          object Label39: TLabel
            Left = 289
            Top = 152
            Width = 12
            Height = 13
            Caption = 'do'
          end
          object Label40: TLabel
            Left = 8
            Top = 183
            Width = 121
            Height = 13
            Caption = 'Data ostatniej aktywno'#347'ci'
          end
          object Label41: TLabel
            Left = 295
            Top = 183
            Width = 12
            Height = 13
            Caption = 'do'
          end
          object Label42: TLabel
            Left = 8
            Top = 273
            Width = 244
            Height = 13
            Caption = 'Token s'#322'u'#380#261'cy do pobrania kolejnej strony wynik'#243'w'
          end
          object Label8: TLabel
            Left = 8
            Top = 208
            Width = 58
            Height = 13
            Caption = 'Statusy sesji'
          end
          object ComboBoxKSeFSSessionType: TComboBox
            Left = 59
            Top = 24
            Width = 100
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = 'Online'
            Items.Strings = (
              'Online'
              'Batch')
          end
          object SpinEditKSeFSPageSize1: TSpinEdit
            Left = 95
            Top = 55
            Width = 87
            Height = 22
            MaxValue = 100
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object EditKSeFSReferenceNumber: TEdit
            Left = 146
            Top = 86
            Width = 608
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object DateTimePickerKSeFSCreatedFrom: TDateTimePicker
            Left = 143
            Top = 117
            Width = 137
            Height = 23
            Date = 45963.930190081020000000
            Time = 45963.930190081020000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 3
          end
          object DateTimePickerKSeFSCreatedTo: TDateTimePicker
            Left = 310
            Top = 117
            Width = 137
            Height = 23
            Date = 45963.930190231480000000
            Time = 45963.930190231480000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 4
          end
          object DateTimePickerKSeFSClosedFrom: TDateTimePicker
            Left = 144
            Top = 148
            Width = 137
            Height = 23
            Date = 45963.930190937500000000
            Time = 45963.930190937500000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 5
          end
          object DateTimePickerKSeFSClosedTo: TDateTimePicker
            Left = 311
            Top = 148
            Width = 137
            Height = 23
            Date = 45963.930191099530000000
            Time = 45963.930191099530000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 6
          end
          object DateTimePickerKSeFSModifiedFrom: TDateTimePicker
            Left = 150
            Top = 179
            Width = 137
            Height = 23
            Date = 45963.930191643520000000
            Time = 45963.930191643520000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 7
          end
          object DateTimePickerKSeFSModifiedTo: TDateTimePicker
            Left = 317
            Top = 179
            Width = 137
            Height = 23
            Date = 45963.930191793980000000
            Time = 45963.930191793980000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 8
          end
          object CheckGroupKSeFSSesionStatuses: TCheckListBox
            Left = 8
            Top = 226
            Width = 745
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Columns = 4
            ItemHeight = 13
            Items.Strings = (
              'InProgress'
              'Succeeded'
              'Failed'
              'Cancelled')
            TabOrder = 9
          end
          object EditKSeFSContinuationToken: TEdit
            Left = 285
            Top = 269
            Width = 469
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 10
          end
          object ButtonKSeFSessions: TButton
            Left = 8
            Top = 300
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 11
            OnClick = ButtonKSeFSessionsClick
          end
        end
        object GroupBox11: TGroupBox
          Left = 0
          Top = 337
          Width = 763
          Height = 92
          Align = alTop
          Caption = 'Pobranie statusu sesji'
          TabOrder = 1
          DesignSize = (
            763
            92)
          object Label43: TLabel
            Left = 8
            Top = 28
            Width = 114
            Height = 13
            Caption = 'Numer referencyjny sesji'
          end
          object EditKSeFSReferenceNumber2: TEdit
            Left = 146
            Top = 24
            Width = 607
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFSession: TButton
            Left = 8
            Top = 55
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 1
            OnClick = ButtonKSeFSessionClick
          end
        end
        object GroupBox14: TGroupBox
          Left = 0
          Top = 429
          Width = 763
          Height = 154
          Align = alTop
          Caption = 'Pobranie faktur sesji'
          TabOrder = 2
          DesignSize = (
            763
            154)
          object Label44: TLabel
            Left = 8
            Top = 90
            Width = 244
            Height = 13
            Caption = 'Token s'#322'u'#380#261'cy do pobrania kolejnej strony wynik'#243'w'
          end
          object Label45: TLabel
            Left = 8
            Top = 59
            Width = 114
            Height = 13
            Caption = 'Numer referencyjny sesji'
          end
          object Label46: TLabel
            Left = 8
            Top = 28
            Width = 69
            Height = 13
            Caption = 'Rozmiar strony'
          end
          object ButtonKSeFSessionsInvoice: TButton
            Left = 8
            Top = 117
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 0
            OnClick = ButtonKSeFSessionsInvoiceClick
          end
          object EditKSeFSContinuationToken1: TEdit
            Left = 285
            Top = 86
            Width = 468
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object EditKSeFSReferenceNumber1: TEdit
            Left = 146
            Top = 55
            Width = 607
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object SpinEditKSeFS1PageSize1: TSpinEdit
            Left = 95
            Top = 24
            Width = 87
            Height = 22
            MaxValue = 100
            MinValue = 0
            TabOrder = 3
            Value = 0
          end
        end
        object GroupBox15: TGroupBox
          Left = 0
          Top = 583
          Width = 763
          Height = 120
          Align = alTop
          Caption = 'Pobranie statusu faktury z sesji'
          TabOrder = 3
          DesignSize = (
            763
            120)
          object Label47: TLabel
            Left = 8
            Top = 28
            Width = 114
            Height = 13
            Caption = 'Numer referencyjny sesji'
          end
          object Label48: TLabel
            Left = 8
            Top = 56
            Width = 126
            Height = 13
            Caption = 'Numer referencyjny faktury'
          end
          object EditKSeFSReferenceNumber3: TEdit
            Left = 146
            Top = 24
            Width = 607
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFSessionInvoice: TButton
            Left = 8
            Top = 83
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 1
            OnClick = ButtonKSeFSessionInvoiceClick
          end
          object EditKSeFSInvoiceReferenceNumber: TEdit
            Left = 161
            Top = 52
            Width = 592
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object GroupBox16: TGroupBox
          Left = 0
          Top = 703
          Width = 763
          Height = 154
          Align = alTop
          Caption = 'Pobranie niepoprawnie przetworzonych faktur sesji'
          TabOrder = 4
          DesignSize = (
            763
            154)
          object Label49: TLabel
            Left = 8
            Top = 90
            Width = 244
            Height = 13
            Caption = 'Token s'#322'u'#380#261'cy do pobrania kolejnej strony wynik'#243'w'
          end
          object Label50: TLabel
            Left = 8
            Top = 59
            Width = 114
            Height = 13
            Caption = 'Numer referencyjny sesji'
          end
          object Label51: TLabel
            Left = 8
            Top = 28
            Width = 69
            Height = 13
            Caption = 'Rozmiar strony'
          end
          object ButtonKSeFSessionsInvoiceFailed: TButton
            Left = 8
            Top = 117
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 0
            OnClick = ButtonKSeFSessionsInvoiceFailedClick
          end
          object EditKSeFSContinuationToken2: TEdit
            Left = 285
            Top = 86
            Width = 468
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object EditKSeFSReferenceNumber4: TEdit
            Left = 146
            Top = 55
            Width = 607
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object SpinEditKSeFS1PageSize2: TSpinEdit
            Left = 95
            Top = 24
            Width = 87
            Height = 22
            MaxValue = 100
            MinValue = 0
            TabOrder = 3
            Value = 0
          end
        end
      end
    end
    object TabSheetKSeFUpo: TTabSheet
      Caption = 'KSeF2 - UPO'
      ImageIndex = 7
      TabVisible = False
      object ScrollBox6: TScrollBox
        Left = 0
        Top = 0
        Width = 784
        Height = 457
        Align = alClient
        TabOrder = 0
        object GroupBox18: TGroupBox
          Left = 0
          Top = 154
          Width = 763
          Height = 154
          Align = alTop
          Caption = 
            'Pobranie UPO faktury z sesji na podstawie numeru referencyjnego ' +
            'faktury'
          TabOrder = 0
          DesignSize = (
            763
            154)
          object Label55: TLabel
            Left = 8
            Top = 28
            Width = 114
            Height = 13
            Caption = 'Numer referencyjny sesji'
          end
          object Label56: TLabel
            Left = 8
            Top = 59
            Width = 126
            Height = 13
            Caption = 'Numer referencyjny faktury'
          end
          object Label57: TLabel
            Left = 8
            Top = 90
            Width = 65
            Height = 13
            Caption = 'Plik docelowy'
          end
          object EditKSeFUReferenceNumber1: TEdit
            Left = 146
            Top = 24
            Width = 607
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object EditKSeFUInvoiceReferenceNumber: TEdit
            Left = 161
            Top = 55
            Width = 592
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFUPobierz1: TButton
            Left = 8
            Top = 117
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 2
            OnClick = ButtonKSeFUPobierz1Click
          end
          object FileNameEditKSeFUFile1: TEdit
            Left = 89
            Top = 86
            Width = 638
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Text = 'upo.xml'
          end
          object ButtonFileNameEditKSeFUFile1: TButton
            Left = 728
            Top = 86
            Width = 24
            Height = 20
            Caption = '...'
            TabOrder = 4
            OnClick = ButtonFileNameEditKSeFUFile1Click
          end
        end
        object GroupBox17: TGroupBox
          Left = 0
          Top = 0
          Width = 763
          Height = 154
          Align = alTop
          Caption = 'Pobranie UPO faktury z sesji na podstawie numeru KSeF'
          TabOrder = 1
          DesignSize = (
            763
            154)
          object Label52: TLabel
            Left = 8
            Top = 28
            Width = 114
            Height = 13
            Caption = 'Numer referencyjny sesji'
          end
          object Label53: TLabel
            Left = 8
            Top = 59
            Width = 95
            Height = 13
            Caption = 'Numer KSeF faktury'
          end
          object Label54: TLabel
            Left = 8
            Top = 90
            Width = 65
            Height = 13
            Caption = 'Plik docelowy'
          end
          object EditKSeFUReferenceNumber: TEdit
            Left = 146
            Top = 24
            Width = 607
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object EditKSeFUKSefNumber: TEdit
            Left = 121
            Top = 55
            Width = 632
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFUPobierz: TButton
            Left = 8
            Top = 117
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 2
            OnClick = ButtonKSeFUPobierzClick
          end
          object FileNameEditKSeFUFile: TEdit
            Left = 89
            Top = 86
            Width = 638
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Text = 'upo.xml'
          end
          object ButtonFileNameEditKSeFUFile: TButton
            Left = 728
            Top = 86
            Width = 24
            Height = 20
            Caption = '...'
            TabOrder = 4
            OnClick = ButtonFileNameEditKSeFUFileClick
          end
        end
        object GroupBox19: TGroupBox
          Left = 0
          Top = 308
          Width = 763
          Height = 154
          Align = alTop
          Caption = 'Pobranie UPO dla sesji'
          TabOrder = 2
          DesignSize = (
            763
            154)
          object Label58: TLabel
            Left = 8
            Top = 28
            Width = 114
            Height = 13
            Caption = 'Numer referencyjny sesji'
          end
          object Label61: TLabel
            Left = 8
            Top = 59
            Width = 117
            Height = 13
            Caption = 'Numer referencyjny UPO'
          end
          object Label62: TLabel
            Left = 8
            Top = 90
            Width = 65
            Height = 13
            Caption = 'Plik docelowy'
          end
          object EditKSeFUReferenceNumber2: TEdit
            Left = 146
            Top = 24
            Width = 607
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object EditKSeFUUpoReferenceNumber2: TEdit
            Left = 148
            Top = 55
            Width = 605
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFUPobierz2: TButton
            Left = 8
            Top = 117
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 2
            OnClick = ButtonKSeFUPobierz2Click
          end
          object FileNameEditKSeFUFile2: TEdit
            Left = 89
            Top = 86
            Width = 638
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Text = 'upo.xml'
          end
          object ButtonFileNameEditKSeFUFile2: TButton
            Left = 728
            Top = 86
            Width = 24
            Height = 20
            Caption = '...'
            TabOrder = 4
            OnClick = ButtonFileNameEditKSeFUFile2Click
          end
        end
      end
    end
    object TabSheetKSeFDownload: TTabSheet
      Caption = 'KSeF2 - Pobieranie faktur'
      ImageIndex = 8
      TabVisible = False
      object ScrollBox8: TScrollBox
        Left = 0
        Top = 0
        Width = 784
        Height = 457
        Align = alClient
        TabOrder = 0
        object GroupBox22: TGroupBox
          Left = 0
          Top = 0
          Width = 763
          Height = 123
          Align = alTop
          Caption = 'Pobranie faktury po numerze KSeF'
          TabOrder = 0
          DesignSize = (
            763
            123)
          object Label74: TLabel
            Left = 8
            Top = 28
            Width = 95
            Height = 13
            Caption = 'Numer KSeF faktury'
          end
          object Label75: TLabel
            Left = 8
            Top = 59
            Width = 65
            Height = 13
            Caption = 'Plik docelowy'
          end
          object EditKSeFDKsefNumber: TEdit
            Left = 121
            Top = 24
            Width = 632
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object FileNameEditKSeFDOutFile: TEdit
            Left = 89
            Top = 55
            Width = 632
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFDDownload: TButton
            Left = 8
            Top = 86
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 2
            OnClick = ButtonKSeFDDownloadClick
          end
          object ButtonFileNameEditKSeFDOutFile: TButton
            Left = 728
            Top = 54
            Width = 24
            Height = 20
            Caption = '...'
            TabOrder = 3
            OnClick = ButtonFileNameEditKSeFDOutFileClick
          end
        end
        object GroupBox25: TGroupBox
          Left = 0
          Top = 123
          Width = 763
          Height = 511
          Align = alTop
          Caption = 'Filtr'
          TabOrder = 1
          DesignSize = (
            763
            511)
          object Label76: TLabel
            Left = 8
            Top = 28
            Width = 64
            Height = 13
            Caption = 'Typ podmiotu'
          end
          object Label80: TLabel
            Left = 8
            Top = 134
            Width = 95
            Height = 13
            Caption = 'Numer KSeF faktury'
          end
          object Label90: TLabel
            Left = 8
            Top = 480
            Width = 119
            Height = 13
            Caption = 'Czy faktura ma za'#322#261'cznik'
          end
          object Label95: TLabel
            Left = 8
            Top = 165
            Width = 182
            Height = 13
            Caption = 'Numer faktury nadany przez wystawc'#281
          end
          object Label9: TLabel
            Left = 8
            Top = 360
            Width = 69
            Height = 13
            Caption = 'Rodzaje faktur'
          end
          object ComboBoxKSeFDFSubjectType: TComboBox
            Left = 90
            Top = 24
            Width = 180
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = 'Subject1'
            Items.Strings = (
              'Subject1'
              'Subject2'
              'Subject3'
              'SubjectAuthorized')
          end
          object GroupBox26: TGroupBox
            Left = 8
            Top = 55
            Width = 745
            Height = 66
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Typ i zakres dat, wed'#322'ug kt'#243'rego maj'#261' by'#263' filtrowane faktury'
            TabOrder = 1
            object Label77: TLabel
              Left = 8
              Top = 20
              Width = 41
              Height = 13
              Caption = 'Typ daty'
            end
            object Label78: TLabel
              Left = 224
              Top = 20
              Width = 12
              Height = 13
              Caption = 'od'
            end
            object Label79: TLabel
              Left = 391
              Top = 20
              Width = 12
              Height = 13
              Caption = 'do'
            end
            object ComboBoxKSeFDFDateType: TComboBox
              Left = 60
              Top = 16
              Width = 156
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = 'Issue'
              Items.Strings = (
                'Issue'
                'Invoicing'
                'PermanentStorage')
            end
            object DateTimePickerKSeFDFFrom: TDateTimePicker
              Left = 246
              Top = 16
              Width = 137
              Height = 23
              Date = 45964.671635543980000000
              Time = 45964.671635543980000000
              TabOrder = 1
            end
            object DateTimePickerKSeFDFTo: TDateTimePicker
              Left = 413
              Top = 16
              Width = 137
              Height = 23
              Date = 45964.671635694450000000
              Time = 45964.671635694450000000
              ShowCheckbox = True
              Checked = False
              TabOrder = 2
            end
            object CheckBoxKSeFDFRestrictToHwm: TCheckBox
              Left = 8
              Top = 39
              Width = 654
              Height = 19
              Caption = 
                'Ograniczy'#263' filtrowanie (zakres dateRange.to) do warto'#347'ci Permane' +
                'ntStorageHwmDate (tylko dla typu PermanentStorage)'
              TabOrder = 3
            end
          end
          object EditKSeFDFKsefNumber: TEdit
            Left = 121
            Top = 130
            Width = 632
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object GroupBox27: TGroupBox
            Left = 8
            Top = 192
            Width = 745
            Height = 59
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Filtr kwotowy '#8211' brutto, netto lub VAT (z warto'#347'ci'#261')'
            TabOrder = 3
            object Label81: TLabel
              Left = 8
              Top = 28
              Width = 33
              Height = 13
              Caption = 'Rodzaj'
            end
            object Label82: TLabel
              Left = 160
              Top = 28
              Width = 12
              Height = 13
              Caption = 'od'
            end
            object Label83: TLabel
              Left = 310
              Top = 28
              Width = 12
              Height = 13
              Caption = 'do'
            end
            object ComboBoxKSeFDFAmountType: TComboBox
              Left = 51
              Top = 24
              Width = 101
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = 'Brutto'
              Items.Strings = (
                'Brutto'
                'Netto'
                'Vat')
            end
            object FloatSpinEditKSeFDFFrom: TSpinEdit
              Left = 182
              Top = 24
              Width = 120
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 1
              Value = 0
            end
            object FloatSpinEditKSeFDFTo: TSpinEdit
              Left = 332
              Top = 24
              Width = 120
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 2
              Value = 0
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 256
            Width = 718
            Height = 101
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 4
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 402
              Height = 101
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                402
                101)
              object Label84: TLabel
                Left = 8
                Top = 12
                Width = 75
                Height = 13
                Caption = 'Nip sprzedawcy'
              end
              object Label85: TLabel
                Left = 8
                Top = 43
                Width = 103
                Height = 13
                Caption = 'Identyfikator nabywcy'
              end
              object Label86: TLabel
                Left = 8
                Top = 74
                Width = 213
                Height = 13
                Caption = 'Kody walut (warto'#347'ci oddzielone przecinkiem)'
              end
              object EditKSeFDFSellerNip: TEdit
                Left = 99
                Top = 8
                Width = 295
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object EditKSeFDFBuyerIdentifierValue: TEdit
                Left = 247
                Top = 39
                Width = 147
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
              end
              object EditKSeFDFCurrencyCodes: TEdit
                Left = 258
                Top = 70
                Width = 136
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
              object ComboBoxKSeFDFBuyerIdentifierType: TComboBox
                Left = 133
                Top = 39
                Width = 106
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 3
                Text = '(nie okre'#347'lono)'
                Items.Strings = (
                  '(nie okre'#347'lono)'
                  'None'
                  'Other'
                  'Nip'
                  'VatUe')
              end
            end
            object Panel7: TPanel
              Left = 402
              Top = 0
              Width = 316
              Height = 101
              BevelOuter = bvNone
              TabOrder = 1
              object Label88: TLabel
                Left = 8
                Top = 43
                Width = 106
                Height = 13
                Caption = 'Czy samofakturowania'
              end
              object Label87: TLabel
                Left = 8
                Top = 12
                Width = 116
                Height = 13
                Caption = 'Tryb wystawienia faktury'
              end
              object Label89: TLabel
                Left = 8
                Top = 74
                Width = 74
                Height = 13
                Caption = 'Typ dokumentu'
              end
              object ComboBoxKSeFDFIsSelfInvoicing: TComboBox
                Left = 136
                Top = 39
                Width = 108
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = '(nie okre'#347'lono)'
                Items.Strings = (
                  '(nie okre'#347'lono)'
                  'Nie'
                  'Tak')
              end
              object ComboBoxKSeFDFInvoicingMode: TComboBox
                Left = 145
                Top = 8
                Width = 108
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 1
                Text = '(nie okre'#347'lono)'
                Items.Strings = (
                  '(nie okre'#347'lono)'
                  'Online'
                  'Offline')
              end
              object ComboBoxKSeFDFFormType: TComboBox
                Left = 99
                Top = 70
                Width = 124
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 2
                Text = '(nie okre'#347'lono)'
                Items.Strings = (
                  '(nie okre'#347'lono)'
                  'FA - Faktura VAT'
                  'PEF - Faktura PEF'
                  'RR - Faktura RR')
              end
            end
          end
          object CheckGroupKSeFDFInvoiceType: TCheckListBox
            Left = 8
            Top = 376
            Width = 745
            Height = 92
            Anchors = [akLeft, akTop, akRight]
            Columns = 2
            ItemHeight = 13
            Items.Strings = (
              'Vat - (FA) Podstawowa'
              'Zal - (FA) Zaliczkowa'
              'Kor - (FA) Koryguj'#261'ca'
              'Roz - (FA) Rozliczeniowa'
              'Upr - (FA) Uproszczona'
              'KorZal - (FA) Koryguj'#261'ca faktur'#281' zaliczkow'#261
              'KorRoz - (FA) Koryguj'#261'ca faktur'#281' rozliczeniow'#261
              'VatPef - (PEF) Podstawowowa'
              'VatPefSp - (PEF) Specjalizowana'
              'KorPef - (PEF) Koryguj'#261'ca'
              'VatRr - (RR) Podstawowa'
              'KorVatRr - (RR) Koryguj'#261'ca')
            TabOrder = 5
          end
          object ComboBoxKSeFDFHasAttachment: TComboBox
            Left = 145
            Top = 476
            Width = 108
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 6
            Text = '(nie okre'#347'lono)'
            Items.Strings = (
              '(nie okre'#347'lono)'
              'Tak'
              'Nie')
          end
          object ButtonKSeFDFClear: TButton
            Left = 673
            Top = 24
            Width = 77
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Czy'#347#263' filtr'
            TabOrder = 7
            OnClick = ButtonKSeFDFClearClick
          end
          object EditKSeFDFInvoiceNumber: TEdit
            Left = 219
            Top = 161
            Width = 534
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
        end
        object GroupBox28: TGroupBox
          Left = 0
          Top = 634
          Width = 763
          Height = 117
          Align = alTop
          Caption = 'Pobranie listy metadanych faktur'
          TabOrder = 2
          object Label91: TLabel
            Left = 8
            Top = 28
            Width = 207
            Height = 13
            Caption = 'Indeks strony wynik'#243'w (0 = pierwsza strona)'
          end
          object Label92: TLabel
            Left = 352
            Top = 28
            Width = 186
            Height = 13
            Caption = 'Rozmiar strony wynik'#243'w (0 = domy'#347'lnie)'
          end
          object Label120: TLabel
            Left = 8
            Top = 59
            Width = 53
            Height = 13
            Caption = 'Sortowanie'
          end
          object SpinEditKSeFDPageOffset: TSpinEdit
            Left = 248
            Top = 24
            Width = 80
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 0
          end
          object SpinEditKSeFDPageSize: TSpinEdit
            Left = 575
            Top = 24
            Width = 80
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object ButtonKSeFDMetadata: TButton
            Left = 8
            Top = 82
            Width = 216
            Height = 25
            Caption = 'Pobierz stron'#281' metadanych wg filtra'
            TabOrder = 2
            OnClick = ButtonKSeFDMetadataClick
          end
          object ComboBoxKSeFDSortOrder: TComboBox
            Left = 75
            Top = 55
            Width = 197
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 3
            Text = '(nie okre'#347'lono)'
            Items.Strings = (
              '(nie okre'#347'lono)'
              'Sortowanie rosn'#261'co'
              'Sortowanie malej'#261'co')
          end
        end
        object GroupBox29: TGroupBox
          Left = 0
          Top = 751
          Width = 763
          Height = 61
          Align = alTop
          Caption = 'Eksport paczki faktur'
          TabOrder = 3
          object ButtonKSeFDExport: TButton
            Left = 8
            Top = 24
            Width = 160
            Height = 25
            Caption = 'Eksportuj paczk'#281' wg filtra'
            TabOrder = 0
            OnClick = ButtonKSeFDExportClick
          end
        end
        object GroupBox30: TGroupBox
          Left = 0
          Top = 812
          Width = 763
          Height = 92
          Align = alTop
          Caption = 'Pobranie statusu eksportu paczki faktur'
          TabOrder = 4
          DesignSize = (
            763
            92)
          object Label93: TLabel
            Left = 8
            Top = 28
            Width = 131
            Height = 13
            Caption = 'Numer referencyjny operacji'
          end
          object ButtonKSeFDStatus: TButton
            Left = 8
            Top = 55
            Width = 184
            Height = 25
            Caption = 'Pobierz status eksportu paczki'
            TabOrder = 0
            OnClick = ButtonKSeFDStatusClick
          end
          object EditKSeFDEOperationReferenceNumber: TEdit
            Left = 166
            Top = 24
            Width = 587
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
        end
        object GroupBoxKSeFD1: TGroupBox
          Left = 0
          Top = 904
          Width = 763
          Height = 92
          Align = alTop
          Caption = 'Pobranie gotowej paczki faktur'
          Enabled = False
          TabOrder = 5
          DesignSize = (
            763
            92)
          object Label94: TLabel
            Left = 8
            Top = 28
            Width = 65
            Height = 13
            Caption = 'Plik docelowy'
          end
          object FileNameEditKSeFDEFileName: TEdit
            Left = 89
            Top = 24
            Width = 632
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFDEDownload: TButton
            Left = 8
            Top = 55
            Width = 147
            Height = 25
            Caption = 'Pobierz gotow'#261' paczk'#281
            TabOrder = 1
            OnClick = ButtonKSeFDEDownloadClick
          end
          object ButtonFileNameEditKSeFDEFileName: TButton
            Left = 728
            Top = 22
            Width = 24
            Height = 20
            Caption = '...'
            TabOrder = 2
            OnClick = ButtonFileNameEditKSeFDEFileNameClick
          end
        end
      end
    end
    object TabSheetKSeFToken: TTabSheet
      Caption = 'KSeF2 - Tokent KSeF'
      ImageIndex = 9
      TabVisible = False
      object ScrollBox9: TScrollBox
        Left = 0
        Top = 0
        Width = 784
        Height = 457
        Align = alClient
        TabOrder = 0
        object GroupBox31: TGroupBox
          Left = 0
          Top = 0
          Width = 763
          Height = 170
          Align = alTop
          Caption = 'Wygenerowanie nowego tokena'
          TabOrder = 0
          DesignSize = (
            763
            170)
          object Label96: TLabel
            Left = 8
            Top = 106
            Width = 57
            Height = 13
            Caption = 'Opis tokena'
          end
          object Label10: TLabel
            Left = 8
            Top = 16
            Width = 169
            Height = 13
            Caption = 'Uprawnienia generowanego tokena'
          end
          object CheckGroupKSeFTKPermisions: TCheckListBox
            Left = 2
            Top = 31
            Width = 759
            Height = 66
            Columns = 3
            ItemHeight = 13
            Items.Strings = (
              'InvoiceRead'
              'InvoiceWrite'
              'CredentialsRead'
              'CredentialsManage'
              'SubunitManage'
              'EnforcementOperations')
            TabOrder = 0
          end
          object EditKSeFTKDescription: TEdit
            Left = 79
            Top = 102
            Width = 631
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFTKGenerate: TButton
            Left = 8
            Top = 133
            Width = 116
            Height = 25
            Caption = 'Wygeneruj token'
            TabOrder = 2
            OnClick = ButtonKSeFTKGenerateClick
          end
        end
        object GroupBox32: TGroupBox
          Left = 0
          Top = 170
          Width = 763
          Height = 213
          Align = alTop
          Caption = 'Pobranie listy wygenerowanych token'#243'w'
          TabOrder = 1
          DesignSize = (
            763
            213)
          object Label97: TLabel
            Left = 8
            Top = 87
            Width = 57
            Height = 13
            Caption = 'Opis tokena'
          end
          object Label98: TLabel
            Left = 8
            Top = 118
            Width = 72
            Height = 13
            Caption = 'Tw'#243'rca tokenu'
          end
          object Label99: TLabel
            Left = 488
            Top = 118
            Width = 99
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Rodzaj identyfikatora'
          end
          object Label100: TLabel
            Left = 8
            Top = 149
            Width = 69
            Height = 13
            Caption = 'Rozmiar strony'
          end
          object Label101: TLabel
            Left = 181
            Top = 149
            Width = 244
            Height = 13
            Caption = 'Token s'#322'u'#380#261'cy do pobrania kolejnej strony wynik'#243'w'
          end
          object Label11: TLabel
            Left = 8
            Top = 16
            Width = 140
            Height = 13
            Caption = 'Status token'#243'w do zwr'#243'cenia'
          end
          object CheckGroupKSeFTKStatus: TCheckListBox
            Left = 2
            Top = 32
            Width = 759
            Height = 49
            Columns = 3
            ItemHeight = 13
            Items.Strings = (
              'Pending'
              'Active'
              'Revoking'
              'Revoked'
              'Failed')
            TabOrder = 0
          end
          object EditKSeFTKDescrFlt: TEdit
            Left = 79
            Top = 83
            Width = 631
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object EditKSeFTKAuthorIdentifier: TEdit
            Left = 93
            Top = 114
            Width = 387
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object ComboBoxKSeFTKAuthorIdentifierType: TComboBox
            Left = 607
            Top = 114
            Width = 103
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 3
            Text = '(nie okre'#347'lono)'
            Items.Strings = (
              '(nie okre'#347'lono)'
              'Nip'
              'Pesel'
              'Fingerprint')
          end
          object SpinEditKSeFTKPageSize: TSpinEdit
            Left = 95
            Top = 145
            Width = 78
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 4
            Value = 0
          end
          object EditKSeFTKContinuationToken: TEdit
            Left = 458
            Top = 145
            Width = 252
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object ButtonKSeFTKList: TButton
            Left = 8
            Top = 176
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 6
            OnClick = ButtonKSeFTKListClick
          end
        end
        object GroupBox33: TGroupBox
          Left = 0
          Top = 383
          Width = 763
          Height = 92
          Align = alTop
          Caption = 'Pobranie statusu tokena'
          TabOrder = 2
          DesignSize = (
            763
            92)
          object Label102: TLabel
            Left = 8
            Top = 28
            Width = 127
            Height = 13
            Caption = 'Numer referencyjny tokena'
          end
          object EditKSeFTKSReferenceNumber: TEdit
            Left = 160
            Top = 24
            Width = 550
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFTKStatus: TButton
            Left = 8
            Top = 55
            Width = 65
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 1
            OnClick = ButtonKSeFTKStatusClick
          end
        end
        object GroupBox34: TGroupBox
          Left = 0
          Top = 475
          Width = 763
          Height = 92
          Align = alTop
          Caption = 'Uniewa'#380'nienie tokena'
          TabOrder = 3
          DesignSize = (
            763
            92)
          object Label103: TLabel
            Left = 8
            Top = 28
            Width = 127
            Height = 13
            Caption = 'Numer referencyjny tokena'
          end
          object EditKSeFTKDReferenceNumber: TEdit
            Left = 160
            Top = 24
            Width = 550
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFTKDelete: TButton
            Left = 8
            Top = 55
            Width = 53
            Height = 25
            Caption = 'Usu'#324
            TabOrder = 1
            OnClick = ButtonKSeFTKDeleteClick
          end
        end
      end
    end
    object TabSheetKSeF2TestData: TTabSheet
      Caption = 'KSeF2 - Dane testowe'
      ImageIndex = 10
      TabVisible = False
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 784
        Height = 457
        Align = alClient
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 763
          Height = 185
          Align = alTop
          TabOrder = 0
          DesignSize = (
            763
            185)
          object Label12: TLabel
            Left = 8
            Top = 28
            Width = 50
            Height = 13
            Caption = 'subjectNip'
          end
          object Label13: TLabel
            Left = 8
            Top = 59
            Width = 58
            Height = 13
            Caption = 'subjectType'
          end
          object Label14: TLabel
            Left = 8
            Top = 90
            Width = 51
            Height = 13
            Caption = 'description'
          end
          object Label15: TLabel
            Left = 8
            Top = 121
            Width = 59
            Height = 13
            Caption = 'createdDate'
          end
          object GroupBox2: TGroupBox
            Left = 489
            Top = 15
            Width = 272
            Height = 168
            Align = alRight
            Caption = 'subunits'
            TabOrder = 0
            object StringGridDTUPSubunits: TStringGrid
              Left = 2
              Top = 15
              Width = 268
              Height = 151
              Align = alClient
              ColCount = 2
              FixedCols = 0
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
              TabOrder = 0
            end
          end
          object EditKSeFDTUPSubjectNip: TEdit
            Left = 73
            Top = 24
            Width = 365
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ComboBoxKSeFDTUPSubjectType: TComboBox
            Left = 78
            Top = 55
            Width = 165
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 2
            Text = 'EnforcementAuthority'
            Items.Strings = (
              'EnforcementAuthority'
              'VatGroup'
              'JST')
          end
          object EditKSeFDTUPDescription: TEdit
            Left = 75
            Top = 86
            Width = 363
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object DateTimePickerKSeFDTUPCreationDate: TDateTimePicker
            Left = 79
            Top = 117
            Width = 137
            Height = 23
            Date = 45964.721455289350000000
            Time = 45964.721455289350000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 4
          end
          object ButtonKSeFDTUtworzPodmiot: TButton
            Left = 8
            Top = 148
            Width = 148
            Height = 25
            Caption = 'Utw'#243'rz dane podmiotu'
            TabOrder = 5
            OnClick = ButtonKSeFDTUtworzPodmiotClick
          end
          object Button1: TButton
            Left = 656
            Top = 8
            Width = 99
            Height = 25
            Caption = 'Dodaj subunit'
            TabOrder = 6
            OnClick = Button1Click
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 246
          Width = 763
          Height = 212
          Align = alTop
          Caption = 'Utworzenie osoby fizycznej'
          TabOrder = 1
          DesignSize = (
            763
            212)
          object Label16: TLabel
            Left = 8
            Top = 28
            Width = 14
            Height = 13
            Caption = 'nip'
          end
          object Label17: TLabel
            Left = 8
            Top = 59
            Width = 25
            Height = 13
            Caption = 'pesel'
          end
          object Label59: TLabel
            Left = 8
            Top = 117
            Width = 51
            Height = 13
            Caption = 'description'
          end
          object Label104: TLabel
            Left = 8
            Top = 148
            Width = 59
            Height = 13
            Caption = 'createdDate'
          end
          object EditKSeFDTUONip: TEdit
            Left = 33
            Top = 24
            Width = 720
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object EditKSeFDTUODescription: TEdit
            Left = 75
            Top = 113
            Width = 678
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object DateTimePickerKSeFDTUOCreationDate: TDateTimePicker
            Left = 79
            Top = 144
            Width = 137
            Height = 23
            Date = 45964.721456840280000000
            Time = 45964.721456840280000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 2
          end
          object ButtonKSeFDTUtworzOsobe: TButton
            Left = 8
            Top = 175
            Width = 143
            Height = 25
            Caption = 'Utw'#243'rz osob'#281' fizyczn'#261
            TabOrder = 3
            OnClick = ButtonKSeFDTUtworzOsobeClick
          end
          object EditKSeFDTUOPesel: TEdit
            Left = 43
            Top = 55
            Width = 710
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object CheckBoxKSeFTDUOIsBailiff: TCheckBox
            Left = 8
            Top = 86
            Width = 56
            Height = 19
            Caption = 'isBailiff'
            TabOrder = 5
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 185
          Width = 763
          Height = 61
          Align = alTop
          Caption = 'Usuni'#281'cie podmiotu'
          TabOrder = 2
          DesignSize = (
            763
            61)
          object Label105: TLabel
            Left = 8
            Top = 28
            Width = 50
            Height = 13
            Caption = 'subjectNip'
          end
          object EditKSeFDTUsPSubjectNip: TEdit
            Left = 73
            Top = 24
            Width = 568
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFDTUsunPodmiot: TButton
            Left = 648
            Top = 24
            Width = 102
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Usu'#324' podmiot'
            TabOrder = 1
            OnClick = ButtonKSeFDTUsunPodmiotClick
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 458
          Width = 763
          Height = 61
          Align = alTop
          Caption = 'Usuni'#281'cie osoby fizycznej'
          TabOrder = 3
          DesignSize = (
            763
            61)
          object Label106: TLabel
            Left = 8
            Top = 28
            Width = 14
            Height = 13
            Caption = 'nip'
          end
          object EditKSeFDTUsONip: TEdit
            Left = 33
            Top = 24
            Width = 576
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFDTUsunOsobe: TButton
            Left = 617
            Top = 24
            Width = 133
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Usu'#324' osob'#281' fizyczn'#261
            TabOrder = 1
            OnClick = ButtonKSeFDTUsunOsobeClick
          end
        end
      end
    end
    object TabSheetKSeF2PublicKeys: TTabSheet
      Caption = 'KSeF2 - Klucze publiczne'
      ImageIndex = 11
      TabVisible = False
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 94
        Align = alTop
        Caption = 'Klucze publiczne'
        TabOrder = 0
        object Label107: TLabel
          Left = 8
          Top = 28
          Width = 36
          Height = 13
          Caption = 'Bramka'
        end
        object ButtonKSeFGetPublicKeyCertificates: TButton
          Left = 240
          Top = 24
          Width = 226
          Height = 25
          Caption = 'Pobierz certyfikaty kluczy publicznych'
          TabOrder = 0
          OnClick = ButtonKSeFGetPublicKeyCertificatesClick
        end
        object ComboBoxKSeFPKCertBramka: TComboBox
          Left = 56
          Top = 24
          Width = 176
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 2
          TabOrder = 1
          Text = 'Testowa'
          Items.Strings = (
            'Produkcyjna'
            'Demo'
            'Testowa')
        end
        object ButtonKSeFLoadKeyToken: TButton
          Left = 8
          Top = 57
          Width = 266
          Height = 25
          Caption = 'Wczytaj z pliku klucz szyfrowania tokena KSeF'
          TabOrder = 2
          OnClick = ButtonKSeFLoadKeyTokenClick
        end
        object ButtonKSeFLoadKeyKeyEx: TButton
          Left = 282
          Top = 57
          Width = 317
          Height = 25
          Caption = 'Wczytaj z pliku klucz szyfrowania kluczy symetrycznych'
          TabOrder = 3
          OnClick = ButtonKSeFLoadKeyKeyExClick
        end
      end
    end
    object TabSheetKSeF2VerLinks: TTabSheet
      Caption = 'KSeF2 - Linki weryfikacyjne'
      ImageIndex = 12
      TabVisible = False
      object ScrollBox10: TScrollBox
        Left = 0
        Top = 0
        Width = 784
        Height = 457
        Align = alClient
        TabOrder = 0
        object GroupBox35: TGroupBox
          Left = 0
          Top = 0
          Width = 763
          Height = 216
          Align = alTop
          Caption = 'KOD I '#8211' Weryfikacja i pobieranie faktury'
          TabOrder = 0
          DesignSize = (
            763
            216)
          object Label108: TLabel
            Left = 8
            Top = 28
            Width = 36
            Height = 13
            Caption = 'Bramka'
          end
          object Label109: TLabel
            Left = 8
            Top = 90
            Width = 77
            Height = 13
            Caption = 'NIP sprzedawcy'
          end
          object Label110: TLabel
            Left = 8
            Top = 59
            Width = 169
            Height = 13
            Caption = 'Data wystawienia faktury (pole P_1)'
          end
          object Label111: TLabel
            Left = 8
            Top = 121
            Width = 167
            Height = 13
            Caption = 'Skr'#243't SHA-256  w formacie Base64'
          end
          object Label112: TLabel
            Left = 8
            Top = 185
            Width = 99
            Height = 13
            Caption = 'Weygenerowany link'
          end
          object ComboBoxKSeFLBramka1: TComboBox
            Left = 56
            Top = 24
            Width = 219
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 2
            TabOrder = 0
            Text = 'Testowa'
            Items.Strings = (
              'Produkcyjna'
              'Demo'
              'Testowa')
          end
          object EditKSeFLNIP1: TEdit
            Left = 99
            Top = 86
            Width = 192
            Height = 21
            TabOrder = 1
          end
          object DateTimePickerKSeFLDataWyst1: TDateTimePicker
            Left = 202
            Top = 55
            Width = 83
            Height = 23
            Date = 45981.768886030090000000
            Time = 45981.768886030090000000
            TabOrder = 2
          end
          object EditKSeFLHash1: TEdit
            Left = 202
            Top = 117
            Width = 455
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object ButtonKSeFLHashGet1: TButton
            Left = 660
            Top = 117
            Width = 96
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Oblicz z pliku'
            TabOrder = 4
            OnClick = ButtonKSeFLHashGet1Click
          end
          object ButtonKSeFLGen1: TButton
            Left = 8
            Top = 148
            Width = 67
            Height = 25
            Caption = 'Generuj'
            TabOrder = 5
            OnClick = ButtonKSeFLGen1Click
          end
          object EditKSeFLLink: TEdit
            Left = 126
            Top = 181
            Width = 627
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
          end
        end
        object GroupBox36: TGroupBox
          Left = 0
          Top = 216
          Width = 763
          Height = 278
          Align = alTop
          Caption = 'KOD II '#8211' Weryfikacja certyfikatu'
          TabOrder = 1
          DesignSize = (
            763
            278)
          object Label113: TLabel
            Left = 8
            Top = 28
            Width = 36
            Height = 13
            Caption = 'Bramka'
          end
          object Label114: TLabel
            Left = 8
            Top = 121
            Width = 77
            Height = 13
            Caption = 'NIP sprzedawcy'
          end
          object Label115: TLabel
            Left = 8
            Top = 152
            Width = 167
            Height = 13
            Caption = 'Skr'#243't SHA-256  w formacie Base64'
          end
          object Label116: TLabel
            Left = 8
            Top = 247
            Width = 99
            Height = 13
            Caption = 'Weygenerowany link'
          end
          object Label117: TLabel
            Left = 8
            Top = 59
            Width = 58
            Height = 13
            Caption = 'Identyfikator'
          end
          object Label118: TLabel
            Left = 8
            Top = 90
            Width = 99
            Height = 13
            Caption = 'Rodzaj identyfikatora'
          end
          object Label119: TLabel
            Left = 8
            Top = 183
            Width = 44
            Height = 13
            Caption = 'Certyfikat'
          end
          object ComboBoxKSeFLBramka2: TComboBox
            Left = 56
            Top = 24
            Width = 219
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 2
            TabOrder = 0
            Text = 'Testowa'
            Items.Strings = (
              'Produkcyjna'
              'Demo'
              'Testowa')
          end
          object EditKSeFLNIP2: TEdit
            Left = 99
            Top = 117
            Width = 192
            Height = 21
            TabOrder = 1
          end
          object EditKSeFLHash2: TEdit
            Left = 202
            Top = 148
            Width = 463
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object ButtonKSeFLHashGet2: TButton
            Left = 660
            Top = 148
            Width = 96
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Oblicz z pliku'
            TabOrder = 3
            OnClick = ButtonKSeFLHashGet2Click
          end
          object ButtonKSeFLGen2: TButton
            Left = 8
            Top = 210
            Width = 67
            Height = 25
            Caption = 'Generuj'
            TabOrder = 4
            OnClick = ButtonKSeFLGen2Click
          end
          object EditKSeFLLink1: TEdit
            Left = 126
            Top = 243
            Width = 627
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object EditKSeFLIdentifier2: TEdit
            Left = 83
            Top = 55
            Width = 192
            Height = 21
            TabOrder = 6
          end
          object ComboBoxKSeFLIdentifierType2: TComboBox
            Left = 127
            Top = 86
            Width = 148
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 2
            TabOrder = 7
            Text = 'Nip'
            Items.Strings = (
              'None'
              'AllPartners'
              'Nip'
              'InternalId'
              'NipVatUe'
              'PeppolId')
          end
          object ComboBoxLCertificate2: TComboBox
            Left = 67
            Top = 179
            Width = 601
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 8
          end
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 300
    Top = 72
  end
  object SaveDialog1: TSaveDialog
    Left = 332
    Top = 72
  end
  object PopupMenuSigners: TPopupMenu
    Left = 413
    Top = 77
  end
  object PopupMenuKeys: TPopupMenu
    Left = 448
    Top = 77
  end
  object OpenDialogKey: TOpenDialog
    Title = 'Wybierz plik certyfikatu klucza publicznego'
    Left = 296
    Top = 109
  end
  object OpenDialogXML: TOpenDialog
    Filter = 'Pliki XML (*.xml)|*.xml|Wszystkie pliki (*.*)|*.*'
    Left = 336
    Top = 109
  end
end
