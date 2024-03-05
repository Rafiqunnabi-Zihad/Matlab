% Constants
g = 9.81; % acceleration due to gravity (m/s^2)
v0 = 280; % initial velocity (m/s)
theta = 55; % launch angle (degrees)
wind_speed = 35; % wind speed (m/s)

% Components of initial velocity
v0x = v0 * cosd(theta); % initial velocity in x-direction
v0y = v0 * sind(theta); % initial velocity in y-direction

% Time of flight
t_flight = (2 * v0y) / g;

% Time intervals
t_intervals = linspace(0, t_flight, 1000);

% Trajectory without wind
x_no_wind = v0x * t_intervals;
y_no_wind = v0y * t_intervals - 0.5 * g * t_intervals.^2;

% Trajectory with wind
x_with_wind = v0x * t_intervals + wind_speed * t_intervals;
y_with_wind = v0y * t_intervals - 0.5 * g * t_intervals.^2;

% Plotting the trajectories
figure;
plot(x_no_wind, y_no_wind, 'b', 'LineWidth', 1.5);
hold on;
plot(x_with_wind, y_with_wind, 'r--', 'LineWidth', 1.5);
xlabel('Horizontal Distance (m)');
ylabel('Vertical Distance (m)');
title('Projectile Trajectory');
legend('No Wind', 'With Wind');
grid on;
