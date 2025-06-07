function [x,w,Ics]=simpson_composta(N,a,b,f)
% FORMULA DI CAVALIERI SIMPSON COMPOSTA.
% [x,w,Ics]=simpson_composta(N,a,b,f)
% INPUT:
% N:    NUMERO SUBINTERVALLI.
% a, b: ESTREMI DI INTEGRAZIONE.
% f:    FUNZIONE INTEGRANDA
% OUTPUT:
% x:     NODI INTEGRAZIONE.
% w:     PESI INTEGRAZIONE (INCLUDE IL PASSO!).
% Ics: VALORE APPROSSIMATO CALCOLATO CON LA FORMULA DI QUADRATURA 

h=(b-a)/N;             % PASSO INTEGRAZIONE.
x=a:h/2:b; x=x';         % NODI INTEGRAZIONE.
w=ones(2*N+1,1);         % PESI INTEGRAZIONE.
w(2:2:2*N, 1)=4;
w(3:2:2*N-1, 1)=2;
w=w*h / 6;

fx=feval(f,x);         %VALUTAZIONE DELLA FUNZIONE NEI NODI 
Ics=w' * fx;           %CALCOLO DEL VALORE APPROSSIMATO DALLA FORMULA

