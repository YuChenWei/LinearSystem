function Coefficient = LinearFilter( L )
Coefficient=zeros(1,2*(L)+1);
for i=1:1:length(Coefficient)
    if((i-L)<=0)
        Coefficient(i)=(i-1)/L;
    else
        Coefficient(i)=1-(i-L-1)/L;
    end
end
end

