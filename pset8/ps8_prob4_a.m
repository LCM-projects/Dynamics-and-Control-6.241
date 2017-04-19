% specify A,B,C,D matrices

function g = ps8_prob4_a(K)
  K
  A = [0 1 0; 0 0 1; -1 -2 -2];
  B = [0; 0; 1];
  C = [0.01 0.2 1];
  [n, m] = size(B);
  % L_lambda = zeros(n+2, n+2);
  P = sdpvar(n,n);
  h = sdpvar(1,1);
  d = sdpvar(1,1);
  L_lambda = [-P*A-A'*P-C'*C zeros(3,2); zeros(2,5)];
  % L_lambda(1:n, 1:n) = -P*A-A'*P-C'*C;
  L_lambda(1:n, n+1) = d*K*C'- P*B;
  L_lambda(n+1, 1:n) = -B'*P + d*K*C;
  L_lambda(n+1:n+2, n+1:n+2) = [2*d -d*K; -d*K  h];

  % sdpvar2str(L_lambda)

  SDP = [L_lambda>=0, P>=0, d>=0];
  options = sdpsettings('verbose', 0);
  diagn = optimize(SDP, h, options);
  if (diagn.problem ~= 0)
    g=Inf;
  else
    g = sqrt(double(h));
  end
end
