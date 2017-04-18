object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Importuj list'#281' nauczycieli'
  ClientHeight = 167
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 257
    Height = 73
    Caption = #377'r'#243'd'#322'o'
    Items.Strings = (
      'MS Excel'
      'MS Access')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 86
    Width = 257
    Height = 66
    Caption = 'Separator'
    Enabled = False
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 20
      Width = 83
      Height = 13
      Caption = 'Znak separatora:'
    end
    object Label3: TLabel
      Left = 123
      Top = 20
      Width = 92
      Height = 13
      Caption = 'Ogranicznik tekstu:'
    end
    object Edit1: TEdit
      Left = 16
      Top = 32
      Width = 85
      Height = 21
      MaxLength = 1
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 123
      Top = 32
      Width = 92
      Height = 21
      MaxLength = 1
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 271
    Top = 87
    Width = 265
    Height = 66
    Caption = 'Import'
    TabOrder = 2
    object Label2: TLabel
      Left = 18
      Top = 20
      Width = 39
      Height = 13
      Caption = #346'cie'#380'ka:'
    end
    object Edit2: TEdit
      Left = 16
      Top = 32
      Width = 165
      Height = 21
      TabOrder = 0
      OnClick = Edit2Click
    end
    object BitBtn1: TBitBtn
      Left = 187
      Top = 32
      Width = 70
      Height = 25
      Caption = 'Importuj'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000EFEFEFD0D0D0
        D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D8D4D7DCD5DBD0D0
        D0EDEDEDFFFFFFFFFFFFF2F2F2E1E1E1E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
        E3E3E4E3E4F2E7F1C9D6CA90D394F7E5F5FEF4FDFFFFFFFFFFFFF2F2F2E1E1E1
        E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E7E4E7F5E3F48CCB9022D02C4BD25377CB
        7D79C97E74C378D3EAD5F2F2F2E1E1E1E3E3E3E3E3E3E3E3E3E3E3E3E6E4E6D8
        D8D84BCA5331D83B3ED9473BD84436D83F35D83F29D633AFEDB3F3F3F3E2E2E2
        E3E3E3E3E3E3E3E3E3E4E4E4F0E4F03DD34632DA3E42DA4C43DA4C43DA4C42DA
        4C42DA4C37D841B6EFB9F3F3F3E3E3E3E5E5E5E5E5E5E5E5E5E5E5E5E6E5E6F5
        E5F488E08E33DB3D44DB4E40DC4B3ADB4538DA422AD636B0EEB4F3F3F3E3E3E3
        E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E6E5E6F5E6F4CDE3CE42DD4D73DF7BCEE2
        CFD5EDD7DAF7DCF9FDF8F4F4F4E5E5E5E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6ECE7ECEDE6ECB9E2BCEEE5EDF6F2F6FFFFFFFFFFFFF4F4F4E5E5E5
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E8E7E8EBE7EAE5E5
        E5F1F1F1FFFFFFFFFFFFF4F4F4E6E6E6E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E6E6E6F3F3F3FFFFFFFFFFFFF5F5F5E7E7E7
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E7E7
        E7F2F2F2FFFFFFFFFFFFF5F5F5E7E7E7E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E9E9E9EAEAEBE8E9EAF3F3F4FFFFFFFFFFFFF5F5F5E8E8E8
        EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAE8EAEEDFDFDFDFE0
        E1F0EFEDFFFFFFFFFFFFF5F5F5E9E9E9EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
        EBEBEBEBEBEDF0F6D3B880BE871DB88B30FEFEFFFFFFFFFFFFFFF5F5F5EAEAEA
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEDF1F8D9B778CA9D42FFFF
        FFFFFFFFFFFFFFFFFFFFF9F9F9EBEBEBECECECECECECECECECECECECECECECEC
        ECECECECECEDF0F5DFC99BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object RadioGroup2: TRadioGroup
    Left = 271
    Top = 8
    Width = 265
    Height = 73
    Caption = 'Opcje'
    Items.Strings = (
      'Utw'#243'rz now'#261' list'#281
      'Dodaj do istniej'#261'cej')
    TabOrder = 3
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Filter = 'pliki tekstowe|*.txt'
    Left = 360
    Top = 104
  end
end
