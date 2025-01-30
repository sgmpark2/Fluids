clc
clear
close all
%Define Cylinder

Ri = 1e-3; %Inner Cylinder Radius (m)
Ro = 2e-3; %Outer Cylinder Radius (m)

U_Zero = 0.1; %Outer Circle Translation Speed Rad/s

%Calculation of U(Z) Axial Velocity

r = Ri:1e-6:Ro;

VZ = (U_Zero / (log(Ro/Ri))) *(log(r/Ri));



%Reading SU2 Data
BC2Out = readtable('BC2OUT.csv');

figure(1)
%plot((UTheta/(Ri*w)),(r/Ri))
ylabel('Normalised Radius')
xlabel('Cylinder Translation Speed')

hold on
%plot(VZ/(U_Zero),(r/Ri))

%plot(BC2Out.Velocity_2/(U_Zero),(BC2Out.Points_1/Ri))

plot(VZ/U_Zero,r/Ri,LineWidth=1.5,Color='r')
%plot(BC2Out.Velocity_2/U_Zero,BC2Out.Points_1/Ri)

grid on
%legend('Analytical','SU2',Location='northwest')

RMSE = rmse(VZ/U_Zero,(BC2Out.Velocity_2/U_Zero)')







