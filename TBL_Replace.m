
function u = TBL_Replace(u)
% this is a function for correcting site parameters. These parameters are
% different with different sites.So please check all the numbers and
% strings in this file before running related scripts!

% Copyright 2023 Feng Jiang (South China Sea Institude of Oceanology,CAS)

%% Site information

u.SITE = 'TSBTEST';            % Site ID of the measurement
u.FILE = 'TSBTEST';            % CK: File name for data logging.Default is SSSSMddA. It is the site name and the output data name!!!

u.LOUT = 'JF';               % Name of Layout Crew Leader
u.SRVY = 'GF';                 % CK: Survey ID

u.ELEV = 2378;                  % CK: Elevation of site,m. Received from GPS.----------------------------------------------------------------------------------
u.LATG='2132.412,N';            % CK: Latitude from GPS, degrees and minutes. Format 'DDMM.mmm,N'--------------------------------------------------------------
u.LNGG='12149.563,E';           % CK: Longitude from GPS, degrees and minutes. Format 'DDMM.mmm,E'-------------------------------------------------------------

u.SNUM = 1119;                  % CK=1119: Serial number of the instrument, box calibration file

u.EAZM = 0;                     % CK: Ex sensor azimuth, using reference as defined in NREF
u.EXLN = 45.2;                     % CK: Ex dipole length, unit = m
u.EYLN = 50;                     % CK: Ey dipole length, unit = m

u.HAZM = 0;                     % CK: Hx sensor azimuth, using reference as defined in NREF--------------------------------------------------------------
u.DECL = 0;                     % CK=10???: Declination of magnetic or grid North, measured clockwise from True North, in degrees.

u.HXSN = 'MT8H7412';            % CK: Hx sensor serial number. MTC-50:'COILnnnn',MTC-30:'AMTCnnnn'-------------------------------------------------------
u.HYSN = 'MT8H7412';            % CK: Hy sensor serial number. MTC-50:'COILnnnn',MTC-30:'AMTCnnnn'-------------------------------------------------------
u.HZSN = 'MT8H7412';            % CK: Hz sensor serial number. MTC-50:'COILnnnn',MTC-30:'AMTCnnnn',Loop:'LOOPnnnn'---------------------------------------

u.FTIM = '2015/10/13 10:59:33'; % WHEN NO GPS SYNC, Should be changed in the future.
u.nst = 2; % cutoff the first nst-1 seconds from the resampled data since values in the first several seconds has been distorted by the low pass filter and resample function.
u.srate = 125; % the new TSM is 300 Hz, the old TSM is 150 HZ; TSB is 125HZ
%% GAIN AND FILTERS
u.HATT =   1;                   % CK=0.5??: It's Wrong From OBEMPRO!!! Gain of coil attentuation on interconnect board. Typical: phoenix = 0.233.
u.HNOM = 500;                   % CK=100??: Coil nominal gain (mV/nT), MTC-30:100,MTU-50:1000,Loop:500.

u.ACDH = 0;                     % CK=0: H channel coupling. 0-DC coupling, 1-AC coupling----------------------------------------------------------
u.ACDC = 0;                     % CK=1: E channel coupling. 0-DC coupling, 1-AC coupling----------------------------------------------------------
u.HGN  =1;                     % CK=1:Gain for H channels. MTU-A:1,4,16,MTU:3,12,48--------------------------------------------------------------
u.HGNC = 1;                     % CK=1: Gain control for H channel, 0:low, 1:normal, 2:high-------------------------------------------------------
u.EGN  =  50;                  % CK=1200: Gain for E channels------------------------------------------------------------------------------------
u.EGNC = 1;                     % CK=1: Gain control for E channel, 0:low, 1:normal, 2:high-------------------------------------------------------
u.EXR  = 2000;                    % CK=700? Ex dipole resistance between N-S, ohm. Measured by user.
u.EYR  = 2000;                    % CK=700? Ey dipole resistance between E-W, ohm. Measured by user.

%% Version and Model
u.V5SR = 0;                     % CK=0    0:V5-2000 SRate[15,150,2400,24000 Hz],1:V5-compatible SRate[24,320\384,2560\3072]
u.MTSR = 1;                     % CK=0??: 0:AMT,3:ACMT SRate[150,2400,24000], 1:MT SRate[15,150,2400],2:DAMT SRate[2400,240](!!!check phoenix=1!!)

%% They are not used in data process but differ from Phoenix.
u.FSCV = 2.45;                  % CK=phoenix?, CK=2.5???: A/D converter full scale(V) MTU:6.4, MTU-A:2.45-------------------------------------------------
u.VER = '3112B8';               % CK=3112B8: Software version (!!!Check Phoenix=3112G3/F6 etc.!!!)
u.HW = 'MTU5';                 % CK=MTU5A. Hardware Type CK_CLC = MTU52
u.LPFR = 17;                    % CK=17???: Low-pass filter setting for E-channel. MTU:1-3, MTU-A: see User Guide.(!!!Check Phoenix=163!!!)-------
u.TCMB = 4;                     % CK=phoenix: Type of comb filter. One- or two-digit integer. (!!! Check Phoenix=4!!!)-----------------------------
u.TALS = 6;                     % CK=6???: Type of aliasing filter. One- or two-digit integer.(!!!Check Phoenix=11!!!)-----------------------------

end
