clc;
clear;
A=[1,2;2,7;4,0];
AA=A*A';
[u,s,v]=svd(A);
[V,D]=eig(AA);
