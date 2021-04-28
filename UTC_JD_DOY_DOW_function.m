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

