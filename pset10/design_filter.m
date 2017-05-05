function [GAM] = design_filter(w_0)

	% syms w_0;
	% L = sym('L', [3 1]);
	% syms a x;

	% this is just for testing
	a = 1;
	% w_0 = 3;



	A = [0 0 0; 0 0 1; 1 -w_0^2 0];
	B = [1 0; 0 0; 0 0];
	C = [0 1 0];
	D = [0 1];
	eps = 1e-5;

	L_test = [-a^3; -3*a; (w_0^2 - 3*a^2) ];
	eig(A + L_test*C)

	C_0 = [1 0 0; 0 1 0];
	B_0 = -L_test;
	A_0 = A + L_test*C;

	A_tilde = A_0;
	B_1 = [-B(:,1) -L_test];
	B_2 = zeros(3,2);

	C_1 = C_0;
	D_11 = zeros(2,2);
	D_12 = eye(2);

	C_2 = [0 -1 0];
	D_21 = [0 1];
	D_22 = zeros(1,2);

	% pack it into SS form
	A_sys = A_tilde;
	B_sys = [B_1 B_2];
	C_sys = [C_1; C_2];
	D_sys = [D_11 D_12; D_21 D_22];
	P = ss(A_sys,B_sys,C_sys,D_sys);
	NMEAS = 1;
	NCON = 2;

	[K,CL,GAM,INFO] = h2syn(P,NMEAS,NCON);
	GAM
	a
	w_0
end

