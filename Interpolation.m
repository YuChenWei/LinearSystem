function Output = Interpolation( Input,L )
    Output=zeros(1,length(Input)*L);
    for i=1:1:length(Input)
        Output(L*(i-1)+1)=Input(i);
    end
    TMP=Output;
    %Creating the coefficients of interpolation filter%
    Filter=LinearFilter(L);
    %Using matrix caculation to instead of the convolution operation%
    for i=1:1:length(Output)
        Sta=i-L;
        Fin=i+L;
        if(i<(L+1))
            Output(i)=TMP(i:1:Fin)*Filter(L+1:1:length(Filter))';
        elseif( i>(length(Output)-(L)) )
            Output(i)=TMP(Sta:1:length(Output))*Filter(1:1:length(Output)-Sta+1)';
        else
            Output(i)=TMP(Sta:1:Fin)*Filter';
        end
    end

end

