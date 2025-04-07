%% FILE FOR TESTING tfissa.m (with newton.m) %%
% Dino Meng [SM3201466]

try
    newton(@(x) x,@(x) 2,3,4,5);
    tfissa(@(x) x,@(x) 2,3,4,5);
catch
    disp("Mancante file tfissa.m oppure newton.m"); % Prints newtonmod is missing
end

f = @(x) exp(-x) + cos(x) -3;
df = @(x) -1 * exp(-x) - sin(x);
x_0 = -1;
MAXITER = 100;
tol = 1e-9;

%% Get convergence profiles

[~, i_1, scarti_1] = newton(f, df, x_0, tol, MAXITER);
[~, i_2, scarti_2] = tfissa(f, df, x_0, tol, MAXITER);

%% Draw

semilogy(1:i_1, abs(scarti_1), Color='red', marker='o');
hold on;
semilogy(1:i_2, abs(scarti_2), Color='green', marker='o');
hold off;

legend("Newton", "Fixed Tangent")
title("Semilogarithmic plot of differences for different algorithms")
subtitle("(Newton vs Fixed Tangent)")
xlabel("-th iteration")
ylabel("difference")

print -dpdf ./graphs/graficotf.pdf

clear i_1 
clear scarti_1
clear i_2
clear scarti_2
clear f
clear df
clear ans
clear MAXITER
clear tol
clear x_0