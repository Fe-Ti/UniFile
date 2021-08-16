disp(sprintf('The First Task\n'));
% setting up variables
x = -2:0.001:2;
y = l2t1(x);

disp('Plotting the function graph...');
figure 1
plot(x, y);
% enabling grid and labelling axes
grid on;
title('Task 1')
xlabel('X');
ylabel('Y');

% finding the root of the equation
X = fzero('l2t1', [-1.5 1.5]);
format long;
disp(sprintf('The equation root is %d.', X));
% X = -0.946048...

disp(sprintf('\nThe Second Task\n\nCalculating the earthing tube length...'));

R = 15;           % Desired resistance
G = 0.02;         % Soil resistivity
h = 1;            % Depth
r = 0.025;        % Tube radius
k = 6;            % Tube count
l = 0.5:0.001:2;  % Single tube length
deltaR = l2t2(l, k, r, h, G, R);
figure 2
plot(l, deltaR);
grid on;
title('Task 2')
xlabel('l');
ylabel('Delta R');

l2t2_fz = @(l) l2t2(l, k, r, h, G, R); % creating function with only 1 parameter
L = fzero(l2t2_fz, [0.5 2]);
disp(sprintf('The required tube lenght is %d', L));
