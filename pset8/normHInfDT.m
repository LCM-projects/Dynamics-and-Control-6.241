function g = normHInfDT(A, B, C, D)
  [n, m] = size(B);
  P = sdpvar(n,n);
  r = sdpvar(1,1);
  SDP = [[P-A'*P*A-C'*C -A'*P*B-C'*D; -B'*P*A-D'*C r*eye(m)-D'*D-B'*P*B]>=0, P>=0];
  options = sdpsettings('verbose', 0);
  diagn = optimize(SDP, r, options);
  if (diagn.problem ~= 0)
    g=Inf;
  else
    g = sqrt(double(r));
  end
end
