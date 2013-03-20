function f=funct(kp,ki,kd)
s=tf('s');
g=3/(s^2+4*s+3);% plant
c=(kd*s^2+kp*s+ki)/s;%controller
cloop=feedback(g*c,1);%closedloop transfer function

%step response
t=0:.01:50;
[y,t]=step(cloop,t);
%plot(t,y);%step response
i=1;
while i<5002;
    z(i)=(y(i)-1)^2;
    i=i+1;
end
%plot(t,z);
f=trapz(t,z);          %area under squared error function
f=1/(1+f);   %for a mimimizing problem fitness has to be 
end           %changed so that we can continue as miximizin problem