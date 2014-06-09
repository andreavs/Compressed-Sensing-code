clear all; close all;
n = 20; 
N = n*n;

nM = 100;
nk = 100;
Mlistp = linspace(0,1,nM);
klistp = linspace(0,1,nk);
result = zeros(nM, nk);
result2= zeros(nM, nk);
nExp = 20;

for i=1:nM
    M = max(round(Mlistp(i)*N),1);
    for j=1:nk
        k = max(round(klistp(j)*M),1);
        idx_us =randsample(1:N,M); 
        A1 = randn(n,n);
	A2 = randn(n,n);
        %[A, R] = qr(A);
	%[A1, R] = qr(A1);
	%[A2, R] = qr(A2);


        A = kron(A1,A2);
        
        %mutual_coherence(A, eye(N));
        A = A(idx_us,:);
        A2 = randn(N);
        %[A2, R] = qr(A2);
        A2 = A2(idx_us,:);
        i
        j
        for l=1:nExp
            x = zeros(N,1); 
            idx = randsample(1:N,k); 

            x(idx) = 2*rand(k,1)-1;





            % A = randn(n,n);
            % A = kron(A,A);
            % A = A(idx_us,:);

            y = A*x; 
            o.iterations = 4000;
            o.verbosity = 0;
            o.optTol = 1e-10;
            x_res = spg_bp(A,y,o);
            err = norm(x-x_res);
            if err > 1e-7;
                result(i,j) = result(i,j) + 1;
            end
            
            y = A2*x;
            x_res = spg_bp(A2,y,o);
            err = norm(x-x_res);
            if err > 1e-7;
                result2(i,j) = result2(i,j) + 1;
            end
            
        end
    end
    save('result_noqr1.mat', 'result', 'result2')
end
result = result/nExp;

% plot(x_res-x)
% figure
% plot(x)
% hold all
% plot(x_res)
