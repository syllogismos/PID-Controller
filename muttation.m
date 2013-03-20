% mutation for main project based on roulette method to generate next
% generation, input will be parent generation and pc and output will next
% generation





function cnew=cross(c pc)
i=1;
for i=1:15
    d=roulette(c);
    e=roulette(c);
    a=rand;
    if a>pc
        cnew(2*i-1,:)=d;
        cnew(2*i,:)=e;
    else
        a1=round(rand*24);
        a2=round(rand*24);
        a3=min(a1,a2);
        a4=max(a1,a2);
        if a3==0
            a3=1;
        else
        end
        if a4==0
            a4=1;
        else
        end        
        for j=1:a3
            cnew(2*i-1,j)=d(j);
            cnew(2*1)=e(j);
        end
        for j=a3:a4
            cnew(2*i-1,j)=e(j);
            cnew(2*i)=d(j);
        end
        for j=a4:24
            cnew(2*i-1,j)=d(j);
            cnew(2*i,j)=e(j);
        end
    end
end
end
