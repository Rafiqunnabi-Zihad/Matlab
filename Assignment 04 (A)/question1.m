% Define grid
[x, y] = meshgrid(-2:0.1:2, -2:0.1:2);
% Calculate velocity potential and stream function
phi = 2*log(sqrt(x.^2 + y.^2));
psi = 2*atan2(y, x);

% Plot streamlines
contour(x, y, psi, 20, 'k'); % solid black lines for streamlines
hold on
% Plot equipotential lines
contour(x, y, phi, 20, '--r'); % dashed red lines for equipotential lines
xlabel('x');
ylabel('y');
title('Streamlines and Equipotential Lines');
legend('Streamlines', 'Equipotential Lines');
axis equal;
