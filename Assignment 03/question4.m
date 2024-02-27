road_length = 10;             % Length of the road
max_speed = 120;              % Maximum speed of vehicles
initial_density = 20;         % Initial traffic density
max_density = initial_density;

time_step = 0.001;            % Time step
total_time = 0.2;             % Total simulation time
num_steps = total_time / time_step; % Number of time steps

position = linspace(-40, 40, 1000); % Positions on the road
density = zeros(size(position));    % Traffic density at each position
density(1:end) = initial_density;   % Set initial density

colormap('jet');

figure;

for step = 1:num_steps
    velocity = max_speed * (1 - 2 * density / max_density);
    displacement = max_speed * (1 - 2 * density / max_density) * time_step;
    position = position - displacement;
    density = (max_density / 2) * (1 - position ./ (max_speed * step * time_step));
    
    % Boundary conditions
    density(position < -max_speed * step * time_step) = max_density;
    density(position > max_speed * step * time_step) = 0;
    
    % Plotting
    plot(position, density, 'LineWidth', 2);
    xlabel('Position');
    ylabel('Density');
    title(['Traffic Density Evolution (Time: ' num2str(step*time_step) ' hours)']);
    
    ylim([0, max_density]);
    xlim([-10, 10]);
    
    drawnow;
end
