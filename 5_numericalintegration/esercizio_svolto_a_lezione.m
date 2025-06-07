%%      INTEGRAZIONE NUMERICA. 
%       Esercizio svolto a lezione in data 29/05/2025 per N=2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% 	In questo script Matlab si può vedere come decresce l'errore al raddoppiare il numero di 
% 	suddivisioni dell'intervallo di integrazione
%       e quanto valgono i rapporti tra errori E_N/E_2N

%%      OCCHIO: SERVE LA FUNCTION simpson_composta.m da scrivere 
%%      seguendo le indicazioni che trovate nei lucidi labquad.pdf

% funzione integranda
f=@(x) log(x);

% Estremi di integrazione
a=1; b=2;

% Valore vero dell'integrale definito
Ivero=quad(f,a,b,1e-14)

err_t=[];
err_s=[];
% NUMERO DI SUDDIVISIONI DELL'INTERVALLO DI INTEGRAZIONE 
vet=[1:8]; n=length(vet);
nsudd=2.^vet; % numero di suddivisoni 

fprintf('\n %8s %15s %15s %17s %15s ','N. SUDD.', 'I_TRAP', 'ERR. ASS' ,...
'I_SIMPSON','ERR. ASS'  );
fprintf('\n'); 

for k=nsudd
% Calcolo del valore approssimato
% I_trap: valore approssimato di I ottenuto con la formula di Trapezi
[x_trap,w_trap, I_trap]=trapezi_composta(k,a,b,f);

% I_simp: valore approssimato di I ottenuto con la formula di Cavalieri-Simpson
[x_simp,w_simp, I_simp]=simpson_composta(k,a,b,f);

% Calcolo degli errori assoluti
E_trap = abs(Ivero - I_trap);
E_simp = abs(Ivero - I_simp);

%Salvataggio su vettore di quelli relativi
err_t=[err_t;E_trap];
err_s=[err_s;E_simp];

fprintf(' %7d %20.14f %12.3E  %18.14f %13.3E\n',k,I_trap,E_trap,I_simp,E_simp);

end
rappt=err_t(1:n-1)./err_t(2:n)
rapps=err_s(1:n-1)./err_s(2:n)
