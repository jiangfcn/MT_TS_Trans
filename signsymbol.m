function x = signsymbol(x)
% correcting sign (positive/negtive) of the decimal data.

for i = 1:length(x)
    if x(i)>2^23-1
        x(i)=x(i)-2^24;
    end
end
end