function [byte1,byte2,byte3] = deciTo24bits(x)
% transfer an array of decimal numbers to three bytes binary. 
for i=1:length(x)
    if x(i)<0
        x(i)=x(i)+2^24;
    end
    byte3(i) = bitshift(x(i),-16); % highest
    byte2(i) = bitshift(x(i),-8) - byte3(i)*256;
    byte1(i) = x(i) - byte3(i)*256*256 - byte2(i)*256; % least
end
