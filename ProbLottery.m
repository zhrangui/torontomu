function P = ProbLottery(m,r,n)
% Probability lottery
% ProbLottery(m,r,n) is function to calculate probability 
% of guessing m numbers out of the r numbers
% Detailed explanation goes here
P = cxy(r,m)*cxy((n-r),(r-m))/cxy(n,r);
end

function cxy = cxy(x, y)
% combination calculation
cxy = factorial(x)/(factorial(y)*factorial(x-y));
end