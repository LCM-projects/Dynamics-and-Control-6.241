function g = normHInfCT(A, B, C, D)
  [n, m] = size(B);
  P = sdpvar(n,n);
  r = sdpvar(1,1);
  SDP = [[-P*A-A'*P-C'*C -C'*D-P*B; -D'*C-B'*P r*eye(m)-D'*D]>=0, P>=0];
  options = sdpsettings('verbose', 0);
  diagn = optimize(SDP, r, options);
  if (diagn.problem ~= 0)
    g=Inf;
  else
    g = sqrt(double(r));
  end
end
