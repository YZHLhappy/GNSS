%Aufgabe 3.2 skyplot
%N18:igs19614.sp3;PG05 
load('SATCOO.mat')
myData = SATCOO (:,:,18);

for i = 1:96
    X_ECEF(i) = myData(i,3);
    Y_ECEF(i) = myData(i,4);
    Z_ECEF(i) = myData(i,5);
    K_sat(1,i) = X_ECEF(i);
    K_sat(2,i) = Y_ECEF(i);
    K_sat(3,i) = Z_ECEF(i);
end
%transformieren die Koodrdinaten vom ECEF ins Topozentrische System
X_sta = 3845215.146;
Y_sta = 658111.891;
Z_sta = 5029197.632;
K_sta = [3845215.146;658111.891;5029197.632;];
%ECEFzuEllipsodisch_function output :K_sta_topo = [phi_s;lambda_s;h_s];
K_sta_topo = ECEFzuEllipsodisch_function(K_sta);
phi_s = K_sta_topo(1);
lambda_s = K_sta_topo(2);
h_s = K_sta_topo(3);
% Die Elevation und das Azimut des Satelliten bezuglich der Station S fur jede Epoche Ihres Satelliten
% TOPO(:,i) = [N;E;U;Azi;Elev]
for i = 1:96
    TOPO(:,i) = Azimut_und_Elevation_function(K_sat(:,i),K_sta);
    azimut(i) = TOPO(4,i);
    elevation(i) = TOPO(5,i);
    N(i) = TOPO(1,i);
    E(i) = TOPO(2,i);
    U(i) = TOPO(3,i); 
end
% stellen Sie die Ergebnisse in einem Skyplot dar
theta = -pi/2:pi/10000:pi/2;
y_1 = atan((18.28-1.5)/20*cos(theta));
delta = -pi:pi/10000:pi;
y_2 = -atan((15.5-1.5)/20*cos(delta));
%polarplot(azimut,rad2deg(elevation));
polarplot(azimut,rad2deg(elevation),theta,rad2deg(y_1),delta,rad2deg(y_2));
set(gca,'RDir','reverse','ThetaZeroLocation','top','ThetaDir','clockwise');
rlim([0 90]);
title('Abschattungsskizze3.2.')