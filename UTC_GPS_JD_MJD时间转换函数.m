%from UTC to JD/MJD,从UTC时间转换到JD/MJD
function [JD_MJD] = UTC_to_JD_MJD_function(year,month,day,hour,minute,second)
%umrechnung UTC in JD/MJD,6.April.2019,13:06:46 UTC
%inputUTC = [year,monat,day,hour,minute,second]
%output[JD,MJD]
% function [JD,MJD]= UTC_TO_JD/MJD(year,monat,day,hour,minute,second)
U=(hour+minute/60+second/3600);
if month>2
    JD=floor(365.25*year)+floor(30.6001*(month+1))+day+U/24+1720981.5;
    MJD=JD-2400000.5;
end

if month<=2
    month=month+12;
    year=year-1;
    JD=floor(365.25*year)+floor(30.6001*(month+1))+day+U/24+1720981.5;
    MJD=JD-2400000.5;
end 
JD_MJD = [JD;MJD];   
end

%from JD/MJD time to DOW/DOY,将JD/MJD时间转换为DOW和DOY
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

%from UTC time to DOY and DOW,将UTC时间转换为DOY和DOW
function [DOY_DOW] = UTC_JD_DOY_DOW_function(UTC)
%UTC=[year,monat,day,hour,minute,second]
year = UTC(1);
month = UTC(2);
day = UTC(3);
hour = UTC(4);
minute = UTC(5);
second = UTC(6);
%from UTC to JD
JD_UM = UTC_to_JD_MJD_function(year,month,day,hour,minute,second);
JD = JD_UM(1);
DOY_DOW = JD_to_DOY_DOW_function(JD);
end

%from GPS-week and GPS-second to JD/MJD,根据GPS周和GPS周秒转换到JD/MJD时间
%input:GPS_week_Sekunde = [GPS_week;GPS_Sekunde]
function [JD_MJD_from_GPS_Zeit] = GPS_week_to_JD_MJD_function(GPS_week_Sekunde)
%from GPS-ZEIT to JD/MJD
UTC_STAR = UTC_to_JD_MJD_function(1980,1,6,0,0,0);
% JD_STAR = UTC_STAR(1);
JD_STAR = UTC_STAR(1);
N_GPS_UTC = 18;%in der Ubung ist der Werte 18s .

GPS_week = GPS_week_Sekunde(1);
GPS_Sekunde = GPS_week_Sekunde(2);

JD_sunday=floor(GPS_week*7-N_GPS_UTC/86400+JD_STAR);
UTC = JD_to_UTC_function(JD_sunday);
h_sunday = UTC(4);
m_sunday = UTC(5);
s_sunday = UTC(6);

Sekunde = GPS_Sekunde - N_GPS_UTC;
DOW = fix(Sekunde/86400);
D = DOW+1;
h = fix((Sekunde-DOW*86400)/3600);
m = fix((Sekunde-DOW*86400-h*3600)/60);
s = fix(Sekunde-DOW*86400-h*3600-m*60);

JD = JD_sunday + (h-h_sunday+(m-m_sunday)/60 + (s - s_sunday)/3600)/24 + D;

MJD=JD - 2400000.5;
JD_MJD_from_GPS_Zeit = [JD;MJD];
end

%from JD to UTC,从JD时间转换到UTC时间
function [UTC] = JD_to_UTC_function(JD_s)
%from JD TO UTC
%if the input is MJD, we should first get: JD=MJD+2400000.5 
 JD_s = JD_s; 
 a=fix(JD_s+0.5);
 b=a+1537;
 c=fix((b-122.1)/365.25);
 d=fix(365.25*c);
 e=fix((b-d)/30.6001);
 D = b-d-floor(30.6001*e)+(JD_s+0.5-fix(JD_s+0.5));
 D_output = fix(D);
 M = e-1-12*fix(e/14);
 Y = c-4715-fix((7+M)/10);
 h_t = (D-fix(D))*24;
 h_JD_to_UTC = fix(h_t);
 m_t = (h_t-fix(h_t))*60;
 m_JD_to_UTC = fix(m_t);
 s_t = (m_t-fix(m_t))*60;
 s_JD_to_UTC = fix(s_t);
 UTC = [Y;M;D_output;h_JD_to_UTC;m_JD_to_UTC;s_JD_to_UTC];
end

%from UTC to GPS-time, 从UTC时间转换到GPS时间（GPS = [GPS_week;SOD;DOW_GPS;SOW]）
function [GPS] = UTC_to_GPS_time_function(UTC)
%UTC=[year,monat,day,hour,minute,second]
%N_GPS_UTC must be given before man use this function.
%GPS_week,STAR-week is 6.Janur.1980.
N_GPS_UTC = 18;%in der Ubung ist der Werte 18s .

UTC_STAR = UTC_to_JD_MJD_function(1980,1,6,0,0,0);
% JD_STAR = UTC_STAR(1);
JD_STAR = UTC_STAR(1);
 
year = UTC(1);
month = UTC(2);
day = UTC(3);
hour = UTC(4);
minute = UTC(5);
second = UTC(6); 
 
JD_UM = UTC_to_JD_MJD_function(year,month,day,hour,minute,second);
JD = JD_UM(1);
%GPS_week
GPS_week = floor((JD+18/86400-JD_STAR)/7);
%GPS_SOD(Tagessekunden in GPS-Zeit),according to the datum)
SOD = hour*3600+minute*60+second+N_GPS_UTC;
%GPS_DOW
DOW_GPS=mod(floor(JD+1.5+N_GPS_UTC/86400),7);
%GPS_SOW
SOW = DOW_GPS*24*60*60+SOD;

%Output:GPS_week,GPS_SOD,GPS_DOW,GPS_SOW
GPS = [GPS_week;SOD;DOW_GPS;SOW];
end




