clc;
clear;
A=[0,1,0,0,0,0;
  -1,0,1,0,0,0;
   0,0,0,1,0,0;
   1,0,-2,0,1,0;
   0,0,0,0,0,1;
   0,0,1,0,-1,0];
B=[0 1 0 0 0 -1]';
C=[0 0 1 0 0 0];
D=0;
c=eye(6);
Sys=ss(A,B,C,D);
[S,d]=eig(A);
sys=ss(A,B,c,D);
% rank([-A B])
% rank([i*eye(6)-A B])
% rank([i*sqrt(3)*eye(6)-A B])
Tf=10;
Tm=5;
T=0:0.01:Tf;
Input(1,1:1:Tm/0.01+1)=0.698;
Input(1,Tm/0.01+2:1:Tf/0.01+1)=0.302;
lsim(sys,Input',T)
% [Abar,Bbar,Cbar,T,k]=ctrbf(A,B,C);
% TMP=ctrb(A,B);
% Q=[TMP(:,1) TMP(:,2)];
% Q(:,3)=[0 0 1 0 0 0]';
% Q(:,4)=[0,0,0,1,0,0]';
% Q(:,5)=[0,0,0,0,0,1]';
% Q(:,6)=[1,0,0,0,0,0]';
% A_c=pinv(Q)*A*Q;
% B_c=pinv(Q)*B;
% C_c=C*Q;
% D_c=0;
% Sys_c=ss(A_c,B_c,C_c,D_c);
% % X_f1=[1,0,0,0,-1,0]';
% % Z_f1=pinv(Q)*X_f1;
% % X_f2=[1,0,0,0,1,0]';
% % Z_f2=pinv(Q)*X_f2;
% % X_f3=[1,0,1,0,1,0]';
% % Z_f3=pinv(Q)*X_f3;
% Ob=obsv(A,C)
% rank([A;C])
% rank([i*eye(6)-A;C])
% rank([i*sqrt(3)-A;C])
