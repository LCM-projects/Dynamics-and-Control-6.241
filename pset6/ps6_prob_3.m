d = 3;
a = sym('a', [d,1]);
x = sym('x');
p = 0;
for i=1:d
  p = p + a(i)*x^(i-1);
end
p = p + x^i; % enforce that leading coefficient is 1
p_neg = subs(p,x,-x);


H_1 = 1/(x+1)*exp(-x);
H_r = 1/(1+x)*p_neg/p;
H_r_diff = H_r;
H_1_diff = H_1;


dH1(1) = diff(H_1, x);
dHr(1) = diff(H_r, x);
eqns(1) = subs(dH1(1), x, 0) == subs(dHr(1), x, 0);
for k=2:d
  dH1(k) = diff(dH1(k-1), x);
  dHr(k)= diff(dHr(k-1), x);
  eqn_temp = subs(dH1(k), x, 0) == subs(dHr(k), x, 0);
  eqns(k) = eqn_temp;
end

% solve equations
S = solve(eqns);
a_vals = zeros(d,1);

% extract solutions
for i=1:d
  var_name = char(a(i));
  a_vals(i) = double(getfield(S, var_name));
end

s_max = 1e3;
s_min = -s_max;
N = 50;
s_grid = logspace(0, 3, N);
s_grid = reshape(s_grid, [N,1]);
s_grid = 1i*[-s_grid;s_grid]; % search along imaginary axis
M = 2*N;
inf_norm = zeros(M,1);

for i=1:M
  p_temp = p;
  s_val = s_grid(i);
  H_r_val = subs(H_r, a, a_vals);
  H_r_val = subs(H_r_val, x, s_val);


  H_1_val = subs(H_1, a, a_vals);
  H_1_val = subs(H_1_val, x, s_val);
  inf_norm(i) = double(abs(H_r_val - H_1_val));
end

[val, idx] = max(inf_norm)
s_val_max = s_grid(idx)
H_r_subs = subs(H_r, a, a_vals)
pretty(H_r_subs)

