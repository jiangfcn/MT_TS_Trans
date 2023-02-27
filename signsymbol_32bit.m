function x = signsymbol_32bit(x)
% correcting sign (positive/negtive) of the decimal data.
x = bitshift(x,-8,'uint32');
for i = 1:length(x)
    if x(i)>2^23-1
        x(i) = x(i)-2^24;
    end    
end

% for i=1:length(x)
%     if x(i)>2^31-1
%         x(i) = x(i)-2^32;
%     end
%     x(i) = x(i)*10^6*5/2^31;
% end

end