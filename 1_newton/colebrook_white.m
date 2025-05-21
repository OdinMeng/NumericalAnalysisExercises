%% Colebrook White Exercise
% Dino Meng, SM3201466

function f = COLEBROOK_WHITE(e_, d, Nr)
% Generates the colebrook white function with the parameters
    f = @(x) -2 .* log10((e_)./(3.51 .* d) + ((2.52)./(Nr .* (x).^0.5)));
end

my_cw = COLEBROOK_WHITE(10^(-2), 0.2, 10^4);

f_zero = @(x) my_cw(x) - 1./(x).^0.5;
g = @(x) (1 ./ my_cw(x)).^2;

fplot(f_zero); hold on; fplot(@(x) 0 .* x); hold off; % plots graph of 0 for a good idea
title("Function to Calculate Zero of")

input("press enter to go to next graph :)\n> ")

fplot(g); hold on; fplot(@(x) x); hold off; % same but with fixed point
title("Fixed Point Function")

input("press enter to go to next graph :)\n> ")

% according to both graphs our solution should be between 0.07, 0.08

TOL = 10^(-8);

[x_pf, i_pf, sc_pf] = pfisso(g, 0.07, TOL, 1000);
[x_sv, i_sv, sc_sv] = secvariabile(f_zero, 0.07, 0.08, TOL, 1000);

fprintf("FUNZIONE ZERO APPROSSIMATA (secondo il metodo del punto fisso):\n\t> alpha = %.16f\n\t> scarto = %.16f\n", x_pf(end), sc_pf(end))
fprintf("FUNZIONE ZERO APPROSSIMATA (secondo il metodo della secante variabile):\n\t> alpha = %.16f\n\t> scarto = %.16f\n", x_sv(end), sc_sv(end))

semilogy(1: i_pf, abs(sc_pf), Color='#ffb843', marker='o'); hold on;
semilogy(1:i_sv, abs(sc_sv), Color='#83ff5e', marker='o'); hold off;

title("Convergence Profiles for Numerical Algorithms");
subtitle("(Fixed Point vs Secant Method), convergent case")

legend("Fixed Point", "Secant Method")
print -dpdf ./graphs/graph_colebrookwhite_convergent.pdf

input("press enter to go to next graph :)\n> ")

% Note that secant method can diverge, whereas the fixed point should converge independently to the choice of x_0:
[x_pf, i_pf, sc_pf] = pfisso(g, 100, TOL, 1000);
[x_sv, i_sv, sc_sv] = secvariabile(f_zero, 100, 101, TOL, 1000);

semilogy(1: i_pf, abs(sc_pf), Color='#ffb843', marker='o'); hold on;
semilogy(1:i_sv, abs(sc_sv), Color='#83ff5e', marker='o'); hold off;

title("Convergence Profiles for Numerical Algorithms");
subtitle("(Fixed Point vs Secant Method), divergent case")

legend("Fixed Point", "Secant Method")

print -dpdf ./graphs/graph_colebrookwhite_divergent.pdf
