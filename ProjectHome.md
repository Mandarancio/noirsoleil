### Introduzione al Progetto ###
Il progetto nasce per avere un programma per trovare e misurare macchie solari da foto del sole. Questo inoltre ti permette di gestire i dati immagazzinati. Tutto il software è scritto in Delphi. Il software è freeware e OpenSource (GPL v2).

### News ###
**NoirSoleil 1 28-06-2007**
> Finalmente la prima release stabile(?) o almeno i risultati vengono tutti giusti!!!!
Buone osservazioni!!

**UNA PAUSA?? NO! 19-06-2007**
> Nessuna pausa la versione stabile di noirsoleil non è ancora stata rilasciata perchè si stanno riscrivendo tutte le formule di conversione da coordinate normalizzate a eliografiche (lavoro alquanto difficile per uno che pensa che ci sia ancora la terra al centro del universo..).
> Comunque si SPERA che entro la fine del mese la versione stabile possa essere conclusa...
**SOFTWARE AGGIORNATO 01-06-2007**

**SEGMENTATION FAULT... 30-05-2007**
> Forse è ora che provi le verisoni prima di metterle on-line la versione 1.0b [fixed](fixed.md) conteneva un imbarazzante errore con alcuni indici quindi usciva il classico errore di segmentation fault..
> PS: Non riesco a caricare i file !!!!

**SVN IN FUNZIONE!!! 27-05-2007**
> Finalmente ho implementato l'utilizzo di svn..
> _Per fare checkout e scaricare l'ultima versione fare:_
  1. Non-members may check out a read-only working copy anonymously over HTTP.
> svn checkout http://noirsoleil.googlecode.com/svn/trunk/ noirsoleil
**_VERSIONE 1.0 B COMPLETA 26-05-2007_**
Finalmente la versione 1b è finita!!!
> Corrette molte dimenticanze, implementate 2 tipi di grafici per rielaborazione dei dati raccolti.
> Bug da risolvere:
    * COORDINATE ELIOGRAFICHE (FORSE!!!)
    * "RIMUOVI" (FINESTRA RIELABORATORE) DA CONTROLLARE!!
~~**CERCASI ICONA DECENTE!!!!!**~~
_ICONA TROVATA_

**ATTENZIONE BUG TROVATO E RISOLTO!!!!**
_Per far andare correttamente i sorgenti dovete sostituire nella unit main tutti i 'amac[acount](acount.md):=m0;' con 'amac[acount-1]:=m0;' SCUSATE!!!!_

**14-05-2007 WORKS IN PROGRES..**
Dopo quasi un mese di lavoro la 1.0 B è quasi pronta!! Allora lo stato del progetto è questo:
  * Main è pronta (c'è un bug importante da risolvere che è quello della conversione delle coordinate da quelle normalizzate a quelle eliografiche!!N.B: ci si sta lavorando).
  * Rielaboratore è in buono stato manca solo (o quasi, devo trovare ed eliminare tutti i bug minori!!) il grafico!
**_SPERO IN SETTIMANA DI COMPLETARLA!!! E DI METTERLA ON-LINE!_**

**VERSIONE 0.8 BETA COMPLETATA (21-04-2007) NON ON-LINE**
Finalmente una versione con tutte le funzioni OK e quelle del rielaboratore in costruzione...

**Versione 0.3 [R1](https://code.google.com/p/noirsoleil/source/detail?r=1) Completa (03-04-2007)**

Fixed & addons
  * Tutti i dati sulla macchia sono ricavati
  * Molti Bug risolti
  * Creazione di una libreria per la ricerca delle macchie
Bug principali
  * No implementazione dei nuovi dati nell'anteprima

**Versione 0.1 B Completa (22-03-2007) _on-line solo l'eseguibile_ _AGGIORNATA!_**

Fixed & addons
  * Gestione macchie (anche l'anteprima)
  * Salvataggio risultati
  * Molti Bug risolti
  * Iniziata lo sviluppo della gestione dei risultati
Bug principali
  * Conversione area e coordinate
  * No implementazione nuova sessiona

**Versione 0.04 A Completa (13-03-2007) _non ancora on-line_**

Fixed & addons:
  * Algoritmo Effemeriti (OK!)
  * Reticolo (da finire)

**Versione 0.02 A Ragiunta (13-03-2007)**

Fixed & addons:
  * Algoritmo ricerca macchie
  * Algoritmo Effemeridi (BUGGATO)
  * Settaggio dei livelli
  * Gestione delle Macchie (finire)
  * Salvataggio risultati (BUGGATO)

### TO DO ###
**ARRIVARE ALLA PRIMA RELEASE STABILE E COMPLETA**
Lo sviluppo anche se a rilento continua, si è raggiunta la versione 1.0b che implementa già tutte le funzioni. I principali traguardi per raggiungere la 1.0 sono la corretta converisone delle coordinate (che mi porto dietro dalla ver 0.1a) e risolvere qualche problemino del tool di rielaborazione.

Per Ulteriori Informazioni guardare la [wiki](http://code.google.com/p/noirsoleil/wiki/HomePage)

**GRAZIE DA MARTINO G. FERRARI E GLI ALTRI COLLABORATORI**