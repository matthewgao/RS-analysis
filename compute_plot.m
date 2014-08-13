%RS analysis Plot
%author:Gaoshen
%E-mail:matthewgao@gmail.com
%date:2012.3.9
%Modern Information Technology Lab
%East China University of Science and Technology 
clc
clear
j=1;
for i=0:5000:250000
%randbitlsbhide('f:\lenna.bmp',i,'f:\lennahided.bmp',1234);
bitlsbhide('e:\mumu.bmp',i,'e:\lennahide.bmp');
mask=[1 0 1 0 1 ];
[r,s,u]=compare('e:\lennahide.bmp',mask);
rplus(1,j)=r/(r+s+u);
splus(1,j)=s/(r+s+u);
[r,s,u]=ncompare('e:\lennahide.bmp',mask);
rmins(1,j)=r/(r+s+u);
smins(1,j)=s/(r+s+u);

[r,s,u]=compare2('e:\lennahide.bmp',mask);
rplus2(1,j)=r/(r+s+u);
splus2(1,j)=s/(r+s+u);
[r,s,u]=ncompare2('e:\lennahide.bmp',mask);
rmins2(1,j)=r/(r+s+u);
smins2(1,j)=s/(r+s+u);

d0=rplus(1,j)-splus(1,j);
d1=rplus2(1,j)-splus2(1,j);
dn0=rmins(1,j)-smins(1,j);
dn1=rmins2(1,j)-smins2(1,j);

a=2*(d0+d1);
b=(dn0-dn1-d1-d0*3);
c=d0-dn0;
z=[-1:0.01:2];
%z=p/(2*p-2);
p=[a b c];
rootans=roots(p);
if abs(rootans(1,1))>abs(rootans(2,1))
    finalans=rootans(2,1);
else
    finalans=rootans(1,1);
end
result(1,j)=finalans/(finalans-0.5);
j=j+1;
end
a=[rmins,fliplr(rmins2)];
b=[rplus,fliplr(rplus2)];
c=[splus,fliplr(splus2)];
d=[smins,fliplr(smins2)];
% i=0:0.02:1.02;
% j=0:0.04:1;
i=0:0.01:1.01;
j=0:0.02:1;
subplot(121);
plot(i,a);hold on;grid on;
plot(i,b);hold on;
plot(i,c);hold on;
plot(i,d);hold off;axis([0 1 0 1]);title('RS 分析图');xlabel('嵌入率');ylabel('总组数比例');
subplot(122);plot(j,result);axis([0 1 0 1]);grid on;title('密写率');xlabel('密写率');ylabel('估计嵌入率');
