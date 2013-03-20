function [x fl fmax blen]=genetic(h,psize,nvar,max,min,pc,pm)
global f fl
blen=ceil(log2((max-min)/.01));
fla=0;
fl=1;
for i=1:psize
    for j=1:blen*nvar
        rl=rand(1,1);
        if rl<.5
            c(i,j)=0;
        else
            c(i,j)=1;
        end
    end
end
ij=0;
while(1)
    xl=b2d(max,min,psize,c,nvar,blen);
    f=h(xl,psize);
    fmax1=0;
    for j=1:psize
        if f(j)>fmax1
           fmax1=f(j);
           l=j;
        end
    end
%     if fmax1==0
%         max=10*max;
%         min=10*min;
%         [x fl]=genetic(h,psize,nvar,max,min,pc,pm);
%         break
%     end
    fmax(fl)=fmax1;
    x(fl,:)=xl(l,:);
    if fl>1
        ik=0;
        if abs(fmax(fl-1)-fmax(fl))<.00001
            ij=ij+1;
            ik=1;
        end
        if ik==0
            ij=0;
        end
        if fl==50||fmax(fl)>.999||ij==5
           break
        end
    end
    c=reproduction(f,psize,c);
    c=crossover(psize,c,nvar,blen,pc);
    c=mutation(psize,c,nvar,blen,pm);
    fl=fl+1;
end
end 