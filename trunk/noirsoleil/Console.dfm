object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Console'
  ClientHeight = 406
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    524
    406)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 361
    Height = 390
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 384
    Top = 0
    Width = 140
    Height = 406
    Align = alRight
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 33
      Height = 13
      Caption = 'Livello:'
    end
    object Label2: TLabel
      Left = 8
      Top = 102
      Width = 42
      Height = 13
      Caption = 'Macchia:'
    end
    object Button1: TButton
      Left = 8
      Top = 57
      Width = 57
      Height = 25
      Caption = 'Cambia'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 71
      Top = 57
      Width = 57
      Height = 25
      Caption = 'Individua'
      TabOrder = 1
      OnClick = Button2Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 152
      Width = 121
      Height = 246
      ItemHeight = 13
      PopupMenu = PopupMenu1
      TabOrder = 2
      OnClick = ListBox1Click
    end
    object Button3: TButton
      Left = 8
      Top = 121
      Width = 121
      Height = 25
      Caption = 'Individua'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object Edit1: TEdit
    Left = 392
    Top = 30
    Width = 124
    Height = 21
    TabOrder = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 592
    object Rinonima1: TMenuItem
      Caption = 'Rinonima'
      OnClick = Rinonima1Click
    end
    object Elimina1: TMenuItem
      Caption = 'Elimina'
      OnClick = Elimina1Click
    end
  end
end
