function [x]=relation(a,interval)
[row,col]=size(a);
sum=0;
u=1;
j=1;
for i=1:col-1
    if u~=interval
        sum=sum+abs(a(1,i)-a(1,i+1));
        u=u+1;
    else
        x(j)=sum;
        sum=0;
        j=j+1;u=0;
    end
end