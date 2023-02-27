function [byte1,byte2,byte3,byte4] = deciTo32bits(x)
% transfer an array of decimal numbers to four bytes binary. 
for i=1:length(x)
    if x(i)<0
        x(i)=x(i)+2^32;
    end
    byte4(i) = bitshift(x(i),-24); % highest
    byte3(i) = bitshift(x(i),-16) - byte4(i)*256; 
    byte2(i) = bitshift(x(i),-8) - byte4(i)*256*256 - byte3(i)*256;
    byte1(i) = x(i) - byte4(i)*256*256*256 - byte3(i)*256*256 - byte2(i)*256; % least
end