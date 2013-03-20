syms s c kp ki kd l;
g=tf([0 1],[1 6 5 0]);
c=tf([6.3223 17.996 12.8112],[1 0]);   %kp,ki
t1=g*c;
cloop=feedback(t1,1);
[num,den]=tfdata(cloop,'v');
%subs(t1,{kp,ki,kd},{3,7,1.5});
%pretty(t1);
[A,B,C,D]=tf2ss(num,den);
A1=A;
l=length(A);
I=eye(l,l);

%caliculating matrix exponential of A, phi


phi=ilaplace(inv(s*I-A));
x=inv(A)*(phi-I)*B;
y=C*x;
%e=(1-y)^2;
%t=0:.01:10;
%f=inline(e);
%E=f(t);
%plot(t,E);
%area=trapz(t,E); %fitness


%important
%http://www.profjrwhite.com/system_dynamics/sdyn/s3/ex3_6/ex3_6.html
=================================================================
s=tf('s');
g=;% plant
c=;%controller
cloop=feedback(g*c,1);%closedloop transfer function

%step response
t=0:.01:50;
[y,t]=step(cloop,t);
plot(t,y);%step response
i=1;
while i<5002;
  z(i)=(y(i)-1)^2;
  i=i+1;
end
plot(t,z);
area=trapz(t,z);%area under squared error function
=======================================================================