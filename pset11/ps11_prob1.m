A = [0 1; 0 0];
B_1 = [0 0 0; 0 0 1];
B_2 = [0; 1];
C_1 = [0 0;-1 1];
D_12 = [1;0];
C_2 = [0 0; -1 1];
D_21 = [1 0 0; 0 1 0];

tol = 1e-5;
poles_des = [-2 (-2 + tol)];
F = -place(A, B_2, poles_des);
L = -place(A', C_2', poles_des)';


% state space representation of G_0 transfer matrix
A_t = [(A+B_2*F) -B_2*F; 0*A (A + L*C_2)];
B_t = [B_1; (B_1 + L*D_21)];
C_t = [(C_1 + D_12*F) -D_12*F];
D_t = zeros(2,3);

disp('transfer matrix G_0')
for idx=1:3
  disp(idx)
  [b_1, a_1] = ss2tf(A_t,B_t,C_t,D_t, idx)
  disp('')
end

disp('')
disp('transfer matrix G_1')
A_l = A + B_2*F;
B_l = B_2;
C_l = C_1 + D_12*F;
D_l = D_12;

[b,a] = ss2tf(A_l,B_l,C_l,D_l)


disp('')
disp('transfer matrix G_2')
A_r = A + L*C_2;
B_r = B_1 + L*D_21;
C_r = C_2;
D_r = D_21;

for idx=1:3
  disp(idx)
  [b_1, a_1] = ss2tf(A_r,B_r,C_r,D_r, idx)
  disp('')
end
