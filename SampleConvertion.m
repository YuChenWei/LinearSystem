clc;
clear;
FsOri=16000;
[Ori,FsOri]=audioread('Test.wav');
%Using FFT instead of DFT.%
OriF=2*abs(fft(Ori))/length(Ori);
OriF(1)=OriF(1)/2;
L=3;
Fsu=L*FsOri;
%Upsampling%
Up=Interpolation(Ori',L);
UF=2*abs(fft(Up))/length(Up);UF(1)=UF(1)/2;
Fsd=Fsu/4;
%Downsampling without anti_aliasing filter%
WoutdS=Up(1:4:length(Up));
WoutdF=2*abs(fft(WoutdS))/length(WoutdS);WoutdF(1)=WoutdF(1)/2;
FwouD=([0:1:length(WoutdS)/2-1]*Fsd/length(WoutdS))';
%Corner frequency of low pass filter%
Fc=6000;
%Using the butterworth filter to avoid the ringing phenomena of ideal low pass filter%
[b,a]=butter(25,Fc/(Fsu/2));
AntiSig=filter(b,a,Up);
AntiF=2*abs(fft(AntiSig))/length(AntiSig);AntiF(1)=AntiF(1)/2;
WdS=AntiSig(1:4:length(AntiSig));
WdF=2*abs(fft(WdS))/length(WdS);WdF(1)=WdF(1)/2;


figure(1);
T=(1:length(Ori))/FsOri;
subplot(5,1,1);
plot(T,Ori);
title('Time Sequence of original signal');
xlabel('Time');
ylabel('Magnitude');
subplot(5,1,2);
plot((1:1:length(Up))/(FsOri*L),Up);
title('Time Sequence of upsampling signal');
xlabel('Time');
ylabel('Magnitude');
subplot(5,1,3);
plot((1:1:length(WoutdS))/(Fsu/4),WoutdS);
title('Time Sequence of downsampling signal without anti_aliasing filter');
xlabel('Time');
ylabel('Magnitude');
subplot(5,1,4);
plot((1:1:length(AntiSig))/(FsOri*L),AntiSig);
title('Time Sequence of upsampling filter pass through anti_aliasing filter');
xlabel('Time');
ylabel('Magnitude');
subplot(5,1,5);
plot((1:1:length(WdS))/(Fsu/4),WdS);
title('Time Sequence of downsample signal with anti_aliasing filter');
xlabel('Time');
ylabel('Magnitude');



figure(2);
subplot(5,1,1)
F=([0:1:length(Ori)/2-1]*FsOri/length(Ori))';
plot(F,OriF(1:1:length(F)))
title('Frequency rseponse of original signal');
xlabel('Frequency');
ylabel('Magnitude');
subplot(5,1,2)
Fu=([0:1:length(Up)/2-1] *Fsu/length(Up))';
plot(Fu,UF(1:1:length(Fu)));
title('Frequency rseponse of upsampling signal');
xlabel('Frequency');
ylabel('Magnitude');
xlim([0 8000])
subplot(5,1,4)
plot(Fu,AntiF(1:1:length(Fu)))
xlim([0 8000])
title('Frequency rseponse of upsampling filter pass through anti_aliasing filter');
xlabel('Frequency');
ylabel('Magnitude');
subplot(5,1,3)
plot(FwouD,WoutdF(1:1:length(FwouD)))
xlim([0 8000])
ylim([0 0.004])
title('Frequency rseponse of downsampling signal without anti_aliasing filter');
xlabel('Frequency');
ylabel('Magnitude');
subplot(5,1,5)
plot(FwouD,WdF(1:1:length(FwouD)))
xlim([0 8000]);
ylim([0 0.004]);
title('Frequency rseponse of downsample signal with anti_aliasing filter');
xlabel('Frequency');
ylabel('Magnitude');
% 
% audiowrite('C:\Users\acala\Desktop\Master\DSP\DSP Project of Chapter 4\DSP Project of Chapter 4\After_up_sampling.wav',Up,Fsu);
% audiowrite('C:\Users\acala\Desktop\Master\DSP\DSP Project of Chapter 4\Without_anti_filter_downsampling.wav',WoutdS,Fsd);
% audiowrite('C:\Users\acala\Desktop\Master\DSP\DSP Project of Chapter 4\After_anti_filter.wav',AntiSig,Fsu);
% audiowrite('C:\Users\acala\Desktop\Master\DSP\DSP Project of Chapter 4\With_anti_filter_downsampling.wav',WdS,Fsd);