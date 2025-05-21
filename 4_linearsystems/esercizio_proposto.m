% SVOLGIMENTO DELL'ESERCIZIO PROPOSTO SULLA RISOLUZIONE DEI SISTEMI LINEARI
% DINO MENG [SM3201466], AIDA, 2024-2025

eps_ = 1e-14;
A = [1, 1, -3; 2, 2-eps_, 4; 1,9,4];
x_true = [1; 1; 1];
b = A * x_true; 

% Risolvo Sistema Lineare con LUGAUSS
[L,U] = lugauss(A);
v = L \ b;
x_hat_lugauss = U \ v;

r = norm(b-A*x_hat_lugauss)/norm(b); % residuo relativo
err_rel = norm(x_hat_lugauss - x_true) / norm(x_true); % errore relativo

fprintf("RISULTATI SENZA PIVOTING:\n\t> RESIDUO RELATIVO: %.15f\n\t> ERRORE RELATIVO: %.15f\n", r, err_rel);

fprintf("--------------------------- X ---------------------------\n");
input("Premere enter per continuare: ")
fprintf("--------------------------- X ---------------------------\n");

% Risolvo Sistema Lineare SENZA Lugauss:;
[L,U, P] = lu(A);
v = L \ P*b;
x_hat = U \ v;

r_lu = norm(b-A*x_hat)/norm(b); % residuo relativo
err_rel_lu = norm(x_hat - x_true) / norm(x_true); % errore relativo

fprintf("RISULTATI CON PIVOTING:\n\t> RESIDUO RELATIVO: %.15f\n\t> ERRORE RELATIVO: %.15f\n", r_lu, err_rel_lu);

% sunto
fprintf("--------------------------- X ---------------------------\n");

fprintf("METODO\tRESIDUO RELATIVO\tERRORE RELATIVO\n")
fprintf("LUGAUSS\t%.16f\t%.16f\n", r, err_rel)

fprintf("LU_MATLAB\t%.16f\t%.16f\n", r_lu, err_rel_lu)