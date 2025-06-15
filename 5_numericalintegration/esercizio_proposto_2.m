% ANALISI NUMERICA: LABORATORIO SU INTEGRAZIONE NUMERICA
% SVOLGIMENTO DEGLI ESERCIZI PROPOSTI (DINO MENG, SM3201466)

a = 1;
b = 4;
f = @(x) exp(x-2) .* sin(sqrt(x));
I = integral(f, a, b);

v = 1:9; N_vals = 2 .^ v;
tmp = size(v);
v_size = tmp(2);
err_t = [];
err_s = [];

for N = N_vals
        [~,~,I_t] = trapezi_composta(N, a,b, f);
        [~,~,I_s] = simpson_composta(N, a, b, f);
       err_t = [err_t, abs(I - I_t)];
       err_s = [err_s, abs(I - I_s)];
end

rapp_t = err_t(1:v_size-1) ./ err_t(2:v_size);
rapp_s = err_s(1:v_size-1) ./ err_s(2:v_size);

hold on
plot(v(1:v_size-1), rapp_t, Color='red')
plot(v(1:v_size-1), rapp_s, Color='blue')

plot(v(1:v_size-1), ones(1, v_size-1) * 4, Color='red', LineStyle='--')
plot(v(1:v_size-1), ones(1, v_size-1) * 16, Color='blue', LineStyle='--')

hold off

pause;

figure(2)
% parte 2


a = 0;
b = 1;
f = @(x) exp(x-2) .* sin(sqrt(x));
I = integral(f, a, b);

err_t = [];
err_s = [];

for N = N_vals
        [~,~,I_t] = trapezi_composta(N, a,b, f);
        [~,~,I_s] = simpson_composta(N, a, b, f);
       err_t = [err_t, abs(I - I_t)];
       err_s = [err_s, abs(I - I_s)];
end

rapp_t = err_t(1:v_size-1) ./ err_t(2:v_size);
rapp_s = err_s(1:v_size-1) ./ err_s(2:v_size);
hold on
plot(v(1:v_size-1), rapp_t, Color='red')
plot(v(1:v_size-1), rapp_s, Color='blue')


plot(v(1:v_size-1), ones(1, v_size-1) * 4, Color='red', LineStyle='--')
plot(v(1:v_size-1), ones(1, v_size-1) * 16, Color='blue', LineStyle='--')

hold off
