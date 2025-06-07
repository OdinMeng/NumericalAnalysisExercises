% ANALISI NUMERICA: LABORATORIO SU INTEGRAZIONE NUMERICA
% SVOLGIMENTO DEGLI ESERCIZI PROPOSTI (DINO MENG, SM3201466)

a = 1;
b = 3;
f = @(x) exp(x-2) .* sin(x);

I_true = quad(f, a, b, 1e-14);

fid = fopen('tabproposto1.ris', 'w');

fprintf(fid, 'nval\tI_TRAP\terr_rel_TRAP\tI_SIMP\terr_rel_SIMP\n');
fprintf('nval\tI_TRAP\terr_rel_TRAP\tI_SIMP\terr_rel_SIMP\n');

% PARTE 1

err_rels_trap = [];
err_rels_cs = [];

N_vals = 11:10:201;
for N = N_vals
    [~,~, I_trap] = trapezi_composta(N, a, b, f); err_trap = abs(I_true - I_trap); err_rel_trap = err_trap/I_true;
    [~,~, I_cs] = simpson_composta(N, a,b, f); err_cs = abs(I_true - I_cs); err_rel_cs = err_cs / I_true;

    fprintf('%d\t%.14f\t%.14E\t%.14f\t%.14E\n', N, I_trap, err_rel_trap, I_cs, err_rel_cs);
    fprintf(fid, '%d\t%.14f\t%.14E\t%.14f\t%.14E\n', N, I_trap, err_rel_trap, I_cs, err_rel_cs);

    % salvo gli errori relativi in due vettori x la pt. 2
    err_rels_trap = [err_rels_trap, err_rel_trap];
    err_rels_cs = [err_rels_cs, err_rel_cs];
end

input("Premere enter per continuare con la parte 2\n> ")


% PARTE 2

h = (b-a) ./ N_vals;

loglog(N_vals, err_rels_trap, Color='blue');
hold on
loglog(N_vals, err_rels_cs, Color='red');

legend('Trapezi', 'Cavalieri-Simpson'); title("Grafico logaritmico dell'errore relativo in funzione del numero di nodi")
hold off

figure(2);

loglog(h, err_rels_trap, Color='blue', Marker='x')
hold on
loglog(h, h .^ 2, Color='cyan')

loglog(h*2, err_rels_cs, Color='red', Marker='x') 
% Moltiplichiamo per due in quanto con cavalieri simpson, dati 2N+1 nodi,
% ne usa N per le suddivisioni andando effettivamente a raddoppiare l'ampiezza.
loglog(h*2, (h.*2) .^ 4, Color='#FF474C')

legend('Trapezi', 'h^2', 'Cavalieri-Simpson', 'h^4'); title("Grafico logaritmico dell'errore relativo in funzione dell'ampiezza dei sotto intervalli");
hold off
