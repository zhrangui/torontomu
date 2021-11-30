% Mina Alam - 500900005
% Rui Zhang - 500736315

%% Problem 1:
p1 =[2 2 2 2];
p2 = [1 1 1];
p = polyadd(p1,p2,'add');
disp(p);
p = polyadd(p1,p2,'sub');
disp(p);

%% Problem 2:
y=0:0.1:4;
d2 = [4 -32 97 -136 80];
fplot(@(x) sqrt(polyval(d2,x)), [0 4]);
hold on
p1 = [2 -8 11];
x = polyval(p1, y);
% Distance from point P(3, 4) to polynomial 
d = sqrt((x-3).^2 + (y-4).^2);
plot(y, d);
hold off


%% Problem 3:
Day=[7 21 35 49 63 77 91];
Height=[8.5 21 50 77 89 98 99];
% Curve-fit the data with a third-order polynomial
f3=polyfit(Day, Height, 3);
plot(Day, Height, 'o');
hold on
fplot(@(x) polyval(f3, x), [7 91]);
hold off
%Estimate the height in day 40
day40 = polyval(f, 40);
fprintf('Height in day 40" %.4f\n', day40);
%% Fit the data with linear and spline interpolations
plot(Day, Height, 'o');
hold on
fplot(@(x) interp1(Day,Height,x,'linear'), [7 91]);
fplot(@(x) interp1(Day,Height,x,'spline'), 'b', [7 91]);
legend;
hold off
yl=interp1(Day,Height,40,'linear');
fprintf('Linear interpolation at day 40: %.4f\n', yl);
ys=interp1(Day,Height,40,'spline');
fprintf('Spline interpolation at day 40: %.4f\n', ys);

%% Problem 4:
force=[0 0.6 0.9 1.16 1.18 1.19 1.24 1.48...
        1.92 3.12 4.14 5.34 6.22 7.12 7.86 8.42];
elongation=[0 1.2 2.4 3.6 4.8 6.0 7.2 8.4...
    9.6 10.8 12.0 13.2 14.4 15.6 16.8 18];
f4=polyfit(force, elongation, 4);
plot(force, elongation, 'o');
hold on
fplot(@(x) polyval(f4, x), [0 8.42]);
hold off
e11_5 = polyval(f4, 11.5);
fprintf('Force at 11.5 in. long of rubber: %.4f\n', e11_5);
%% Fit the data with spline interpolation
plot(force, elongation, 'o');
hold on
fplot(@(x) interp1(force,elongation,x,'spline'), [0 8.42]);
legend;
hold off
eb11_5=interp1(force,elongation,11.5,'spline');
fprintf('Spline interpolation at 11.5 in.: %.4f\n', eb11_5);

