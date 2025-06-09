%% RISOLUZIONE DI VARI ESERCIZI PROPOSTI NELL'ESERCITAZIONE
% Dino Meng, SM3201466

%% === Slide 12
% fprintf("ESERCIZIO DELLA SLIDE 12\n")
% f = @(x) exp(-x) - 5*x;
% 
% hold on
% fplot(f, [-5, 5]);
% fplot(0, Color='Black');
% hold off 
% 
% % A posteriori decido che un buon intervallo è [-1, 1]
% [vc, k, ~, ~] = bisezione(-1, 1, 1e-8, 1e-8, 1000, f);
% 
% fprintf("\tRadice approssimata: %.9f\n", vc(end));
% fprintf("\tNumero di iterazioni effettuate: %d\n", k);
% fprintf("\tNumero di iterazioni minime previste (teoricamente): %d\n", ceil(log2(2/1e-8))-1)
% 
% input("Premere enter per continuare al prossimo esercizio\n> ")
% 
% %% == Slide 20
% fprintf("ESERCIZIO DELLA SLIDE 20\n")
% f = @(x) x.^2 - 5 * x + 6;
% df = @(x) 2 * x - 5;
% 
% hold on
% fplot(f, [-5, 5]);
% fplot(0, Color='Black');
% hold off 
% 
% % Per il calcolo della radice maggiore è conveniente scegliere un punto a destra della radice maggiore, come x_0 = 3.2
% 
% [x, iter, scarti] = newton(f,df, 3.2, 1e-8, 1000);
% 
% fprintf("\tRadice approssimata: %.9f\n", x(end));
% fprintf("\tNumero di iterazioni effettuate: %d\n", iter);
% 
% semilogy ( 1 : iter , abs ( scarti ) , 'm-*' ) 
% 
% input("Premere enter per continuare al prossimo esercizio\n> ")

%% == Slide 21
fprintf("ESERCIZIO DELLA SLIDE 21\n")
f1 = @(x) exp(-x./4)-x;
f2 = @(x) x.^3 -2;
f3 = @(x) x*log(x) - 1;

df1 = @(x) (-1./4)*exp(-x./4) - 1;
df2 = @(x) 3 * x.^2;
df3 = @(x) log(x) + 1;

hold on
fplot(f1, [-5, 5]);
fplot(f2, [-5, 5]);
fplot(f3, [-5, 5]);
fplot(@(x) 0*x, Color='Black');

legend("$exp(-x/4)-x$", "$x^3-2$", "$x*log x - 1$")
hold off 

% Intervalli Scelti:
% f1 -> 0.7, 0.9
% f2 -> 1.24, 1.28
% f3 -> 1.65, 1.85
a1 = 0.7; b1=0.9;
a2 = 1.24; b2=1.28;
a3 = 1.65; b3=1.85;

% Punti iniziali scelti:
% f1 -> 0.7
% f2 -> 1.4
% f3 -> 2
x0_1 = 0.7; x0_2 = 1.4; x0_3 = 2;

fid = fopen("./tables/esercizio_slide_21.csv", "w");
fprintf(fid, "name\tmethod\tx\tn_iter\n");

% Definisco una function ausiliaria per svolgere ogni sottoesercizio
function solver(f, df, a, b, x0, name, fid)
    figure()
    fprintf("RISOLVENDO FUNZIONE %s\n", name);
    [x_bis, iter_bis, ~, res_bis] = bisezione(a, b, 1e-8, 1e-8, 1000, f);
    [x_new, iter_new, sc_bis] = newton(f, df, x0, 1e-8, 1000);

    fprintf("METODO DELLA BISEZIONE\n")
    fprintf("\tSOLUZIONE APPROSSIMATA: %.9f\n\tITERAZIONI: %d\n", x_bis(end), iter_bis);
    fprintf("METODO DI NEWTON-RAPHSON\n")
    fprintf("\tSOLUZIONE APPROSSIMATA: %.9f\n\tITERAZIONI: %d\n", x_new(end), iter_new);

    semilogy(abs(res_bis));
    hold on;
    semilogy(abs(sc_bis));
    legend("Residui Pesati Bisezione", "Scarti Newton")
    hold off;

    fprintf(fid, "%s\tBISEZIONE\t%.9f\t%d\n", name, x_bis(end), iter_bis);
    fprintf(fid, "%s\tNEWTON-RAPHSON\t%.9f\t%d\n", name, x_new(end), iter_new);

    input("Premere enter per terminare\n> ")
end

solver(f1, df1, a1, b1, x0_1, "f1", fid);
solver(f2, df2, a2, b2, x0_2, "f2", fid);
solver(f3, df3, a3, b3, x0_3, "f3", fid);
fclose(fid);


