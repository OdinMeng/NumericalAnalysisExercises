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

**A.** #TODO

$\hrulefill$

# Esercizio Obbligatorio

|   **METODO**  | **RESIDUO RELATIVO** | **ERRORE RELATIVO** |
|:-------------:|:--------------------:|:-------------------:|
| **LU SENZA PIVOTING**   |   0.0000362183199862 | 17.5742961327875946 |
| **LU CON PIVOTING** |   0.0000000000000001 |  0.0000000166807056 |

> *Nota*: tabella generata in `esercizio_obbligatorio.m`

**Q.** Perché il residuo relativo nel primo caso (LU calcolata senza pivoting) non è dell'ordine della precisione di macchina?

**A.** #TODO

**Q.** Com'è il residuo nel secondo caso (LU calcolata con pivoting per righe)? Perché l'errore non è dell’ordine della precisione di macchina ma molto più grande?

**A.** TODO