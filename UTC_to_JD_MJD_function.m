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

