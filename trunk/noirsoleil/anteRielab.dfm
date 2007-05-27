object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Macchia[0] : 1'
  ClientHeight = 208
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 135
    Top = 73
    Width = 65
    Height = 13
    Caption = 'Coordinate:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 135
    Top = 92
    Width = 86
    Height = 13
    Caption = 'Eliografiche (X,Y):'
  end
  object Label3: TLabel
    Left = 135
    Top = 111
    Width = 95
    Height = 13
    Caption = 'Normalizzate (X,Y): '
  end
  object Label4: TLabel
    Left = 135
    Top = 138
    Width = 35
    Height = 13
    Caption = 'Arrea:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 135
    Top = 157
    Width = 44
    Height = 13
    Caption = 'N'#176' Pixel: '
  end
  object Label6: TLabel
    Left = 135
    Top = 176
    Width = 56
    Height = 13
    Caption = 'Milionesimi: '
  end
  object Label7: TLabel
    Left = 135
    Top = 8
    Width = 25
    Height = 13
    Caption = 'File: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 135
    Top = 27
    Width = 30
    Height = 13
    Caption = 'Data:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 135
    Top = 46
    Width = 18
    Height = 13
    Caption = 'TU:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 121
    Height = 193
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
end
