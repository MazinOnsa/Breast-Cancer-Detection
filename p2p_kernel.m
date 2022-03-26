function K = p2p_kernel(xi, xj, sigma, gain)

K = dot(xi,xj);

% RBF

K = gain * exp(- norm(xi - xj)^2  /(2*sigma^2)  );


% d-th degree polynomial

% K = tanh(sigma + gain * dot(xi, xj) );