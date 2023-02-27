function [field,tag] = read_TSn_binary(freqs,nCh);
% -function for reading a TSn file recorded by a MTU-5A system.
% Usage: [field,tag] = read_TSn_binary(freqs,nCh)
% -INPUT:
% -freqs, a scale number, the sample rate corresponds to the TSn file.
% -nCh, a scale number, how many channels had been recorded in the TSn file.
% -NOTE:TAG length of the input TSn file must be 32 Bytes.
% -OUTPUT:
% -field,NxnCh, array of the recorded electromagnetic data.
% -tag, tag information, for the details could be found in
% 'Data_processing_user_guide_v3_online' provided by Phoenix Geophysics
% Ltd.
% -Copyright reserved and all rights retained by the author Feng Jiang (South China Sea Institude of Oceanology, CAS).
%

tag_length = 32; % the size of the TAG £¨= 32 byte£©.
% freqs = 15; % freqs = 150 indicates TS4 .
% nCh = 5;

[TSname,TSpath] = uigetfile('*.TS5','To Select ONLY ONE TS5','MultiSelect','on');
fid = fopen([TSpath,TSname],'r');

fseek(fid,0,'eof'); % point to the end of the file - eof'
nbytes = ftell(fid); % how much bytes in the file.

record_length = nbytes/(tag_length + 3*nCh*freqs); 
% One block consists of a tag and one second recordings which includes nCh
% data, one sample occupys 3 Bytes.

scan_size = 3*nCh; % 3 bytes * number of channel.One sample at each channel occupy 3 bytes.
scan_length = freqs; % the length of scan equal to the freqs (number of samples per second).

field = zeros(scan_length*record_length,nCh); % initial an array for EM field data.
tag = zeros(record_length,22);
fseek(fid,0,'bof'); % point to the beginning of the file - bof';

%--------------------------------------------------------------------------
%Reading the TS data follow the guidelines of TS format in page 191 in the
%file  "Data_processing_user_guide_v3_online" provided by Phoenix Geophysics
% wfid = fopen([filename,'.txt'],'w+');
for iblock=1:record_length
    tag(iblock,1:8) = fread(fid,8,'uint8'); % seconds,minutes,hours,days,months,year(last 2 digit),day of week,century-1.
    tag(iblock,9:10) = fread(fid,2,'uint16'); % series number, number of scans/freqs
    tag(iblock,11:16) = fread(fid,6,'uint8'); % nCh,
    tag(iblock,17) = fread(fid,1,'uint16');% sample rate
    tag(iblock,18:19) = fread(fid,2,'uint8'); % units of sample rate (0-Hz), clock status.
    tag(iblock,20:21) = fread(fid,2,'unit32'); % clock error in \mus, reserved without any means.
    tag(iblock,22) = fread(fid,1,'unit16'); % the last 6 Bytes are reserved and have no any means.
    % fprintf(wfid,'%5d Time:%d%d/%d/%d-%d:%d:%d SN:%d SC:%3d CH:%d BY:%d SR:%3d \n',[iblock,tag(8),tag(6:-1:1)',tag(10)*256+tag(9),tag(19)...
    % ,tag(13),tag(18),tag(19)]);
    if ~isequal(tag(iblock,11),nCh); error('The input nCh is not match the TS file''s tag!'); end
    for iscan = 1:scan_length
        ind = (iblock-1)*scan_length + iscan;
        for ich = 1:nCh
            field(ind,ich) = signsymbol(fread(fid,1,'uchar') + fread(fid,1,'uchar')*256 + fread(fid,1,'uchar')*256*256);
            % field(ind,2) = signsymbol(fread(fid,1,'uchar') + fread(fid,1,'uchar')*256 + fread(fid,1,'uchar')*256*256);
            % field(ind,3) = signsymbol(fread(fid,1,'uchar') + fread(fid,1,'uchar')*256 + fread(fid,1,'uchar')*256*256);
            % field(ind,4) = signsymbol(fread(fid,1,'uchar') + fread(fid,1,'uchar')*256 + fread(fid,1,'uchar')*256*256);
            % field(ind,5) = signsymbol(fread(fid,1,'uchar') + fread(fid,1,'uchar')*256 + fread(fid,1,'uchar')*256*256);
        end
    end
end
fclose(fid);
% fclose(wfid);
end