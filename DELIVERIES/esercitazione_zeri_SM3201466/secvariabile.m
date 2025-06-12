function [x, i, scarti]=secvariabile(f, x_0, x_1, TOL, MAXITER)
%----------------------------------------------------------------
% IMPLEMENTAZIONE DELLA SECANTE VARIABILE (Dino Meng, SM3201466)
% Calcola una radice della funzione f definita in un intervallo [a,b]
% usando il metodo della secante variabile. Si usa il test dello scarto per
% determinare l'arresto.
%----------------------------------------------------------------
% [x, iter, scarti] = secvariabile(f, x_0, x_1, TOL, MAXITER)
%----------------------------------------------------------------
% INPUT:
%   - f: funzione della quale si cerca la radice
%   - x_0: punto iniziale
%   - x_1: secondo punto iniziale
%   - TOL: tolleranza
%   - MAXITER: numero massimo di iterazioni
% OUTPUT:
%   - x: vettore di approssimazioni delle soluzioni
%   - i: i-esima iterazione in cui l'algoritmo ha deciso di arrestarsi
%   - scarti: vettore dei scarti
%----------------------------------------------------------------
    % Initialize variables
    x_old = x_1;
    x_veryold = x_0;
    x = [x_0; x_1];
    scarti = [inf]; % Definisco inf così da "forzare" la prima iterazione
    i = 0;

    if MAXITER <= 0
        disp("TypeError: i è non-positiva");
        scarti = [];
        return;
    end

    while ( abs(scarti(end)) >= TOL) && (i <= MAXITER) 
        i = i+1;

        if x_veryold == x_old
            disp("STOP: Incremental quotient is 0 at step "+ i);
            scarti = [scarti; 0];
            break;
        end

        R_i = R(f, x_old, x_veryold);

        x_new = x_old - f(x_old) ./ R_i;

        scarti = [scarti; -f(x_old)/R_i];
        x = [x; x_new];

        % Update variables
        x_veryold = x_old;
        x_old = x_new;
    end

    if i == MAXITER
        disp("MAXIMUM ITERATIONS REACHED")
    end

    scarti = scarti(2:end);
end


function [x] = R(f, x, x_)
%----------------------------------------------------------------
% Funzione ausiliaria che calcola il rapporto incrementale di una funzione
% da x in x_
%----------------------------------------------------------------
    x = (f(x) - f(x_)) ./ (x-x_);
end

