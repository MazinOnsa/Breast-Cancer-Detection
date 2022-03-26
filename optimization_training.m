function [alphas, b,sup_vec_index,opt_sigma] = optimization_training(X,y)

[n,N]=size(X);

LB = zeros(N,1);
UB = ones(N,1);

A = -1*eye(N);
binq = zeros(N,1);

Aeq=[y ; zeros(N-1,N)];
beq=zeros(N,1);

f = -1*ones(1,N);
H = zeros(N);

m=0.01:0.01:10;
[opt_sigma, P] = sigma_selection_for_svdd(X, m);
gain=1;

for i=1:N
    for j=1:N
%K = dot(xi,xj); %dot
K = gain * exp(- norm(xi - xj)^2  /(2*opt_sigma^2)  ); % RBF
% K = tanh(sigma + gain * dot(xi, xj) );% d-th degree polynomial

   H(i,j) =  y(i) * y(j) * K;
    end
end
    

alphas = quadprog(H+eye(N)*0.001,f,A,binq,Aeq,beq,LB,UB);

sup_vec_index=[];

for k=1:N
    if alphas(k)>10^(-8)
        sup_vec_index= [sup_vec_index ; k];
    end
end


% a=sum(alphas .* y' .* X');

b = y(sup_vec_index(1)) - sum(alphas .* y' .* full_kernel(X', X(:,sup_vec_index(1)) , opt_sigma, 1));
