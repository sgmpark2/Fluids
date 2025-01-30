clc
clear
close all
%Define Cylinder

Ri = 1e-3; %Inner Cylinder Radius (m)
Ro = 2e-3; %Outer Cylinder Radius (m)

w = 100; %Inner Cylinder Rotational Speed Rad/s
U_Zero = 0.1;

%Calculation of U(Theta) Tangential Velocity

r = Ri:1e-7:Ro;

VTheta = - ((w.*r) ./ ((Ro.^2./Ri.^2)-1)) + (w ./ (r.*((1/Ri.^2)-(1/Ro.^2))));

VZ = (U_Zero / (log(Ro/Ri))) *(log(r/Ri));

VM = sqrt(VTheta.^2 + VZ.^2);
BC3OUT = readtable('BC3OUT.csv');
VM_SU2 = sqrt(BC3OUT.Velocity_0.^2 + BC3OUT.Velocity_2.^2);

figure(1)
%plot((UTheta/(Ri*w)),(r/Ri))
ylabel('Normalised Radius')
xlabel('Flow Velocity Magnitude')

hold on
plot(VM,r/Ri,"r",LineWidth=1.5)
%plot(VM_SU2,r/Ri,"b--",LineWidth=1.5)
grid on
%legend('Analytical','SU2',Location='northwest')

RMSE = rmse(VM,(VM_SU2)')






