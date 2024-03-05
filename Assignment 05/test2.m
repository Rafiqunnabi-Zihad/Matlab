% Constants
K = 40; % s*kg/m^5
m = 1700; % kg
v0 = 80 * 1000 / 3600; % initial velocity in m/s (converted from km/h)
x_max = 5; % max position in meters
N = 1000; % number of points for plotting

% Define the function for force
F = @(v, x) K * v .* (x + 1).^3;

% Define the differential equation dy/dx = f(x, y)
f = @(x, v) -F(v, x) / m;

% Initial conditions
x0 = 0;
v0 = 80 * 1000 / 3600; % initial velocity in m/s (converted from km/h)
initial_conditions = [x0, v0];

% Solve the differential equation
[x, v] = ode45(@(x, v) f(x, v), linspace(0, x_max, N), v0);

% Plot the velocity as a function of position
plot(x, v)
xlabel('Position (m)')
ylabel('Velocity (m/s)')
title('Velocity of the car as a function of position')
grid on
