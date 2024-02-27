%Define PDE coefficients
c = 1;
a = 1;
f = @(x,y,u,DuDx) 2 - (1/3)*y^(2/3); % Define the function f

% Define grid
x = linspace(0, 2, 50);
y = linspace(1, 2, 50);
[X, Y] = meshgrid(x, y); % Generate a grid of points for the surface plot
t = linspace(0, 1, 50);

% Define initial condition
u0 = @(x) 1 + x;

% Solve the PDE
sol = pdepe(0, @pdefun, u0, @bcfun, x, t); % The first argument is 0 since we have only one equation

% Extract solution
u = sol(:,:,1)';

% Plot solution surface
figure;
surf(X, Y, u);
xlabel('x');
ylabel('y');
zlabel('u');
title('Solution Surface');
hold on;

% Plot characteristic curves on the surface
for i = 1:length(y)
    y_char = y(i)*ones(size(x)); % Generate y values for the characteristic curve
    x_char = x;
    z_char = u0(x) + c*t(i); % Calculate z values for the characteristic curve
    plot3(x_char, y_char, z_char, 'r');
end

hold off;

function [c,f,s] = pdefun(x,y,u,DuDx)
    c = 1;
    f = 1;
    s = 2 - (1/3)*y^(2/3); % The value of the source term based on the given PDE
end

function [pl,ql,pr,qr] = bcfun(xl,ul,xr,ur,t)
    pl = ul - (1 + xl);
    ql = 0;
    pr = ur - (1 + xr);
    qr = 0;
end
