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

JD = JD_sunday + (h-h_sunday+(m-m_sunday)/60+(s-s_sunday)/3600)/24 +D;

MJD=JD-2400000.5;
JD_MJD_from_GPS_Zeit = [JD;MJD];
end

