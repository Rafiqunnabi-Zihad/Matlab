clc;
% Given values
F1 = 20; % kN
F2 = 40; % kN
F3 = 200; % kN
alpha1 = deg2rad(40); % Angle of F1 with respect to x-axis
alpha2 = deg2rad(25); % Angle of F2 with respect to x-axis
alpha3 = deg2rad(58); % Angle of F3 with respect to x-axis

% Components of forces along x-axis and y-axis
F1_x = F1 * cos(alpha1);
F1_y = F1 * sin(alpha1);

F2_x = F2 * cos(alpha2);
F2_y = F2 * sin(alpha2);

F3_x = F3 * cos(alpha3);
F3_y = F3 * sin(alpha3);

% Summing up the forces
F_resultant_x = F1_x + F2_x + F3_x;
F_resultant_y = F1_y + F2_y + F3_y;

% Magnitude of resultant force
F_resultant_mag = sqrt(F_resultant_x^2 + F_resultant_y^2);

% Angle of resultant force with respect to x-axis
alpha_resultant = atan2(F_resultant_y, F_resultant_x);

% Convert angle to degrees
alpha_resultant_deg = rad2deg(alpha_resultant);

% Display the results
disp(['Magnitude of resultant force: ', num2str(F_resultant_mag), ' kN']);
disp(['Direction of resultant force: ', num2str(alpha_resultant_deg), ' degrees with respect to x-axis']);
