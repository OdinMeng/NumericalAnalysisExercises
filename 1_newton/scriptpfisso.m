% Tests pfisso.m
% Dino Meng

try
    pfisso(@(x) x, 0, 0, 1);
    newton(@(x) x, @(x) 1, 0, 100, 100);
catch
    disp("Mancante file pfisso.m O newton.m"); % Prints newtonmod is missing
end

%% 1: cos(x)

[x,i_1,  sc1] = pfisso(@(x) cos(x), 0, 1e-10, 100);

fprintf("RESULTS OF FIXED POINT ON cos(x):\n")
fprintf("\t> Iterations: %d\n", i_1);
fprintf("\t> Approximated fixed point: %.16f\n", x(end))
fprintf("\t>Approximated Error: %.16f\n", sc1(end))

[x,i_2,  sc2] = newton(@(x) cos(x)-x, @(x) -sin(x)-1, 0.1, 1e-10, 100);

fprintf("RESULTS OF NEWTON POINT ON cos(x):\n")
fprintf("\t> Iterations: %d\n", i_2);
fprintf("\t> Approximated solution: %.16f\n", x(end))
fprintf("\t> Approximated Error: %.16f\n", sc2(end))

input("Press enter to continue\n> ")

semilogy(1:i_1, abs(sc1), Color='red'); hold on;
semilogy(1:i_2, abs(sc2), Color='blue'); 

legend("Fixed Point", "Newton")
title("Convergence Profiles for Different Methods")


print -dpdf ./graphs/graph_confronto_scriptpfisso.pdf

hold off;

%% 2: 1 + arctan(x)
input("Press enter to continue\n> ")
disp("Visualizing function...")

fplot(@(x) 1+atan(x)); hold on; fplot(@(x) 0 .* x); hold off;
input("Press enter to continue\n> ")

% graficamente si evince che un intervallo opportuno è [-2, -1]

g = @(x) 1+atan(x)-x;

[x,i_, sc] = pfisso(g, -2, 1e-12, 1000);

% write to file
f_id = fopen("./tables/pfisso.csv", "w");

fprintf(f_id, "i\tx_i\tscarto\n");
it = [0: i_];

TABLE = [it(2:end); x(2:end)'; abs(sc)'];

fprintf(f_id , "%d\t%18.14f\t%20.4e\n", TABLE);
fprintf(f_id, "\n");

fclose(f_id);

% create graph
semilogy(1:i_, abs(sc), Color='red');
title("Convergence Profile of Fixed Point Method")

print -dpdf ./graphs/graph_scriptpfisso.pdf


clear g; clear it; clear f_id; clear x; clear i_; clear sc; clear f; clear i; clear TABLE;clear x; clear i_1; clear i_2; clear sc1; clear sc2
