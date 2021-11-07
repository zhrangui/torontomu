% Mina Alam - 500900005
% Rui Zhang - 500736315

%% Problem 1:
% Initialize x axis values
x = (0:0.1:10);
% Calulated function
y = x.^2.*exp(-x);
% Save the result of calculated derivative function in a vector
yd = 2*x.*exp(-x)-x.^2.*exp(-x);
% Plot function and its derivative with proper line style 
plot(x, y, "-", x, yd, "--");
% add legend and axix labels
legend("f(x)", "f'(x)");
xlabel("time");
ylabel("velocity");


%% Problem 2:
% Initialize independant variable values
x = (-1:0.1:1);
% Calculated functions in two variables
yplus = (x.^2).^(1/3) + sqrt(1-x.^2);
yminus = (x.^2).^(1/3) - sqrt(1-x.^2);
% plot whole function
plot(x, yplus, x, yminus);
% Define x and y view limit
xlim([-1.5, 1.5]);
ylim([-1.5, 2]);
% Add text on plot
text(-0.3, 0.5, 'Stay safe!', 'FontSize', 14);


%% Problem 3:
% Initialize theta
t = linspace(0,5*pi,200);
% calculate polar axis
rplus=sqrt(t);
rminus=-sqrt(t);
% plot polar
polarplot(t, rplus, t, rminus);



%% Problem 4:
% Set constant value
M = 0.032;
R = 8.31;
% Initialize x, y values
x = (0:1000);
y = (70:320);
% Generate mesh values
[v, T] = meshgrid(x, y);
% Calculate probability distribution by temperature and speed
Pv = 4*pi*(((M./2*pi*R*T).^3).^(1/2)).*v.^2.*exp(-M.*v.^2./(2*R*T));
% Draw distribution surface
surf(v, T, Pv);
% Add title and axix labels
title('Distribution of molecules of a gas');
xlabel('speed(m/s)');
ylabel('temerature(kelvins)')
shading interp;



