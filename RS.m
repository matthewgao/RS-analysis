%RS analysis
%author:Gaoshen
%E-mail:matthewgao@gmail.com
%date:2012.3.9
%Modern Information Technology Lab
%East China University of Science and Technology 
clc
clear
inputfile='e:\lenna.bmp';
outputfile='e:\lennahide.bmp';
bitlsbhide(inputfile,1,outputfile);
mask=[1 0 1 0 1 ];
[r,s,u]=compare(outputfile,mask);
rplus=r/(r+s+u);
splus=s/(r+s+u);
[r,s,u]=ncompare(outputfile,mask);
rmins=r/(r+s+u);
smins=s/(r+s+u);

[r,s,u]=compare2(outputfile,mask);
rplus2=r/(r+s+u);
splus2=s/(r+s+u);
[r,s,u]=ncompare2(outputfile,mask);
rmins2=r/(r+s+u);
smins2=s/(r+s+u);

d0=rplus-splus;
d1=rplus2-splus2
dn0=rmins-smins;
dn1=rmins2-smins2;

a=2*(d0+d1);
b=(dn0-dn1-d1-d0*3);
c=d0-dn0;
z=[-1:0.01:2];
p=[a b c];
rootans=roots(p);
if abs(rootans(1,1))>abs(rootans(2,1))
    finalans=rootans(2,1);
else
    finalans=rootans(1,1);
end
p=finalans/(finalans-0.5);
