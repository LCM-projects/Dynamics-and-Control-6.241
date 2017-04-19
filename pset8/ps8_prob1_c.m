%G(z) = 1/(z+0.5) should have L2 gain of 2
a = 0.5
A = -a;
B = 1;
C = 1;
D = 0;

g = normHInfDT(A, B, C, D)


%G(z) = 1/(z-0.5) should have L2 gain of \infty
a = -0.75
A = -a;
B = 1;
C = 1;
D = 0;


g = normHInfDT(A, B, C, D)
