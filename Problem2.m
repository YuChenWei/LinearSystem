clc;
clear;
syms t;
A=[-1,1;0,-1];
B=[0;1];
X0=[1;1];
X1=[1;1];
C=[B A*B];
rank(C);
Sys=ss(A,B,[1,0;0,1],[0;0]);
Tf=10;
OPT=gramOptions('TimeIntervals',[0 Tf]);
Wc=gram(Sys,'c',OPT)
InvWc=inv(Wc);

U=-B'*expm(transpose(A)*(Tf-t))*InvWc*(expm(A*Tf)*X0-X1);
simplify(U)
Tf=1;
OPT=gramOptions('TimeIntervals',[0 Tf]);
Wc=gram(Sys,'c',OPT)
InvWc=inv(Wc);
U=-B'*expm(transpose(A)*(Tf-t))*InvWc*(expm(A*Tf)*X0-X1);
simplify(U);

figure(1);
t2=0:0.1:15;
u2=2.4993.*exp(-1.+t2)-1.5799.*exp(-1.+t2).*t2;
lsim(Sys,u2,t2,X0)
figure(2);
t1=0:0.1:15;
u1=39.9637.*exp(-10.+t1)-3.9962.*exp(-10.+t1).*t1;
lsim(Sys,u1,t1,X0)


