% Tests secvariabile.m
% Dino Meng
try
    secvariabile(@(x) x, 0, -1, 0, 1);
    newton(@(x) x,@(x) 2, 2, 2, 2);
catch
    disp("Mancante file secvariabile.m"); % Prints newtonmod is missing
end

[x, ~,sc] = secvariabile(@(x) exp(-x) + cos(x) - 3, - 1.5, -1, 10e-10, 100);

ezplot(@(x) exp(-x) + cos(x) - 3); hold on; ezplot(@(x) 0); hold off;
disp("Estimated solution: "+ x(end))
disp("Estimated error: "+ sc(end))

clear x; clear sc;