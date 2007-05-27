unit anteRielab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,macchieunit,rielaboratore;

type
  TForm5 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  xpos:integer;

implementation

{$R *.dfm}

procedure TForm5.ListBox1Click(Sender: TObject);
var
inx: integer;
begin
 inx:=listbox1.ItemIndex;
 label7.Caption:='File: '+tab.elementi[xpos,inx].fileorigine;
 label8.Caption:='Data: '+tab.elementi[xpos,inx].dt.dttostr;
 label9.Caption:='TU: '+floattostr(tab.elementi[xpos,inx].dt.tu);
 label2.Caption:='Eliografiche (X,Y): '+floattostr(taglia(tab.elementi[xpos,inx].xr,3))+' ,'+floattostr(taglia(tab.elementi[xpos,inx].yr,3));
 label3.Caption:='Normalizzate (X,Y): '+floattostr(taglia(tab.elementi[xpos,inx].xs,3))+' ,'+floattostr(taglia(tab.elementi[xpos,inx].ys,3));
 label5.Caption:='N° Pixel: '+inttostr(tab.elementi[xpos,inx].area);
 label6.Caption:='Milionesimi: '+floattostr(taglia(tab.elementi[xpos,inx].areamil,4));
end;

end.
