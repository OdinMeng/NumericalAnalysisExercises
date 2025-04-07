
function [x, i, scarti]=tfissa(f, df, x_0, TOL, MAXITER)
%----------------------------------------------------------------
% IMPLEMENTAZIONE DELLA TANGENTE FISSA (Dino Meng, SM3201466)
% Calcola una radice della funzione f definita in un intervallo [a,b]
% usando il metodo della tangente fissa. Si usa il test dello scarto
%----------------------------------------------------------------
% [x, iter, scarti] = tfissa(f, df, x_0, TOL, MAXITER)
%----------------------------------------------------------------
% INPUT:
%   - f: funzione della quale si cerca la radice
%   - df: derivata della funzione
%   - x_0: punto iniziale
%   - TOL: tolleranza
%   - MAXITER: numero massimo di iterazioni
% OUTPUT:
%   - x: vettore di approssimazioni delle soluzioni
%   - i: i-esima iterazione in cui l'algoritmo ha deciso di arrestarsi
%   - scarti: vettore dei scarti
%----------------------------------------------------------------
    % Initialize variables
    dfx0 = df(x_0); % Calculate derivative on initial point
    xold = x_0;
    x = [x_0];
    scarti = [inf]; % Definisco inf così da "forzare" la prima iterazione
    i = 0;

    if MAXITER <= 0
        disp("TypeError: i è non-positiva");
        scarti = [];
        return;
    end

    while ( abs(scarti(end)) >= TOL) && (i <= MAXITER) && (f(x(end)) ~= 0)
        i = i + 1;

        if dfx0 == 0
            disp("ERROR: Derivative on step "+current_i+" is null");
            return;
        end

        xnew = xold - (f(xold)/dfx0);
        x = [x; xnew];
        scarti = [scarti; xnew-xold];

        xold = xnew;
    end

    if i == MAXITER
        disp("===== MASSIME ITERAZIONI RAGGIUNTE =====")
    end

    scarti = scarti(2: end);

    fprintf("\n")
    return;