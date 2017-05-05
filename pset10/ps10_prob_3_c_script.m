N = 10

w_0_grid = linspace(1,N,N);
gam_grid = 0*w_0_grid;

for i=1:N
	gam_grid(i) = design_filter(w_0_grid(i));
end

fig = figure(1)
clf(fig)
plot(w_0_grid, gam_grid)
xlabel('w0')
ylabel('H2 gain')
