% Clear command window
clc;

% Define symbolic variables
syms x_val t_val u_val

% Define heat distributions for different materials
silverDist = heatDist(x_val, t_val, 1.71);
copperDist = heatDist(x_val, t_val, 1.14);
aluminumDist = heatDist(x_val, t_val, 0.86);
ironDist = heatDist(x_val, t_val, 0.12);

% Define positions on the rod
x = linspace(0, 10, 21);

% Calculate heat distributions at different time points
createHeatDistributionTable(1);
createHeatDistributionTable(10);
createHeatDistributionTable(20);

% Calculate time required for the temperature to reach 15°C at the middle of each rod
silverMid(t_val) = silverDist(5, t_val);
for i = 0:.1:30
    if(round(silverMid(i)) == 15)
        tSilverMid = i;
        break
    end
end
tSilverMid

copperMid(t_val) = copperDist(5, t_val);
for i = 0:.1:30
    if(round(copperMid(i)) == 15)
        tCopperMid = i;
        break
    end
end
tCopperMid

aluminumMid(t_val) = aluminumDist(5, t_val);
for i = 0:.1:30
    if(round(aluminumMid(i)) == 15)
        tAluminumMid = i;
        break
    end
end
tAluminumMid

tIronMid = 0;
ironMid(t_val) = ironDist(5, t_val);
for i = 1000:1:1300
    if(round(ironMid(i)) == 15)
        tIronMid = i;
        break
    end
end
tIronMid

% Plot heat distribution for each material
figure
fsurf(silverDist, [0 10 0 30], "EdgeColor","interp"), colormap jet
title('Heat distribution in a thin silver rod')
xlabel('x')
ylabel('t')
zlabel('u(x, t)')
box on
alpha(0.5)

figure
fsurf(copperDist, [0 10 0 30], "EdgeColor","interp"), colormap jet
title('Heat distribution in a thin copper rod')
xlabel('x')
ylabel('t')
zlabel('u(x, t)')
box on
alpha(0.5)

figure
fsurf(aluminumDist, [0 10 0 30], "EdgeColor","interp"), colormap jet
title('Heat distribution in a thin aluminum rod')
xlabel('x')
ylabel('t')
zlabel('u(x, t)')
box on
alpha(0.5)

figure
fsurf(ironDist, [0 10 0 30], "EdgeColor","interp"), colormap jet
title('Heat distribution in a thin iron rod')
xlabel('x')
ylabel('t')
zlabel('u(x, t)')
box on
alpha(0.5)

function createHeatDistributionTable(t)
    syms x_val t_val u_val
    % Define the values of x (assuming it's defined outside this function)
    x = linspace(0, 10, 21);

    % Define heat distributions for different materials
    silverDist = heatDist(x_val, t_val, 1.71);
    copperDist = heatDist(x_val, t_val, 1.14);
    aluminumDist = heatDist(x_val, t_val, 0.86);
    ironDist = heatDist(x_val, t_val, 0.12);
    
    % Calculate heat distributions for each metal at time t
    sil = vpa(silverDist(x, t), 7);
    cop = vpa(copperDist(x, t), 7);
    alu = vpa(aluminumDist(x, t), 7);
    irn = vpa(ironDist(x, t), 7);
    
    % Create and display the table
    disp(table(x', sil', cop', alu', irn', 'VariableNames', {'x', 'Silver', 'Copper', 'Aluminum', 'Iron'}));
end

% Define function for heat distribution
function heat = heatDist(x, t, a)
    syms n c_n(n) L f(x) u_n(x, t, n) lambda(n) heat(x, t)
    
    % Define assumptions
    assume(n, "integer")
    assume([L a], "positive")
    
    % Define initial heat distribution
    heat(x, t) = 10 + 2*x;
    
    % Calculate Fourier series coefficients
    lambda(n) = n*pi/L;
    
    % Calculate individual heat distributions for each term in the series
    u_n(x, t, n) = (20/pi) .*(((3*((-1)^n))-1)/n) .* sin(x*lambda(n)) .* exp(-t*(a^2)*(lambda(n).^2));
    
    % Sum all the individual heat distributions
    u_n_plot(x, t, n) = subs(u_n(x, t, n), sym(["L" "a"]), [10 a]);
    for i = 1:50
        u_plot(x, t) = u_n_plot(x, t, i);
        heat(x, t) = heat(x, t) + u_plot(x, t);
    end
end
