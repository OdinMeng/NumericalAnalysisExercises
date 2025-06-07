---
title: Laboratorio Svolto di Analisi Numerica (Risoluzione di Sistemi Lineari)
author: Dino Meng [SM3201466]
output: pdf_document
colorlinks: true
geometry: margin=0.75in
---

*Questo file contiene le risposte alle domande poste nella traccia del laboratorio*

$\hrulefill$

# Esercizio Proposto

**Q.** Commentare i risultati ottenuti relativi al laboratorio svolto in `esercizio_proposto.m`.

|     **METODO**     | **RESIDUO RELATIVO** | **ERRORE RELATIVO** |
|:------------------:|:--------------------:|:-------------------:|
| **SENZA PIVOTING** |   0.0550208409413487 |  0.0907218423253028 |
| **CON PIVOTING**   |   0.0000000000000001 |  0.0000000000000002 |

**A.** Da questi risultati possiamo evidenziare l'instabilità dell'algoritmo di eliminazione di Gauss senza pivoting, infatti usando la tecnica di pivoting notiamo un decremento significativo nel residuo e nell'errore relativo, di circa 14 ordini di grandezza. Questo fenomeno è dovuto al fatto che stiamo usando una matrice con matrice di testa principale seconda $A_2$ quasi singolare (i.e. con determinante quasi zero). Infatti, $\det A_2 = (2-\varepsilon)-2 = -\varepsilon$ con $\varepsilon=10^{-14}$.

$\hrulefill$

# Esercizio Obbligatorio

|   **METODO**  | **RESIDUO RELATIVO** | **ERRORE RELATIVO** |
|:-------------:|:--------------------:|:-------------------:|
| **LU SENZA PIVOTING**   |   0.0000362183199862 | 17.5742961327875946 |
| **LU CON PIVOTING** |   0.0000000000000001 |  0.0000000166807056 |

> *Nota*: tabella generata in `esercizio_obbligatorio.m`

**Q.** Perché il residuo relativo nel primo caso (LU calcolata senza pivoting) non è dell'ordine della precisione di macchina?

**A.** Questo fenomeno è dovuto all'instabilità dell'algoritmo di Gauss senza pivoting, evidenziato dal fatto che la sottomatrice principale di ordine 2 ha determinante quasi zero (infatti chiamando il comando `det(A(1:2, 1:2))` dopo l'esecuzione del codice `esercizio_obbligatorio.m` si ottiene un valore di `-9.999778782798785e-13`). 

**Q.** Com'è il residuo nel secondo caso (LU calcolata con pivoting per righe)? Perché l'errore non è dell’ordine della precisione di macchina ma molto più grande?

**A.** Nel secondo caso, il residuo diventa significativamente più piccolo rispetto al primo caso, con una diminuzione di circa 11 ordini di grandezza. Tuttavia l'errore relativo diventa molto più grande di quello del residuo relativo, e questo è dovuto al mal condizionamento della matrice. Infatti la matrice generata è una versione leggermente variata di Hilbert (in particolare nella sottomatrice principale di ordine 2), ossia una tipologia di matrice nota ad essere mal condizionata. Eseguendo il comando `norm(A) * norm(A^-1)`a seguito dell'esecuzione dello script `esercizio_obbligatorio.m`, otteniamo un valore di `7.584569571517603e+09`; effettivamente, la differenza in termini di ordini di grandezza tra il residuo relativo e l'errore relativo è proprio nove. Un'altra evidenza principale è proprio il warning dato eseguendo `esercizio_obbligatorio.m`