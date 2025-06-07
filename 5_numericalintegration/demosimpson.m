a=-1; b=1; 
f=inline('x.^20');
N=501;        % NUMERO SUBINTERVALLI 
[x_simp,w_simp, Isimp]=simpson_composta(N,a,b,f);

format long
Isimp

disp('valore vero dell''integrale definito');
Ivero=2/21

disp('Errore relativo');
Esimp=abs((Ivero-Isimp)/Ivero)
