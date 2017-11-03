clc;clear;
A=[0,-1;1,0];
B=[0;1];
C=[1,0;0,1];
D=[0;0];
Sys=ss(A,B,C,D);
[V,D]=eig(A);
X=[1.01;0.05];
dT=0.1;
T=0:dT:20;
figure(1);
Weight=0;
for i=2:1:length(T)
    dX1=X(2,i-1)-2*X(1,i-1)*X(2,i-1);
    dX2=-X(1,i-1)+X(1,i-1)^(2)+X(2,i-1)^(2)+Weight*sin(T(i-1));
    X(1,i)=X(1,i-1)+dX1*dT;
    X(2,i)=X(2,i-1)+dX2*dT;
end
U=zeros(length(T),1);
y=lsim(Sys,U,T,[0.01;0.05]);
plot(T,X(1,:),'bo-',T,X(2,:),'rx-',T,y(:,1)'+1.00,'ms-',T,y(:,2)','g^-');
legend('Nonlinear output 1','Nonlinear output 2','linear output 1','linear output2')
figure(2);
X=[1.0;0];
Weight=0.01;
for i=2:1:length(T)
    dX1=X(2,i-1)-2*X(1,i-1)*X(2,i-1);
    dX2=-X(1,i-1)+X(1,i-1)^(2)+X(2,i-1)^(2)+Weight*sin(T(i-1));
    X(1,i)=X(1,i-1)+dX1*dT;
    X(2,i)=X(2,i-1)+dX2*dT;
end
U=Weight*sin(T);
y=lsim(Sys,U,T,[0;0]);
plot(T,X(1,:),'bo-',T,X(2,:),'rx-',T,y(:,1)'+1.00,'ms-',T,y(:,2)','g^-');
legend('Nonlinear output 1','Nonlinear output 2','linear output 1','linear output2')