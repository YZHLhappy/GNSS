%from X_satellit and X_station (ECEF coordinate) get AZIMUT and ELEVATION 
%从卫星的坐标和基站的坐标（ECEF坐标下的值）得到偏向角和仰角
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

%from X_satellit and X_station (ECEF coordinate) to Ellipsodisch Coordinate
%从卫星的坐标和基站的坐标（ECEF坐标下的值）转换到椭圆坐标系下的坐标
function [X_s] = ECEFzuEllipsodisch_function(X)
% X=[3845245.146;658116.891;5029177.632];
%output [phi_s;lambda_s;h_s];
a = 6378137;
b = 6356752.3142;
X_e = X(1);
Y_e = X(2);
Z_e = X(3);
%λ:lambda_s
lambda_s = atan2(Y_e,X_e);

q = sqrt(X_e^2+Y_e^2);
c = a^2/b;
e_2 = (a^2-b^2)/b^2;
w = Z_e*(1+e_2);

h = [];
N = [];
phi = [];

phi0 = atan(w/q);
i = 1;
while 1
    if i<=1
        N(i) = c/sqrt(1+e_2*cos(phi0)^2);
        h(i) = q/cos(phi0) - N(1);
        phi(i) = atan(w/q*(1+e_2*h(i)/(N(i)+h(i)))^-1);
        i = i+1;
    else
        N(i) = c/sqrt(1+e_2*cos(phi(i-1))^2);
        h(i) = q/cos(phi(i-1)) - N(i);
        phi(i) = atan(w/q*(1+e_2*h(i)/(N(i)+h(i)))^-1);
        
            phi_s = phi(i);
%             lambda_s = lambda_s;
            h_s = h(i);
            X_s = [phi_s;lambda_s;h_s];
        if abs(h(i)-h(i-1))<=0.001
            break
        end
        i = i+1;
    end
end
end