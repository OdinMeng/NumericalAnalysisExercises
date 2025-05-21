clear all; clc;
% DEFINIZIONE DELLA FUNZIONE DI RUNGE
runge=@(x) 1./(x.^2+1);
%fid=fopen('errorerunge.ris','w');

% GRADO DEL POLINOMIO DI INTERPOLAZIONE.
n=8;
% NODI EQUISPAZIATI. ASCISSE/ORDINATE 
x=-5:10/n:5; y=runge(x);   

% NODI TEST (dove valutare l'interpolante)
s=-5:10/(10*n):5;  

% CALCOLO E VALUTAZIONE DELL'INTERPOLANTE
t=interpol(x,y,s);  

% NODI Gauss-ChebyshevLobatto. ASCISSE/ORDINATE
xgcl=chebgausslob(-5,5,n+1); ygcl=runge(xgcl);
% CALCOLO E VALUTAZIONE DELL'INTERPOLANTE
tt =interpol(xgcl, ygcl,s);  

% PLOT INTERPOLANTE VS FUNZIONE DI RUNGE.
plot(s,runge(s),s,t,s,tt);  
legend('F. Runge','I. nodi equis','I. nodi GCL')
str = sprintf(' Grado %d',n);
title(str) 

% CALCOLO E SCRITTURA A VIDEO DEGLI ERRORI ASSOLUTI (in norma infinito).
% la norma infinito di un vettore e' la massima componente in valore assoluto.
ee=norm(runge(s)-t,inf);ec=norm(runge(s)-tt,inf); 
fprintf('\n [GRADO] %3d [ERR. (NORM INF.)][EQS]:%2.2e [GCL]:%2.2e',n,ee,ec);
fprintf('\n');

%PLOT errore
figure(2)
plot(s,runge(s)-t,s,runge(s)-tt);  
legend('Errore nodi equis','Errore nodi GCL')
title(str) 


%fclose(fid);
