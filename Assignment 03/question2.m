% Clear command window
clc;

% Define symbolic variables
syms t x n c_n(n) L a f(x) u_n(x, t, n) lambda(n) heat(x, t)

% Specify assumptions
assume(n, "integer")
assume([L a], "positive")

% Initialize the total heat function
heat(x, t) = 0;

% Define the Fourier basis
lambda(n) = n*pi/L;

% Define the heat equation solution
u_n(x, t, n) = c_n .* sin(x*lambda(n)) .* exp(-t*(a^2)*lambda(n).^2);
% Check if the heat equation is satisfied
eqn = simplify(diff(u_n, t) - (a^2)*diff(u_n, x, x));
if eqn == 0
    fprintf('The equation is satisfied.\n')
else
    fprintf('The equation is not satisfied.\n')
end

% Define the heat source function
f(x) = 10;

% Calculate the Fourier coefficients
c_n(n) = (2/L) * int(f(x) .*sin(lambda(n).*x), x, 0, L);

% Substitute numerical values for plotting
u_n_plot(x, t, n) = subs(u_n(x, t, n), sym(["L" "a" "c_n"]), [pi 1.71 c_n]);

% Plot the individual heat solutions for the first 5 terms
for i = 1:9
    tfinal = 3; % Final time for plotting
    u_plot(x, t) = u_n_plot(x, t, i);
    heat(x, t) = heat(x, t) + u_plot(x, t);
    fsurf(u_plot, [0 pi 0 tfinal], "EdgeColor","interp"), colormap jet
    hold on
    alpha(0.5) % Set transparency
end

% Plot the total heat distribution
figure
fsurf(heat, [0 pi 0 tfinal], "EdgeColor","interp"), colormap jet
alpha(0.5) % Set transparency

% Calculate and plot the heat distribution at the midpoint of the rod
figure
heat_mid = heat(pi/2, t);
fplot(heat_mid, [0 3])
