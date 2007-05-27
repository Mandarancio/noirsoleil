unit Grafici;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Rielaboratore, macchieunit;

type
  TForm6 = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure disegna;
  private
    { Private declarations }
    procedure sfondo(c: Tcolor);
  public
    { Public declarations }
  end;
  coordinate= record
    x,y,r:integer;
  end;

var
  Form6: TForm6;
  c0: coordinate;
implementation

{$R *.dfm}
procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 timer1.Enabled:=false;
end;

procedure tform6.sfondo(c: TColor);
var
 mx,my,i,j:integer;
 r:real;
begin
 mx:=paintbox1.Width;
 my:=paintbox1.Height;
 c0.x:=mx div 2;
 c0.r:=c0.x-5;
 c0.y:=my div 2;
 with paintbox1.Canvas do begin
  //pulizia
  brush.Color:=c;
  pen.Color:=c;
  rectangle(0,0,mx,my);
  //cerchio sole
  pen.Color:=clyellow;
  ellipse(5,5,mx-5,my-5);
  //assi cartesiani
  pen.Color:=0;
  moveto(0,c0.y);
  lineto(mx,c0.y);
  textout(mx-10,c0.y-15,'1r');
  textout(mx-8,c0.y+3,'X');
  moveto(c0.x,0);
  lineto(c0.x,my);
  textout(c0.x+3,1,'1r');
  textout(c0.x-10,1,'Y');
  //tacca a metà
  //asse X
  moveto(c0.x-c0.r div 2,c0.y-5);
  lineto(c0.x-c0.r div 2,c0.y+5);
  textout(c0.x-c0.r div 2 -10,c0.y -15,'-0.5r');
  moveto(c0.x+c0.r div 2,c0.y-5);
  lineto(c0.x+c0.r div 2,c0.y+5);
  textout(c0.x+c0.r div 2 -8,c0.y -15,'0.5r');
  //asse Y
  moveto(c0.x-5,c0.y-c0.r div 2);
  lineto(c0.x+5,c0.y-c0.r div 2);
  textout(c0.x+8,c0.y-c0.r div 2-5,'0.5r');
  moveto(c0.x-5,c0.y+c0.r div 2);
  lineto(c0.x+5,c0.y+c0.r div 2);
  textout(c0.x+6,c0.y+c0.r div 2-5,'-0.5r');
  //inizio rendering macchie
  if tab.mx>0 then begin
   for i := 0 to tab.mx - 1 do begin
    pen.Color:=tab.nomi[i].col;
    brush.Color:=tab.nomi[i].col;
    j:=0;
    moveto(round(tab.elementi[i,j].xs*c0.r)+c0.x,c0.y-round(tab.elementi[i,j].ys*c0.r));
    r:=sqrt(tab.elementi[i,j].areamil*(c0.r*c0.r)/1000000);
    ellipse(c0.x+round(tab.elementi[i,j].xs*c0.r-r),c0.y-round(tab.elementi[i,j].ys*c0.r-r),c0.x+round(tab.elementi[i,j].xs*c0.r+r),c0.y-round(tab.elementi[i,j].ys*c0.r+r));
    brush.Color:=c;
    font.Color:=tab.nomi[i].col;
    textout(round(tab.elementi[i,j].xs*c0.r)+c0.x,c0.y-round(tab.elementi[i,j].ys*c0.r-r)+2,tab.elementi[i,j].name);
    brush.Color:=tab.nomi[i].col;
    if tab.nomi[i].num>1 then
     for j := 1 to tab.nomi[i].num - 1 do begin
      lineto(round(tab.elementi[i,j].xs*c0.r)+c0.x,c0.y-round(tab.elementi[i,j].ys*c0.r));
      r:=sqrt(tab.elementi[i,j].areamil*(c0.r*c0.r)/1000000);
      ellipse(c0.x+round(tab.elementi[i,j].xs*c0.r-r),c0.y-round(tab.elementi[i,j].ys*c0.r-r),c0.x+round(tab.elementi[i,j].xs*c0.r+r),c0.y-round(tab.elementi[i,j].ys*c0.r+r));
     end;
   end;
   font.color:=clblack;
  end;
 end;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
 disegna;
end;

procedure tform6.disegna;
begin
  sfondo(clgray);
end;

end.
