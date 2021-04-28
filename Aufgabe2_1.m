%Aufgabe 2: Transformation von Koordinatensystemen
%Berechnen Sie die ellipsoidischen Koordinaten der Station sowie des Satelliten. 
%Berechnen Sie au?erdem die Elevation und das Azimut des Satelliten bezuglich Ihrer Stationskoordinaten. 
%Erganzen Sie die Stationskoordinaten mit Ihrer Matrikelnummer (Aufgabe 1). 
%Ist der Satellit zu diesem Zeitpunkt fur die Station S sichtbar? Begrunden Sie ihre Antwort.

%Erganzen Sie die Stationskoordinaten mit Ihrer Matrikelnummer (Aufgabe 1). 
X_e_sta = 3845265.146;
Y_e_sta = 658116.891;
Z_e_sta = 5029167.632;
K_e_sta = [X_e_sta;Y_e_sta;Z_e_sta];

X_e_sat = 24047321.548;
Y_e_sat = 4893362.163;
Z_e_sat = -10479643.999;
K_e_sat = [X_e_sat;Y_e_sat;Z_e_sat];

%Berechnen Sie die ellipsoidischen Koordinaten der Station sowie des Satelliten. 
Aufgabe_2_K_ell_sta = ECEFzuEllipsodisch_function(K_e_sta);
Aufgabe_2_K_ell_sat = ECEFzuEllipsodisch_function(K_e_sat);

%Berechnen Sie au?erdem die Elevation und das Azimut des Satelliten bezuglich Ihrer Stationskoordinaten.
Azimut_und_Elevation = Azimut_und_Elevation_function(K_e_sat,K_e_sta);
N = Azimut_und_Elevation(1);
E = Azimut_und_Elevation(2);
U = Azimut_und_Elevation(3);
Aufgabe_2_NEU = [N;E;U];
Aufgabe_2_Azimut = Azimut_und_Elevation(4);
Aufgabe_2_Elevation = Azimut_und_Elevation(5);