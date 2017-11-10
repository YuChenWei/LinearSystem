function Frequency= CoTu_FFT(TimeDomain)
n=length(TimeDomain);

if (n==1)
   Frequency(1)=TimeDomain;
else
   Omega_n=exp(-2*pi*1i/n);
   Omega=1;
   T0=TimeDomain(1:2:n-1);
   T1=TimeDomain(2:2:n);
   F0=CoTu_FFT(T0);
   F1=CoTu_FFT(T1);
   for i=1:1:(n/2)
      t=Omega*F1(i);
      Frequency(i)=F0(i)+t;
      Frequency(i+n/2)=F0(i)-t;
      Omega=Omega*Omega_n;
   end
end
end


