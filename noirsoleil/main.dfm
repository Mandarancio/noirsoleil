object Form1: TForm1
  Left = 11
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Noir Soleil'
  ClientHeight = 788
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menu
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  DesignSize = (
    743
    788)
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 566
    Height = 769
    Hint = 'X= ?; Y=?;'
    Align = alClient
    AutoSize = True
    Center = True
    ParentShowHint = False
    ShowHint = True
    OnClick = Image1Click
    OnMouseMove = Image1MouseMove
    ExplicitLeft = 1
    ExplicitTop = -6
  end
  object Shape1: TShape
    Left = 303
    Top = 204
    Width = 26
    Height = 29
    Brush.Style = bsClear
    Visible = False
    OnMouseMove = Shape1MouseMove
    OnMouseUp = Shape2MouseUp
  end
  object Shape2: TShape
    Left = 120
    Top = 126
    Width = 177
    Height = 170
    Brush.Style = bsClear
    Pen.Color = clLime
    Shape = stCircle
    Visible = False
    OnContextPopup = Shape2ContextPopup
    OnMouseMove = shape2MouseMove
    OnMouseUp = Shape2MouseUp
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 769
    Width = 743
    Height = 19
    Panels = <
      item
        Text = 'x:'
        Width = 75
      end
      item
        Text = 'y:'
        Width = 75
      end
      item
        Text = 'colore'
        Width = 75
      end
      item
        Alignment = taCenter
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = 'Manda powered'
        Width = 400
      end>
  end
  object Memo3: TMemo
    Left = 1
    Top = 356
    Width = 185
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 1
    Visible = False
  end
  object Memo1: TMemo
    Left = 455
    Top = 8
    Width = 105
    Height = 93
    Anchors = [akTop, akRight]
    Lines.Strings = (
      'Reticolo'
      'X: '
      'Y:'
      'P:'
      'r:')
    ReadOnly = True
    ScrollBars = ssHorizontal
    TabOrder = 2
    OnKeyPress = Memo1KeyPress
  end
  object Panel1: TPanel
    Left = 566
    Top = 0
    Width = 177
    Height = 769
    Align = alRight
    TabOrder = 3
    OnClick = Panel1Click
    object Label1: TLabel
      Left = 6
      Top = 11
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label2: TLabel
      Left = 6
      Top = 49
      Width = 27
      Height = 13
      Caption = 'L0 ('#176')'
    end
    object Label3: TLabel
      Left = 88
      Top = 49
      Width = 28
      Height = 13
      Caption = 'B0 ('#176')'
    end
    object Label4: TLabel
      Left = 8
      Top = 86
      Width = 39
      Height = 13
      Caption = 'n'#176'. Rot.'
    end
    object Label5: TLabel
      Left = 90
      Top = 88
      Width = 12
      Height = 13
      Caption = 'JD'
    end
    object Label17: TLabel
      Left = 87
      Top = 11
      Width = 69
      Height = 13
      Caption = 'Universal Time'
    end
    object Edit1: TEdit
      Left = 6
      Top = 61
      Width = 76
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 90
      Top = 61
      Width = 79
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 7
      Top = 99
      Width = 77
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 90
      Top = 99
      Width = 79
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object Button1: TButton
      Left = 45
      Top = 126
      Width = 90
      Height = 25
      Caption = 'Calcola'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 45
      Top = 157
      Width = 89
      Height = 25
      Caption = 'Carica'
      TabOrder = 5
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 45
      Top = 188
      Width = 89
      Height = 25
      Caption = 'Salva dati'
      TabOrder = 6
      OnClick = Button3Click
    end
    object Edit6: TEdit
      Left = 7
      Top = 24
      Width = 74
      Height = 21
      TabOrder = 7
      Text = 'gg/mm/aaaa'
    end
    object edit7: TEdit
      Left = 87
      Top = 22
      Width = 82
      Height = 21
      TabOrder = 8
      Text = 'hh,mm'
    end
    object Button10: TButton
      Left = 45
      Top = 219
      Width = 89
      Height = 25
      Caption = 'Cambia centro'
      TabOrder = 9
      OnClick = Button10Click
    end
    object Button7: TButton
      Left = 45
      Top = 250
      Width = 89
      Height = 25
      Caption = 'Console'
      TabOrder = 10
      OnClick = Button7Click
    end
  end
  object menu: TMainMenu
    Left = 288
    Top = 592
    object File1: TMenuItem
      Caption = 'File'
      object Disegnaasse1: TMenuItem
        Caption = 'Disegna asse'
        OnClick = Disegnaasse1Click
      end
      object Cambiadati1: TMenuItem
        Caption = 'Cambia dati'
        OnClick = Cambiadati1Click
      end
      object Nuovasessione1: TMenuItem
        Caption = 'Nuova sessione'
        OnClick = Nuovasessione1Click
      end
      object Esci1: TMenuItem
        Caption = 'Esci'
        OnClick = Esci1Click
      end
    end
    object oolS1: TMenuItem
      Caption = 'Tools'
      object Rielaboratore1: TMenuItem
        Caption = 'Rielaboratore'
        OnClick = Rielaboratore1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Help2: TMenuItem
        Caption = 'Help'
        OnClick = Help2Click
      end
      object About1: TMenuItem
        Caption = 'About'
      end
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 328
    Top = 592
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'sll'
    FileName = 'soleil'
    Filter = 'Soleil(*.sll)|*sll'
    Left = 360
    Top = 592
  end
end
