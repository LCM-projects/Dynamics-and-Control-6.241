syms w_0;
A = [0 0 0; 0 0 1; 1 -w_0^2 0];
B = [1 0; 0 0; 0 0];
C = [0 1 0];
D = [0 1];
eps = 1e-5;
L = sym('L', [3 1]);
syms a x s;
poly = charpoly(A + L*C, x)
L_test = [-a^3; -3*a; (w_0^2 - 3*a^2) ];
eig(A + L_test*C)

C_0 = [1 0 0; 0 1 0];
B_0 = -L_test;
A_0 = A + L_test*C;

F_0 = C_0*(s*eye(3) - A_0)^(-1)*B_0;
F_0 = simplify(F_0);
F_g_to_hat_q = F_0(2);

P_f_to_g = [1/(s*(s^2+w_0^2)) 1];
P_f_to_w_g = (1-F_g_to_hat_q)*P_f_to_g;
P_f_to_w_g = simplify(P_f_to_w_g);

P = s*zeros(3,4);
P(1,1) = -1/s;
P(1,3) = 1;
P(2,1) = -1/(s*(s^2+w_0^2));
P(2,4) = 1;
P(3,1:2) = P_f_to_w_g;

P = simplify(P)


