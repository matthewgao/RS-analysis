%function ste_cover=bitlsbhide(input,len_total,output) 
%function ---embed random bit stream
%input ---input file
%len_total ---embed bit length
%output ---output file
%Author:Gaoshen
%E-mail:matthewgao@gmail.com
%Date:2012.3.9
%Modern Information Technology Lab
%East China University of Science and Technology 
function ste_cover=bitlsbhide(input,len_total,output)
    cover=imread(input);
    if len_total==0
        ste_cover=cover(:,:,1);
        ste_cover=uint8(ste_cover);
        imwrite(ste_cover,output,'bmp');
    else
        ste_cover=cover(:,:,1);%%%%%%%%%%%%
        ste_cover=double(ste_cover);
        msg=bitrand(len_total);
        [m,n]=size(ste_cover);
        if len_total>m*n
            error('»»Í¼Ïñ');
        end
        p=1;
        for f2=1:n
            for f1=1:m
                ste_cover(f1,f2)=ste_cover(f1,f2)-mod(ste_cover(f1,f2),2)+msg(p,1);
                if p==len_total
                    break;
                end
                p=p+1;
            end
            if p==len_total
                    break;
            end
        end
        ste_cover=uint8(ste_cover);
        imwrite(ste_cover,output,'bmp');
    end