% Constants
initial_velocity = (300 * 1000) / 3600; % Initial velocity in m/s
acceleration_func = @(v) -0.0035 * v.^2 - 3; % Acceleration function
initial_time = 0; % Initial time
final_time = 12.5; % Final time (adjust as needed)
time_step = 0.01; % Time step for numerical integration

% (a) Solving the differential equation to determine velocity as a function of time

[t, velocity] = ode45(@(t, v) acceleration_func(v), [initial_time final_time], initial_velocity);

% Plotting velocity as a function of time
figure;
plot(t, velocity);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity vs Time');
ylim([0 90]);

% (b) Numerical integration to determine distance x as a function of time

% Define the function for numerical integration
distance_func = @(v) v;

% Preallocate array for distance
distance = zeros(size(t));

% Numerical integration
for i = 2:length(t)
    distance(i) = distance(i-1) + time_step * distance_func(velocity(i));
end

% Plotting distance as a function of time
figure;
plot(t, distance);
xlabel('Time (s)');
ylabel('Distance (m)');
title('Distance vs Time');
xlim([0 12.5]);