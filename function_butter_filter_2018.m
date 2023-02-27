%---------------------------------------------------
% This function was shared by Yongxin Gao (HeFei University of Technology)
%--------------------------------------------------------------------------
% output_signal  -   output signal, 
% input_signal   -   input signal, 
% freq_L         -  low-frequency cut
% freq_H         -  high-frequency cut
% f_Nyquist      -  Nyquist sampling frequency. it is equal to (1/dt)/2
% filter_order   -  order of the butter filter, typically values 1-4

% filter_type    -  ¡®low¡¯,'high' 'bandpass','stop'

function [output_signal] = function_butter_filter_2018(input_signal,freq_L,freq_H,f_Nyquist,filter_order,filter_type)


   Wn =  [freq_L,freq_H]/f_Nyquist; 
   
   if strcmp(filter_type,'low')

   [b,a]           =  butter(filter_order,Wn(1),filter_type); % ÂË²¨Æ÷ 
   output_signal   =  filtfilt(b,a,input_signal);
   
   elseif strcmp(filter_type,'high')
       
    [b,a]           =  butter(filter_order,Wn(2),filter_type); % ÂË²¨Æ÷ 
    output_signal   =  filtfilt(b,a,input_signal);
   
   elseif  strcmp(filter_type,'bandpass') 
       
       [b,a]           =  butter(filter_order,Wn,filter_type); % ÂË²¨Æ÷
       output_signal   =  filtfilt(b,a,input_signal);
       
   end  