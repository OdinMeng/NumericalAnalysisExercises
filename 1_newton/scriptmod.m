%% FILE FOR TESTING newtonmod.m %%
% Dino Meng [SM3201466]

try
    newtonmod(@(x) x,@(x) 2,3,4,5, 1);
catch
    disp("Mancante file newtonmod.m"); % Prints newtonmod is missing
end

f = @(x) ((x-1).^2) .* log(x);
df = @(x) ((x-1) .* (x+2 .* x .* log(x) -1 ))./(x);

%% Part 1: Calculate differences for r = 1, r=3

[~, iter_1, scarti_1] = newtonmod(f, df, 3, 1e-9, 100000, 1);
[~, iter_2, scarti_2] = newtonmod(f, df, 3, 1e-9, 100000, 3);

%% Part 2: Plot graphs

semilogy(1:iter_1, abs(scarti_1), Color='red', marker='o');
hold on;
semilogy(1:iter_2, abs(scarti_2), Color='green', marker='o');
hold off;

legend("r=1 (Original NR)", "r=3 (Modified NR)")
title("Semilogarithmic plot of differences for r=1, r=cl3")
subtitle("(Modified Newton)")
xlabel("-th iteration")
ylabel("difference")

print -dpdf ./graphs/graficonewtonm.pdf

%% Clear variables
clear iter_1 
clear scarti_1
clear iter_2
clear scarti_2
clear f
clear df
clear ans
