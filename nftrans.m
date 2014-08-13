%function [transImage]=nftrans(orgImage,mask)
%function ---F-1 function
%orgImage ---input original image matrix
%mask ---mask
%Author:Gaoshen
%E-mail:matthewgao@gmail.com
%Date:2012.3.9
%Modern Information Technology Lab
%East China University of Science and Technology 
function [transImage]=nftrans(orgImage,mask)
    [row,col]=size(orgImage);
    orgImage=double(orgImage);
    [mask_y,mask_x]=size(mask);
    u=0;
    for p=1:col
        if u==mask_x
            u=0;
        end
        if mask(u+1)==1
            if mod(orgImage(1,p),2)==0
                transImage(1,p)=orgImage(1,p)-mask(u+1);
            else
                transImage(1,p)=orgImage(1,p)+mask(u+1);
            end
        else
             transImage(1,p)=orgImage(1,p);
        end
        u=u+1;
    end
