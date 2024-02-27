% Define grid
[x, y] = meshgrid(-2:0.1:2, -2:0.1:2);

% Calculate velocity components
u = 2 * (x.^2 - y.^2);
v = -4 * x .* y;

% Integrate to find velocity potential
phi = cumtrapz(x(1,:), u, 1) + cumtrapz(y(:,1), v, 2);

% Plot velocity potential
contour(x, y, phi, 20);
xlabel('x');
ylabel('y');
title('Velocity Potential');
colorbar;
axis equal;
