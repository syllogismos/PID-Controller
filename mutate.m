%mutation where one allele of a chromomsome is changed if rand>pm


function cnew=mutate(c,pm)
cnew=c;
for i=1:30
    if rand<pm
        j=round(rand*24);
        if j==0
            j=1;
        end
        cnew(i,j)=~c(i,j);
    end
end     
end