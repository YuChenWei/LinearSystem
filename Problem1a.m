clc;clear;
fc=300;
fs=1000;
figure(1);
for i=1:1:6
    [b,a]=butter(i,fc/(fs/2));
    Sys=tf(b,a);
    figure(1);
    subplot(3,2,i);
    bode(Sys);
    title(strcat('$n =\:$',int2str(i)),'interpreter','latex');
    hold on;
    figure(2);
        switch (i)
            case 1
                bode(Sys,'r+-');
            case 2
                bode(Sys,'go-');
            case 3
                bode(Sys,'b*-');
            case 4
                bode(Sys,'c.-');
            case 5
                bode(Sys,'mx-')
            case 6
                bode(Sys,'k^-')
        end
    hold on;
end
figure(2);
legend('1st','2nd','3rd','4th','5th','6th')
% figure(3);
% [b,a]=butter(5,1/sqrt(2));
% Sys=tf(b,a);
% bode(Sys);
% figure(4);
% pzmap(Sys);
% P=pole(Sys)


