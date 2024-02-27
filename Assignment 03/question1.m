%Clear command window and workspace
clc;

% Define symbolic variables and unit symbols
syms U(x, t) a
unit = symunit;

% Assign units to variables
U = U * unit.K; % Temperature (Kelvin)
x = x * unit.m; % Distance (meter)
t = t * unit.t; % Time (second)
a = a * unit.m^2/unit.t; % Acceleration (meter^2/second)

% Define the partial differential equation
eqn = diff(U, t) == a * diff(U, x, x);

% Display the differential terms with their respective units
disp('Differential term with respect to time:');
diff(U, t)
disp('Differential term with respect to space:');
a * diff(U, x, x)
