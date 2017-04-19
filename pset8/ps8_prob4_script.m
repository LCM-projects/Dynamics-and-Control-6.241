% compute L2 bound for problem 4(b)
N = 21;
K_grid = linspace(0,20,N);
h_grid_a = zeros(N,1);
h_grid_e = zeros(N,1);

for i=1:length(K_grid)
  K = K_grid(i);
  h_grid_a(i) = ps8_prob4_a(K);
  h_grid_e(i) = ps8_prob4_e(K);
end

h_grid_a
h_grid_e

h_grid_a - h_grid_e
