% Mina Alam - 500900005
% Rui Zhang - 500736315

% Problem 1:
% transpose row vector to column vector
M = (66.4:0.8:72)'

% Problem 2:
% Convert row vector to column vector
N = linspace(54,27,7)'

% Problem 3:
A = [1:7;
    7:-1:1;
    linspace(2,9,7)]

% Problem 4:
d = [6 -1 4 0 -2 5];
e = [7 5 9 0 1 3];
%(a)
% Fill row with part of vector
M33=[d(2:4);e(3:5);d(4:6)]
%(b)
% Fill each row vector by part of vector
M42=[d(2:5)' e(3:6)']

% Problem 5:
% Create string matrix, each cell is string
M5 = ["Student Name","Quiz 1","Quiz 2","Lab 1","Lab 2";"John Doe",1,0.5,0.75,1;"Jane Doe",1,1,0.5,1];

