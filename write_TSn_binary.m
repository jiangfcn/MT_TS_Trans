function [Stime, Ltime] = write_TSn_binary(field,freqs,u)
% Function for writing out a *.TS5 files.
% Usage: [Stime, Ltime] = write_TSn_binary(field,freqs,u)
% INPUT:field - EM field data.
% OUTPUT: Stime, Ltime - the format is identical with the output of
% datetime function in MATLAB tools.

% sampling schedule for phoenix TS format:
% rec_ts3 = 1;% recording seconds of band 3 data (TS3) per time slot;
% rec_ts4 = 8;% recording seconds of band 4 data (TS4) per time slot;
% timeslot = 10*60; % unit = second.
% freqs = 150;
% input_time = [2022 08 03 15 09 47]; % yr,mon,day,

%------------------------
% Copyright 2023 Feng Jiang (South China Sea Institude of Oceanology,CAS)
%----------------------------

input_time = datevec(u.FTIM); % time of the first recoreded sample proviede by TBL_Replace.

start_time = datetime(input_time);
reverse_t = flip(input_time);
utc_time = [reverse_t(1:5),mod(input_time(1),100),weekday(start_time),round(input_time(1)/100,-1)];
% seconds,minutes,hours,days,months,year(last 2 digit),day of week,century-1

samp_rate = [freqs,0]; % the sampling rate, occupy 2 bytes in TAG.

low_8bits = mod(u.SNUM,2^8);
high_8bits = round(u.SNUM/2^8);
instrument_sn = [low_8bits,high_8bits]; % 8-9 Bytes.(occupy 16-bits)

nCh = 5; % number of channels.
tag_length = 32; % the size of the TAG £¨= 32 byte£©.
TAG = [utc_time,instrument_sn,samp_rate,nCh,tag_length,0,0,0,3,samp_rate,0,4,0,0,0,0,0,0,0,0,0,0];

if freqs == 15
    fid = fopen([u.FILE,'.TS5'],'w+');
elseif freqs == 150
    fid = fopen([u.FILE,'.TS4'],'w+');
elseif freqs == 2400
    fid = fopen([u.FILE,'.TS3'],'w+');
else
    error('please check if the freqs = [15 or 150 or 2400]');
end

scan_size = 3*nCh; % 3 bytes * number of channel.One sample at each channel occupy 3 bytes.
scan_length = freqs; % the length of scan equal to the freqs (number of samples per second).
record_length = size(field,1)/freqs; % the record length = the totel number of samples divided by freqs
if mod(record_length,1)~=0 % checking the number of the recordings
    warning(['the totel number of samples cannot exact divided by freqs ',num2str(freqs),'Hz']);
    record_length = fix(record_length); % deleted the last samples with time long less than 1s. 
end

rec_data = zeros(scan_size,scan_length); % initial a array to install one recording.
% nst = 2; %cutoff the first (nst-1) seconds from the resampled data.
start_time = start_time + seconds(u.nst-1);
Stime = start_time; % the time for the first recordings in the time series that will be written. 

rec_time = start_time; % the initial time of the first record.
for irec = u.nst:record_length 
    time_vec = flip(datevec(rec_time));
    rec_utc = [time_vec(1:5),mod(time_vec(6),100),weekday(rec_time),round(time_vec(6)/100,-1)];
    rec_tag = [rec_utc,TAG(9:32)]; % Update the recording TAG.
    
    fwrite(fid,rec_tag); % write 32-bytes TAG.
    
    ind01 = (irec-1)*freqs + 1; 
    ind02 = irec*freqs; % ind01:ind02, represent the data samples of 1 second. 
    for j = 1:3:scan_size-2
        ch_n = (j+2)/3; % channel number in the field matrix.
        [rec_data(j,:),rec_data(j+1,:),rec_data(j+2,:)] = deciTo24bits(field(ind01:ind02,ch_n));        
    end
    fwrite(fid,rec_data); % write every recording data.
    if irec ~= record_length
        rec_time = rec_time + seconds(1); % Update the recording time.
    end
end
Ltime = rec_time;   % the time for the last recordings in TS5. 

fclose(fid);

end