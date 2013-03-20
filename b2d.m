function m=b2d(max,min,psize,c,nvar,blen)
for ri=1:psize
    for i=1:nvar
        dec=0;
        l=blen-1;
        for j=(blen*(i-1)+1):blen*i
            dec=dec+c(ri,j)*(2^l);
            l=l-1;
        end
        m(ri,i)=min+(max-min)*dec/(2^blen-1);
    end
end
end


