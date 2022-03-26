function K = full_kernel(X_sp, X_in, sigma, gain)

% K = X_sp * X_in;

%  Radial Basis Function  (RBF) 
% 
[N,n] = size(X_sp);

K=zeros(N,1);

for k=1:N
K(k) = gain * exp(- norm(X_sp(k,:)' - X_in)^2  /(2*sigma^2)  );
end


% d-th degree polynomial

% [N,n] = size(X_sp);
% 
% K=zeros(N,1);
% 
% for k=1:N
% K(k) = (1 + dot(X_sp(k,:)', X_in) )^sigma;
% end


% tanh

% [N,n] = size(X_sp);
% 
% K=zeros(N,1);
% 
% for k=1:N
% K(k) = tanh (sigma + gain * dot(X_sp(k,:)', X_in));
% end