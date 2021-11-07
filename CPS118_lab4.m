% Mina Alam - 500900005
% Rui Zhang - 500736315

% Problem 1:
% Receive user input
v = input('Enter the grades as elements of a vector: ');
% v = [93 77 56 62 99 41 82 77 72 68 100 47 78 80 83];
% Get length of vector
len = length(v);
% Calculate mean of vector
m = mean(v);
% Calculate deviation of vector
d = std(v);
% Format output
fprintf('There are %d grades.\n', len);
fprintf('The average grade is %.1f.\n', m);
fprintf('The standard deviation is %.1f.\n', d);

% Problem 2:
h = [0:2:14];
r = 14;
len = 36;
% Calculate angle of circle sector
theta = atan(sqrt(r^2 - (r-h).^2)./(r-h))*2;
% Calculate area of circle sector and multiply length to get volume of tank
%pi*r^2*len/2
volume = 1/2*(theta-sin(theta))*r^2*len;
inch_galon = 0.004329;
% Convert inch^3 to gallon
volume = round(volume*inch_galon, 1);
table = [['hight(inch)' string(h)]' ['volume(gallon)' string(volume)]'];
% Display table
disp(table)

% Problem 3:
% Assign linear equation coefficients
A = [1 2 10 1 1;
    2 3 11 0 1;
    1 4 10 1 0;
    1 3 10 2 0];
b = [5;12;11;8];
% Solve linear score equation A*x = b
x = linsolve(A, b)


