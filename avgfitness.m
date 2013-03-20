function f=avgfitness(c)
f=0;
k=decimal(c);
for i=1:30
    a(i)=funct(k(i,1),k(i,2),k(i,3));
    f=a(i)+f;
end