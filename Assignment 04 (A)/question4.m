% Define grid
[x, y] = meshgrid(-2:0.1:2, -2:0.1:2);

% Given strength of the doublet
mu = 1;

% Calculate stream function
psi = -imag(mu./(x + 1i*y));

% Calculate velocity components from stream function
u = -imag(mu./(x + 1i*y).^2);
v = real(mu./(x + 1i*y).^2);

% Plot stream function contour
contour(x, y, psi, 20);
xlabel('x');
ylabel('y');
title('Stream Function for Doublet Flow');
colorbar;
axis equal;

% Additional visualization with streamslice
figure;
streamslice(x, y, u, v);
xlabel('x');
ylabel('y');
title('Streamlines for Doublet Flow');
axis equal;
