function cnew=reproduction(f,p,c)
rj=0;
if max(f)==0
    cnew=rand(size(c));
    cnew=round(cnew);
else
    for i=1:p                    %creating roulette wheel
        rj=rj+f(i);
        cf(i)=rj;
    end
    cf=cf/cf(p);       %roulette probability
    for i=1:p                % generating next c based on roulette probabilities
        m=rand(1,1);
        for j=1:p
            if m<cf(j)
               cnew(i,:)=c(j,:);
               break
            end
        end
    end
end
end