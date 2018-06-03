clc; clear; close all;
M = 333054;
mT = 5.972e24;
UA = 1.496e11;
sec_years = 31557600; % 365.25 days
G = 6.674e-11*mT*sec_years^2/UA^3;
J = 2*pi;

anys = 1000;
% Solution using Euler

dt= 0.001;
temps = 0:dt:anys;
mida = length(temps);
velocitat = zeros(1,mida);
velocitat(1) = 0;
radi = zeros(1,mida);
radi(1) = 1;

for i = 1:(mida-1)
    velocitat(i+1) = velocitat(i) + (J^2/radi(i)^3 - G*M/radi(i)^2)*dt;
    radi(i+1) = radi(i) + dt*velocitat(i);
end

% Solution using Runge-Kutta 4th order

tspan = [0 anys];
r0 = [1 0];
[t,r] = ode45(@(t,r) funcio(r,J,G,M), tspan, r0);
plot(temps,radi,t,r(:,1))
title('Comparison between Euler and RK-4 methods');
legend('Euler','RK-4');
xlabel('Time (Years)');
ylabel('Distance (AU)');
