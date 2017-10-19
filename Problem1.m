clc;
clear;
A=[0,1;-4,-2];
B=[0;-1];
C=[1,0;0,1];
D=[0];
sys=ss(A,B,C,D);
figure(1);
initial(sys,[0;3]);
title('Problem 1.5');
figure(2);
initial(sys,[0;0]);
step(sys);0,1

