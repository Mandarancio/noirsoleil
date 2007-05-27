unit Rielaboratore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls,macchieunit;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Aggiungi1: TMenuItem;
    Rimuovi1: TMenuItem;
    Esci1: TMenuItem;
    Disegna1: TMenuItem;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    TabControl1: TTabControl;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ListBox2: TListBox;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Memo1: TMemo;
    Button4: TButton;
    Pulisci1: TMenuItem;
    Button5: TButton;
    AndamentoArea1: TMenuItem;
    Ricostruzionepercorso1: TMenuItem;
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Esci1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function verifica(n:string): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  mc,mctemp:integer;
  amediaMil:real;
  tab:tabmac;
  dti,dtf:data;

implementation

uses anteRielab, Grafici, GraficoArea;

{$R *.dfm}

function tform2.verifica(n: string) :boolean;
var
 i:integer;
begin
 verifica:=true;
 if listbox1.Count>0 then begin
  for i := 0 to Listbox1.Count-1 do
   if listbox1.Items.Strings[i]=n then verifica:=false;
 end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 i,j,nm:integer;
 dt:data;
 filen:string;
 mctmp:macchia;
begin
 if opendialog1.Execute then begin //ESECUZIONE MENU OPEN!!
  filen:=opendialog1.FileName;
  if verifica(filen) then begin
   listbox1.Items.Add(FileN);           //aggiunta alla lista del file
   memo1.Lines.LoadFromFile(FileN);
   with memo1.Lines do begin            //lettura data , ora e nmacchie
     dt.gg:=strtoint(copy(strings[0],7,2));
     dt.mm:=strtoint(copy(strings[0],10,2));
     dt.aaaa:=strtoint(copy(strings[0],13,4));
     dt.tu:=strtofloat(copy(strings[1],7,length(strings[1])-6));
     nm:=strtoint(copy(strings[7],5,length(strings[7])-4));
     amediamil:=(amediamil+(strtofloat(copy(strings[6],14,length(strings[6])-13))/2))/2;
     if dtvsdt(dt,dti,true)=1 then begin
      label3.Caption:=dt.dttostr;
      dti:=dt;
     end;
     if dtvsdt(dt,dtf,false)=1 then begin
      label5.Caption:=dt.dttostr;
      dtf:=dt;
     end;
     label9.Caption:=floattostr(amediamil)+' mil';
   end;
   for i := 1 to nm do begin
    mctmp.name:=memo1.Lines.Strings[8+(i-1)*7];
    mctmp.dt:=dt;
    mctmp.fileorigine:=filen;
    mctmp.xr:=strtofloat(copy(memo1.Lines.Strings[9+(i-1)*7],4,length(memo1.Lines.Strings[9+(i-1)*7])-3));
    mctmp.yr:=strtofloat(copy(memo1.Lines.Strings[10+(i-1)*7],4,length(memo1.Lines.Strings[10+(i-1)*7])-3));
    mctmp.xs:=strtofloat(copy(memo1.Lines.Strings[11+(i-1)*7],4,length(memo1.Lines.Strings[11+(i-1)*7])-3));
    mctmp.ys:=strtofloat(copy(memo1.Lines.Strings[12+(i-1)*7],4,length(memo1.Lines.Strings[12+(i-1)*7])-3));
    mctmp.area:=strtoint(copy(memo1.Lines.Strings[13+(i-1)*7],7,length(memo1.Lines.Strings[13+(i-1)*7])-6));
    mctmp.areamil:=strtofloat(copy(memo1.Lines.Strings[14+(i-1)*7],11,length(memo1.Lines.Strings[14+(i-1)*7])-10));
    if tab.search(mctmp.name)=-1 then begin
      tab.addcol(mctmp.name);
      tab.addrig(tab.mx-1,mctmp);
      listbox2.Items.Add(mctmp.name+' : 1');
    end
    else begin
      tab.addrig(tab.search(mctmp.name),mctmp);
      listbox2.Items.Strings[tab.search(mctmp.name)]:=mctmp.name+' : '+inttostr(tab.nomi[tab.search(mctmp.name)].num);
    end;
   end;
  end
  else showmessage('Errore 03! File già presente! Impossibile aggiungerlo di nuovo!');
 end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
 ind,i:integer;
begin
 if listbox1.Items.Count>0 then begin
  ind:=listbox1.ItemIndex;
  tab.delfile(listbox1.Items.Strings[ind]);
  listbox1.Items.Delete(ind);
  listbox2.Clear;
  if listbox1.items.count>0 then begin
   for i := 0 to tab.mx-1 do
    listbox2.Items.Add(tab.nomi[i].nom+' : '+inttostr(tab.nomi[i].num));
  end;
 end
 else showmessage('Errore 04! Nessun file da rimuovere!');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
 form6.Timer1.Enabled:=true;
 form6.visible:=true;
 form6.disegna;
 form6.SetFocus;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
 tab.init;
 listbox1.Clear;
 listbox2.Clear;
 memo1.Clear;
 label3.Caption:='gg/mm/aaaa';
 label5.Caption:='gg/mm/aaaa';
 label9.Caption:='0 mil';
end;

procedure TForm2.Button5Click(Sender: TObject);
var
 h,i:integer;
begin
 if not (listbox2.ItemIndex=-1) then begin
  form7.visible:=true;
  form7.SetFocus;
  h:=listbox2.ItemIndex;
  form7.Caption:='Andamento area: '+tab.nomi[h].nom;
  if form7.Chart1.Title.Text.Count=2 then
   form7.Chart1.Title.Text.Strings[1]:=tab.nomi[h].nom
  else if form7.Chart1.Title.Text.Count=1 then
   form7.Chart1.Title.Text.Add(tab.nomi[h].nom);
   form7.Chart1.SeriesList.Series[0].Clear;
  for I := 0 to tab.nomi[h].num-1 do
   form7.Chart1.SeriesList.Series[0].Add(tab.elementi[h,i].areamil,tab.elementi[h,i].dt.dttostr);
 end;
end;

procedure TForm2.Esci1Click(Sender: TObject);
begin
 form2.close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 amediaMil:=0;
 tab.init;
 dtf.gg:=0;
 dtf.mm:=0;
 dtf.aaaa:=0;
 dti.gg:=99;
 dti.mm:=99;
 dti.aaaa:=9999;
end;

procedure TForm2.ListBox2Click(Sender: TObject);
var
 i,ind,imx:integer;
 nmel:string;
begin
 form5.ListBox1.Clear;
 ind:=listbox2.ItemIndex;
 form5.Caption:=listbox2.Items.Strings[ind];
 nmel:=tab.elementi[ind,0].name;
 imx:=tab.nomi[ind].num;
 xpos:=ind;
 with form5.ListBox1 do begin
  for i := 1 to imx do
   items.Add(nmel+' n°: '+inttostr(i));
 end;
 if form5.visible then
  form5.SetFocus
 else form5.Visible:=true;
end;

end.
