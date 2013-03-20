% input is C matrix which contains the chromosomes, the out put will be a
% an array of size 30X3 containing kp,ki and kd values for each chromosome


function k=decimal(c)          
for i=1:30
    for j=1:8;
        u(j)=c(i,j);      %Kp in binary form
    end
    for j=9:16;
        v(j-8)=c(i,j);      %Kd in binary form
    end
    for j=17:24;
        w(j-16)=c(i,j);        %Ki in binary form
    end
    dec1=0;dec2=0;dec3=0;
    l=7;
    for j=1:8;
        dec1=dec1+u(j)*(2^l);
        dec2=dec2+v(j)*(2^l);
        dec3=dec3+w(j)*(2^l);
        l=l-1;
    end
    
    ki(i)=5+5*dec2/(bin2dec('11111111'));   %based on the respective ranges
    kd(i)=1+4*dec3/(bin2dec('11111111'));
    kp(i)=7+5*dec1/(bin2dec('11111111'));
    k(i,1)=kp(i);
    k(i,2)=ki(i);
    k(i,3)=kd(i);
end
end

