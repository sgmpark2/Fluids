clc
close all
%Define Cylinder

Ri = 1e-3; %Inner Cylinder Radius (m)
Ro = 2e-3; %Outer Cylinder Radius (m)

w = 100; %Inner Cylinder Rotational Speed Rad/s

%Calculation of U(Theta) Tangential Velocity

r = Ri:1e-6:Ro;

VTheta = (w*Ri)*(((Ro./r) - (r./Ro)) ./ ((Ro/Ri) - (Ri/Ro)));
VTheta2 = ((-w.*r)/(Ro.^2*((1/Ri.^2) - (1/Ro.^2)))) + ((w)./(r.*((1/Ri.^2) - (1/Ro.^2))));
UTheta = VTheta ./ r;
figure(1)
plot((UTheta/(Ri*w)),(r/Ri))
ylabel('normalised Radius')
xlabel('Cylinder Rotation Speed')


wr = w.*(1+((Ro.^2*Ri.^2)./(Ro.^2 - Ri.^2)) .* ((1./r.^2) - (1./Ri.^2)));
wr2 = ((Ri.^2 * w)/(Ri.^2 - Ro.^2)) * (1 - ((Ro./r).^2));


VTheta3 = - ((w.*r) ./ ((Ro.^2./Ri.^2)-1)) + (w ./ (r.*((1/Ri.^2)-(1/Ro.^2))));



figure(2)
plot(wr2,r/Ri)
hold on
ylabel('normalised Radius')
xlabel('Cylinder Rotation Speed')
plot(wr,r/Ri)
plot(UTheta,r/Ri)
plot(VTheta2./r,r/Ri)

figure(3)
plot(VTheta3,r/Ri)
hold on
ylabel('normalised Radius')
xlabel('Cylinder Rotation Speed')
