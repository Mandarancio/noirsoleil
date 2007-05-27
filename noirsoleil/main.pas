unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Menus, ExtDlgs, ComCtrls,math,search,macchieunit;

type
  TForm1 = class(TForm)
    menu: TMainMenu;
    File1: TMenuItem;
    Esci1: TMenuItem;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    SaveDialog1: TSaveDialog;
    oolS1: TMenuItem;
    Rielaboratore1: TMenuItem;
    StatusBar1: TStatusBar;
    Help1: TMenuItem;
    Help2: TMenuItem;
    About1: TMenuItem;
    Shape1: TShape;
    Shape2: TShape;
    Memo3: TMemo;
    Nuovasessione1: TMenuItem;
    Memo1: TMemo;
    Cambiadati1: TMenuItem;
    Disegnaasse1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label17: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit6: TEdit;
    edit7: TEdit;
    Button10: TButton;
    Button7: TButton;
    procedure Button7Click(Sender: TObject);
    procedure Disegnaasse1Click(Sender: TObject);
    procedure Cambiadati1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure Shape2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Rinonima1Click(Sender: TObject);
    procedure Nuovasessione1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Shape2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button5Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure shape2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Rielaboratore1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Esci1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
   DATA_OK=0;
   GIORNO_ERRATO=1;
   MESE_ERRATO=2;
   ANNO_ERRATO=3;
var
 Form1:tForm1;
 DX,DY,x,y,r,a,x0,y0,indc:integer;
 fname: string;
 S1,ind,tlevel: boolean;
 jd,p,l0,b0,cr:double;
 mrect:array [1..2,1..2] of integer;
 bordo,dimensioni:array[1..2] of integer;
 amac:array of macchia;
 acount,livello:integer;
 areatot:real;


implementation

uses Rielaboratore, ante, Console;

{$R *.dfm}

function jdies (y1, m1: integer; d, h: double):double;
var
 data, a, b, a1, b1: double;
 y, m: integer;
begin
 d:=d+(trunc(h)+(h-trunc(h))/60)/24;
 data:=y1+(m1+d/30.6)/12;
 if m1>2 then begin
   y:=y1;
   m:=m1;
 end
 else begin
   y:=y1-1;
   m:=m1+12;
 end;
 if data>=1582.875 then begin
   a:=trunc(y/100);
   b:=trunc(a/4);
   B:=2-A+B;
 end
 else begin
   a:=0;
   b:=0;
 end;
 a1:=trunc(365.25*(y+4716));
 b1:=trunc(30.6001*(m+1));
 jdies:=(A1+B1+D+B-1524.5);
end;

function kappa(jd:double):double;
var
 gr,t,aux:double;
begin
 gr:=57.29578;
 //* costante di conversione gradi <--> radianti */
 //* calcolo del secolo giuliano */
 t:=(jd-2415020.0)/(36525.0);
 aux:=74.3646+1.395833*t;
 aux:=aux/gr;
 kappa:=aux;
end;

function obliq(jd: double):double;
var
 gr,t,epsilon,omega:double;
begin
 gr:=57.29577951; //* costante di conversione gradi <--> radianti */
 //* calcolo del secolo giuliano */
 t:=(jd-2415020.0)/(36525.0);
 epsilon:=23.452294-0.0130125*t-0.00000164*t*t+0.000000503*t*t*t;
 omega:=4.523544355-33.7571461*t;
 epsilon:=epsilon+0.00256*cos(omega);
 epsilon:=epsilon/gr;
 obliq:=(epsilon);
end;
function sunlong(jd:double):double;
var
  gr,t,lo,omega,am,aux1,aux2,aux3,n:real;
begin
 gr:=57.29577951; //* costante di conversione gradi <--> radianti */
 //* calcolo del secolo giuliano */
 t:=(jd-2415020.0)/(36525.0);
 //* calcolo della longitudime media del Sole */
 lo:=(279.69668+36000.76892*t+0.0003025*t*t)/gr;
 //* calcolo della anomalia media del Sole */
 am:=(358.47583+35999.04975*t-0.00015*t*t-0.0000033*t*t*t)/gr;
 //* calcolo equazione del centro del Sole */
 aux1:=((1.91946-0.004789*t-0.000014*t*t)*sin(am))/gr;
 aux2:=((0.020094-0.0001*t)*sin(2*am))/gr;
 aux3:=(0.000293*sin(3*am))/gr;
 omega:=4.523544355-33.7571461*t;
 lo:=lo+aux1+aux2+aux3-0.000099309-0.000083601*sin(omega);
 //* riduzione della longitudine fra 0 e 6.28 */
 if (lo>=0) then
    n:=floor(lo/(2*PI))
 else
    n:=ceil(lo/(2*PI))-1;
 lo:=lo-n*2*PI;
 if (lo<0) then
    lo:=lo+2*PI;
 sunlong:=(lo);
end;


function cdata (giorno, mese, anno: integer):integer;
var
   maxgiorni: array [1..12] of integer;
   verifica: integer;
begin
   // caricamento numero massimo giorni per ogni mese
   maxgiorni[1]:=31;
   maxgiorni[2]:=28;
   maxgiorni[3]:=31;
   maxgiorni[4]:=30;
   maxgiorni[5]:=31;
   maxgiorni[6]:=30;
   maxgiorni[7]:=31;
   maxgiorni[8]:=31;
   maxgiorni[9]:=30;
   maxgiorni[10]:=31;
   maxgiorni[11]:=30;
   maxgiorni[12]:=31;
   // inizilamente data corretta
   verifica:=DATA_OK;
   // anno non valido
   if (anno<1600) or (anno>2500) then
      verifica:=ANNO_ERRATO;
   // mese non valido
   if (mese<1) or (mese>12) then
      verifica:=MESE_ERRATO;
   // se siamo a febbraio
   if (mese=2) then
   begin
      // se l'anno è bisestile
      if (anno mod 400=0) or ((anno mod 4=0) and (anno mod 100<>0)) then
      begin
         // febbraio ha al massimo 29 giorni
         if (giorno<1) or (giorno>29) then
            verifica:=GIORNO_ERRATO;
      end
      else
         // altrimenti 28
         if (giorno<1) or (giorno>28) then
            verifica:=GIORNO_ERRATO;
   end
   else
      // per gli altri mesi, il massimo di giorni salvato in MaxGiorni
      if (giorno<1) or (giorno>maxgiorni[mese]) then
         verifica:=GIORNO_ERRATO;
   // valore di ritorno
   cdata:=verifica;
end;

function cora(ora:real) :integer;
begin
 if (ora>0) and (ora<=24) then begin
  if ((ora-trunc(ora))*100>=0) and ((ora-trunc(ora))*100<60) then
   cora:=0
  else cora:=1;
 end
 else cora:=1;
end;

//calcolo delle effemeridi e stampa Btn: Calcola
procedure TForm1.Button10Click(Sender: TObject);
begin
 x0:=x+x0;
 y0:=y0-y;
 y:=0;
 x:=0;
 memo1.Lines.Strings[1]:='X='+inttostr(x);
 memo1.Lines.Strings[2]:='Y='+inttostr(y);
 memo1.Lines.Strings[3]:='r='+inttostr(r);
end;

procedure TForm1.Button1Click(Sender: TObject);
const
 c1=57.29577951;
 i1=7.25;
var
 dt,lo,ep,k,theta,eta,x1,y1,i:double;
 anno,mese,giorno, n:integer;
 tu:double;
begin
  anno:= strtoint(edit6.Text[7]+edit6.Text[8]+edit6.Text[9]+edit6.Text[10]);
  giorno:= strtoint(edit6.Text[1]+edit6.Text[2]);
  mese:=strtoint(edit6.Text[4]+edit6.Text[5]);
  tu:=strtofloat(edit7.text);
  if (cdata(giorno,mese,anno)=0) and (cora(tu)=0) then begin
   jd:=jdies(ANNO,MESE,GIORNO,TU)+51.0/86400.0;
   lo:=sunlong(jd);
   ep:=obliq(jd); //* obliquita' apparente dell'eclittica in radianti */
   //* Calcolo effemeridi fisiche del Sole */
   theta:=(jd-2398220)*(360.0/25.38);  //* I angolo ausiliario */
   k:=kappa(jd); //* II angolo ausiliario in radianti */
   i:=i1/c1;//* Inclinazione equatore solare in radianti */
   x1:=arctan(-cos(lo)*tan(ep));
   y1:=arctan(-cos(lo-k)*tan(i));
   p:=x1+y1; //* Angolo di posizione dell'asse di rotazione del Sole */
   B0:=arcsin(sin(lo-k)*sin(i)); //* Latitudine eliografica */
   eta:=arctan2(-sin(lo-k)*cos(i), -cos(lo-k));
   L0:=C1*eta-theta; //* Longitudine eliografica */
   //* Riduzione di L0 fra 0 e 360 gradi */
   if(L0>=0) then
    n:=floor(L0/360.0)
   else
    n:=ceil(L0/360.0);
   L0:=L0-n*360.0;
   if(L0<0) then
    L0:=L0+360;
   memo1.Lines.Strings[4]:='P: '+floattostr(p*c1);
   edit1.Text:=floattostr(taglia(l0,4));
   edit2.Text:=floattostr(taglia(b0*c1,4));
   cr:=(jd-2398140.24)/27.275232;
   edit3.Text:=floattostr(taglia(cr,4));
   edit4.Text:=floattostr(taglia(jd,4));
   edit6.ReadOnly:=true;
   edit7.ReadOnly:=true;
  end
  else begin
   edit6.Text:='gg/mm/aaaa';
   edit7.Text:='hh,mm';
   showmessage('Data o ora sbagliata!!');
  end;
end;

// apertura di un immagine Btn: Apri
procedure TForm1.Button2Click(Sender: TObject);

begin
 if (openpicturedialog1.Execute) and (openpicturedialog1.FileName<>'') then begin
  fname:=openpicturedialog1.FileName;
  image1.Picture.LoadFromFile(fname);
  image1.Canvas.Pen.Color:=65280;
  bordo[1]:=0;
  bordo[2]:=0;
  repeat
   bordo[1]:=bordo[1]+1;
  until image1.Canvas.Pixels[image1.Width-bordo[1],image1.Height div 2]>-1;
  repeat
    bordo[2]:=bordo[2]+1;
  until image1.Canvas.Pixels[image1.Width div 2,image1.Height-bordo[2]]>-1;
  bordo[1]:=bordo[1] div 2;
  bordo[2]:=bordo[2] div 2;
  shape2.Top:=y0-r;
  shape2.Left:=x0-r;
  shape2.Height:=r*2;
  shape2.Width:=r*2;
  shape2.Visible:=true;
//  image2.Canvas.Pen.Color:=cllime;
//  image2.Canvas.MoveTo(x0-bordo[1],y0-r-bordo[2]);
//  image2.Canvas.LineTo(x0-bordo[1],y0+r-bordo[2]);
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 i:integer;
begin
 if (acount>=0) and (edit1.Text<>'') then begin
  memo3.Clear;
  with memo3.Lines do begin
    Add('Data: '+edit6.Text);
    Add('T.U.: '+edit7.Text);
    Add('Jd: '+floattostr(jd));
    Add('L0 :'+floattostr(l0));
    Add('B0: '+floattostr(b0));
    Add('Cr: '+floattostr(cr));
    add('area totale: '+floattostr(areatot));
    Add('Nm: '+inttostr(acount+1));
    for I := 0 to acount do begin
      Add(form4.listbox1.Items.Strings[i]);
      Add('Xe: '+floattostr(amac[i].xr));
      Add('Ye: '+floattostr(amac[i].yr));
      Add('Xn: '+floattostr(amac[i].xs));
      Add('Yn: '+floattostr(amac[i].ys));
      Add('Area: '+inttostr(amac[i].area));
      add('Area mil: '+floattostr(amac[i].areamil));
    end;
  end;
  if savedialog1.Execute then
   memo3.Lines.SaveToFile(savedialog1.FileName);
 end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 ind:=false;
 tlevel:=true;
end;

//Individua macchie solari Btn: Individua
procedure TForm1.Button6Click(Sender: TObject);
begin
 ind:=true;
 indc:=0;
 if acount>=10 then setlength(amac,acount+1);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 if not form4.Visible then
  form4.visible:=true
 else form4.SetFocus;
 form4.Edit1.Text:=inttostr(livello);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 ind:=true;
 indc:=0;
end;

//Chiusura del pannello individua
procedure TForm1.Button9Click(Sender: TObject);
begin
end;

//Controllo oggetti presenti
procedure TForm1.Cambiadati1Click(Sender: TObject);
begin
 edit6.Text:='gg/mm/aaaa';
 edit7.Text:='hh,mm';
 edit6.ReadOnly:=false;
 edit7.ReadOnly:=false;
end;

procedure TForm1.Disegnaasse1Click(Sender: TObject);
var
 xf,yf,xi,yi:real;
begin
 if (r>0) and (p<>0) then begin
  xf:=x0-bordo[1]-sin(p)*r;
  xi:=x0-bordo[1]+sin(p)*r;
  yf:=y0-bordo[2]-r*cos(p);
  yi:=y0-bordo[2]+r*cos(p);
  with image1.Canvas do begin
   pen.Color:=65280;
   moveto(round(xi),round(yi));
   lineto(round(xf),round(yf));
  end;
 end;
end;

//Controllo sull'uscita del software
procedure TForm1.Esci1Click(Sender: TObject);
begin
 close;
end;

//Inizializzazione
procedure TForm1.FormCreate(Sender: TObject);
begin
 //inizializzazione variabili globali
 areatot:=0;
 setlength(amac,0);
 p:=-maxint;
 acount:=-1;
 r:=300;
 a:=0;
 x0:=image1.Width div 2;
 y0:=image1.Height div 2;
 x:=0;
 y:=0;
 shape2.Width:=r*2;
 shape2.Height:=r*2;
 shape2.Left:=x0-r;
 shape2.top:=y0-r;
 livello:=9000000;
 image1.Canvas.Pen.Color:=65280;
 
 memo1.Lines.Strings[1]:='X='+inttostr(x);
 memo1.Lines.Strings[2]:='Y='+inttostr(y);
 memo1.Lines.Strings[3]:='r='+inttostr(r);
 memo1.Lines.Strings[4]:='a='+inttostr(a);
 dimensioni[1]:=form1.width;
 dimensioni[2]:=form1.Height;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
 showmessage(inttostr(ord(key)));
end;

//Controlli sul ridimensionamento dell'immagine
procedure TForm1.FormResize(Sender: TObject);
begin
 if (dimensioni[1]<>form1.Width) or (dimensioni[2]<>form1.Height) then begin
   x0:=image1.Width div 2;
   y0:=image1.Height div 2;
   x:=0;
   y:=0;
   shape2.Top:=y+y0-r;
   dimensioni[1]:=form1.Width;
   dimensioni[2]:=form1.Height;
   memo1.Lines.Strings[1]:='X='+inttostr(x);
   memo1.Lines.Strings[2]:='Y='+inttostr(y);
   memo1.Lines.Strings[3]:='r='+inttostr(r);
   memo1.Lines.Strings[4]:='a='+inttostr(a);
 end;
end;
procedure TForm1.Help2Click(Sender: TObject);
begin
 
end;

//Ricerca delle macchie in un area selezionata
//DA FINIRE!!
procedure TForm1.Image1Click(Sender: TObject);
var
 m0:macchia;
begin
 if ind then begin
  indc:=indc+1;
  mrect[indc,1]:=mouse.CursorPos.X-form1.Left-2;
  mrect[indc,2]:=mouse.CursorPos.Y-form1.Top-48;
  if indc=2 then begin
   ind:=false;
   //trova area e centro
   //Inizializzazione variabili
   shape1.Visible:=true;
   //Posizionamento rettangolo
   shape1.Top:=mrect[1,2];
   shape1.Left:=mrect[1,1];
   shape1.Width:=mrect[2,1]-mrect[1,1];
   shape1.Height:=mrect[2,2]-mrect[1,2];
   if p>-maxint then begin
     //Ricerca
     m0:=searchm(mrect[1,1]-bordo[1],mrect[1,2]-bordo[2],mrect[2,1]-bordo[1],mrect[2,2]-bordo[2],livello,r,x0,y0);
     //Stampa risultati
     areatot:=areatot+m0.areamil;
     form4.Memo1.Clear;
     if m0.h>-1 then begin
       with form4.memo1.Lines do begin
         add('Area[sqr(px)]: '+inttostr(m0.area));
         add('Area[mil]: '+floattostr(m0.areamil));
         add('Raggio[px]: '+inttostr(round(m0.r)));
         add('Raggio norm: '+floattostr(m0.rm));
         add('Centro[px]: '+inttostr(m0.xc)+' , '+inttostr(m0.yc));
         add('Coordinate norm: '+floattostr(m0.xs)+' , '+floattostr(m0.ys));
         add('Coordinate elio: '+floattostr(m0.xr)+' , '+floattostr(m0.yr));
       end;
       //Aggiungo elemento all'array
       acount:=acount+1;
       setlength(amac,acount);
       amac[acount-1]:=m0;
       //Inserimento area di contenimento
       amac[acount].mrect[1,1]:=mrect[1,1]-bordo[1];
       amac[acount].mrect[1,2]:=mrect[1,2]-bordo[2];
       amac[acount].mrect[2,1]:=mrect[2,1]-bordo[1];
       amac[acount].mrect[2,2]:=mrect[2,2]-bordo[2];
       form4.listbox1.Items.Add('Macchia['+inttostr(acount)+']');
     end
     else showmessage('Nessuna Macchia');
   end
   else showmessage('Calcolare prima le effemeridi');
  end;
 end;
 if tlevel then begin
  form4.Edit1.Text:=inttostr(image1.Canvas.pixels[mouse.CursorPos.X-form1.Left-2-bordo[1],mouse.CursorPos.Y-form1.Top-48-bordo[2]]);
  livello:=strtoint(form4.Edit1.Text);
  tlevel:=false;
 end;
end;


//Stampa delle Coordinate
procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 image1.Hint:='X= '+inttostr(x-image1.Width div 2)+'; Y= '+inttostr(image1.Height div 2 -y)+';';
 statusbar1.Panels.Items[0].Text:='x: '+inttostr(x-x0);
 statusbar1.Panels.Items[1].Text:='y: '+inttostr(y0-y);
 statusbar1.Panels.Items[2].Text:=inttostr(image1.Canvas.Pixels[x-bordo[1],y-bordo[2]]);
end;

//Posizionamento griglia di rifermimento

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
 if upcase(Key)='W' then
  y:=y+2;
 if upcase(Key)='S' then
  y:=y-2;
 if upcase(Key)='A' then
  x:=x-2;
 if upcase(Key)='D' then
  x:=x+2;
 if (Key)='+' then begin
  r:=r+2;
 end;
 if (Key)='-' then begin
  r:=r-2;
 end;
 memo1.Lines.Strings[1]:='X='+inttostr(x);
 memo1.Lines.Strings[2]:='Y='+inttostr(y);
 memo1.Lines.Strings[3]:='r='+inttostr(r);
 shape2.Top:=y0-y-r;
 shape2.Left:=x+x0-r;
 shape2.Height:=r*2;
 shape2.Width:=r*2;
end;

procedure TForm1.Nuovasessione1Click(Sender: TObject);
begin
 areatot:=0;
 edit6.Text:='gg/mm/aaaa';
 edit7.Text:='hh,mm';
 edit1.Clear;
 edit2.Clear;
 edit3.Clear;
 edit4.Clear;
 edit6.ReadOnly:=false;
 edit7.ReadOnly:=false;
 setlength(amac,10);
 image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
 shape2.Visible:=false;
 shape1.Visible:=false;
 acount:=0;
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

//Selezione di ToolS del menu per il software di rielaborazione
procedure TForm1.Rielaboratore1Click(Sender: TObject);
begin
 form2.visible:=true;
 form2.SetFocus;
end;

procedure TForm1.Rinonima1Click(Sender: TObject);
begin
 form4.listbox1.Items.Strings[form4.listbox1.ItemIndex]:=inputbox('Rinonima','Nuovo nome: ',form4.listbox1.Items.Strings[form4.listbox1.ItemIndex]);
end;

procedure TForm1.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shape1.ShowHint:=true;
 shape1.Hint:='X= '+inttostr(x-shape1.Width div 2)+'; Y= '+inttostr(shape1.Height div 2-y)+';';
 statusbar1.Panels.Items[0].Text:='x: '+inttostr(x-x0+shape1.Left);
 statusbar1.Panels.Items[1].Text:='y: '+inttostr(y0-y-shape1.Top);
 statusbar1.Panels.Items[2].Text:=inttostr(image1.Canvas.Pixels[x+shape1.Left-bordo[1],y+shape1.Top-bordo[2]]);
end;

procedure TForm1.Shape2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

//Stampa delle Coordinate parte II
procedure TForm1.shape2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 shape1.ShowHint:=true;
 shape1.Hint:='X= '+inttostr(x-shape1.Width div 2)+'; Y= '+inttostr(shape1.Height div 2-y)+';';
 statusbar1.Panels.Items[0].Text:='x: '+inttostr(x-x0+shape2.Left);
 statusbar1.Panels.Items[1].Text:='y: '+inttostr(y0-y-shape2.Top);
 statusbar1.Panels.Items[2].Text:=inttostr(image1.Canvas.Pixels[x+shape2.Left-bordo[1],y+shape2.Top-bordo[2]]);
end;

procedure TForm1.Shape2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 m0:macchia; //macchie da utilizzare
begin
 if ind then begin
  indc:=indc+1;
  mrect[indc,1]:=mouse.CursorPos.X-form1.Left-2;
  mrect[indc,2]:=mouse.CursorPos.Y-form1.Top-48;
  if indc=2 then begin
   ind:=false;
   shape1.Visible:=true;
   //Posizionamento rettangolo
   shape1.Top:=mrect[1,2];
   shape1.Left:=mrect[1,1];
   shape1.Width:=mrect[2,1]-mrect[1,1];
   shape1.Height:=mrect[2,2]-mrect[1,2];
   if p>-maxint then begin
     //Ricerca
     m0:=searchm(mrect[1,1]-bordo[1],mrect[1,2]-bordo[2],mrect[2,1]-bordo[1],mrect[2,2]-bordo[2],livello,r,x0,y0);
     //Stampa risultati
     form4.memo1.Clear;
     if m0.h>-1 then begin
       with form4.memo1.Lines do begin
         add('Area[sqr(px)]: '+inttostr(m0.area));
         add('Area[mil]: '+floattostr(m0.areamil));
         add('Raggio[px]: '+inttostr(round(m0.r)));
         add('Raggio norm: '+floattostr(m0.rm));
         add('Centro[px]: '+inttostr(m0.xc)+' , '+inttostr(m0.yc));
         add('Coordinate norm: '+floattostr(m0.xs)+' , '+floattostr(m0.ys));
         add('Coordinate elio: '+floattostr(m0.xr)+' , '+floattostr(m0.yr));
       end;
       //Aggiungo elemento all'array
       acount:=acount+1;
       setlength(amac,acount);
       amac[acount-1]:=m0;
       areatot:=areatot+m0.areamil;
       //Inserimento area di contenimento
       amac[acount].mrect[1,1]:=mrect[1,1]-bordo[1];
       amac[acount].mrect[1,2]:=mrect[1,2]-bordo[2];
       amac[acount].mrect[2,1]:=mrect[2,1]-bordo[1];
       amac[acount].mrect[2,2]:=mrect[2,2]-bordo[2];
       form4.listbox1.Items.Add('Macchia['+inttostr(acount)+']');
     end
     else showmessage('Nessuna Macchia');
   end
   else showmessage('Calcolare prima le effemeridi');
  end;
 end;
 if tlevel then begin
  form4.Edit1.Text:=inttostr(image1.Canvas.pixels[mouse.CursorPos.X-form1.Left-2-bordo[1],mouse.CursorPos.Y-form1.Top-48-bordo[2]]);
  livello:=strtoint(form4.Edit1.Text);
  tlevel:=false;
 end;
end;


end.
