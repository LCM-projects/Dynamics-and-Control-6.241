% specify A,B,C,D matrices

function g = ps8_prob4_e(K)
  C_p = [0.01 0.2 1];
  A = [0 1 0 0; 0 0 1 0; -1 -2 -2 0; -K*C_p -1];
  B = [0 0; 0 0; 1 0; -1 -K];
  C = [C_p 0];
  [n, m] = size(B);
  % L_lambda = zeros(n+2, n+2);
  P = sdpvar(4,4);
  h = sdpvar(1,1);
  d_1 = sdpvar(1,1);
  d_2 = sdpvar(1,1);

  S_e = [0 0 0 1];
  S_w = [1 0];
  S_r = [0 1];
  S_x = [eye(4) zeros(4,2)];
  S_f = [zeros(2,4) eye(2)];
  
  L_lambda = h*S_f'*S_r'*S_r*S_f;
  L_lambda = L_lambda - S_x'*C'*C*S_x;
  temp = S_x'*P*(A*S_x + B*S_f); % xP(Ax + Bf)
  L_lambda = L_lambda - (temp + temp');

  temp_1 = d_1*S_f'*S_w'*(K*S_r*S_f - K*C*S_x - S_w*S_f);
  L_lambda = L_lambda - (temp_1 + temp_1');

  temp_2 = d_2*(S_f'*S_r'*K- K*S_x'*C')*(K*S_r*S_f - K*C*S_x - S_w*S_f - S_e*S_x);

  L_lambda = L_lambda - (temp_2 + temp_2');


  % sdpvar2str(L_lambda)

  SDP = [L_lambda>=0, P>=0, d_1>=0, d_2>=0];
  options = sdpsettings('verbose', 0);
  diagn = optimize(SDP, h, options);
  if (diagn.problem ~= 0)
    g=Inf;
  else
    g = sqrt(double(h));
  end
end
