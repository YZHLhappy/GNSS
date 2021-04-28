%Aufagbe 1.1 
%Berechnen Sie fur den 6 April 2019, 13:06:46 UTC 
UTC = [2019;4;6;13;6;46];
UTC_Beispiel = [2010;10;20;16;3;32];
% das Julianische Datum und das Modizierte Julianische Datum 
Aufgabe1_JD_MJD = UTC_to_JD_MJD_function(2019,4,6,13,6,46);
Aufgabe1_JD = Aufgabe1_JD_MJD(1);
Aufgabe1_MJD = Aufgabe1_JD_MJD(2);

%den Tag des Jahres, sowie Tag der Woche 
Aufgabe1_DOY_DOW = UTC_JD_DOY_DOW_function(UTC);
Aufgabe1_DOY = Aufgabe1_DOY_DOW(1);
Aufgabe1_DOW = Aufgabe1_DOY_DOW(2);

%die GPS-Zeit (GPS-Woche und Sekunden der GPS-Woche)
Aufgabe1_GPSweek_SOW = UTC_to_GPS_time_function(UTC);
Aufgabe1_GPSweek = Aufgabe1_GPSweek_SOW(1);
Aufgabe1_GPS_SOW = Aufgabe1_GPSweek_SOW(4);