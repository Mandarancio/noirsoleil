unit GraficoArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, TeeFunci, Series;

type
  TForm7 = class(TForm)
    Chart1: TChart;
    Series1: TAreaSeries;
    TeeFunction1: TMultiplyTeeFunction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

end.
