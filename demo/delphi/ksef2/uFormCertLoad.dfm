object FormCertLoad: TFormCertLoad
  Left = 192
  Top = 125
  Width = 598
  Height = 226
  Caption = 'FormCertLoad'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    582
    187)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 120
    Top = 11
    Width = 69
    Height = 13
    Caption = 'Plik certyfikatu'
  end
  object Label2: TLabel
    Left = 104
    Top = 35
    Width = 84
    Height = 13
    Caption = 'Format certyfikatu'
  end
  object Label3: TLabel
    Left = 16
    Top = 59
    Width = 172
    Height = 13
    Caption = 'Plik klucza prywatnego (opcjonalnie)'
  end
  object Label4: TLabel
    Left = 121
    Top = 83
    Width = 66
    Height = 13
    Caption = 'Format klucza'
  end
  object Label5: TLabel
    Left = 158
    Top = 107
    Width = 29
    Height = 13
    Caption = 'Has'#322'o'
  end
  object FileNameEditCert: TEdit
    Left = 192
    Top = 8
    Width = 345
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object ButtonCert: TButton
    Left = 544
    Top = 8
    Width = 22
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 1
    OnClick = ButtonCertClick
  end
  object ComboBoxCertFmt: TComboBox
    Left = 192
    Top = 32
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = 'PEM'
    Items.Strings = (
      'PEM'
      'DER'
      'PFX')
  end
  object FileNameEditKey: TEdit
    Left = 192
    Top = 56
    Width = 345
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object ButtonKey: TButton
    Left = 544
    Top = 56
    Width = 22
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 4
    OnClick = ButtonKeyClick
  end
  object ComboBoxKeyFmt: TComboBox
    Left = 192
    Top = 80
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = 'PEM'
    Items.Strings = (
      'PEM'
      'DER')
  end
  object EditPasswd: TEdit
    Left = 192
    Top = 104
    Width = 377
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
  end
  object BitBtnOK: TBitBtn
    Left = 408
    Top = 152
    Width = 75
    Height = 25
    TabOrder = 7
    Kind = bkOK
  end
  object BitBtnCancel: TBitBtn
    Left = 496
    Top = 152
    Width = 75
    Height = 25
    TabOrder = 8
    Kind = bkCancel
  end
  object OpenDialog1: TOpenDialog
    Left = 320
    Top = 32
  end
end
