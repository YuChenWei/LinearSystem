function Frequency= RecursiveFFT(TimeDomain)
n=length(TimeDomain);

if (n==1)
   Frequency(1)=TimeDomain;
else
   Omega_n=exp(-2*pi*1i/n);
   Omega=1;
   T0=TimeDomain(1:2:n-1);
   T1=TimeDomain(2:2:n);
   F0=RecursiveFFT(T0);
   F1=RecursiveFFT(T1);
   for i=1:1:(n/2)
       Frequency(i)=F0(i)+Omega*F1(i);
       Frequency(i+n/2)=F0(i)-Omega*F1(i);
       Omega=Omega*Omega_n;
   end
end
        

end

