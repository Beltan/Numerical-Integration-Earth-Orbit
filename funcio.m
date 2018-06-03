function dydt = funcio(r,J,G,M)
% r'' = J^2/r.^3 - G*M/r.^2;
dydt = zeros(2,1);
dydt(1) = r(2); % r'
dydt(2) = J^2/r(1)^3 - G*M/r(1)^2; % r''