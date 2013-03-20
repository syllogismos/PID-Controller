function CR=controlred(CH,G)
global A B n k m l GL CL
GL=G;
CL=CH;
[bt at]=tfdata(CH);
b=bt{1};
a=at{1};
while(1)
    if a(1)==0
        a(:,1)=[];
    else
        break
    end
end
while(1)
    if b(1)==0
        b(:,1)=[];
    else
        break
    end
end
m=length(b)-1;
n=length(a)-1;
while(1)
    if b(m+1)==0&&a(n+1)==0
        b(:,m+1)=[];
        a(:,n+1)=[];
        m=m-1;
        n=n-1;
    else
        break
    end
end
k=input('enter order of reduced model denominator');
l=input('enter order of reduced model numerator');
if m+k>n+l
    t=n;
    n=n+(m+k)-(n+l);
    for i=1:n-t
        c(i)=0;
    end
    a=[c,a];
elseif m+k<n+l
    t=m;
    m=m+(n+l)-(m+k);
    for i=m-t
        c(i)=0;
    end
    b=[c,b];
end
for i=1:n+l+1
    for j=1:l+1
        if i<=n+1
            if j<=i
                A(i,j)=a(i-j+1);
            else
                A(i,j)=0;
            end
        else
            if j<=i-n-1
                A(i,j)=0;
            else
                A(i,j)=a(i-j+1);
            end
        end
    end
end
for i=1:m+k+1
    for j=1:k+1
        if i<=m+1
            if j<=i
                B(i,j)=b(i-j+1);
            else
                B(i,j)=0;
            end
        else
            if j<=i-m-1
                B(i,j)=0;
            else
                B(i,j)=b(i-j+1);
            end
        end
    end
end
i=input('enter 1 for finding expansion points using GA else 0');
if i==1
   psize=input('enter the population size');
   pc=.8;
   pm=.01;
   ds=max(max(a),max(b))/3;
   [x fl fmax blen]=genetic(@controlredfit,psize,k+l,ds,-ds,pc,pm);
   [fm in]=maxi(fmax);
   xl=x(in,:);
else
    ep=input('enter k+l+1 expansion points');
    xl=poly(ep);
    xl(:,1)=[];
end
for i=1:m+k
    for j=1:m+k+1
        if i<=k+l&&j==1
            M(i,j)=-xl(i);
        else if j==i+1
                M(i,j)=1;
            else
                M(i,j)=0;
            end
        end
    end
end
for i=1:m-l
    A=M*A;
    B=M*B;
    M(m+k-i+1,:)=[];
    M(:,m+k+2-i)=[];
end
for i=1:k+l+1
    d(i)=B(i,1);
end
B(:,1)=[];
D=[A -B];
rf=D^-1*d';
o(1)=1;
for i=1:l+1
    n(i)=rf(i);
end
for i=l+2:k+l+1
    o(i-l)=rf(i);
end
CR=tf(n,o);
end