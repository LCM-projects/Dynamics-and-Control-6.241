A = [1 0 0; 0 2 0; 0 0 1];
B = [1 0; 1 1; 0 1];
C = [1 1 0; 0 1 1];
syms k_11 k_21 k_22 k_23 x
F = [k_11 0 0; k_21 k_22 k_23];
T = A + B*F
p = charpoly(A + B*F,x)

k_21_test = 1;
F_test = [-2 0 0; k_21_test -9 4];
T_test = A + B*F_test;
eig(T_test);



