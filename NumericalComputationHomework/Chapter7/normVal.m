function val = normVal(A, type)
%NORMVAL Summary of this function goes here
%   Detailed explanation goes here
D = diag(diag(A)); % first diag gets diag of A, second turns into diagonal matrix
L = tril(A)- D; % lower triangle, but remove the main diagonal
U = triu(A)- D; % upper triangle, but remove the main diagonal

M = [];
if strcmp(type, 'GS')
    M = -1 * inv(D + L) * U;
else
    M = -1 * inv(D)*(L + U);
end

val = max(abs(eig(M)));
end

