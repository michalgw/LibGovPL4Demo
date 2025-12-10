object Form3: TForm3
  Left = 192
  Top = 117
  Width = 555
  Height = 152
  Caption = 'Dodaj schema/szablon'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    539
    113)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 141
    Height = 13
    Caption = 'Przestrze'#324' nazw (namespace)'
  end
  object Label2: TLabel
    Left = 8
    Top = 38
    Width = 96
    Height = 13
    Caption = 'Plik lub URL zasobu'
  end
  object EditNS: TEdit
    Left = 160
    Top = 8
    Width = 369
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'http://'
  end
  object FileNameEditRes: TEdit
    Left = 112
    Top = 35
    Width = 385
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object Button1: TButton
    Left = 504
    Top = 32
    Width = 25
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 2
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 376
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 456
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
  object OpenDialog1: TOpenDialog
    Left = 272
    Top = 24
  end
end
