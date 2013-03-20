fprintf('the following program allows you to design PID controller using GA \n for plant whose transfer function is 3/(s^2+4s+3) \n');
fprintf('pc is crossover probability and pm is mutation probability \n');
fprintf('press 1 for starting the algorithm or 0 to abandon \n');
i=input('');
switch i
    case 1
    c=round(rand(30,24));
    fprintf('initial distribution \n');
    plotter(c);
    fprintf('enter the value of crossover probability, general range is (.7,.9) \n');
    pc=input('');
    fprintf('enter the value of mutation probability, general range is (.001,.01) \n');
    pm=input('');
    fprintf('enter the number of generation you wish to continue  \n');
    n=input('');
    for m=1:n 
        cnew=cross(c,pc);
        cnew=mutate(cnew,pm);
        fprintf('next generation distribution \n');
        plotter(cnew);
        a(m)=avgfitness(cnew);
        p(m)=m;
    end
    scatter(p,a);
    case 0
        break
end