clc
clear
close all
%Define Cylinder

Ri = 1e-3; %Inner Cylinder Radius (m)
Ro = 2e-3; %Outer Cylinder Radius (m)

w = 100; %Inner Cylinder Rotational Speed Rad/s

%Calculation of U(Theta) Tangential Velocity

r = Ri:1e-7:Ro;
VTheta = - ((w.*r) ./ ((Ro.^2./Ri.^2)-1)) + (w ./ (r.*((1/Ri.^2)-(1/Ro.^2))));

%Reading SU2 Data
BC1OUT = readtable('BC1OUT.csv');

figure(1)
%plot((UTheta/(Ri*w)),(r/Ri))
ylabel('Normalised Radius')
xlabel('Cylinder Rotation Speed')

hold on
plot(VTheta/(Ri*w),(r/Ri))

plot(BC1OUT.Velocity_0/(Ri*w),(abs(BC1OUT.Points_1)/Ri))

legend('Analytical','SU2')
grid on

RMSE = rmse(VTheta/(Ri*w),(BC1OUT.Velocity_0/(Ri*w))');







