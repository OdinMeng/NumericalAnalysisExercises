V = [100, 101, 102]; % change this to whatever you want

s = size(V); D = s(2); % get number of variables automatically
clear s;

N = 7; % upper bound of alpha

M = [];

for i=1:N
    M = [M; softmax(i .* V)];
end

for i=1:D
    plot(M(:, i)); hold on;
end

hold off;