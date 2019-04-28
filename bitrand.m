function y=bitrand(m)
y=rand(m,1);
for i=1:m
if y(i,1)>0.5
    y(i,1)=1;
else
    y(i,1)=0;
end
end