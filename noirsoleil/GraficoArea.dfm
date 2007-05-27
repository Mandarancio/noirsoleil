object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Andamento area: '
  ClientHeight = 529
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 537
    Height = 529
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Grafico andamento dell'#39'are della macchia: ')
    Align = alClient
    TabOrder = 0
    ExplicitTop = 512
    ExplicitHeight = 17
    object Series1: TAreaSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      AreaBrush = bsClear
      DrawArea = True
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = True
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      object TeeFunction1: TMultiplyTeeFunction
      end
    end
  end
end
