clc;
clear;
A=[0,1,0,0,0,0;
  -1,0,1,0,0,0;
  0,0,0,1,0,0;
  1,0,-2,0,1,0;
  0,0,0,0,0,1;
  0,0,1,0,-1,0];
B=[0;1;0;0;0;0];
C=[1,0,0,0,0,0];
D=0;
rank([C;C*A;C*A^(2);C*A^(3);C*A^(4);C*A^(5)])
Sys=ss(A,B,C,D);
Sysd=c2d(Sys,0.1);
X0=[1;1;0;0;-1;-1];
a=zeros(1,100);
figure(1);
for i=1:1:101
    TMP=((Sysd.A)^(i-1))*X0;
    a(i)=TMP(1);
end
subplot(2,1,1)
plot((0:1:100),a);
title('Simulation result');
TMP1=zeros(6,1);
Input=ones(1,101);
T=0:0.1:10;
figure(2);
subplot(4,1,1);
lsim(Sys,Input',T',X0);
title('Using lsim function');
Test=zeros(6,6);
for i=1:1:101
    if(i==1)
        Test(:,i)=X0;
    else
        Test(:,i)=Sysd.A*Test(:,i-1)+Sysd.B;
    end
    a(i)=Test(1,i);
end
subplot(4,1,2);
plot((0:1:100),a);
title('Using recursive method');
for i=1:1:101
    TMP=((Sysd.A)^(i-1))*X0;
    if(i>1)
        for j=0:1:i-2
            TMP1=TMP1+Sysd.A^(j)*Sysd.B;
        end
    end
    a(i)=TMP1(1)+TMP(1);
    TMP1=0;
end
subplot(4,1,3);
plot((0:1:100),a);
title('Using formula on textbook');
        