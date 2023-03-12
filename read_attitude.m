
function attitude = read_attitude;

% A function for read attitude parameters from CK.
% attitude.rotmean = mean(Rot(ind));
% attitude.rotstd = std(Rot(ind));
% attitude.pitchmean = mean(Pitch(ind));
% attitude.pitchstd = std(Pitch(ind));
% attitude.yawmean = mean(Yaw(ind));
% attitude.yawstd = std(Yaw(ind));

Time = [];
Min = [];
Rot = []; % rotation angle
Pitch = []; % pitch angle
Yaw = []; % yaw angle
Volt = []; % voltage

[FileName,PathName] = uigetfile('*.txt*','Select an attitude file');%选择需要处理的数据文件
fid = fopen([PathName,FileName],'r');
while 1
    tline = fgetl(fid);
    if ~ischar(tline) break; end
    
    space_point = strfind(tline,' ');
    time = tline(space_point(1):space_point(2));
    min = tline(space_point(2):space_point(3));
    R = tline(space_point(3)+3:space_point(4));
    P =  tline(space_point(4)+3:space_point(5));
    Y = tline(space_point(5)+3:space_point(6));
    V = tline(space_point(6):space_point(6)+4);
    Time = [Time;datenum([time,min])];
    Rot = [Rot;str2num(R)];
    Pitch = [Pitch;str2num(P)];
    Yaw = [Yaw;str2num(Y)];
    Volt = [Volt;str2num(V)];
end
fclose(fid);

ind = find(Volt>3.4&Volt<3.6); % numbers for calculating the ultimate results based on the voltage.

if isempty(ind) 
    ind = length(Volt)-120:length(Volt)-60; % last one hour data.
end

attitude.rotmean = mean(Rot(ind));
attitude.rotstd = std(Rot(ind));
attitude.pitchmean = mean(Pitch(ind));
attitude.pitchstd = std(Pitch(ind));
attitude.yawmean = mean(Yaw(ind));
attitude.yawstd = std(Yaw(ind));
%%

figure(1)
subplot(4,1,1)
plot(Time(ind),Rot(ind));
legend('Rotation');
dateaxis('x',6);
ylabel('degree (°)');
subplot(4,1,2)
plot(Time(ind),Pitch(ind));
legend('Pitch');
dateaxis('x',6);
ylabel('degree (°)');
subplot(4,1,3)
plot(Time(ind),Yaw(ind));
legend('Yaw');
dateaxis('x',6);
ylabel('degree (°)');
subplot(4,1,4)
plot(Time(ind),Volt(ind));
legend('Voltage');
dateaxis('x',6);
ylabel('Volt');
end

