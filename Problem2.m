clc;
clear;
fs=200;
T=1/fs;
N=131072;
t=0:1:N-1;
Input=randn(1,N);
[b,a]=butter(5,1/sqrt(2));
Sys=tf(b,a);
Output=lsim(Sys,Input',t);
tic
OutputF=fft(Output(1023:1:length(Output)));
toc
tic
OutputF2=RecursiveFFT(Output);
toc
tic
OutputF3=CoTu_FFT(Output);
toc
F=fs*(0:N/2)/N;
% figure(1);
% plot(t.*T,Output);
% xlim([min(t)*T max(t)*T]);
% title('$n=5,\omega_{c}=\pi*0.7\:s^{-1}\simeq4.49\:Hz$','interpreter','latex')
% xlabel('Time Sequences (s)')
% ylabel('Magnitude')
% figure(2);
% plot(F,10*log10(2*(abs(OutputF(1:length(F)))'.^2)*(T/N)));
% xlim([0 100])
% xlabel('Frequency (Hz)')
% ylabel('Power/frequency (dB/Hz)')
% title('$n=5,\omega_{c}=\pi*0.7\:s^{-1}\simeq4.49\:Hz$','interpreter','latex')
% grid on;
% figure(3);
% periodogram(Output(1023:1:length(Output)),rectwin(length(Output(1023:1:length(Output)))),length(Output(1023:1:length(Output))),fs)
% title('$n=5,\omega_{c}=\pi*0.7\:s^{-1}\simeq4.49\:Hz$','interpreter','latex')
% figure(4);
% plot(F,10*log10(2*(abs(OutputF2(1:length(F)))'.^2)*(T/N)));
% xlabel('Frequency (Hz)')
% ylabel('Power/frequency (dB/Hz)')
% title('$n=5,\omega_{c}=\pi*0.7\:s^{-1}\simeq4.49\:Hz$','interpreter','latex')
% grid on;
% figure(5)
% plot(F,10*log10(2*(abs(OutputF3(1:length(F)))'.^2)*(T/N)));
% xlabel('Frequency (Hz)')
% ylabel('Power/frequency (dB/Hz)')
% title('$n=5,\omega_{c}=\pi*0.7\:s^{-1}\simeq4.49\:Hz$','interpreter','latex')
% grid on;
% 
