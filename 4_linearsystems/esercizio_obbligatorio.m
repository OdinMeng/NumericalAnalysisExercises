% SVOLGIMENTO DELL'ESERCIZIO OBBLIGATORIO SULLA RISOLUZIONE DEI SISTEMI LINEARI
% DINO MENG [SM3201466], AIDA, 2024-2025

% punto a)
eps_ = 1e-12;

A = hilb(8); A(2,1) = 2 * A(1,1); A(2,2) = 2*A(1,2)-eps_;

% punto b)
x_true = ones(8,1); b = A * x_true;

% punto c)
[L, U] = lugauss(A); 
v = L \ b;
x_lugauss = U \ v;

% punto d)
format long;
fprintf("SOLUZIONE CALCOLATA (SENZA PIVOTING)\n");
disp(x_lugauss)

% punto e)
r_rel_lugauss = norm(b-A * x_lugauss, 2) / norm(b, 2); 
err_rel_lugauss = norm(x_lugauss - x_true, 2) / norm(x_true, 2);

input("Premi enter per procedere al punto f) (risoluzione con pivoting)")

% punto f)
[L, U, P] = lu(A); 
v = L \ P*b;
x_lu = U \ v;

format long;
fprintf("SOLUZIONE CALCOLATA (CON PIVOTING)\n")
disp(x_lu)

r_rel_lu = norm(b-A * x_lu, 2) / norm(b, 2); 
err_rel_lu = norm(x_lu - x_true, 2) / norm(x_true, 2);

input("Premi enter per procede al riassunto dei risultati (stampa a schermo i residui e gli errori relativi")

fprintf("METODO\tRESIDUO RELATIVO\tERRORE RELATIVO\n")
fprintf("LUGAUSS\t%.16f\t%.16f\n", r_rel_lugauss, err_rel_lugauss)
fprintf("LU_MATLAB\t%.16f\t%.16f\n", r_rel_lu, err_rel_lu)