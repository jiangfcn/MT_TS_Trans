function u = TBLpar
% A file listing TBL information which is needed by the main function.
% Copyright 2023 Feng Jiang (South China Sea Institude of Oceanology,CAS)
u.Tag = {'SGIN_Int','EGNC_Int','HGNC_Int','EGN_Int','HGN_Int','ACDC_Int','ACDH_Int','LPFR_Int',...
'LFRQ_Int','V5SR_Int','MTSR_Int','LCHP_Int','L2NS_Int','L3NS_Int','L4NS_Int','DDAT_Int',...
'SRL2_Int','SRL3_Int','SRL4_Int','SRL5_Int','MXSC_Int','TCMB_Int','TALS_Int','TXPR_Int',...
'TBVO_Int','TBVI_Int','INIT_Int','TDSP_UTC','RQST_Int','MODE_Int','DISK_Int','XDOS_Int',...
'SNUM_Int','VER_Str','HW_Str','SITE_Str','CMPY_Pos','SRVY_Pos','PMIT_Pos','LOUT_Pos',...
'SITN_Str','SITF_Str','ATYP_Int','FILE_Str','FNAM_Int','FLEN_Int','AQST_Int','STIM_UTC',...
'ETIM_UTC','HTIM_UTC','ETMH_UTC','HSMP_Int','CPTH_Pos','EPTH_Pos','DPTH_Pos','SPTH_Pos',...
'SWRT_Pos','TOTL_Int','BADR_Int','NOBF_Int','SATR_Int','FTIM_UTC','LTIM_UTC','STDE_Int',...
'STDH_Int','CALS_Int','CCLS_Int','CALR_Str','BAT1_Int','BAT2_Int','BAT3_Int','TEMP_Int',...
'TMAX_Int','GFPG_Int','FFPG_Int','DSP_Int','CHEX_Int','CHEY_Int','CHHX_Int','CHHY_Int',...
'CHHZ_Int','TCHN_Int','EXAC_Flt','EXDC_Flt','EYAC_Flt','EYDC_Flt','HXAC_Flt','HXDC_Flt',...
'HYAC_Flt','HYDC_Flt','HZAC_Flt','HZDC_Flt','DXAC_Flt','DXDC_Flt','DYAC_Flt','DYDC_Flt',...
'EXPR_Flt','EXNR_Flt','EYPR_Flt','EYNR_Flt','GNDR_Flt','MAXR_Flt','POTS_Int','EXR_Int',...
'EYR_Int','EAZM_Flt','EXLN_Flt','EYLN_Flt','HAZM_Flt','HXSN_Str','HYSN_Str','HZSN_Str',...
'DECL_Flt','NREF_Int','TSTV_Flt','TSTR_Flt','INPR_Flt','FSCV_Flt','CCLT_Int','PZLT_Int',...
'CFMN_Flt','CFMX_Flt','CCMN_Flt','CCMX_Flt','HATT_Flt','HNOM_Flt','HAMP_Flt','CPHC_Flt',...
'NUTC_UTC','NSAT_Int','LFIX_UTC','TSYN_UTC','CLST_Int','OCTR_Int','TERR_Int','ELEV_Int',...
'LATG_Pos','LNGG_Pos'};

u.SGIN = 0;                     % Signal input source. 0:External,1:Test signal.2:Both
u.EGNC = 1;                     % CK=1: Gain control for E channel, 0:low, 1:normal, 2:high-------------------------------------------------------
u.HGNC = 1;                     % CK=1: Gain control for H channel, 0:low, 1:normal, 2:high-------------------------------------------------------
u.EGN = 1000;                   % CK=1000: Gain for E channels------------------------------------------------------------------------------------
u.HGN = 1;                      % CK=1:Gain for H channels. MTU-A:1,4,16,MTU:3,12,48--------------------------------------------------------------
u.ACDC = 1;                     % CK=1: E channel coupling. 0-DC coupling, 1-AC coupling----------------------------------------------------------
u.ACDH = 0;                     % CK=0: H channel coupling. 0-DC coupling, 1-AC coupling----------------------------------------------------------
u.LPFR = 17;                    % CK=17???: Low-pass filter setting for E-channel. MTU:1-3, MTU-A: see User Guide.(!!!Check Phoenix=163!!!)-------
u.LFRQ = 50;                    % Line frequency,Hz 50 or 60
u.V5SR = 0;                     % CK=0 0:V5-2000 SRate[15,150,2400,24000 Hz],1:V5-compatible SRate[24,320\384,2560\3072]
u.MTSR = 1;                     % CK=0??: 0:AMT,3:ACMT SRate[150,2400,24000], 1:MT SRate[15,150,2400],2:DAMT SRate[2400,240](!!!check phoenix=1!!)
u.LCHP = 0;                     % CK MISS: NO COMMENT Phoenix=0
u.L2NS = 0;                     % CK: Band 2 records per timeslot. Starts on even multiples of HSMP. MTU-A:0-4
u.L3NS = 0;                     % CK: Band 3 records per timeslot. Starts on odd multiples of HSMP. MTU-A:0-2
u.L4NS = 0;                     % CK: Band 4 records per timeslot. Starts on even multiples of HSMP. MTU-A:0-16
u.DDAT = 0;                     % CK MISS: NO COMMENT Phoenix=0
u.SRL2 = 24000;                 % Sample rate for band 2,Hz.24000
u.SRL3 = 2400;                  % Sample rate for band 3,Hz.2400,3072,or 2560
u.SRL4 = 150;                   % Sample rate for band 4,Hz.150,384,or 320
u.SRL5 = 15;                    % Sample rate for band 5,Hz.15,or 24
u.MXSC = 2400;                  % Maximum number of scans in one record of TS2 data (2400 only)
u.TCMB = 4;                     % CK=phoenix: Type of comb filter. One- or two-digit integer. (!!! Check Phoenix=4!!!)-----------------------------
u.TALS = 6;                     % CK=6???: Type of aliasing filter. One- or two-digit integer.(!!!Check Phoenix=11!!!)-----------------------------
u.TXPR = 60;                    % Period of polarity signal output in s for MTUTXC.HW,an MTU as a transmitter controller.
u.TBVO = 1;                     % CK MISS: NO COMMENT Phoenix=1
u.TBVI = 1;                     % CK MISS: NO COMMENT Phoenix=1
u.INIT = 1;                     % MTU initialization status. 1:Finished, 0:Not finished
u.TDSP = '1980/01/04 00:00:32'; % Time of completion of program loading into DSP (measured from startup)
u.RQST = 2;                     % CK=2??: Requst a change in MODE. Values are the same as MODE.(!!!Check Phoenix=2!!!)
u.MODE = 2;                     % CK=2??: 1:Setup,2:Record,5:GPS reset,7:Instrument Cal,8:Coil Cal,9:Shutdown,10:Fatal Error (!!!Check Phoenix=9!!!)
u.DISK = 90869760;              % Free disk space in bytes.
u.XDOS = 0;                     % Exit to DOS, 0:Normally, 1:Quit MTUP and exit to DOS, 4: Power
u.SNUM = 1129;                  % CK=1119: Serial number of the instrument, box calibration file
u.VER = '3112G3';               % CK=3112B8: Software version (!!!Check Phoenix=3112G3/F6 etc.!!!)
u.HW = 'MTU5A';                 % CK=MTU5A. Hardware Type
u.SITE = '';                    % Site ID of the measurement
u.CMPY = '';                    % CK=CUGBOBEM. Name of Company
u.SRVY = 'SCS';                 % CK: Survey ID
u.PMIT = '';                    % CK=CUGB: Name of Permitter(!!!Check Phoenix=NULL!!!).
u.LOUT = 'TH/AG';               % Name of Layout Crew Leader
u.SITN = '';                    % Site ID of the near measurement
u.SITF = '';                    % Site ID of the far reference
u.ATYP = 0;                     % Array type. 0:Normal Ex Ey Hx Hy Hz. 1:Parallel orientation. 2:Magnetic vector 3H
u.FILE = 'wp030825';            % CK: File name for data logging.Default is SSSSMddA 
u.FNAM = 1;                     % CK MISSING: NO COMMENT Phoenix=1;
u.FLEN = 0;                     % CK=phoenix: Max file length in hour. 0:Infinite file length.
u.AQST = 2;                     % CK=3 ???, Acqusition status. 0: waiting, 1: In progress, 2: Completed.(!!!Check Phoenix=2!!!)
u.STIM = '2022/07/10 00:00:00'; % Requested start time for data acquisition.     (!!!check phoenix=2016/07/14 00:00:00!!!)
u.ETIM = '2022/10/01 08:00:00'; % End time for all data acquisition.             (!!!check phoenix=2018/08/08 08:00:00!!!)
u.HTIM = '2022/07/10 00:00:00'; % Start time for high frequency data acqusition. (!!!check phoenix=2016/07/14 00:00:00!!!)
u.ETMH = '2022/10/01 08:00:00'; % End time for high frequency data acquisition.  (!!!check phoenix=2018/08/08 08:00:00!!!)
u.HSMP = 10;                    % CK=10 or 300??: Sample interval for high frequency band in s (MTU-A) or min (MTU).
u.CPTH = 'C:\CAL\';             % Path of calibration files.
u.EPTH = 'D:\CAL\';             % Path to calibration files on CompactFlash card.
u.DPTH = 'D:\DATA\';            % Path to data files.
u.SPTH = 'C:\SW\';              % Path to location of software
u.SWRT = 'C:\';                 % Root directory of software path.(eg,C:\ from C:\SW)
u.TOTL = 150587;                % Total number of one-second data records.
u.BADR = 0;                     % Number of bad records flagged by MTU.
u.NOBF = 0;                     % NO COMMENT!
u.SATR = 40;                    % Number of saturated records.
u.FTIM = '2022/07/30 04:46:59'; % CK: First recorded time in time series data.(!!!check phoenix=2016/07/14 08:15:49!!!)---------------------------------
u.LTIM = '2022/08/04 09:03:29'; % CK: Last recorded time in acquired data.    (!!!check phoenix=2016/07/16 01:28:32!!!)---------------------------------
u.STDE = -1;                    % DSP status code of last DSP error, channel CHEX (!!!Check Phoenix=-1!!!)
u.STDH = -1;                    % DSP status code of last DSP error, channel CHhX
u.CALS = 0;                     % Instrument calibration status: 0: OK, 1:No file, 3:In progress, 4:Failed, 5:Invaild.
u.CCLS = 1;                     % Coil calibration status. 0: OK, 1:No file, 3:In progress, 4:Failed, 5:Invaild.
u.CALR = '';                    % Calibration results. H:Bad corner,G:Bad gain, L:Low gain, N: Normal Gain.
u.BAT1 = 11906;
u.BAT2 = 11906;
u.BAT3 = 11343;
u.TEMP = 46;                    % Temperature in degress C.
u.TMAX = 67;                    % CK MISSING phoenix=67
u.GFPG = 0;                     % CK=phoenix: GPS FPGA programing return code. 0:Success
u.FFPG = 0;                     % CK=phoenix: Front end boards FPGA loader code. 0:Success
u.DSP = 0;                      % CK=phoenix: Front end boards DSP loader code. 0:Success
u.CHEX = 1;                     % CK=phoenix: Front end channel for EX. Normally 1.
u.CHEY = 2;                     % CK=phoenix: Front end channel for EY. Normally 2.
u.CHHX = 3;                     % CK=phoenix: Front end channel for HX. Normally 3.
u.CHHY = 4;                     % CK=phoenix: Front end channel for HY. Normally 4.
u.CHHZ = 5;                     % CK=phoenix: Front end channel for HZ. Normally 5.
u.TCHN = 5;                     % CK=phoenix: Total number of channels. (May be 0 on older fireware versions)(!!!Check Phoenix!!!)
u.EXAC = 0.003755416424;        % Ex dipole AC between N-S(V). Measured by MTU
u.EXDC = 0.0008284361158;       % Ex dipole DC between N-S(V). Measured by MTU
u.EYAC = 0.003637861149;        % Ey dipole AC between E-W(V). Measured by MTU
u.EYDC = 0.009498977303;        % Ey dipole DC between E-W(V). Measured by MTU
u.HXAC = 0.006505114616;        % Hx AC level(V). Measured by MTU
u.HXDC = 0.03899688143;         % Hx DC level(V). Measured by MTU
u.HYAC = 0.00275210771;         % Hy AC level(V). Measured by MTU
u.HYDC = 0.00342158865;         % Hx DC level(V). Measured by MTU
u.HZAC = 0.002825196424;        % Hz AC level(V). Measured by MTU
u.HZDC = 0.01761335792;         % Hz DC level(V). Measured by MTU
u.DXAC = 0;                     % Ex dipole AC between N-S(V). Measured by user.
u.DXDC = 0;                     % Ex dipole DC between N-S(V). Measured by user.
u.DYAC = 0;                     % Ey dipole AC between E-W(V). Measured by user.
u.DYDC = 0;                     % Ey dipole DC between E-W(V). Measured by user.
u.EXPR = 141.6149894;           % CK MISSING 
u.EXNR = 175.3380304;           % CK MISSING
u.EYPR = 189.3801109;           % CK MISSING
u.EYNR = 142.7937828;           % CK MISSING
u.GNDR = 274.7533351;           % CK MISSING
u.MAXR = 0;                     % CK MISSING
u.POTS = 0;                     % CK MISSING
u.EXR = 10;                     % CK=700? Ex dipole resistance between N-S, ohm. Measured by user.
u.EYR = 10;                     % CK=700? Ey dipole resistance between E-W, ohm. Measured by user.
u.EAZM = 0;                     % CK: Ex sensor azimuth, using reference as defined in NREF
u.EXLN = 8;                     % CK: Ex dipole length, unit = m-----------------------------------------------------------------------------------------
u.EYLN = 8;                     % CK: Ey dipole length, unit = m-----------------------------------------------------------------------------------------
u.HAZM = 0;                     % CK: Hx sensor azimuth, using reference as defined in NREF--------------------------------------------------------------
u.HXSN = 'MT8CM501';            % CK: Hx sensor serial number. MTC-50:'COILnnnn',MTC-30:'AMTCnnnn'-------------------------------------------------------
u.HYSN = 'MT8CM502';            % CK: Hy sensor serial number. MTC-50:'COILnnnn',MTC-30:'AMTCnnnn'-------------------------------------------------------
u.HZSN = 'MT8CM503';            % CK: Hz sensor serial number. MTC-50:'COILnnnn',MTC-30:'AMTCnnnn',Loop:'LOOPnnnn'---------------------------------------
u.DECL = 0;                     % CK=10???: Declination of magnetic or grid North, measured clockwise from True North, in degrees.
u.NREF = 3;                     % North Reference.2: True, 3-Magnetic,4-Grid
u.TSTV = 0.02475;               % Test signal amplitude(V)
u.TSTR = 297;                   % CK MISSING
u.INPR = 455;                   % CK MISSING
u.FSCV = 2.45;                  % CK=phoenix?, CK=2.5???: A/D converter full scale(V) MTU:6.4, MTU-A:2.45-------------------------------------------------
u.CCLT = 2;                     % Length of coil calibration as a multiple of half-hour intervals.
u.PZLT = 1;                     % CK MISSING
u.CFMN = 1.5;                   % CK=phoenix: Minimum acceptable AC coupling corner freq. MTU:0.0045, MTU-A:1.5
u.CFMX = 2.5;                   % CK=phoenix: Maximum acceptable AC coupling corner freq. MTU:0.0055, MTU-A:2.5
u.CCMN = 0;                     % CK=0? Coil calibration minimum acceptable corner freq. MTU-30:0, MTC-50:0.2, Loop:0.4 (!!!!check phoenix=0.3!!!!)
u.CCMX = 0;                     % CK=0? Coil calibration maximum acceptable corner freq. MTU-30:0, MTC-50:0.4, Loop:0.8 (!!!!check phoenix=0.6!!!!)
u.HATT = 0.4;                   % CK=0.4??: It's Wrong From OBEMPRO!!! Gain of coil attentuation on interconnect board. Typical: phoenix = 0.233.
u.HNOM = 100;                   % CK=100??: Coil nominal gain (mV/nT), MTC-30:100,MTU-50:1000,Loop:500.
u.HAMP = -0.206;                % CK=Phoenix: Coil test waveform amplitude (nT). MTC-30:-0.206, MTC-50:-0.206,Loop:-0.235
u.CPHC = 0;                     % CK=Phoenix: Coil pre-amplitude high-pass corner frequency. MTC-30:0,MTC-5-:0,Loop:0.00159
u.NUTC ='2022/08/01 01:03:00';  % UTC time of recent 1 HZ pulse                         (!!!check phoenix=2016/07/16 01:28:34!!!)After LTIM two-second
u.NSAT = 6;                     % Number of satellites acquired by the GPS receiver.
u.LFIX = '2022/08/04 01:03:00'; % CK: UTC time of last GPS fix                          (!!!check phoenix=2016/07/16 01:28:33!!!) After LTIM one-second
u.TSYN = '2022/07/29 04:00:00'; % UTC time when Minute Clock signal sync'd to GPS clock (!!!check phoenix=2016/07/14 08:13:00!!!) Before FTIM
u.CLST = 4;                     % CK=phoenix???: Clock status. 0:No init.1:CPU RTC,2:GPS sync in progress,3:Sync'd 0CX0,4:GPS locked.
u.OCTR = 103;                   % CK=112??: Program control to track GPS 1Hz pulse. 0-255
u.TERR = 0;                     % Sample time error (uS)[+late, -early].0:Normal, Non-zero: GPS dropout recovery
u.ELEV = 3218;                  % CK: Elevation of site,m. Received from GPS.----------------------------------------------------------------------------------
u.LATG='2908.818,N';            % CK: Latitude from GPS, degrees and minutes. Format 'DDMM.mmm,N'--------------------------------------------------------------
u.LNGG='10130.401,E';           % CK: Longitude from GPS, degrees and minutes. Format 'DDMM.mmm,E'-------------------------------------------------------------
end