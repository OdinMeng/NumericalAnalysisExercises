% ESERCITAZIONE PROPOSTA SULLA REGRESSIONE AI MINIMI QUADRATI.
%  DINO MENG [SM3201466], AIDA, 2024-2025

% Parte 1: approssimazione dei dati sperimentali e grafico con regressione
% OLS
x = 0.7;

sigma = [0, 0.06, 0.14, 0.25, 0.31, 0.47, 0.60];
eps = [0, 0.08, 0.14, 0.20, 0.23, 0.25, 0.28];

tmp = (size(sigma) == size(eps));

assert(tmp(1) & tmp(2)); 

clear tmp;

N = size(sigma); N = N(2);

p1 = polyfit(sigma, eps, 1); p2 = polyfit(sigma, eps, 2); % fit della retta e della parabola (rispettivamente p1 e p2)

hat_y_1 = polyval(p1, x); hat_y_2 = polyval(p2, x); % valuto il nuovo dato con le rette e le parabole ottenute dall'approssimazione OLS

fprintf("RISULTATI DELL'APPROSSIMAZIONE AI MINIMI QUADRATI: eps(0.7)\n")
fprintf("\t> RETTA: %f\n", hat_y_1)
fprintf("\t> PARABOLA: %f\n", hat_y_2)
fprintf("\t> LOSS RETTA (somma delle distanze quadratiche): %f\n", norm(polyval(p1, sigma)-eps, 2)^0.5);
fprintf("\t> LOSS PARABOLA (somma delle distanze quadratiche): %f\n", norm(polyval(p2,sigma)-eps, 2)^0.5);

f1 = @(x_new) polyval(p1, x_new); f2 = @(x_new) polyval(p2, x_new); % creo delle function per il plot!

hold on;

scatter(sigma, eps, 'x');
scatter([0.7], [0.29], 'p');

fplot(f1, [0, 0.7], 'r')
fplot(f2, [0, 0.7], 'g')

xlabel('sigma')
ylabel('epsilon')
title("Approssimazione ai Minimi Quadrati (senza interpolazione)")

legend('Dati', 'Valore Vero' ,'Retta','Parabola')


hold off;

input("Premere enter per continuare: ");

% Parte 2: stima della deformazione eps(0.7) usando l'interpolazione
% polinimaile

p_poly = polyfit(sigma, eps, N-1); f_poly = @(x_) polyval(p_poly, x_);

hold on;

scatter(sigma, eps, 'x');
scatter([0.7], [0.29], 'p');

fplot(f1, [0, 0.7], 'r')
fplot(f2, [0, 0.7], 'g')
fplot(f_poly, [0,0.7], 'b')

xlabel('sigma')
ylabel('epsilon')
title("Approssimazione ai Minimi Quadrati (con interpolazione)")

legend('Dati', 'Valore Vero','Retta','Parabola', 'Polinomio Interpolante')


hold off;
