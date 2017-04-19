% specify A,B,C,D matrices

function g = ps8_prob4_c(K)
  K
  A = [0 1 0; 0 0 1; -1 -2 -2];
  B = [0; 0; 1];
  C = [0.01 0.2 1];
  [n, m] = size(B);
  % L_lambda = zeros(n+2, n+2);
  P = sdpvar(n,n);
  h = sdpvar(1,1);
  d_1 = sdpvar(1,1);
  d_2 = sdpvar(1,1);
  P_r = sdpvar(1,1); % extra dissipation inequality for \dot{R} --> r system
  L_lambda = [-P*A-A'*P-C'*C zeros(3,3); zeros(3,6)];
  % L_lambda(1:n, 1:n) = -P*A-A'*P-C'*C;
  L_lambda(1:n, n+1) = d_1*K*C'- P*B + d_2*A'*C'*K;
  L_lambda(n+1, 1:n) = d_1*K*C -B'*P + d_2*K*C*A;
  L_lambda(n+1:n+3, n+1:n+3) = [2*d_1+2*d_2*K*C*B -d_1*K -d_2*K; -d_1*K  h  -P_r; -d_2*K -P_r 0];

  % sdpvar2str(L_lambda)

  SDP = [L_lambda>=0, P>=0, d_1>=0, d_2>=0, P_r>=0];
  options = sdpsettings('verbose', 0);
  diagn = optimize(SDP, h, options);
  if (diagn.problem ~= 0)
    g=Inf;
  else
    g = sqrt(double(h));
  end
end
