function [I] = Simpson(x,y)
%This is a matlab function for integrating data using simpson's 1/3 rule. 
%  This function will check if there are an odd or even amount of
%  intervals. Trapezoid rule will be used if there are an odd number of
%  intervals. The function will also check if the inputs are the same
%  length and if x is equally spaced. 
% INPUTS:
% x - x data values in vector form.
% y - y data values in vector form.
% OUTPUTS:
% I - Integral of the data.
%
%Author: Andrew Hubler
%Date: 4/5/18
%--------------------------------------------------------------------------
n = length(x); m = length(y); %finds length of x and y vectors
if nargin < 2 || nargin > 3 
    error('2 input arguments are required')
end
if any(diff(x) < 0)
    error('x not monotonically ascending')
end
if n ~= m
    error('X and Y must be the same length')
end
k = diff(x);
if min(k) ~= max(k) %checks distance between x values
    error('Distance between x values must be equal') 
end
even = mod(n,2); % determines if the function has an odd or even number of intervals by dividing the number by two and sees if it is a whole number
if even == 0 
    warning('Odd number of intevals, trapezoid rule must be used on the last interval')
    newx = n - 1; %removes last row for trapezoid rule. 
else
    newx = n;
end
h = (max(x) - min(x))/newx; %determines step size
I = sum(y(1:2:newx - 2)+4*y(2:2:newx-1)+y(3:2:newx))*h/3; %Simpsons 1/3 formula to find integral
if even == 0
    I = I + ((y(n-1)+y(n))/2)*h; %determines integral with trapezoid rule if odd number of intervals
end
end
