% Define the strengths of the sources and sinks
strength = 1;

% Define the positions of the sources and sinks
sources = [3, 0; -3, 0];
sinks = [0, 3; 0, -3];

% Define the grid
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);

% Initialize velocity components
u = zeros(size(x));
v = zeros(size(y));

% Calculate the velocity components due to the sources
for i = 1:size(sources, 1)
    u = u + strength ./ (2 * pi) .* (x - sources(i, 1)) ./ ((x - sources(i, 1)).^2 + (y - sources(i, 2)).^2);
    v = v + strength ./ (2 * pi) .* (y - sources(i, 2)) ./ ((x - sources(i, 1)).^2 + (y - sources(i, 2)).^2);
end

% Calculate the velocity components due to the sinks
for i = 1:size(sinks, 1)
    u = u - strength ./ (2 * pi) .* (x - sinks(i, 1)) ./ ((x - sinks(i, 1)).^2 + (y - sinks(i, 2)).^2);
    v = v - strength ./ (2 * pi) .* (y - sinks(i, 2)) ./ ((x - sinks(i, 1)).^2 + (y - sinks(i, 2)).^2);
end

% Plot the streamlines
figure;
streamslice(x, y, u, v, 10);
hold on;

theta = linspace(0, 2*pi, 100);
x_circle = 3 * cos(theta);
y_circle = 3 * sin(theta);

% Plot the sources and sinks
plot(sources(:, 1), sources(:, 2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot(sinks(:, 1), sinks(:, 2), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot(x_circle, y_circle, 'k--', 'MarkerSize', 20, 'MarkerFaceColor', 'y');

axis equal;
title('Streamlines due to Sources and Sinks');
xlabel('x');
ylabel('y');
legend('Streamlines', 'Sources', 'Sinks');
