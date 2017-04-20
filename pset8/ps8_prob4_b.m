P = @(s) (s + 0.1)^2/(s^3 + 2*s^2+2*s+1);

M = 100;
N = 10*M;
w = linspace(-M,M,N);
p_vals = zeros(N,1);

for j=1:N
  p_vals(j) = P(w(j)*1i);
end

close all
plot(real(p_vals), imag(p_vals))
