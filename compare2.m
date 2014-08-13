%function [r,s,u]=compare2(input,mask)
%function ---calculate R S U another group using F1 function
%input ---input file
%mask ---mask
%Author:Gaoshen
%E-mail:matthewgao@gmail.com
%Date:2012.3.9
%Modern Information Technology Lab
%East China University of Science and Technology 
function [r,s,u]=compare2(input,mask)
orgImage=imread(input);
orgImage=orgImage(:,:,1);
orgImage=double(orgImage);
orgImage=zigzag(orgImage);
[mask_y,mask_x]=size(mask);
a=ftrans(orgImage,ones(1,mask_x));
h=a;
a=ftrans(a,mask);
x=relation(a,mask_x);
b=relation(h,mask_x);
r=0;
s=0;
u=0;
[row,col]=size(x);
for i=1:col
    if x(i)>b(i)
        r=r+1;
    else
        if x(i)<b(i)
            s=s+1;
        else
            u=u+1;
        end
    end
end
        