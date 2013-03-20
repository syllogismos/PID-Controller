function cnew=mutation(psize,c,nvar,blen,pm)
for i=1:psize
    for j=1:blen*nvar
        m=rand(1,1);
        if m<pm
            if c(i,j)==1
                cnew(i,j)=0;
            else
                cnew(i,j)=1;
            end
        else
            cnew(i,j)=c(i,j);
        end
    end
end
end