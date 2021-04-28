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

