function [x, i, scarti] = pfisso(g, x_0, TOL, MAXITER)
% ============================================================
% Implementazione del metodo del punto fisso (Dino Meng, SM3201466)
%----------------------------------------------------------------
% [x, iter, scarti] = pfisso(g, x_0, TOL, MAXITER)
%----------------------------------------------------------------
% INPUT:
%   - g:                    funzione di cui calcolare il p.to fisso
%   - x_0:                p.to iniziale
%   - TOL:               tolleranza
%   - MAXITER:      massime iterzioni
% OUTPUT:
%   - x:            vettore dei p.ti fissi approssimati
%   - i:             il numero della iterazione per cui si è arrestato l'algoritmo
%   - scarti:     vettore dei scarti calcolati come differenza tra x_k -
%   x_(k-1)
% ============================================================
    i = 0;
    scarti = [inf];
    x_old = x_0;
    x = [x_old];

    while (i <= MAXITER) && (abs(scarti(end)) >= TOL) && (g(x(end)) ~= x(end))
            x_new = g(x_old);

            x = [x; x_new];
            scarti = [scarti; x_new - x_old];

            x_old = x_new;
            i = i+1;
    end

    scarti = scarti(2:end);
end