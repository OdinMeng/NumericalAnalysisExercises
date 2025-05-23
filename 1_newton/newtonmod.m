function [x,iter,scarti]=newtonmod(f,df,x0,tol,itmax,r)
%----------------------------------------------------------------
% NEWTON MODIFICATO:  calcola una radice della funzione fun definita 
% nell'intervallo [a,b] usando il metodo iterativo di Newton modificato
% test di arresto sullo scarto (step = residuo pesato)
%----------------------------------------------------------------
% [x,iter,scarti]=newton(f,df,x0,tol,itmax)
%----------------------------------------------------------------
% parametri di input: 
%        f: funzione della quale si cerca una radice in [a,b]
%        d: derivata prima di f
%        x0 = approssimazione iniziale
%        toll: tolleranza  
%        itmax: numero massimo di iterazioni 
%        r: molteplicità della radice
% parametri di output: 
%        x: vettore delle approssimazione della radice 
%        iter:  numero di iterazioni effettuate
%        scarti: vettore degli scarti successivi
%----------------------------------------------------------------

 xold=x0;
 x=[x0];
 scarti=[];
 dif =tol+1; 
 iter=0;
 while (abs(dif) > tol) & (iter < itmax)
    fx=feval(f,xold);
    if fx == 0 return; end
    dfx=feval(df,xold);
    if dfx == 0 
       disp('ERRORE: derivata nulla.'); return; 
    end
    iter=iter+1;
    dif=-fx/dfx;
    dif=r * dif;
    xnew=xold+dif;
    scarti=[scarti;dif];
    x=[x; xnew];
    xold=xnew;
 end
 if (iter >=itmax)
    disp('raggiunto il numero massimo di iterazioni')
 end
 fprintf('\n');

