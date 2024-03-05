clc;
% Define the given values
F = 150; % N
alpha_values = linspace(0, 90, 500); % Angles in degrees
T_MO = zeros(size(alpha_values));
T_NO = zeros(size(alpha_values));

% Calculate tension in each cable for different alpha values
for i = 1:length(alpha_values)
    alpha = deg2rad(alpha_values(i));
    T_MO(i) = (200 * cos(alpha) - (200 / sqrt(3))* sin(alpha) - 150 );
    T_NO(i) = ((200 / sqrt(3))* sin(alpha) - 200 * cos(alpha) + 150);
    if(abs(T_MO(i) - T_NO(i)) < 0.5)
        equil = rad2deg(alpha)
    end
end

% Plot tension in each cable
plot(alpha_values, T_MO, 'b', alpha_values, T_NO, 'r');
xlabel('\alpha (degrees)');
ylabel('Tension (N)');
legend('T_{MO}', 'T_{NO}');
title('Tension in each cable vs. \alpha');
grid on;
