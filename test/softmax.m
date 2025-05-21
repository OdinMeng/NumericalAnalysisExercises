function [prob] = softmax(x)
    w = norm(exp(x), 1);
    prob = exp(x) ./ w;
    clear w;
end

