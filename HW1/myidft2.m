function out=myidft2(x)

[M,N] = size(x);
%Éú³Édft¾ØÕó
U = zeros(M,M);
for m = 1 : M
    for n = 1 : M
        U(m,n) = (exp(-j*2*pi/M))^(-(m-1)*(n-1))/sqrt(M);
    end
end

V = zeros(N,N);
for m = 1 : N
    for n = 1 : N
        V(m,n) = (exp(-j*2*pi/N))^(-(m-1)*(n-1))/sqrt(N);
    end
end

out = U*x*V;
