function [L,U] = lugauss(A)
    assert (size(A, 1) == size(A,2))
    n = size(A,1);

    if det(A)==0
        for i = 1:n-1
            assert(det(A(1:i, 1:i)) ~= 0);
        end
    end

    L = eye(n); U = A;

    for k = 1:n-1
        % Iterate for each column
           for i = k+1:n
               % Calculate multiplier and scale columns
               L(i, k) = U(i,k) / U(k,k);
               U(i, :) = U(i, :) - L(i,k) * U(k, :);
           end
    end
end    

