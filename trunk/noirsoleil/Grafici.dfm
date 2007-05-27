object Form6: TForm6
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Grafico'
  ClientHeight = 600
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 600
    Height = 600
    Align = alClient
    Color = clCream
    Enabled = False
    ParentColor = False
    ExplicitWidth = 305
    ExplicitHeight = 225
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 272
    Top = 336
  end
end
