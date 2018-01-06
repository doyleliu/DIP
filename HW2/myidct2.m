function out=myidct2(x,mask)
if nargin < 2
    mask = 1;
else
end

[M,N] = size(x);
U = zeros(M,M);
for m = 1 : M
    for n = 1 : M
        U(m,n) = cos((m-1)*(2*n-1)*pi/(2*M))*sqrt(2/M);
    end
end
for n = 1 : M
    U(1,n) = 1/sqrt(2)*sqrt(2/M);
end


V = zeros(N,N);
for m = 1 : N
    for n = 1 : N
        V(m,n) = cos((m-1)*(2*n-1)*pi/(2*N))*sqrt(2/N);
    end
end
for n = 1 : N
    V(1,n) = 1/sqrt(2)*sqrt(2/N);
end

F = zeros(M,N);
F = (U.')*x*V;
out = F;
