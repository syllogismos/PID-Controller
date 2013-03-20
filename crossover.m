function cnew=crossover(psize,c,nvar,blen,pc)
r=round((1-pc)*psize);
for i=1:r
    cnew(i,:)=c(i,:);
end
j=r+1;
while j<psize
    cr=round(rand(1)*(blen*nvar));
    for l=1:blen*nvar
        if l<cr
            cnew(j,l)=c(j,l);
            cnew(j+1,l)=c(j+1,l);
        else
            cnew(j,l)=c(j+1,l);
            cnew(j+1,l)=c(j,l);
        end
    end
    j=j+2;
end
if j==psize
    cnew(j,:)=c(j,:);
end
end