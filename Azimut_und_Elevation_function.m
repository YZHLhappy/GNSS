function [A] = Azimut_und_Elevation_function(X_sat,X_sta)
%Berechnung von Azimut und Elevation
DELTA_X = X_sat - X_sta;
% X = X_sta;
X_s = ECEFzuEllipsodisch_function(X_sta);
%X_s[phi_s;lambda_s;h_s]
phi_s = X_s(1);
lambda_s = X_s(2);
h_s = X_s(3);
tran_Matrix = [-sin(phi_s)*cos(lambda_s) -sin(phi_s)*sin(lambda_s) cos(phi_s);
               -sin(lambda_s) cos(lambda_s) 0;
               cos(phi_s)*cos(lambda_s) cos(phi_s)*sin(lambda_s) sin(phi_s)];
DELTA_X_t = tran_Matrix*DELTA_X;
N = DELTA_X_t(1);
E = DELTA_X_t(2);
U = DELTA_X_t(3);
Azi = atan2(E,N);
Elev = atan2(U,sqrt(N^2+E^2));
A = [N;E;U;Azi;Elev];
end

