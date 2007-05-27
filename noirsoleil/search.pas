unit search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Menus, ExtDlgs, ComCtrls,math,macchieunit;

  function searchm(x0,y0,xf,yf,lev,rs,xc,yc:integer): macchia;     // procedura che trova e rielabora le macchie sullo schermo


implementation
uses main;

function searchm(x0,y0,xf,yf,lev,rs,xc,yc:integer): macchia;
const
  c1=57.29577951;
var
 xt,yt,i,j:integer;
 m0,m1:macchia; //var macchia (m0 globale , m1 temp)
 rm: real; // raggio macchia
 aux1,aux2,n,xn,yn: real; //var temporanee
begin
 // Controllo ordinamento delle coordinate e scambio se necessario
 if x0>xf then begin
  xt:=xf;
  xf:=x0;
  x0:=xt;
 end;
 if y0>yf then begin
  yt:=yf;
  yf:=y0;
  y0:=yf;
 end;
 // inizializzazione a 0 di m0  (solo varibili necessarie)
 m0.h:=0;
 m0.area:=0;
 // ciclo su X
 for i := x0 to xf do begin
  //inizializzazione ciclica a 0 di m1 (solo var necessarie)
  m1.h:=0;
  m1.xc:=i;
  m1.yi:=0;
  m1.yf:=0;
  // ciclo su Y
  for j := y0 to yf do begin
   // ricerca secondo il livello impostato dall'utente, default 900000
   if (form1.image1.Canvas.Pixels[i,j]< lev ) and (form1.image1.Canvas.Pixels[i,j]<>cllime) then begin
     // salvataggio primo punto
     if m1.yi=0 then m1.yi:=j;
     // incremento altezza (temp) e area (globale)
     m1.h:=m1.h+1;
     m0.area:=m0.area+1;
     // pulizia della macchia
     form1.image1.Canvas.Pixels[i,j]:=clwhite;
   end
   // salvataggio ultimo punto
   else if m1.yf=0 then m1.yf:=j-1;
  end;
  // salvataggi sensibili al centro della macchia;
  if m1.h>m0.h then begin
    m0.h:=m1.h;  // altezza max
    m0.xc:=m1.xc; // x centro della macchia
    m0.yi:=m1.yi; // yi a coordinata x = xc
    m0.yf:=m1.yf; // yf a coordinata x = xc
  end;
 end;
 // fine ricerca
 // conferma dell'esistenza della macchia e inizio rielaborazione
 if (m0.h>0) and (m0.h<100) then begin
    rm:=sqrt(m0.area/(pi)); // calcolo del raggio
    m0.r:= rm;
    m0.yc:=m0.yi+round(rm);  // settaggio di yc
    //disegno della griglia della macchia
    with form1.image1.Canvas do begin
     pen.Color:=65280;
     moveto(m0.xc-round(rm),(m0.yi+round(rm)));
     lineto(m0.xc+round(rm)+1,(m0.yi+round(rm)));
     if m0.yi<m0.yf then begin
      moveto(m0.xc,m0.yi-1);
      lineto(m0.xc,m0.yi+m0.h);
     end
     else begin
      moveto(m0.xc,m0.yi-1);
      lineto(m0.xc,m0.yi+m0.h);
     end;
    end;
    m0.xc:=m0.xc+bordo[1]-xc; // correzione delle coordinate X,Y secondo quelle reali con 0,0 al centro del sole
    m0.yc:=yc-(m0.yc+bordo[2]);
    m0.rm:=m0.r/rs;      // raggio normalizzatto a quello del sole
    m0.xs:=m0.xc/rs;     // coordinate X,Y normalizate a quelle del sole
    m0.ys:=m0.yc/rs;
    xn:=m0.xs*cos(p)+m0.ys*sin(p); //Rotazione delle cordinate per averle in asse con il sole
    yn:=-m0.xs*sin(p)+m0.ys*cos(p);
    aux1:=xn*cos(b0);              //Calcolo variabili temporanee
    aux2:=sqrt(1-(power(xn,2.0)+power(yn,2.0)))*sin(b0);
    m0.xr:=arcsin(aux1+aux2);         //Calcolo coordinate eliografiche
    m0.yr:=arcsin(xn/cos(m0.xr))+l0/c1;
    if m0.yr<0 then m0.yr:=m0.yr+2*Pi;         //Correzzione degli angoli tra 0 e 2PI
    if m0.yr>2*Pi then begin
     n:=floor(m0.yr/(2*pi));
     m0.yr:=m0.yr-n*2*Pi;
    end;
    m0.xr:=m0.xr*c1;
    m0.yr:=m0.yr*c1;
    m0.xs:=xn;
    m0.ys:=yn;
    m0.areamil:=m0.area/(rs*rs*2*pi/1000000);
    searchm:=m0;     //restituzione valore
 end
 else
  searchm.h:=-1;
end;

end.
