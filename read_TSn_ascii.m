function A = read_TSn_ascii
% Usage: A = read_TSn_ascii;
% -A, nx5 array. 
% Updated on 2022-08-28
% Copyright 2022-2023 Feng Jiang

[FileName,PathName] = uigetfile('*.ALM2*','Data file transferred from Phoenix TSNASC2');
%input a ascii file.

fid = fopen([PathName,FileName],'r');
line = fgetl(fid);
i = 0;
A = [];
% Total_Read_Second = 100;
% while i<=Total_Read_Second
while 1
    if ~ischar(line) break; end
    line = fgetl(fid);
    line = fgetl(fid);
    Atmp = fscanf(fid,'%d',[6,150]);
    Atmp = Atmp';
    Atmp2 = [Atmp(:,1)+(i*150),Atmp(:,2:end)];
    A = [A;Atmp2];
    i = i+1;
    line = fgetl(fid);
end
