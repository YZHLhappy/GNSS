%aufagbe3.3
load('SATCOO.mat')
load coast
myData = SATCOO (:,:,18);
%output [phi_s;lambda_s;h_s];
for i = 1:96
    X_ECEF(i) = myData(i,3);
    Y_ECEF(i) = myData(i,4);
    Z_ECEF(i) = myData(i,5);
    K_sat(1,i) = X_ECEF(i);
    K_sat(2,i) = Y_ECEF(i);
    K_sat(3,i) = Z_ECEF(i);
    
    K_sat_ell(:,i) = ECEFzuEllipsodisch_function(K_sat(:,i));
    phi_s(i) = K_sat_ell(1,i);
    lambda_s(i) = K_sat_ell(2,i);
    h_s(i) = K_sat_ell(3,i);
    phi_s_deg(i) = rad2deg(phi_s(i));
    lambda_s_deg(i) = rad2deg(lambda_s(i));
end

plot(long,lat,'k',lambda_s_deg,phi_s_deg,'*r','LineWidth',1.5)
xlim([-180 180])
ylim([-90 90])
title('Groundtrack')
xlabel('¦Ë[deg]')
ylabel('¦µ[deg]')
grid on

