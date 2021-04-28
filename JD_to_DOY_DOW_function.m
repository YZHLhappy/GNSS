function [DOY_DOW] = JD_to_DOY_DOW_function(JD)
%if the input is MJD, we should first get: JD=MJD+2400000.5 
UTC = JD_to_UTC_function(JD);
year_0 = UTC(1);
month_0 = 1;
day_0 = 1;
h_0 = 0;
m_0 = 0;
s_0 = 0;
JD_UM = UTC_to_JD_MJD_function(year_0,month_0,day_0,h_0,m_0,s_0);
JD_0 = JD_UM(1);

MJD=JD-2400000.5;
MJD_0=JD_0-2400000.5;

DOY = floor(MJD-MJD_0)+1;
DOW = mod(floor(JD+1.5),7);
DOY_DOW = [DOY;DOW];
end

