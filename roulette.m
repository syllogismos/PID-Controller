%roulette wheel method used for selecting the chromosomes that are to be
%crossed accordingly



function a=roulette(c)
e=0;   %e is the sum of all fitneses
d=0;      %d differentiation points in roulette wheel
k=decimal(c);
for i=1:30
    f(i)=funct(k(i,1),k(i,2),k(i,3));
    e=e+f(i);    
end
for i=1:30
    d=f(i)/e+d;
    r(i)=d;
end
x=rand;
for i=1:30
    if x<r(i)
        y=i;
        break
    end
end
a=c(y,:);    %selected chromomsome for crossover
end