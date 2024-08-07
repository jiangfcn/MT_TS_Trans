# Bugs may encounter:
I was informed with some bugs when other people run this code package with different versions of MATLAB, which I am not able to debug and update them timely, but will be listed here:
* Error using datetime:  'Inputformat' should be specified:'yyyy/mm/dd HH:mm:ss' when the datetime function is called.

  
# MT_TS_Trans
* It is a MATLAB script package for transferring magnetotelluric (MT) time series (TS) to the format the SSMT2000 package can process.
* Look at the TBLpar.m and TBL_Replace.m files before running the main function MT_Trans.m.

# Gulidelines:
1. adding this package to your MATLAB's PATH
2. copying the TBL_Replace.m file to your work direcrion.
3. opening TBL_Replace.m file and editing the parameters in this file. Note that it is your responsibility to edit the TBLpar.m and TBL_Replace.m and make sure that all the parameters in these two files are correct and match your measurements.
4. running the main function MT_Trans.m without any input.

# Notes:
1. *.CLC and *.CLB files are needed to process the output data from this package. 
2. Signals with frequencis above 5 Hz have been removed at default by the 'filter_mt.m'.

# Copyright 
Copyright 2023 Feng Jiang (South China Sea Institute of Oceanology, CAS).

# License:
This package is free to use under the terms of the GNU General Public License.

# Acknowledgement
* Part of the scripts was originally written by Mingren Hong (CUG,BJ) on the Shiyan 6 ship of the 2022 marine geophysical cruise. I would like to thank him and the research group leaded by Kai Chen (CUG,BJ).
* The script function_butter_filter_2018 is shared by Yongxin Gao (HeFei University of Technology). 
