A_11 = 0; B_11 = 1; C_11 = 1;
A_12 = 1; B_12 = -1; C_12 = 1;
A_21 = 1; B_21 = -1; C_21 = 1;
A_22 = [0 1;-1 -2]; B_22 = [0;1]; C_22 = [0 1];

% system matrix for P that maps [w,u] --> [e, y] = [r-q, r-q]
% note that y = e in this setup.
A = blkdiag(A_11,A_12,A_21,A_22);
B_1 = zeros(5,2);
B_2 = [B_11 0; B_12 0; 0 B_21; zeros(2,1) B_22];
C_1 = -[C_11 C_12 zeros(1,3); zeros(1,2) C_21 C_22];
C_2 = C_1;
D_11 = eye(2);
D_12 = zeros(2);
D_21 = D_11;


tol = 1e-7;
poles_des = -ones(1,5) + tol*[0:4];
F = -place(A,B_2,poles_des)
L = -place(A',C_2',poles_des)'

% touch up to round numbers
F(1,3) = -1.5;
F(2,3) = 2;

L(3,1) = -1.5;
L(3,2) = 2;


% Write down G_1 system
disp('')
disp('transfer matrix G_1')
A_l = A + B_2*F;
B_l = B_2;
C_l = C_1 + D_12*F;
D_l = D_12;

for idx=1:2
  disp(idx)
  [b, a] = ss2tf(A_l,B_l,C_l,D_l, idx)
  disp('')
end

disp('')
disp('transfer matrix G_2')
A_r = A + L*C_2;
B_r = B_1 + L*D_21;
C_r = C_2;
D_r = D_21;

for idx=1:2
  disp('idx')
  disp(idx)
  [b, a] = ss2tf(A_r,B_r,C_r,D_r, idx)
  disp('')
end



