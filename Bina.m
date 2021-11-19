function b = Bina(d)
%Decimal to binary
%   positive integer to be converted to
% a vector with 1’s and 0’s that represents the number in binary form
b=[];
if d < 0
    fprintf('Input %d should be positive integer!', d);
elseif d > 2^16
    fprintf('Input %d is too large to convert', d);
else
    m = d;
    while m > 0
        b = [mod(m,2) b];
        m = floor(m/2);
    end
end
fprintf('\n')
end