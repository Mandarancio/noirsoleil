#Libreria per la ricerca di macchie solari.

# Introduzione #

> Questa libreria è indipendente dal progetto noir soleil. Questa pagina spiga il funzionamento di questa e soprattutto come usarla

# Correzioni da fare #

> Innanzitutto vi prego di perdonarmi perchè c'è un errore nella libreria:
> Nella sezione Interface la funzione search è definita cosi:
> > _function search(immagine: bitmap; livello: integer): **bitmap**;_

> invece di:
> > _function search(immagine: bitmap; livello: integer): **reductmac**;_

> Quindi modificate il listato se volete utilizzarla!!

# Dettagli sul funzionamento #

> La libreria è composta da 2 oggetti, un record e una funzione.
    * Il primo è chiamato bitamap e consiste in una matrice dinamica di interi, 2 interi e una procedura. L'oggetto riduce un immagine in una matrice dove sono contenuti i colori in interi, i due interi non dicono altro che la dimensione della matrice. La funzione serve propio per settarne le dimensioni.
    * Il record è chiamato macchia e contiene tutti i dati relativi a una macchia.
    * L'ultimo oggetto è chiamato reductMac e contiene solo le informazioni base della macchia, coordinate, area e altezza. Le funzioni e le procedure permettono conversioni da reductmac a macchia e viceversa, più una procedura di inizializzazione.
    * La funzione search è il cuore della libreria.
Questa permette dato un bitmap e un livello di colore di avere una reductmac trovata cercando pixel per pixel la zona al disotto del livello dato.