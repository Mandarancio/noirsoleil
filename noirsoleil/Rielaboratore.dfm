object Form2: TForm2
  Left = 0
  Top = 11
  Caption = 'Rielaboratore'
  ClientHeight = 498
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 498
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 10
    ExplicitTop = -8
    DesignSize = (
      137
      498)
    object ListBox1: TListBox
      Left = 8
      Top = 8
      Width = 121
      Height = 414
      Anchors = [akLeft, akTop, akBottom]
      ItemHeight = 13
      TabOrder = 0
      ExplicitHeight = 394
    end
    object Button1: TButton
      Left = 8
      Top = 424
      Width = 57
      Height = 25
      Caption = 'Aggiungi'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 71
      Top = 424
      Width = 60
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Rimuovi'
      TabOrder = 2
      OnClick = Button2Click
      ExplicitTop = 404
    end
    object Button3: TButton
      Left = 71
      Top = 455
      Width = 60
      Height = 25
      Caption = 'Disegna'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 8
      Top = 455
      Width = 57
      Height = 25
      Caption = 'Pulisci'
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object TabControl1: TTabControl
    Left = 137
    Top = 0
    Width = 375
    Height = 498
    Align = alClient
    TabOrder = 1
    Tabs.Strings = (
      'Macchie')
    TabIndex = 0
    ExplicitHeight = 478
    DesignSize = (
      375
      498)
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object Label2: TLabel
      Left = 16
      Top = 43
      Width = 17
      Height = 13
      Caption = 'Da:'
    end
    object Label3: TLabel
      Left = 16
      Top = 62
      Width = 60
      Height = 13
      Caption = 'gg/mm/aaaa'
    end
    object Label4: TLabel
      Left = 112
      Top = 43
      Width = 11
      Height = 13
      Caption = 'A:'
    end
    object Label5: TLabel
      Left = 112
      Top = 62
      Width = 60
      Height = 13
      Caption = 'gg/mm/aaaa'
    end
    object Label6: TLabel
      Left = 16
      Top = 96
      Width = 81
      Height = 13
      Caption = 'Macchie rivelate:'
    end
    object Label7: TLabel
      Left = 192
      Top = 96
      Width = 58
      Height = 13
      Caption = 'Area media:'
    end
    object Label9: TLabel
      Left = 192
      Top = 115
      Width = 21
      Height = 13
      Caption = '0 mil'
    end
    object Label10: TLabel
      Left = 16
      Top = 245
      Width = 58
      Height = 13
      Caption = 'Dettagli file:'
    end
    object ListBox2: TListBox
      Left = 16
      Top = 115
      Width = 156
      Height = 97
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = ListBox2Click
    end
    object Memo1: TMemo
      Left = 3
      Top = 264
      Width = 366
      Height = 231
      Anchors = [akLeft, akTop, akRight, akBottom]
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object Button5: TButton
      Left = 16
      Top = 214
      Width = 156
      Height = 25
      Caption = 'Grafico andamento area'
      TabOrder = 2
      OnClick = Button5Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 448
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Aggiungi1: TMenuItem
        Caption = 'Aggiungi'
        OnClick = Button1Click
      end
      object Rimuovi1: TMenuItem
        Caption = 'Rimuovi'
      end
      object Pulisci1: TMenuItem
        Caption = 'Pulisci'
        OnClick = Button4Click
      end
      object Esci1: TMenuItem
        Caption = 'Esci'
        OnClick = Esci1Click
      end
    end
    object Disegna1: TMenuItem
      Caption = 'Disegna'
      object AndamentoArea1: TMenuItem
        Caption = 'Andamento Area'
      end
      object Ricostruzionepercorso1: TMenuItem
        Caption = 'Ricostruzione percorso'
        OnClick = Button3Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'sll'
    Filter = 'Soleil (*.sll)|*.sll'
    Left = 480
    Top = 8
  end
end
