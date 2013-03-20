clc
clear all
global s m
s=tf('s');
display('enter 1 for siso reduction')
display('enter 2 for siso controller design')
display('enter 3 for siso controller reduction')
display('enter 4 for mimo reduction')
display('enter 5 for mimo controller design')
i=input('');
switch i
    case 1
        sys=input('enter the higher order transfer function');
        k=input('enter the order of the reduced model requred');
        j=input('enter 1 for pade approximation or enter 2 for momemt matching tech');
        if j==1
           red=lucas(sys,k);
        elseif j==2
            red=momentmatch(sys,k);
        end
    case 2
        M=input('enter the model transfer function');
        G=input('enter the plant transfer function');
        CH=M/(G-G*M);
        CR=controlred(CH,G);
    case 3
        G=input('enter the plant transfer function');
        CH=input('enter the higher order controller TF');
        CR=controlred(CH,G);
    case 4
        sys=input('enter the transfer function matrix');
        k=input('enter the order of the reduced model required');
        red=momentmimo(sys,k);
    case 5
        M=input('enter the model TFM');
        G=input('enter the plant TFM');
        i=length(M);
        I=eye(i);
        M0=M*(I-M)^-1;
        M0=polezero(M0,i);
        for j=1:i
            n(j)=order(M0(j,j));
            e(j,:)=eig(M0(j,j));
        end
        for j=1:i
            temp(j)=0;
            for k=1:n(j)
                if e(j,k)==0
                   temp(j)=temp(j)+1;
                end
            end
        end
        m=max(temp);
        M0=s^m*M0;
        M0=polezero(M0,i);
        CR=controlmimored(G,M,M0,m);
end