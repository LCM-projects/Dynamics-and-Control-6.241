% compute L2 bound for problem 4(b)
N = 21;
K_grid = linspace(0,20,N);
h_grid = zeros(N,1);

for i=1:length(K_grid)
  K = K_grid(i);
  h_grid(i) = ps8_prob4_c(K);
end

h_grid
