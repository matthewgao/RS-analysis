function [ste_cover,len_total]=randbitlsbhide(input,len_total,output,key)
cover=imread(input);
ste_cover=cover;%%%%%%%%%%%%
ste_cover=double(ste_cover);
msg=bitrand(len_total);
[m,n]=size(ste_cover);
if len_total>m*n
    error('»»Í¼Ïñ');
end
p=1;
[row,col]=randinterval(ste_cover,len_total,key);
for i=1:len_total
    ste_cover(row(i),col(i))=ste_cover(row(i),col(i))-mod(ste_cover(row(i),col(i)),2)+msg(p,1);
    if p==len_total
        break;
    end
    p=p+1;
end
ste_cover=uint8(ste_cover);
imwrite(ste_cover,output,'bmp');