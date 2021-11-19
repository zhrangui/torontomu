function y = lab7fun1a(x)
%lab7fun1a calculate function value by input x
% element-by-element calculation
y = 0.6.*x.^3.*exp(-0.4./x)+1.5*x.^2.*exp(-0.6*x);
end