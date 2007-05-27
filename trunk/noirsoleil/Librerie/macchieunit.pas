unit macchieunit;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Menus, ExtDlgs, ComCtrls,math;
type
 data= object         //classe data
   gg,mm,aaaa:integer;
   tu:real;
   function dttostr: string;
 end;

 macchia= record     //tipo macchia    Descrizioni variabili:
   h,xc,yc,area,yi,yf:integer;  //altezza macchia, coordinate x,y centro in px rispetto al centro del cerchio, area in px della macchia, variabili per la ricerca della macchia (yiniziale e yfinale macchia)
   mrect: array [1..2,1..2] of integer;   //area (rettangolare) dove è stata ricercata la macchia
   aream,rm,r,xs,xr,ys,yr,areamil:real;   //area in metri (da togliere), r in metro (da togliere), r in px, coordinate normalizzate, area milionesimi
   fileorigine,name:string;
   dt:data;
  end;

  nomenum= record
    num: integer;
    nom: string;
  end;

  tabMac = object
   mx,my:integer;
   nomi: array of nomenum;
   elementi: array of array of macchia;
   function search(nome: string): integer;
   function searchf(n:integer; f:string): integer;
   procedure addcol(nome: string);
   procedure addrig(n:integer; m:macchia);
   procedure remrig(n,h:integer);
   procedure remcol(n:integer);
   procedure delfile(f:string);
   procedure init;
  end;
  //Funzioni
  function dtvsdt(a,b:data;inv:boolean):integer;
  function taglia(a:real;n:integer):real;

implementation
// PROCEDURE MACCHIA E SEARCHM
function data.dttostr: string;
begin
  dttostr:=inttostr(gg)+'/'+inttostr(mm)+'/'+inttostr(aaaa);
end;
//PROCEDURE E FUNZIONI tabMac

function tabmac.search(nome: string): integer;
const
 nul=-2;
 err=-1;
var
 tmp,i:integer;
begin
 tmp:=nul;
 if mx=0 then tmp:=err
 else begin
  for i := 0 to mx-1 do
    if nomi[i].nom=nome then
      tmp:=i;
  if tmp=nul then
    tmp:= err;
 end;
 search:=tmp;
end;

function tabmac.searchf(n: Integer; f: string): integer;
const
 nul=-2;
 err=-1;
var
 i,tmp:integer;
begin
 tmp:=nul;
 for i := 0 to nomi[n].num-1 do if elementi[n,i].fileorigine=f then tmp:=i;
 if tmp=nul then tmp:=err;
 searchf:=tmp;
end;

procedure tabmac.addcol(nome: string);
begin
  if search(nome)>-1 then showmessage('ERRORE 01! Elemento già presente impossibilie aggiungere colonna!')
  else begin
    mx:=mx+1;
    setlength(nomi,mx);
    setlength(elementi,mx,my);
    nomi[mx-1].nom:=nome;
    nomi[mx-1].num:=0;
  end;
end;

procedure tabmac.addrig(n: Integer; m: macchia);
var
 i,h:integer;
begin
  if n>mx-1 then showmessage('ERRORE 02! Posizione inesistente! Impossibile collocare elemento!')
  else begin
    nomi[n].num:=nomi[n].num+1;
    if nomi[n].num>my then begin
      my:=my+1;
      setlength(elementi,mx,my);
    end;
    if nomi[n].num>1 then begin
     h:=-1;    //controllo data!!
     I:=-1;
     repeat
      i:=i+1;
      if dtvsdt(m.dt,elementi[n,i].dt,false)=2 then h:=i;
     until (i=nomi[n].num-2) or (h>-1);
     if h=-1 then// caso fosse la maggiore
      elementi[n,nomi[n].num-1]:=m
     else begin  //caso nn la fosse!
      for i := nomi[n].num-2 downto h do elementi[n,i+1]:=elementi[n,i];
      elementi[n,h]:=m;
     end;
    end
    else elementi[n,nomi[n].num-1]:=m;
  end;
end;

procedure tabmac.remcol(n: integer);
var
 i,j:integer;
begin
 if not (n=mx-1) then  begin
  for i := n to mx-2 do begin
   nomi[i].num:=nomi[i+1].num;
   nomi[i].nom:=nomi[i+1].nom;
   for j := 0 to nomi[i+1].num-1 do
    elementi[i,j]:=elementi[i+1,j];
  end;
  mx:=mx-1;
  setlength(elementi,mx,my);
  setlength(nomi,mx);
 end
 else begin
  mx:=mx-1;
  setlength(elementi,mx,my);
  setlength(nomi,mx);
 end;
end;

procedure tabmac.remrig(n,h: Integer);
var
 i:integer;
begin
 if h=nomi[n].num-1 then
  nomi[n].num:=nomi[n].num-1
 else begin
  for i := h to nomi[n].num-2 do
   elementi[n,i]:=elementi[n,i+1];
  nomi[n].num:=nomi[n].num-1;
 end;
end;

procedure tabmac.delfile(f: string);
var
 i:Integer;
begin
 if mx>0 then begin
  i := 0;
  repeat
   if searchf(i,f)>-1 then begin
    remrig(i,searchf(i,f));
    if nomi[i].num=0 then begin
     remcol(i);
     i:=-1;
    end;
   end;
   i:=i+1;
  until (i=mx-1) or (mx=0);
 end;
end;

// inizializzazione a 0 delle variabili
procedure tabmac.init;
begin
  mx:=0;
  my:=0;
  setlength(nomi,0);
  setlength(elementi,0,0);
end;

// dtvsdt funzione per stabilire quale sia la data maggiore o minore

function dtvsdt(a,b:data;inv:boolean):integer;
var
 tmp:integer;
 dif:double;
begin
 dif:=(a.tu-b.tu)+(a.gg-b.gg)*100.0+(a.mm-b.mm)*10000.0+(a.aaaa-b.aaaa)*1000000.0;
 if inv then dif:=-dif;
 if dif>0 then tmp:=1;
 if dif<0 then tmp:=2;
 if dif=0 then tmp:=0;
 dtvsdt:=tmp;
end;

//function taglia alle prime n cifre decimali un reale

function taglia(a:real;n:integer):real;
var
 int,dec,cambio,i:integer;
begin
 cambio:=1;
 for i := 1 to n do
  cambio:=cambio*10;
 int:=trunc(a);
 dec:=round((a-int)*cambio);
 taglia:=int+(dec/cambio);
end;


end.
