
function f_field = filter_mt(field,ori_srate,res_srate)
% Function which allows you to filter out useless frequence bands signals
% before writing out in a file.
% Usage: f_field = filter_mt(field,ori_srate,res_srate)
% 
% 
filter_type = 'low'; % 'low', 'high', 'bandpass'
filter_order = 4;
f_Nyquist = ori_srate/2;

freq_L = 5; % Hz

freq_H = 0.0001; % Hz

out_field = field;
% out_field_med = field; % For medfilter
nch = size(field,2);

for ich = 1:nch-1 % the last channel is noise!!!
    input_signal = field(:,ich);
    out_field(:,ich) = function_butter_filter_2018(input_signal,freq_L,freq_H,f_Nyquist,filter_order,filter_type);
    
    % input_signal_med = out_field(:,ich);
    % out_field_med(:,ich) = medfilt1(input_signal_med,20,'omitnan','truncate');
    
end

f_field = round(resample(out_field,res_srate,ori_srate),0); % resample to a new sample frequency and round the number to the nearest values.

% plot for visual check
%{
figure(100)
subplot(2,1,1);
h1 = plot(field(1:10000,1),'k-');hold on;
h2 = plot(out_field(1:10000,1),'r-','linewidth',1);
xlabel('sample counts'); ylabel('Amp');
legend([h1,h2],'raw data','filtered data');
subplot(2,1,2);
h3 = plot(field(1:10000,1),'k-');hold on;
h4 = plot(f_field(1:10000,1),'y-','linewidth',1);
xlabel('sample counts'); ylabel('Amp');
legend([h3,h4],'raw data','filtered and resampled data');
%}

end
