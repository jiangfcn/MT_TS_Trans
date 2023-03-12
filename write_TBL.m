function write_TBL(u)
% -writeTBL
% -INPUT: u, a struct type variate defined in TBLpar and CKTBL_Replace.
% -This is a function for write a Phoenix system 2000's TBL file.
% -All the paramters should be provided and listed in a seperated
% 'TBLpar.m' file.

% -Updated by Jiang Feng on 2022-09-06.
% Copyright 2023 Feng Jiang (South China Sea Institude of Oceanology,CAS)

% 1	    2	0	0	0	0	0	0
% 4	    0	0	0	0	0	0	0
% 24	255	255	0	0	0	0	0
% 83	0	0	0	0	0	0	1
% 93	255	255	0	0	0	0	1
% 102	2	0	0	0	0	0	1
% 36	2	0	0	0	0	0	2
% 41	255	255	0	0	0	0	2
% 37	255	255	0	0	0	0	4
% 53	0	0	0	0	0	0	4
% 34	0	0	0	0	0	0	5
% 48	2	0	0	0	0	0	5
% 49	255	255	0	0	0	0	5
% 28	0	0	0	0	0	0	5

Int_NUM = [0 0 0 0 0 0 0]; % indicate: [6:12],Signed 4 byte Integer
Flt_NUM = [0 0 0 0 0 0 1]; % 8 byte IEEE floating point.
Str_NUM = [0 0 0 0 0 0 2]; % [9] String,+Null end [0-8 bytes].
Pos_NUM = [0 0 0 0 0 0 4]; % P[13],GPS position info string

UTC_NUM = [0 0 0 0 0 0 5]; % [8] UTC date and time encoded,
% 8 bytes: s, min, h, day, month, year, day of week , century

par = struct2cell(u);

fid = fopen([u.FILE,'.TBL'],'w+');
for i = 1:length(par{1}) % number of fields
    fieldinfo = zeros(1,25);
    strtmp =  char(par{1}(i));
    [fieldstr,typestr] =  strtok(strtmp,'_');
    len_str = length(fieldstr); % length of the field string
    fieldinfo(1:len_str) = fieldstr; % pass the string to a double array.
    
    switch typestr(2:end)
        case 'UTC'
            fieldinfo(6:12) = UTC_NUM;
            fieldinfo(13:25) = trans_utc(par{i+1});
            fwrite(fid,fieldinfo,'uchar');
        case 'Int'
            fieldinfo(6:12) = Int_NUM;
            fwrite(fid,fieldinfo(1:12),'uchar');
            fwrite(fid,par{i+1},'int32'); % signed 4 bytes integer            
            fwrite(fid,fieldinfo(17:25),'uchar');
        case 'Str'
            fieldinfo(6:12) = Str_NUM;
            fieldinfo(13:25) = trans_str(par{i+1});
            fwrite(fid,fieldinfo,'uchar');
        case 'Pos'
            fieldinfo(6:12) = Pos_NUM;
            fieldinfo(13:25) = trans_pos(par{i+1});
            fwrite(fid,fieldinfo,'uchar');
        case 'Flt'
            fieldinfo(6:12) = Flt_NUM;
            fwrite(fid,fieldinfo(1:12),'uchar');
            fwrite(fid,par{i+1},'double');
            fwrite(fid,zeros(1,5),'uchar');
            %write_flt(par{i+1});
    end
end
% -----DON'T KONOW WHY THE FLLOW 25 BYTES IS NEEDED!----------------------
endinfo = zeros(1,25);
endinfo(1,6) = 3; 
fwrite(fid,endinfo,'uchar');
% if the TBL end without these 25 bytes, hit 'Edit TBL' button in the SSMT2000 will make the software crash.

fclose(fid);
end % end of the main function.

function re = trans_utc(pari)
re = zeros(1,13);
vec = datevec(pari);
fvec = flip(vec);
if(length(pari) ==19)
    re(1:5) = fvec(1:5);
    re(6) = mod(vec(1),100);
    re(7) = weekday(pari);
    re(8) = fix(vec(1)/100); % centry mins one year.
end
end

% function re = trans_int(pari)
% re = zeros(1,13);
% if pari<0
%     pari = 2^32 - abs(pari); % Signed 4 byte Integer
% end
% bin_int = flip(dec2bin(pari));
% len = length(bin_int);
% i = 1;
% while i<=len
%     if i+7 <= len
%         re(fix(i/8)+1) = bin2dec(flip(bin_int(i:i+7)));
%     else
%         re(fix(i/8)+1) = bin2dec(bin_int(i:len));
%     end
%     i = i+8;
% end
% end

function re = trans_str(pari)
re = zeros(1,13);
bin_str = uint8(pari);
re(1:length(bin_str)) = bin_str;
end

function  re = trans_pos(pari)
re = zeros(1,13);
j = 1;
for  i = pari
    re(j) = i;
    j = j+1;
end
end


