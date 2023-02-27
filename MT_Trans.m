
function MT_Trans
% -A main function for transfer TSM/TSB data to TS5 data.
% -TSM is a time series format used by a sea floor MT receiver instrument
% designed by Chen Kai from University of Geosciences (Beijing), China.
% -TS5 is a time seried format used by MTU-A receiver designed by Phoenix
% Geophysics, Canada.
% -It is your responsibility to editing the TBLpar.m and TBL_Replace.m and making sure that all the parameters are correct and match your recording instrument.

u = TBLpar; % load a sample of TBL parameters.
%
warning('Please Do Check the *! TBL_Replace !* Function Before Running This Script');
u = TBL_Replace(u); % first time running TBL_Replace for loading correct site information.
disp('Replace TBL Has Done!');

itype = menu('File Type:','TS5','TSM','TSB'); % TSB - 125HZ
if itype == 1
    field = read_TSn_binary;
    ori_srate = 150; % original sample rate
    disp('Read TSn has Done!');
elseif itype ==2
    [field,filetime] = read_TSM; %Load TSM data.
    ori_srate = u.srate; % original sample rate
    
    if filetime(1)~= 2000
        u.FTIM = datetime(filetime(1,:)); % update the FTIM when GPS has synchronized.
    end
    
    disp('Read TSM has Done!');
elseif itype ==3
    [field,filetime] = read_TSB; %Load TSM data.
    ori_srate = u.srate; % original sample rate
    
    if filetime(1)~= 2000
        u.FTIM = datetime(filetime(1,:)); % update the FTIM when GPS has synchronized.
    end
end


res_srate = 15; % final sample rate you need after resampling.
f15_field = filter_mt(field,ori_srate,res_srate); % filtering the high sampling rate raw data to TSn data with low sampling rate.
disp('Filter and Resample Has Done!');

if itype ==2
    f15_field(:,end) = f15_field(:,end-1);
    % Error may arise if any channels only record instrment noise, so you can
    % fill the channel noises only with other normal channel data.
end

[Stime,Ltime] = write_TSn_binary(f15_field,res_srate,u);
disp('Write TSn File Has Done!');

TBLStime = datetime(u.FTIM) + seconds(1); % it follows the write_TSn_binary function.
dtime = fix(size(f15_field,1)/res_srate); % the last samples with time long less than 1s are not written in TSn file.
TBLLtime = TBLStime + seconds(dtime-u.nst); % the first u.nst was deleted before writting TSn file.
u.FTIM = TBLStime;
u.LTIM = TBLLtime;

if Stime ~= u.FTIM || Ltime ~= u.LTIM
    warning('Recording time signed to TBL not match the time series in TS5 ');
end

% SOME TIME INFORMATION NEED TO BE CORRECTED FOR DATA PROCESSING.
u = chg_TBLtime(u);

write_TBL(u);% write TBL file.
disp('Write TBL is Done!');
 
end




function u = chg_TBLtime(u)
% u.FTIM = '2022/07/30 04:46:59'; % CK: First recorded time in time series data.(!!!check phoenix=2016/07/14 08:15:49!!!)---------------------------------
% u.LTIM = '2022/08/04 09:03:29'; % CK: Last recorded time in acquired data.    (!!!check phoenix=2016/07/16 01:28:32!!!)---------------------------------
vFTIM = datevec(datetime(u.FTIM));
vLTIM = datevec(datetime(u.LTIM));
u.FTIM = [datestr(vFTIM,'yyyy/mm/dd'),' ',datestr(vFTIM,'HH:MM:SS')];
u.LTIM = [datestr(vLTIM,'yyyy/mm/dd'),' ',datestr(vLTIM,'HH:MM:SS')];


% u.NUTC ='2022/08/01 01:03:00';  % UTC time of recent 1 HZ pulse                         (!!!check phoenix=2016/07/16 01:28:34!!!)After LTIM two-second
% u.LFIX = '2022/08/04 01:03:00'; % CK: UTC time of last GPS fix                          (!!!check phoenix=2016/07/16 01:28:33!!!) After LTIM one-second
% u.TSYN = '2022/07/29 04:00:00'; % UTC time when Minute Clock signal sync'd to GPS clock (!!!check phoenix=2016/07/14 08:13:00!!!) Before FTIM
vNUTC = datevec(datetime(u.LTIM) + seconds(2));
vLFIX = datevec(datetime(u.LTIM) + seconds(1));
vTSYN = datevec(datetime(u.FTIM) - seconds(10));

u.NUTC = [datestr(vNUTC,'yyyy/mm/dd'),' ',datestr(vNUTC,'HH:MM:SS')];
u.LFIX = [datestr(vLFIX,'yyyy/mm/dd'),' ',datestr(vLFIX,'HH:MM:SS')];
u.TSYN = [datestr(vTSYN,'yyyy/mm/dd'),' ',datestr(vTSYN,'HH:MM:SS')];

% u.STIM = '2016/07/14 00:00:00'; % Requested start time for data acquisition.     (!!!check phoenix=2016/07/14 00:00:00!!!)
% u.ETIM = '2016/10/01 08:00:00'; % End time for all data acquisition.             (!!!check phoenix=2018/08/08 08:00:00!!!)
% u.HTIM = '2016/07/10 00:00:00'; % Start time for high frequency data acqusition. (!!!check phoenix=2016/07/14 00:00:00!!!)
% u.ETMH = '2016/10/01 08:00:00'; % End time for high frequency data acquisition.  (!!!check phoenix=2018/08/08 08:00:00!!!)
vSTIM = datevec(datetime(u.FTIM) - calmonths(2));
vETIM = datevec(datetime(u.FTIM) + calmonths(2));
vHTIM = datevec(datetime(u.FTIM) - calmonths(2));
vETMH = datevec(datetime(u.FTIM) + calmonths(2));

u.STIM = [datestr(vSTIM,'yyyy/mm/dd'),' ',datestr(vSTIM,'HH:MM:SS')];
u.ETIM = [datestr(vETIM,'yyyy/mm/dd'),' ',datestr(vETIM,'HH:MM:SS')];
u.HTIM = [datestr(vHTIM,'yyyy/mm/dd'),' ',datestr(vHTIM,'HH:MM:SS')];
u.ETMH = [datestr(vETMH,'yyyy/mm/dd'),' ',datestr(vETMH,'HH:MM:SS')];

end