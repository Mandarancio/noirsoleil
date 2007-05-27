unit Console;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus,main,macchieunit;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    Button3: TButton;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    Rinonima1: TMenuItem;
    Elimina1: TMenuItem;
    procedure Elimina1Click(Sender: TObject);
    procedure Rinonima1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses ante;

{$R *.dfm}

procedure TForm4.Button2Click(Sender: TObject);
begin
 tlevel:=true;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
 ind:=true;
 indc:=0;
end;

procedure TForm4.Elimina1Click(Sender: TObject);
var
 i,ix,j:integer;
begin
 ix:=form4.listbox1.ItemIndex;
 form4.listbox1.Items.Delete(ix);
 areatot:=areatot-amac[ix].areamil;
 acount:=acount-1;
 //cancellazione della macchia
 if amac[ix].mrect[1,1]<amac[ix].mrect[2,1] then begin
  for I :=amac[ix].mrect[1,1] to amac[ix].mrect[2,1] do begin
   if amac[ix].mrect[1,2]<amac[ix].mrect[2,2] then  begin
    for j := amac[ix].mrect[1,2] to amac[ix].mrect[2,2] do
      if (form1.image1.Canvas.Pixels[i,j]=clwhite) or (form1.image1.Canvas.Pixels[i,j]=cllime) then
       form1.image1.Canvas.Pixels[i,j]:=clblack
   end
   else
    for j := amac[ix].mrect[2,2] to amac[ix].mrect[1,2] do
      if (form1.image1.Canvas.Pixels[i,j]=clwhite) or (form1.image1.Canvas.Pixels[i,j]=cllime) then
       form1.image1.Canvas.Pixels[i,j]:=clblack
  end;
 end
 else begin
  for I :=amac[ix].mrect[2,1] to amac[ix].mrect[1,1] do begin
   if amac[ix].mrect[1,2]<amac[ix].mrect[2,2] then begin
    for j := amac[ix].mrect[1,2] to amac[ix].mrect[2,2] do
      if (form1.image1.Canvas.Pixels[i,j]=clwhite) or (form1.image1.Canvas.Pixels[i,j]=cllime) then
       form1.image1.Canvas.Pixels[i,j]:=clblack
   end
   else
    for j := amac[ix].mrect[2,2] to amac[ix].mrect[1,2] do
      if (form1.image1.Canvas.Pixels[i,j]=clwhite) or (form1.image1.Canvas.Pixels[i,j]=cllime) then
       form1.image1.Canvas.Pixels[i,j]:=clblack
  end;
 end;
 for I := ix to acount do
  amac[i]:=amac[i+1];
 setlength(amac,acount);
end;

procedure TForm4.ListBox1Click(Sender: TObject);
var
 h:integer;
begin
 h:=listbox1.ItemIndex;
 if not (h=-1) then begin
  form3.visible:=true;
  form3.SetFocus;
  form3.Caption:=amac[h].name;
  form3.Label3.caption:='Posizione: '+inttostr(amac[h].xc)+' ;'+inttostr(amac[h].yc);
  form3.Label4.caption:='Normalizzata: '+floattostr(taglia(amac[h].xs,3))+' ;'+floattostr(taglia(amac[h].ys,3));
  form3.label6.caption:='Eliografica: '+floattostr(taglia(amac[h].xr,3))+' ;'+floattostr(taglia(amac[h].yr,3));
  form3.label5.caption:='Area: '+inttostr(amac[h].area);
  form3.Label2.caption:='Milionesimi: '+floattostr(taglia(amac[h].areamil,3));
 end;
end;

procedure TForm4.Rinonima1Click(Sender: TObject);
begin
 if not (listbox1.Itemindex=-1) then
  listbox1.Items.Strings[listbox1.ItemIndex]:=inputbox('Rinonima','Nome: ',listbox1.Items.Strings[listbox1.ItemIndex]);
end;

end.
