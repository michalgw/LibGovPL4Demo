object Form1: TForm1
  Left = 137
  Top = 48
  Caption = 'LibGovPL 4 Demo'
  ClientHeight = 676
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 527
    Width = 698
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 525
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 698
    Height = 527
    ActivePage = TabSheetKSeFBatch
    Align = alClient
    MultiLine = True
    TabOrder = 0
    ExplicitHeight = 525
    object TabSheetSetup: TTabSheet
      Caption = 'Setup'
      ExplicitHeight = 497
      object Panel1: TScrollBox
        Left = 0
        Top = 0
        Width = 690
        Height = 449
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 447
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 55
          Height = 13
          Caption = 'HTTP Client'
        end
        object Label2: TLabel
          Left = 0
          Top = 23
          Width = 123
          Height = 13
          Caption = 'Random nmber generator'
        end
        object Label11: TLabel
          Left = 0
          Top = 46
          Width = 77
          Height = 13
          Caption = 'Base64 Encoder'
        end
        object Label3: TLabel
          Left = 0
          Top = 69
          Width = 48
          Height = 13
          Caption = 'MD5 Hash'
        end
        object Label4: TLabel
          Left = 0
          Top = 92
          Width = 53
          Height = 13
          Caption = 'SHA1 Hash'
        end
        object Label5: TLabel
          Left = 0
          Top = 115
          Width = 69
          Height = 13
          Caption = 'SHA-256 Hash'
        end
        object Label6: TLabel
          Left = 0
          Top = 138
          Width = 30
          Height = 13
          Caption = 'Signer'
        end
        object Label7: TLabel
          Left = 0
          Top = 161
          Width = 86
          Height = 13
          Caption = 'eDeklaracja SOAP'
        end
        object Label8: TLabel
          Left = 0
          Top = 184
          Width = 48
          Height = 13
          Caption = 'XML C14N'
        end
        object Label9: TLabel
          Left = 0
          Top = 207
          Width = 57
          Height = 13
          Caption = 'XML Reader'
        end
        object Label10: TLabel
          Left = 0
          Top = 230
          Width = 31
          Height = 13
          Caption = 'Zip file'
        end
        object Label12: TLabel
          Left = 0
          Top = 253
          Width = 91
          Height = 13
          Caption = 'AES256 Encryption'
        end
        object Label13: TLabel
          Left = 0
          Top = 276
          Width = 74
          Height = 13
          Caption = 'RSA encryption'
        end
        object Label24: TLabel
          Left = 0
          Top = 299
          Width = 97
          Height = 13
          Caption = 'XAdES - Rodzaj SHA'
        end
        object Label25: TLabel
          Left = 0
          Top = 322
          Width = 127
          Height = 13
          Caption = 'XAdES - Do'#322#261'cz dat'#281' i czas'
        end
        object Label26: TLabel
          Left = 0
          Top = 339
          Width = 133
          Height = 13
          Caption = 'eDeklaracja - kanonizuj XML'
        end
        object Label33: TLabel
          Left = 0
          Top = 356
          Width = 136
          Height = 13
          Caption = 'JPK - Klucz RSA produkcyjny'
        end
        object Label34: TLabel
          Left = 0
          Top = 379
          Width = 116
          Height = 13
          Caption = 'JPK - Klucz RSA testowy'
        end
        object Label55: TLabel
          Left = 0
          Top = 402
          Width = 142
          Height = 13
          Caption = 'KSeF - klucz RSA produkcyjny'
        end
        object Label56: TLabel
          Left = 0
          Top = 425
          Width = 109
          Height = 13
          Caption = 'KSeF - klucz RSA demo'
        end
        object Label57: TLabel
          Left = 0
          Top = 448
          Width = 117
          Height = 13
          Caption = 'KSeF - klucz RSA tetowy'
        end
        object ComboBoxHTTPCli: TComboBox
          Left = 361
          Top = 0
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
        object ComboBoxRandGen: TComboBox
          Left = 361
          Top = 23
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
        end
        object ComboBoxBase64: TComboBox
          Left = 361
          Top = 46
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
        end
        object ComboBoxMD5: TComboBox
          Left = 361
          Top = 69
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
        end
        object ComboBoxSHA1: TComboBox
          Left = 361
          Top = 92
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
        end
        object ComboBoxSHA256: TComboBox
          Left = 361
          Top = 115
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 5
        end
        object ComboBoxSign: TComboBox
          Left = 361
          Top = 138
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 6
        end
        object ComboBoxEDek: TComboBox
          Left = 361
          Top = 161
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
        end
        object ComboBoxXMLC14N: TComboBox
          Left = 361
          Top = 184
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 8
        end
        object ComboBoxXMLRead: TComboBox
          Left = 361
          Top = 207
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 9
        end
        object ComboBoxZip: TComboBox
          Left = 360
          Top = 230
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 10
        end
        object ComboBoxAES256: TComboBox
          Left = 361
          Top = 253
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 11
        end
        object ComboBoxRSAEnc: TComboBox
          Left = 361
          Top = 276
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 12
        end
        object ComboBoxXAdESSHA: TComboBox
          Left = 361
          Top = 299
          Width = 308
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 13
          Text = 'SHA256'
          Items.Strings = (
            'SHA1'
            'SHA256')
        end
        object CheckBoxXAdESCzas: TCheckBox
          Left = 361
          Top = 322
          Width = 308
          Height = 17
          TabOrder = 14
        end
        object CheckBoxEDekC14N: TCheckBox
          Left = 361
          Top = 339
          Width = 308
          Height = 17
          Checked = True
          State = cbChecked
          TabOrder = 15
        end
        object FileNameEditJPKRSAProd: TJvFilenameEdit
          Left = 361
          Top = 356
          Width = 308
          Height = 21
          FilterIndex = 0
          ButtonWidth = 23
          TabOrder = 16
          Text = '..\pem\prod.pem'
        end
        object FileNameEditJPKRSATest: TJvFilenameEdit
          Left = 361
          Top = 379
          Width = 308
          Height = 21
          FilterIndex = 0
          ButtonWidth = 23
          TabOrder = 17
          Text = '..\pem\test.pem'
        end
        object FileNameEditKSeFRSAProd: TJvFilenameEdit
          Left = 361
          Top = 402
          Width = 308
          Height = 21
          FilterIndex = 0
          ButtonWidth = 23
          TabOrder = 18
          Text = '..\pem\ksefprod.pem'
        end
        object FileNameEditKSeFRSADemo: TJvFilenameEdit
          Left = 361
          Top = 425
          Width = 308
          Height = 21
          FilterIndex = 0
          ButtonWidth = 23
          TabOrder = 19
          Text = '..\pem\ksefdemo.pem'
        end
        object FileNameEditKSeFRSATest: TJvFilenameEdit
          Left = 361
          Top = 448
          Width = 308
          Height = 21
          FilterIndex = 0
          ButtonWidth = 23
          TabOrder = 20
          Text = '..\pem\kseftest.pem'
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 449
        Width = 690
        Height = 50
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 447
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
    end
    object TabSheetCert: TTabSheet
      Caption = 'Certyfikaty'
      TabVisible = False
      ExplicitHeight = 497
      object ListViewCert: TListView
        Left = 0
        Top = 0
        Width = 690
        Height = 449
        Align = alClient
        Columns = <
          item
            Caption = 'Index'
            Width = 60
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
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitHeight = 447
      end
      object Panel3: TPanel
        Left = 0
        Top = 449
        Width = 690
        Height = 50
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 447
        object ButtonShowCert: TButton
          Left = 14
          Top = 12
          Width = 123
          Height = 25
          Caption = 'Poka'#380' szczeg'#243#322'y'
          TabOrder = 0
          OnClick = ButtonShowCertClick
        end
        object ButtonCertWybierz: TButton
          Left = 160
          Top = 12
          Width = 232
          Height = 25
          Caption = 'Wybierz certyfikat i poka'#380' informacje'
          TabOrder = 1
          OnClick = ButtonCertWybierzClick
        end
        object ButtonCertReload: TButton
          Left = 416
          Top = 12
          Width = 192
          Height = 25
          Caption = 'Od'#347'wierz list'#281' certyfikat'#243'w'
          TabOrder = 2
          OnClick = ButtonCertReloadClick
        end
      end
    end
    object TabSheetEDekPodpisCert: TTabSheet
      Caption = 'eDeklaracja podpis certyfikatem'
      TabVisible = False
      ExplicitHeight = 497
      DesignSize = (
        690
        499)
      object Label16: TLabel
        Left = 21
        Top = 19
        Width = 48
        Height = 13
        Caption = 'Certyfikat'
      end
      object Label14: TLabel
        Left = 8
        Top = 64
        Width = 67
        Height = 13
        Caption = 'Plik wej'#347'ciowy'
      end
      object Label15: TLabel
        Left = 8
        Top = 104
        Width = 65
        Height = 13
        Caption = 'Plik wynikowy'
      end
      object ComboBoxEdekCert: TComboBox
        Left = 94
        Top = 16
        Width = 584
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
      end
      object FileNameEditEDPCWej: TJvFilenameEdit
        Left = 94
        Top = 63
        Width = 584
        Height = 21
        OnAfterDialog = FileNameEditEDPCWejAcceptFileName
        Filter = 'Pliki XML|*.xml|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object FileNameEditEDPCWyj: TJvFilenameEdit
        Left = 94
        Top = 104
        Width = 584
        Height = 21
        DialogKind = dkSave
        Filter = 'Pliki XML|*.xml|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object ButtonEdekPodpiszCert: TButton
        Left = 94
        Top = 160
        Width = 75
        Height = 25
        Caption = 'Podpisz'
        TabOrder = 3
        OnClick = ButtonEdekPodpiszCertClick
      end
    end
    object TabSheetEDekPodpisAut: TTabSheet
      Caption = 'eDeklaracja podpis danymi aut.'
      TabVisible = False
      ExplicitHeight = 497
      DesignSize = (
        690
        499)
      object Label17: TLabel
        Left = 8
        Top = 177
        Width = 67
        Height = 13
        Caption = 'Plik wej'#347'ciowy'
      end
      object Label18: TLabel
        Left = 8
        Top = 217
        Width = 65
        Height = 13
        Caption = 'Plik wynikowy'
      end
      object Label19: TLabel
        Left = 8
        Top = 16
        Width = 17
        Height = 13
        Caption = 'NIP'
      end
      object Label20: TLabel
        Left = 8
        Top = 46
        Width = 20
        Height = 13
        Caption = 'Imi'#281
      end
      object Label21: TLabel
        Left = 8
        Top = 80
        Width = 44
        Height = 13
        Caption = 'Nazwisko'
      end
      object Label22: TLabel
        Left = 8
        Top = 112
        Width = 73
        Height = 13
        Caption = 'Data urodzenia'
      end
      object Label23: TLabel
        Left = 8
        Top = 144
        Width = 83
        Height = 13
        Caption = 'Kwota przychodu'
      end
      object FileNameEditEDPAWyj: TJvFilenameEdit
        Left = 112
        Top = 217
        Width = 566
        Height = 21
        DialogKind = dkSave
        Filter = 'Pliki XML|*.xml|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object FileNameEditEDPAWej: TJvFilenameEdit
        Left = 112
        Top = 176
        Width = 566
        Height = 21
        OnAfterDialog = FileNameEditEDPAWejAcceptFileName
        Filter = 'Pliki XML|*.xml|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object ButtonEdekPodpiszAut: TButton
        Left = 112
        Top = 265
        Width = 75
        Height = 25
        Caption = 'Podpisz'
        TabOrder = 2
        OnClick = ButtonEdekPodpiszAutClick
      end
      object EditEDPNIP: TEdit
        Left = 112
        Top = 16
        Width = 200
        Height = 21
        TabOrder = 3
      end
      object EditEDPImie: TEdit
        Left = 112
        Top = 48
        Width = 200
        Height = 21
        TabOrder = 4
      end
      object EditEDPNazwisko: TEdit
        Left = 112
        Top = 80
        Width = 200
        Height = 21
        TabOrder = 5
      end
      object DateTimePickerEDPDataU: TDateTimePicker
        Left = 112
        Top = 112
        Width = 83
        Height = 23
        Date = 45117.890734849530000000
        Time = 45117.890734849530000000
        MaxDate = 2958465.000000000000000000
        MinDate = -53780.000000000000000000
        TabOrder = 6
      end
      object FloatSpinEditEDPKwota: TJvSpinEdit
        Left = 112
        Top = 144
        Width = 202
        Height = 21
        TabOrder = 7
      end
    end
    object TabSheetEDekBramka: TTabSheet
      Caption = 'eDeklaracja bramka'
      TabVisible = False
      ExplicitHeight = 497
      DesignSize = (
        690
        499)
      object GroupBox1: TGroupBox
        Left = 8
        Top = 3
        Width = 670
        Height = 181
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Wy'#347'lij podpisan'#261' eDeklaracj'#281
        TabOrder = 0
        DesignSize = (
          670
          181)
        object Label27: TLabel
          Left = 16
          Top = 19
          Width = 63
          Height = 13
          Caption = 'Plik deklaracji'
        end
        object Label28: TLabel
          Left = 16
          Top = 45
          Width = 73
          Height = 13
          Caption = 'Rodzaj podpisu'
        end
        object Label29: TLabel
          Left = 16
          Top = 80
          Width = 35
          Height = 13
          Caption = 'Bramka'
        end
        object FileNameEditEDBPlikWej: TJvFilenameEdit
          Left = 112
          Top = 17
          Width = 542
          Height = 21
          Filter = 
            'Pliki eDeklaracji (*.xml;*.xades;*.xml.sig)|*.xml;*.xades;*.xml.' +
            'sig|Wszystkie pliki (*.*)|*.*'
          FilterIndex = 0
          ButtonWidth = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ComboBoxEDBRodzPodp: TComboBox
          Left = 112
          Top = 41
          Width = 168
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Certyfikat'
            'Dane autoryzuj'#261'ce')
        end
        object ComboBoxEDBRodzBram: TComboBox
          Left = 112
          Top = 77
          Width = 168
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 2
          Text = 'Testowa'
          Items.Strings = (
            'Produkcyjna'
            'Testowa')
        end
        object ButtonEDBWyslij: TButton
          Left = 112
          Top = 112
          Width = 75
          Height = 25
          Caption = 'Wy'#347'lij'
          TabOrder = 3
          OnClick = ButtonEDBWyslijClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 193
        Width = 671
        Height = 167
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Sprawd'#378' status / pobierz UPO'
        TabOrder = 1
        DesignSize = (
          671
          167)
        object Label30: TLabel
          Left = 16
          Top = 24
          Width = 52
          Height = 13
          Caption = 'Numer ref.'
        end
        object Label31: TLabel
          Left = 16
          Top = 48
          Width = 35
          Height = 13
          Caption = 'Bramka'
        end
        object Label32: TLabel
          Left = 16
          Top = 80
          Width = 69
          Height = 13
          Caption = 'Zapisz UPO do'
        end
        object EditEDBNrRef: TEdit
          Left = 112
          Top = 16
          Width = 542
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ComboBoxEDBRodzBramUPO: TComboBox
          Left = 112
          Top = 40
          Width = 168
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 1
          Text = 'Testowa'
          Items.Strings = (
            'Produkcyjna'
            'Testowa')
        end
        object ButtonEDBUPO: TButton
          Left = 112
          Top = 104
          Width = 184
          Height = 25
          Caption = 'Sprawd'#378' status / pobierz UPO'
          TabOrder = 2
          OnClick = ButtonEDBUPOClick
        end
        object FileNameEditEDBPlikWyj: TJvFilenameEdit
          Left = 112
          Top = 72
          Width = 542
          Height = 21
          DialogKind = dkSave
          Filter = 'Plik XML (*.xml)|*.xml|Wszystkie pliki (*.*)|*.*'
          FilterIndex = 0
          ButtonWidth = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Text = 'upo.xml'
        end
      end
    end
    object TabSheetJPKPodpisCert: TTabSheet
      Caption = 'JPK podpis certyfikatem'
      TabVisible = False
      ExplicitHeight = 497
      DesignSize = (
        690
        499)
      object Label35: TLabel
        Left = 21
        Top = 19
        Width = 48
        Height = 13
        Caption = 'Certyfikat'
      end
      object Label36: TLabel
        Left = 8
        Top = 64
        Width = 67
        Height = 13
        Caption = 'Plik wej'#347'ciowy'
      end
      object Label37: TLabel
        Left = 8
        Top = 168
        Width = 162
        Height = 13
        Caption = 'Plik wynikowy (zaszyfrowany ZIP)'
      end
      object Label38: TLabel
        Left = 8
        Top = 208
        Width = 125
        Height = 13
        Caption = 'Plik wynikowy (InitUpload)'
      end
      object Label39: TLabel
        Left = 8
        Top = 107
        Width = 35
        Height = 13
        Caption = 'Bramka'
      end
      object ComboBoxJPKCert: TComboBox
        Left = 94
        Top = 16
        Width = 584
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
      end
      object FileNameEditJPKPCWej: TJvFilenameEdit
        Left = 198
        Top = 63
        Width = 480
        Height = 21
        OnAfterDialog = FileNameEditJPKPCWejAcceptFileName
        Filter = 'Pliki XML|*.xml|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object FileNameEditJPKPCEnc: TJvFilenameEdit
        Left = 198
        Top = 168
        Width = 480
        Height = 21
        DialogKind = dkSave
        Filter = 'Pliki enc (*.enc)|*.enc|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object ButtonJPKPodpiszCert: TButton
        Left = 198
        Top = 248
        Width = 75
        Height = 25
        Caption = 'Podpisz'
        TabOrder = 3
        OnClick = ButtonJPKPodpiszCertClick
      end
      object FileNameEditJPKPCInitUpload: TJvFilenameEdit
        Left = 198
        Top = 208
        Width = 480
        Height = 21
        DialogKind = dkSave
        Filter = 'Pliki iu.sig|*.iu.sig|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object CheckBoxJPKPCAdHoc: TCheckBox
        Left = 198
        Top = 136
        Width = 124
        Height = 19
        Caption = 'Na '#380#261'danie (AdHoc)'
        TabOrder = 5
      end
      object ComboBoxJPKPCRodzBram: TComboBox
        Left = 198
        Top = 104
        Width = 168
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
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
      ExplicitHeight = 497
      DesignSize = (
        690
        499)
      object Label40: TLabel
        Left = 8
        Top = 193
        Width = 67
        Height = 13
        Caption = 'Plik wej'#347'ciowy'
      end
      object Label41: TLabel
        Left = 8
        Top = 236
        Width = 35
        Height = 13
        Caption = 'Bramka'
      end
      object Label42: TLabel
        Left = 8
        Top = 297
        Width = 162
        Height = 13
        Caption = 'Plik wynikowy (zaszyfrowany ZIP)'
      end
      object Label43: TLabel
        Left = 8
        Top = 337
        Width = 125
        Height = 13
        Caption = 'Plik wynikowy (InitUpload)'
      end
      object Label44: TLabel
        Left = 8
        Top = 16
        Width = 17
        Height = 13
        Caption = 'NIP'
      end
      object Label45: TLabel
        Left = 8
        Top = 46
        Width = 20
        Height = 13
        Caption = 'Imi'#281
      end
      object Label46: TLabel
        Left = 8
        Top = 80
        Width = 44
        Height = 13
        Caption = 'Nazwisko'
      end
      object Label47: TLabel
        Left = 8
        Top = 112
        Width = 73
        Height = 13
        Caption = 'Data urodzenia'
      end
      object Label48: TLabel
        Left = 8
        Top = 144
        Width = 83
        Height = 13
        Caption = 'Kwota przychodu'
      end
      object FileNameEditJPKPAWej: TJvFilenameEdit
        Left = 198
        Top = 192
        Width = 480
        Height = 21
        OnAfterDialog = FileNameEditJPKPAWejAfterDialog
        Filter = 'Pliki XML|*.xml|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object ComboBoxJPKPARodzBram: TComboBox
        Left = 198
        Top = 233
        Width = 168
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 1
        Text = 'Testowa'
        Items.Strings = (
          'Produkcyjna'
          'Testowa')
      end
      object CheckBoxJPKPAAdHoc: TCheckBox
        Left = 198
        Top = 265
        Width = 124
        Height = 19
        Caption = 'Na '#380#261'danie (AdHoc)'
        TabOrder = 2
      end
      object FileNameEditJPKPAEnc: TJvFilenameEdit
        Left = 198
        Top = 297
        Width = 480
        Height = 21
        DialogKind = dkSave
        Filter = 'Pliki enc (*.enc)|*.enc|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object FileNameEditJPKPAInitUpload: TJvFilenameEdit
        Left = 198
        Top = 337
        Width = 480
        Height = 21
        DialogKind = dkSave
        Filter = 'Pliki iu.sig|*.iu.sig|Wszystkie pliki|*.*'
        FilterIndex = 0
        ButtonWidth = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object ButtonJPKPodpiszAut: TButton
        Left = 198
        Top = 377
        Width = 75
        Height = 25
        Caption = 'Podpisz'
        TabOrder = 5
        OnClick = ButtonJPKPodpiszAutClick
      end
      object FloatSpinEditJPKPKwota: TJvSpinEdit
        Left = 198
        Top = 144
        Width = 202
        Height = 21
        TabOrder = 6
      end
      object DateTimePickerJPKPDataU: TDateTimePicker
        Left = 198
        Top = 112
        Width = 83
        Height = 23
        Date = 45117.890734849530000000
        Time = 45117.890734849530000000
        MaxDate = 2958465.000000000000000000
        MinDate = -53780.000000000000000000
        TabOrder = 7
      end
      object EditJPKPNazwisko: TEdit
        Left = 198
        Top = 80
        Width = 200
        Height = 21
        TabOrder = 8
      end
      object EditJPKPImie: TEdit
        Left = 198
        Top = 48
        Width = 200
        Height = 21
        TabOrder = 9
      end
      object EditJPKPNIP: TEdit
        Left = 198
        Top = 16
        Width = 200
        Height = 21
        TabOrder = 10
      end
    end
    object TabSheetJPKBramka: TTabSheet
      Caption = 'JPK bramka'
      TabVisible = False
      ExplicitHeight = 497
      DesignSize = (
        690
        499)
      object GroupBox3: TGroupBox
        Left = 5
        Top = 4
        Width = 675
        Height = 196
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Wysy'#322'anie'
        TabOrder = 0
        DesignSize = (
          675
          196)
        object Label49: TLabel
          Left = 16
          Top = 25
          Width = 67
          Height = 13
          Caption = 'Plik InitUpload'
        end
        object Label50: TLabel
          Left = 16
          Top = 56
          Width = 85
          Height = 13
          Caption = 'Plik zaszyfrowany'
        end
        object Label51: TLabel
          Left = 16
          Top = 83
          Width = 35
          Height = 13
          Caption = 'Bramka'
        end
        object FileNameEditJPKBIU: TJvFilenameEdit
          Left = 120
          Top = 19
          Width = 543
          Height = 21
          Filter = 'Pliki iu.sig|*.iu.sig|Wszystkie pliki|*.*'
          FilterIndex = 0
          ButtonWidth = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object FileNameEditJPKBEnc: TJvFilenameEdit
          Left = 120
          Top = 48
          Width = 543
          Height = 21
          Filter = 'Pliki enc (*.enc)|*.enc|Wszystkie pliki|*.*'
          FilterIndex = 0
          ButtonWidth = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object CheckBoxJPKBCert: TCheckBox
          Left = 120
          Top = 120
          Width = 516
          Height = 19
          Caption = 
            'Zweryfikuj czy przes'#322'any plik podpisano poprawnym certyfikatem z' +
            ' wymaganymi parametrami'
          TabOrder = 2
        end
        object ButtonJPKBWyslij: TButton
          Left = 120
          Top = 152
          Width = 75
          Height = 25
          Caption = 'Wy'#347'lij'
          TabOrder = 3
          OnClick = ButtonJPKBWyslijClick
        end
        object ComboBoxJPKBRodzBram: TComboBox
          Left = 120
          Top = 80
          Width = 168
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 4
          Text = 'Testowa'
          Items.Strings = (
            'Produkcyjna'
            'Testowa')
        end
      end
      object GroupBox4: TGroupBox
        Left = 5
        Top = 208
        Width = 675
        Height = 168
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Sprawd'#378' status / pobierz UPO'
        TabOrder = 1
        DesignSize = (
          675
          168)
        object Label52: TLabel
          Left = 16
          Top = 32
          Width = 52
          Height = 13
          Caption = 'Numer ref.'
        end
        object Label53: TLabel
          Left = 16
          Top = 64
          Width = 35
          Height = 13
          Caption = 'Bramka'
        end
        object Label54: TLabel
          Left = 16
          Top = 96
          Width = 69
          Height = 13
          Caption = 'Zapisz UPO do'
        end
        object EditJPKBNrRef: TEdit
          Left = 112
          Top = 24
          Width = 542
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ComboBoxJPKBRodzBramUPO: TComboBox
          Left = 112
          Top = 56
          Width = 168
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 1
          Text = 'Testowa'
          Items.Strings = (
            'Produkcyjna'
            'Testowa')
        end
        object FileNameEditJPKBPlikWyj: TJvFilenameEdit
          Left = 112
          Top = 88
          Width = 542
          Height = 21
          DialogKind = dkSave
          Filter = 'Plik XML (*.xml)|*.xml|Wszystkie pliki (*.*)|*.*'
          FilterIndex = 0
          ButtonWidth = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Text = 'upo.xml'
        end
        object ButtonJPKBUPO: TButton
          Left = 112
          Top = 120
          Width = 184
          Height = 25
          Caption = 'Sprawd'#378' status / pobierz UPO'
          TabOrder = 3
          OnClick = ButtonJPKBUPOClick
        end
      end
    end
    object TabSheetKSeFCommon: TTabSheet
      Caption = 'KSeF - Wsp'#243'lne'
      TabVisible = False
      ExplicitHeight = 497
      object ScrollBox3: TScrollBox
        Left = 0
        Top = 0
        Width = 690
        Height = 499
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        ExplicitHeight = 497
        object GroupBox15: TGroupBox
          Left = 0
          Top = 50
          Width = 673
          Height = 432
          Align = alTop
          Caption = 'Pobranie faktury'
          TabOrder = 0
          DesignSize = (
            673
            432)
          object Label93: TLabel
            Left = 24
            Top = 10
            Width = 107
            Height = 13
            Caption = 'ksefReferenceNumber'
          end
          object Label94: TLabel
            Left = 88
            Top = 34
            Width = 44
            Height = 13
            Caption = 'dueValue'
          end
          object Label95: TLabel
            Left = 9
            Top = 64
            Width = 110
            Height = 13
            Caption = 'invoiceOryginalNumber'
          end
          object Label99: TLabel
            Left = 10
            Top = 354
            Width = 65
            Height = 13
            Caption = 'Plik wynikowy'
          end
          object EditKSeFCInvRefNum: TEdit
            Left = 152
            Top = 5
            Width = 506
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object FloatSpinEditKSeFCInvDueValue: TJvSpinEdit
            Left = 152
            Top = 32
            Width = 130
            Height = 21
            TabOrder = 1
          end
          object EditKSeFCInvOrgNum: TEdit
            Left = 152
            Top = 61
            Width = 336
            Height = 21
            TabOrder = 2
          end
          object GroupBox16: TGroupBox
            Left = 9
            Top = 88
            Width = 663
            Height = 105
            Caption = 'subjectToIdentifier'
            TabOrder = 3
            DesignSize = (
              663
              105)
            object Label96: TLabel
              Left = 18
              Top = 71
              Width = 42
              Height = 13
              Caption = 'identifier'
            end
            object RadioGroupKSeFCInvSubToType: TRadioGroup
              Left = 13
              Top = 16
              Width = 641
              Height = 41
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
              Left = 72
              Top = 65
              Width = 371
              Height = 21
              TabOrder = 1
            end
          end
          object GroupBox17: TGroupBox
            Left = 9
            Top = 199
            Width = 663
            Height = 137
            Caption = 'subjectToName'
            TabOrder = 4
            object Label97: TLabel
              Left = 13
              Top = 20
              Width = 53
              Height = 13
              Caption = 'tradeName'
            end
            object Label98: TLabel
              Left = 19
              Top = 85
              Width = 41
              Height = 13
              Caption = 'fullName'
            end
            object firstName: TLabel
              Left = 359
              Top = 82
              Width = 46
              Height = 13
              Caption = 'firstName'
            end
            object surname: TLabel
              Left = 358
              Top = 106
              Width = 41
              Height = 13
              Caption = 'surname'
            end
            object EditKSeFCInvSubToTradeName: TEdit
              Left = 86
              Top = 16
              Width = 568
              Height = 21
              TabOrder = 0
            end
            object RadioButtonKSeFCInvSubToFullName: TRadioButton
              Left = 19
              Top = 53
              Width = 69
              Height = 19
              Caption = 'FullName'
              TabOrder = 1
            end
            object EditKSeFCInvSubToFullName: TEdit
              Left = 80
              Top = 80
              Width = 248
              Height = 21
              TabOrder = 2
            end
            object RadioButtonKSeFCInvSubToPersonName: TRadioButton
              Left = 359
              Top = 53
              Width = 86
              Height = 19
              Caption = 'PersonName'
              TabOrder = 3
            end
            object EditKSeFCInvSubToFirstName: TEdit
              Left = 420
              Top = 80
              Width = 228
              Height = 21
              TabOrder = 4
            end
            object EditKSeFCInvSubToSurname: TEdit
              Left = 420
              Top = 104
              Width = 228
              Height = 21
              TabOrder = 5
            end
          end
          object FileNameEditKSeFCInvFN: TJvFilenameEdit
            Left = 100
            Top = 352
            Width = 561
            Height = 21
            FilterIndex = 0
            ButtonWidth = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object ButtonKSeFCInvGet: TButton
            Left = 19
            Top = 389
            Width = 75
            Height = 25
            Caption = 'Pobierz'
            TabOrder = 6
            OnClick = ButtonKSeFCInvGetClick
          end
          object ButtonKSeFCInvClear: TButton
            Left = 126
            Top = 389
            Width = 75
            Height = 25
            Caption = 'Czy'#347#263
            TabOrder = 7
            OnClick = ButtonKSeFCInvClearClick
          end
        end
        object GroupBox18: TGroupBox
          Left = 0
          Top = 482
          Width = 673
          Height = 120
          Align = alTop
          Caption = 'Sprawd'#378' status / pobierz UPO'
          TabOrder = 1
          DesignSize = (
            673
            120)
          object Label100: TLabel
            Left = 25
            Top = 24
            Width = 90
            Height = 13
            Caption = 'ReferenceNumber '
          end
          object Label101: TLabel
            Left = 18
            Top = 53
            Width = 97
            Height = 13
            Caption = 'Plik wynikowy z UPO'
          end
          object EditKSeFStatusReferenceNumber: TEdit
            Left = 132
            Top = 21
            Width = 534
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object FileNameEditKSeFUPO: TJvFilenameEdit
            Left = 133
            Top = 50
            Width = 534
            Height = 21
            FilterIndex = 0
            ButtonWidth = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object ButtonKSeFStatusUPO: TButton
            Left = 133
            Top = 80
            Width = 188
            Height = 25
            Caption = 'Sprawd'#378' status / pobierz UPO'
            TabOrder = 2
            OnClick = ButtonKSeFStatusUPOClick
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 673
          Height = 50
          Align = alTop
          TabOrder = 2
          object Label102: TLabel
            Left = 18
            Top = 20
            Width = 35
            Height = 13
            Caption = 'Bramka'
          end
          object ComboBoxKSeFComBramka: TComboBox
            Left = 83
            Top = 16
            Width = 176
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
        end
      end
    end
    object TabSheetKsefSession: TTabSheet
      Caption = 'KSeF - Sesja'
      TabVisible = False
      ExplicitHeight = 497
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 690
        Height = 499
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        ExplicitHeight = 497
        object GroupBoxKSeFSesPar: TGroupBox
          Left = 0
          Top = 0
          Width = 673
          Height = 97
          Align = alTop
          Caption = 'Parametry sesji'
          TabOrder = 0
          object Label58: TLabel
            Left = 24
            Top = 26
            Width = 17
            Height = 13
            Caption = 'NIP'
          end
          object Label59: TLabel
            Left = 24
            Top = 58
            Width = 35
            Height = 13
            Caption = 'Bramka'
          end
          object Label68: TLabel
            Left = 318
            Top = 58
            Width = 72
            Height = 13
            Caption = 'Kod formularza'
          end
          object EditKSeFNIP: TEdit
            Left = 89
            Top = 21
            Width = 122
            Height = 21
            TabOrder = 0
          end
          object ComboBoxKSeFBramka: TComboBox
            Left = 89
            Top = 55
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
          object CheckBoxKSeFEncrypt: TCheckBox
            Left = 318
            Top = 26
            Width = 186
            Height = 19
            Caption = 'Szyfrowanie dokument'#243'w (AES)'
            TabOrder = 2
          end
          object ComboBoxKSeFInitFormCode: TComboBox
            Left = 417
            Top = 55
            Width = 76
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
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
          Top = 97
          Width = 673
          Height = 123
          Align = alTop
          Caption = 'Inicjuj certyfikatem'
          TabOrder = 1
          DesignSize = (
            673
            123)
          object Label60: TLabel
            Left = 19
            Top = 23
            Width = 48
            Height = 13
            Caption = 'Certyfikat'
          end
          object Label67: TLabel
            Left = 19
            Top = 54
            Width = 89
            Height = 13
            Caption = 'Rodzaj autoryzacji'
          end
          object ComboBoxKSeFCert: TComboBox
            Left = 126
            Top = 18
            Width = 531
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
          end
          object ButtonKSeFInitSigned: TButton
            Left = 126
            Top = 80
            Width = 75
            Height = 25
            Caption = 'Inicjuj'
            TabOrder = 1
            OnClick = ButtonKSeFInitSignedClick
          end
          object ComboBoxKSeFCertAuthType: TComboBox
            Left = 126
            Top = 51
            Width = 164
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
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
          Top = 220
          Width = 673
          Height = 88
          Align = alTop
          Caption = 'Inicjuj tokenem'
          TabOrder = 2
          DesignSize = (
            673
            88)
          object Label61: TLabel
            Left = 24
            Top = 24
            Width = 29
            Height = 13
            Caption = 'Token'
          end
          object EditKSeFToken: TEdit
            Left = 86
            Top = 22
            Width = 569
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFIniToken: TButton
            Left = 86
            Top = 48
            Width = 75
            Height = 25
            Caption = 'Inicjuj'
            TabOrder = 1
            OnClick = ButtonKSeFIniTokenClick
          end
        end
        object GroupBoxKSeFSesInitPZ: TGroupBox
          Left = 0
          Top = 308
          Width = 673
          Height = 161
          Align = alTop
          Caption = 'Inicjuj profilem zaufanym'
          TabOrder = 3
          DesignSize = (
            673
            161)
          object Label62: TLabel
            Left = 12
            Top = 23
            Width = 122
            Height = 13
            Caption = 'Wynikowy plik do podpisu'
          end
          object Label63: TLabel
            Left = 12
            Top = 96
            Width = 93
            Height = 13
            Caption = 'Podpisany w PZ plik'
          end
          object FileNameEditKSeFInitPZOut: TJvFilenameEdit
            Left = 171
            Top = 24
            Width = 480
            Height = 21
            DialogKind = dkSave
            FilterIndex = 0
            ButtonWidth = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object ButtonKSeFInitPZZapisz: TButton
            Left = 171
            Top = 56
            Width = 75
            Height = 25
            Caption = 'Zapisz'
            TabOrder = 1
            OnClick = ButtonKSeFInitPZZapiszClick
          end
          object ButtonKSeFInitPZ: TButton
            Left = 171
            Top = 128
            Width = 75
            Height = 25
            Caption = 'Inicjuj'
            TabOrder = 2
            OnClick = ButtonKSeFInitPZClick
          end
          object FileNameEditKSeFInitPZIn: TJvFilenameEdit
            Left = 171
            Top = 96
            Width = 479
            Height = 21
            FilterIndex = 0
            ButtonWidth = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
        end
        object GroupBoxKSeFSesStat: TGroupBox
          Left = 0
          Top = 469
          Width = 673
          Height = 121
          Align = alTop
          Caption = 'Status'
          Enabled = False
          TabOrder = 4
          object Label64: TLabel
            Left = 18
            Top = 23
            Width = 193
            Height = 13
            Caption = 'Nr ref lub puste dla statusu sesji og'#243'lnej'
          end
          object Label65: TLabel
            Left = 18
            Top = 50
            Width = 43
            Height = 13
            Caption = 'PageSize'
          end
          object Label66: TLabel
            Left = 171
            Top = 50
            Width = 55
            Height = 13
            Caption = 'PageOffset'
          end
          object EditKSeFSesStatRef: TEdit
            Left = 243
            Top = 19
            Width = 385
            Height = 21
            TabOrder = 0
          end
          object ButtonkSeFSesStat: TButton
            Left = 14
            Top = 80
            Width = 112
            Height = 25
            Caption = 'Sprawd'#378' status'
            TabOrder = 1
            OnClick = ButtonkSeFSesStatClick
          end
          object CheckBoxKSeFStatDet: TCheckBox
            Left = 347
            Top = 50
            Width = 69
            Height = 19
            Caption = 'Szczeg'#243#322'y'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object SpinEditKSeFSesPgSz: TSpinEdit
            Left = 75
            Top = 48
            Width = 71
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 3
            Value = 10
          end
          object SpinEditKSeFSesPgOf: TSpinEdit
            Left = 243
            Top = 48
            Width = 70
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 4
            Value = 0
          end
        end
        object GroupBoxKSeFSesTerm: TGroupBox
          Left = 0
          Top = 590
          Width = 673
          Height = 61
          Align = alTop
          Caption = 'Zako'#324'czenie sesji'
          Enabled = False
          TabOrder = 5
          object ButtonKSeFSesTerm: TButton
            Left = 24
            Top = 21
            Width = 123
            Height = 25
            Caption = 'Zako'#324'cz sesji'#281
            TabOrder = 0
            OnClick = ButtonKSeFSesTermClick
          end
        end
        object GroupBoxKSeFSesGenIntId: TGroupBox
          Left = 0
          Top = 651
          Width = 673
          Height = 65
          Align = alTop
          Caption = 'Wygenerowanie identyfikatora wewnetrznego'
          Enabled = False
          TabOrder = 6
          DesignSize = (
            673
            65)
          object Label92: TLabel
            Left = 12
            Top = 30
            Width = 100
            Height = 13
            Caption = 'inputDigitsSequence '
          end
          object EditKSeFinputDigitsSequence: TEdit
            Left = 128
            Top = 27
            Width = 448
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitWidth = 465
          end
          object ButtonKSeFGenIntId: TButton
            Left = 592
            Top = 24
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Generuj'
            TabOrder = 1
            OnClick = ButtonKSeFGenIntIdClick
            ExplicitLeft = 609
          end
        end
      end
    end
    object TabSheetKSeFFaktury: TTabSheet
      Caption = 'KSeF - Faktury'
      TabVisible = False
      ExplicitHeight = 497
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 690
        Height = 96
        Align = alTop
        Caption = 'Wysy'#322'anie faktury'
        TabOrder = 0
        DesignSize = (
          690
          96)
        object Label69: TLabel
          Left = 3
          Top = 24
          Width = 75
          Height = 13
          Caption = 'Plik XML faktury'
        end
        object FileNameEditKSeFInvSend: TJvFilenameEdit
          Left = 99
          Top = 21
          Width = 576
          Height = 21
          FilterIndex = 0
          ButtonWidth = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ButtonKSeFInvSend: TButton
          Left = 99
          Top = 56
          Width = 75
          Height = 25
          Caption = 'Wy'#347'lij'
          TabOrder = 1
          OnClick = ButtonKSeFInvSendClick
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 96
        Width = 690
        Height = 96
        Align = alTop
        Caption = 'Sprawd'#378' status faktury'
        TabOrder = 1
        DesignSize = (
          690
          96)
        object Label70: TLabel
          Left = 8
          Top = 25
          Width = 169
          Height = 13
          Caption = 'Invoice Element Reference Number'
        end
        object EditKSeFInvStatNr: TEdit
          Left = 201
          Top = 22
          Width = 466
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ButtonKSeFInvStat: TButton
          Left = 201
          Top = 56
          Width = 75
          Height = 25
          Caption = 'Sprawd'#378
          TabOrder = 1
          OnClick = ButtonKSeFInvStatClick
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 192
        Width = 690
        Height = 120
        Align = alTop
        Caption = 'Pobieranie faktury'
        TabOrder = 2
        DesignSize = (
          690
          120)
        object Label71: TLabel
          Left = 3
          Top = 30
          Width = 117
          Height = 13
          Caption = 'KSeF Reference Number'
        end
        object Label72: TLabel
          Left = 32
          Top = 61
          Width = 87
          Height = 13
          Caption = 'Plik wynikowy XML'
        end
        object EditKSeFInvGetNr: TEdit
          Left = 144
          Top = 29
          Width = 529
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object FileNameEditKSeFGetFN: TJvFilenameEdit
          Left = 144
          Top = 56
          Width = 531
          Height = 21
          FilterIndex = 0
          ButtonWidth = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object ButtonKSeFInvGet: TButton
          Left = 144
          Top = 88
          Width = 75
          Height = 25
          Caption = 'Pobierz'
          TabOrder = 2
          OnClick = ButtonKSeFInvGetClick
        end
      end
    end
    object TabSheetKSeFQueryInvoice: TTabSheet
      Caption = 'KSeF - Zapytania - Faktury'
      TabVisible = False
      ExplicitHeight = 497
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 690
        Height = 499
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 497
        object GroupBox10: TGroupBox
          Left = 0
          Top = 448
          Width = 669
          Height = 56
          Align = alTop
          Caption = 'Zapytaj synchronicznie'
          TabOrder = 0
          object Label85: TLabel
            Left = 19
            Top = 25
            Width = 46
            Height = 13
            Caption = 'PageSize '
          end
          object Label86: TLabel
            Left = 193
            Top = 24
            Width = 55
            Height = 13
            Caption = 'PageOffset'
          end
          object SpinEditKSeFQInvAsPS: TSpinEdit
            Left = 76
            Top = 20
            Width = 85
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 10
          end
          object SpinEditKSeFQInvAsPS1: TSpinEdit
            Left = 265
            Top = 20
            Width = 85
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object ButtonKSeFQInvSync: TButton
            Left = 393
            Top = 20
            Width = 75
            Height = 25
            Caption = 'Zapytaj'
            TabOrder = 2
            OnClick = ButtonKSeFQInvSyncClick
          end
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 669
          Height = 448
          Align = alTop
          Caption = 'Kryteria'
          TabOrder = 1
          object Label73: TLabel
            Left = 23
            Top = 21
            Width = 80
            Height = 13
            Caption = 'Rodzaj podmiotu'
          end
          object ComboBoxKSeFQInvCrSubTyp: TComboBox
            Left = 129
            Top = 16
            Width = 135
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
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
            Left = 8
            Top = 40
            Width = 648
            Height = 384
            ActivePage = TabSheetKSeFQInvCrDetail
            TabOrder = 1
            object TabSheetKSeFQInvCrDetail: TTabSheet
              Caption = 'Szczeg'#243#322'owo'
              object Label74: TLabel
                Left = 12
                Top = 19
                Width = 60
                Height = 13
                Caption = 'amountFrom'
              end
              object Label75: TLabel
                Left = 232
                Top = 19
                Width = 48
                Height = 13
                Caption = 'amountTo'
              end
              object Label76: TLabel
                Left = 448
                Top = 19
                Width = 60
                Height = 13
                Caption = 'amountType'
              end
              object Label77: TLabel
                Left = 130
                Top = 87
                Width = 70
                Height = 13
                Caption = 'invoiceNumber'
              end
              object Label78: TLabel
                Left = 12
                Top = 173
                Width = 88
                Height = 13
                Caption = 'invoicingDateFrom'
              end
              object Label79: TLabel
                Left = 296
                Top = 170
                Width = 76
                Height = 13
                Caption = 'invoicingDateTo'
              end
              object Label80: TLabel
                Left = 12
                Top = 200
                Width = 107
                Height = 13
                Caption = 'ksefReferenceNumber'
              end
              object Label87: TLabel
                Left = 12
                Top = 232
                Width = 78
                Height = 13
                Caption = 'subjectBy ident.'
              end
              object FloatSpinEditKSeFQInvCAamountFrom: TJvSpinEdit
                Left = 94
                Top = 16
                Width = 106
                Height = 21
                TabOrder = 0
              end
              object FloatSpinEditKSeFQInvCAamountTo: TJvSpinEdit
                Left = 296
                Top = 16
                Width = 106
                Height = 21
                TabOrder = 1
              end
              object FloatSpinEditKSeFQInvCAamountType: TJvSpinEdit
                Left = 528
                Top = 16
                Width = 106
                Height = 21
                TabOrder = 2
              end
              object GroupBox9: TGroupBox
                Left = 12
                Top = 43
                Width = 96
                Height = 110
                Caption = 'currencyCodes'
                TabOrder = 3
                object MemoKSeFQInvCrCurrencyCodes: TMemo
                  Left = 2
                  Top = 15
                  Width = 92
                  Height = 93
                  Align = alClient
                  TabOrder = 0
                  ExplicitHeight = 88
                end
              end
              object CheckBoxKSeFQInvCrFaP17Annotation: TCheckBox
                Left = 128
                Top = 57
                Width = 107
                Height = 19
                Caption = 'faP17Annotation'
                TabOrder = 4
              end
              object EditKSeFQInvCrInvoiceNumber: TEdit
                Left = 224
                Top = 84
                Width = 408
                Height = 21
                TabOrder = 5
              end
              object CheckGroupKSeFQInvCrIInvoiceTypes: TGroupBox
                Left = 133
                Top = 106
                Width = 504
                Height = 44
                Caption = 'invoiceTypes'
                TabOrder = 6
                object CheckBoxKSeFQInvCrIInvTypVAT: TCheckBox
                  Left = 8
                  Top = 16
                  Width = 41
                  Height = 17
                  Caption = 'VAT'
                  TabOrder = 0
                end
                object CheckBoxKSeFQInvCrIInvTypKOR: TCheckBox
                  Left = 73
                  Top = 16
                  Width = 46
                  Height = 17
                  Caption = 'KOR'
                  TabOrder = 1
                end
                object CheckBoxKSeFQInvCrIInvTypZAL: TCheckBox
                  Left = 133
                  Top = 16
                  Width = 44
                  Height = 17
                  Caption = 'ZAL'
                  TabOrder = 2
                end
                object CheckBoxKSeFQInvCrIInvTypROZ: TCheckBox
                  Left = 200
                  Top = 16
                  Width = 57
                  Height = 17
                  Caption = 'ROZ'
                  TabOrder = 3
                end
                object CheckBoxKSeFQInvCrIInvTypUPR: TCheckBox
                  Left = 263
                  Top = 16
                  Width = 50
                  Height = 17
                  Caption = 'UPR'
                  TabOrder = 4
                end
                object CheckBoxKSeFQInvCrIInvTypKOR_ZAL: TCheckBox
                  Left = 328
                  Top = 16
                  Width = 66
                  Height = 17
                  Caption = 'KOR_ZAL'
                  TabOrder = 5
                end
                object CheckBoxKSeFQInvCrIInvTypKOR_ROZ: TCheckBox
                  Left = 400
                  Top = 16
                  Width = 65
                  Height = 17
                  Caption = 'KOR_ROZ'
                  TabOrder = 6
                end
              end
              object DateTimePickerKSeFQInvCrDetInvFrom: TDateTimePicker
                Left = 123
                Top = 168
                Width = 137
                Height = 23
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 7
              end
              object DateTimePickerKSeFQInvCrDetInvTo: TDateTimePicker
                Left = 392
                Top = 165
                Width = 137
                Height = 23
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 8
              end
              object EditKSeFQInvCrRefNo: TEdit
                Left = 136
                Top = 198
                Width = 491
                Height = 21
                TabOrder = 9
              end
              object EditKSeFQInvCrSubjectByIdent: TEdit
                Left = 115
                Top = 228
                Width = 285
                Height = 21
                TabOrder = 10
              end
              object GroupBox11: TGroupBox
                Left = 11
                Top = 261
                Width = 616
                Height = 91
                Caption = 'subjectTo'
                TabOrder = 11
                object Label88: TLabel
                  Left = 33
                  Top = 62
                  Width = 28
                  Height = 13
                  Caption = 'ident.'
                end
                object RadioGroupKSeFQInvCrSubjevtToType: TRadioGroup
                  Left = 2
                  Top = 15
                  Width = 612
                  Height = 41
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
                  Left = 97
                  Top = 59
                  Width = 512
                  Height = 21
                  TabOrder = 1
                end
              end
            end
            object TabSheetKSeFQInvCrIncr: TTabSheet
              Caption = 'Narastaj'#261'co'
              object Label81: TLabel
                Left = 12
                Top = 24
                Width = 172
                Height = 13
                Caption = 'acquisitionTimestampThresholdFrom'
              end
              object Label82: TLabel
                Left = 12
                Top = 61
                Width = 160
                Height = 13
                Caption = 'acquisitionTimestampThresholdTo'
              end
              object DateTimePickerKSeFQInvCrIncInvFrom: TDateTimePicker
                Left = 216
                Top = 19
                Width = 137
                Height = 23
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 0
              end
              object DateTimePickerKSeFQInvCrIncInvTo: TDateTimePicker
                Left = 216
                Top = 56
                Width = 137
                Height = 23
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 1
              end
            end
            object TabSheetKSeFQInvCrRange: TTabSheet
              Caption = 'Zakres'
              object Label83: TLabel
                Left = 8
                Top = 16
                Width = 88
                Height = 13
                Caption = 'invoicingDateFrom'
              end
              object Label84: TLabel
                Left = 296
                Top = 13
                Width = 76
                Height = 13
                Caption = 'invoicingDateTo'
              end
              object DateTimePickerKSeFQInvCrRanInvFrom: TDateTimePicker
                Left = 119
                Top = 11
                Width = 137
                Height = 23
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 0
              end
              object DateTimePickerKSeFQInvCrRanInvTo: TDateTimePicker
                Left = 392
                Top = 8
                Width = 137
                Height = 23
                Date = 43789.000000000000000000
                Time = 43789.000000000000000000
                MaxDate = 2958465.000000000000000000
                MinDate = -53780.000000000000000000
                TabOrder = 1
              end
            end
          end
          object ButtonKSeFQInvClear: TButton
            Left = 576
            Top = 16
            Width = 75
            Height = 25
            Caption = 'Wyczy'#347#263
            TabOrder = 2
            OnClick = ButtonKSeFQInvClearClick
          end
        end
        object GroupBox12: TGroupBox
          Left = 0
          Top = 504
          Width = 669
          Height = 248
          Align = alTop
          Caption = 'Zapytanie asynchroniczne'
          TabOrder = 2
          DesignSize = (
            669
            248)
          object ButtonKSeFQInvAsync: TButton
            Left = 19
            Top = 19
            Width = 75
            Height = 25
            Caption = 'Zapytaj'
            TabOrder = 0
            OnClick = ButtonKSeFQInvAsyncClick
          end
          object GroupBox13: TGroupBox
            Left = 17
            Top = 48
            Width = 643
            Height = 62
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Status zapytania'
            TabOrder = 1
            DesignSize = (
              643
              62)
            object Label89: TLabel
              Left = 13
              Top = 26
              Width = 82
              Height = 13
              Caption = 'Nr ref. zapytania'
            end
            object EditKSeFQInvAsyncQRefNo: TEdit
              Left = 109
              Top = 18
              Width = 422
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object ButtonKSeFQInvAsyncStat: TButton
              Left = 537
              Top = 16
              Width = 99
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Sprawd'#378' status'
              TabOrder = 1
              OnClick = ButtonKSeFQInvAsyncStatClick
            end
          end
          object GroupBox14: TGroupBox
            Left = 18
            Top = 115
            Width = 648
            Height = 117
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Pobieranie wyniku zapytania'
            TabOrder = 2
            DesignSize = (
              648
              117)
            object Label90: TLabel
              Left = 15
              Top = 23
              Width = 79
              Height = 13
              Caption = 'Nr ref. elementu'
            end
            object Label91: TLabel
              Left = 15
              Top = 55
              Width = 82
              Height = 13
              Caption = 'Plik docelowy ZIP'
            end
            object EditKSeFQInvAsyncERefNo: TEdit
              Left = 119
              Top = 22
              Width = 506
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object FileNameEditKSeFQInvAsyncFN: TJvFilenameEdit
              Left = 119
              Top = 52
              Width = 505
              Height = 21
              DialogKind = dkSave
              Filter = 'Pliki ZIP (*.zip)|*.zip|Wszystkie pliki (*.*)|*.*'
              FilterIndex = 0
              ButtonWidth = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object ButtonKSeFQInvAsyncFetch: TButton
              Left = 113
              Top = 80
              Width = 75
              Height = 25
              Caption = 'Pobierz'
              TabOrder = 2
              OnClick = ButtonKSeFQInvAsyncFetchClick
            end
          end
        end
      end
    end
    object TabSheetKSeFBatch: TTabSheet
      Caption = 'KSeF - Wysy'#322'ka wsadowa'
      TabVisible = False
      ExplicitHeight = 497
      object ScrollBox4: TScrollBox
        Left = 0
        Top = 0
        Width = 690
        Height = 499
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 497
        object GroupBox19: TGroupBox
          Left = 0
          Top = 0
          Width = 686
          Height = 296
          Align = alTop
          Caption = 'Podpis / przygotowanie'
          TabOrder = 0
          DesignSize = (
            686
            296)
          object Label103: TLabel
            Left = 4
            Top = 100
            Width = 86
            Height = 13
            Caption = 'Plik wej'#347'ciowy ZIP'
          end
          object Label104: TLabel
            Left = 4
            Top = 128
            Width = 73
            Height = 13
            Caption = 'Rodzaj podpisu'
          end
          object Label105: TLabel
            Left = 19
            Top = 58
            Width = 35
            Height = 13
            Caption = 'Bramka'
          end
          object Label106: TLabel
            Left = 313
            Top = 58
            Width = 72
            Height = 13
            Caption = 'Kod formularza'
          end
          object Label107: TLabel
            Left = 19
            Top = 26
            Width = 17
            Height = 13
            Caption = 'NIP'
          end
          object Label108: TLabel
            Left = 4
            Top = 165
            Width = 48
            Height = 13
            Caption = 'Certyfikat'
          end
          object Label109: TLabel
            Left = 4
            Top = 199
            Width = 119
            Height = 13
            Caption = 'Plik wyj'#347'ciowy InitUpload'
          end
          object Label110: TLabel
            Left = 4
            Top = 229
            Width = 120
            Height = 13
            Caption = 'Plik yj'#347'ciowy zaszyfr. ZIP'
          end
          object FileNameEditKSeFBatchInZIP: TJvFilenameEdit
            Left = 119
            Top = 96
            Width = 549
            Height = 21
            OnAfterDialog = FileNameEditKSeFBatchInZIPAcceptFileName
            Filter = 'Pliki ZIP (*.zip)|*.zip|Wszystkie pliki (*.*)|*.*'
            FilterIndex = 0
            ButtonWidth = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object RadioButtonKSeFBatchCert: TRadioButton
            Left = 119
            Top = 128
            Width = 123
            Height = 19
            Caption = 'Podpis certyfikatem'
            Checked = True
            TabOrder = 2
            TabStop = True
          end
          object RadioButtonKSeFBatchPZ: TRadioButton
            Left = 324
            Top = 128
            Width = 90
            Height = 19
            Caption = 'Profil zaufany'
            TabOrder = 1
          end
          object ComboBoxKSeFBatchBramka: TComboBox
            Left = 84
            Top = 55
            Width = 176
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 2
            TabOrder = 3
            Text = 'Testowa'
            Items.Strings = (
              'Produkcyjna'
              'Demo'
              'Testowa')
          end
          object ComboBoxKSeFBatchInitFormCode: TComboBox
            Left = 412
            Top = 55
            Width = 76
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 4
            Text = 'FA(1)'
            Items.Strings = (
              'FA(1)'
              'FA(2)')
          end
          object EditKSeFBatchNIP: TEdit
            Left = 84
            Top = 21
            Width = 122
            Height = 21
            TabOrder = 5
          end
          object ComboBoxKSeFBatchCert: TComboBox
            Left = 119
            Top = 160
            Width = 549
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 6
          end
          object FileNameEditKSeFBatchOutInitUp: TJvFilenameEdit
            Left = 156
            Top = 192
            Width = 512
            Height = 21
            DialogKind = dkSave
            Filter = 'Pliki XML (*.xml)|*.xml|Wszystkie pliki (*.*)|*.*'
            FilterIndex = 0
            ButtonWidth = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
          object FileNameEditKSeFBatchOutEncZIP: TJvFilenameEdit
            Left = 156
            Top = 224
            Width = 512
            Height = 21
            DialogKind = dkSave
            Filter = 'Plik part (*.part1)|*.part1|Wszystkie pliki (*.*)|*.*'
            FilterIndex = 0
            ButtonWidth = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
          object ButtonKSeFBatchPodp: TButton
            Left = 156
            Top = 256
            Width = 120
            Height = 25
            Caption = 'Podpisz / szyfruj'
            TabOrder = 9
            OnClick = ButtonKSeFBatchPodpClick
          end
        end
        object GroupBox20: TGroupBox
          Left = 0
          Top = 296
          Width = 686
          Height = 184
          Align = alTop
          Caption = 'Wysy'#322'ka'
          TabOrder = 1
          object Label111: TLabel
            Left = 3
            Top = 28
            Width = 119
            Height = 13
            Caption = 'Podpisany plik InitUpload'
          end
          object Label112: TLabel
            Left = 4
            Top = 61
            Width = 105
            Height = 13
            Caption = 'Zaszyfrowany plik ZIP'
          end
          object Label113: TLabel
            Left = 92
            Top = 91
            Width = 35
            Height = 13
            Caption = 'Bramka'
          end
          object Label114: TLabel
            Left = 15
            Top = 157
            Width = 115
            Height = 13
            Caption = 'Nadany nr referencyjny'
          end
          object FileNameEditKSeFBatchSendIU: TJvFilenameEdit
            Left = 154
            Top = 24
            Width = 521
            Height = 21
            Filter = 'Pliki XML (*.xml;*.sig)|*.xml;*.sig|Wszystkie pliki (*.*)|*.*'
            FilterIndex = 0
            ButtonWidth = 23
            TabOrder = 0
          end
          object FileNameEditKSeFBatchSendEnc: TJvFilenameEdit
            Left = 154
            Top = 56
            Width = 521
            Height = 21
            Filter = 'Pliki danych (*.part1)|*.part1|Wszystkie pliki (*.*)|*.*'
            FilterIndex = 0
            ButtonWidth = 23
            TabOrder = 1
          end
          object ComboBoxKSeFBatchSendBramka: TComboBox
            Left = 157
            Top = 88
            Width = 176
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 2
            TabOrder = 2
            Text = 'Testowa'
            Items.Strings = (
              'Produkcyjna'
              'Demo'
              'Testowa')
          end
          object ButtonKSeFBatchSend: TButton
            Left = 154
            Top = 120
            Width = 75
            Height = 25
            Caption = 'Wy'#347'lij'
            TabOrder = 3
            OnClick = ButtonKSeFBatchSendClick
          end
          object EditKSeFBatchNrRef: TEdit
            Left = 154
            Top = 152
            Width = 363
            Height = 21
            TabOrder = 4
          end
        end
      end
    end
  end
  object MemoLog: TMemo
    Left = 0
    Top = 532
    Width = 698
    Height = 144
    Align = alBottom
    Lines.Strings = (
      'MemoLog')
    TabOrder = 1
    WordWrap = False
    ExplicitTop = 530
  end
end
