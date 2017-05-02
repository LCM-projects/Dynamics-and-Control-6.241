N = 10;

a_grid_pos = 1:N;
a_grid_neg = -N:-1;

gamma_pos = [];
gamma_neg = [];

for i = 1:length(a_grid_pos)
  gamma_pos(i) = compute_bandwidth(a_grid_pos(i));
  gamma_neg(i) = compute_bandwidth(a_grid_neg(i));
end

hold on
fig = figure(1);
clf(fig);
plot(a_grid_pos, gamma_pos, 'b')
xlabel('a')
ylabel('H-Infty gain')


fig = figure(2);
clf(fig);
plot(a_grid_neg, gamma_neg, 'r')
xlabel('a')
ylabel('H-Infty gain')
hold off

