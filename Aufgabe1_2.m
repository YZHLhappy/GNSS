%Aufgabe 1.2
% Umrechnung von GPS-Zeit
%Berechnen Sie fur die GPS-Woche 2042 und die GPS-Sekunde 410666 
GPS_week_Sekunde = [2042;410666];

% 1.2.1das Modizierte Julianische Datum 
GPS_week_to_JD_MJD = GPS_week_to_JD_MJD_function(GPS_week_Sekunde);
Aufgabe1_2_JD = GPS_week_to_JD_MJD(1);

%1.2.2die UTC-Zeit
Aufgabe1_2_UTC = JD_to_UTC_function(Aufgabe1_2_JD);


