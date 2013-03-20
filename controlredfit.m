function f=controlredfit(rl,psize)
global A B n k m l GL CL
for i=1:psize
    rl(i,k+l+1)=0;
end
for l1=1:psize
for i=1:m+k
    for j=1:m+k+1
        if i<=k+l&&j==1
            M(i,j)=-rl(l1,i);
        else if j==i+1
                M(i,j)=1;
            else
                M(i,j)=0;
            end
        end
    end
end
Z=A;
U=B;
for i=1:m-l
    Z=M*Z;
    U=M*U;
    M(m+k+1-i,:)=[];
    M(:,m+k+2-i)=[];
end
for i=1:k+l+1
    d(i)=U(i,1);
end
U(:,1)=[];
D=[Z -U];
rF=D^-1*d';
O(1)=1;
for i=1:l+1
    N(i)=rF(i);
end
for i=l+2:k+l+1
    O(i-l)=rF(i);
end
sys1=GL*CL;
Cr=tf(N,O);
sys2=GL*Cr;
tf1=feedback(sys1,1);
tf2=feedback(sys2,1);
eigen=eig(tf2);
maxe=max(real(eigen));
if maxe>0
    f(l1)=0;
else
    t=0:.01:10;
    y1=step(tf1,t);
    y2=step(tf2,t);
    fr=abs(y1-y2);
    temp=sum(fr);
    f(l1)=1/(1+temp);
end
end
end