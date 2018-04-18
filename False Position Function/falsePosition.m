
function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter,varargin)
%This function will find the roots of a function where f(x)=0 using false postition
%methods (linear Interpolation) and bisection.
%   INPUTS:
%       func - the function being evaluated
%       xl - the lower guess
%       xu - the upper guess
%       es - the desired relative error
%       iter - the number of iterations desired
%   OUTPUTS:
%       root - the estimated location of the root
%       fx - the evaluated function at the root
%       ea - the approximate relative error (%)
%       iter - how many interations were performed.
% Author: Andrew Hubler
% Date: 2/15/18
%--------------------------------------------------------------------------
test = func(xl,varargin{:})*func(xu,varargin{:});   %test if there is a root in
if test > 0                                         %in the function
    error('no sign change')
end
if nargin < 4||isempty(es)    %check number of inputs
    es = 0.0001;
end
if nargin < 5||isempty(maxiter)
    maxiter = 200;
end
if nargin < 3
    error('Too few input arguments')
end
iter = 0;       %set initial arguments
ea = 100;
xr = xl;
format long
while (1)
    xrold = xr;
    num = double(func(xu)*(xl-xu));      %find xr using false position function
    den = double(func(xl))-double(func(xu));
    xr = xu - ((num)/(den));
    iter = iter + 1;
    if xr ~= 0                                  
        ea = abs((xr - xrold)/xr)*100;      %calculate approximate relative error
    end
    test = func(xl,varargin{:})*func(xu,varargin{:});   %find sign change
    if test < 0
        xu = xr;
    elseif test > 0 
        xl = xr;
    else
        ea = 0;
    end
    if ea <= es||iter >= maxiter    %check if error or iterations is equal or out of range,
        break                       %if so, stop function, otherwise continue running iterations
    end
end
root = xr;
fx = func(xr,varargin{:});          %print final results
fprintf('The root(s) of the function is(are) %.3f\n',root)
fprintf('The value of the function at the root(s) is(are) %.3f\n',fx)
fprintf('The approximated relative error is %.3f\n',ea)
fprintf('There were %.3f iterations performed',iter)
end
%--------------------------------------------------------------------------
% To call function:
%
%clear
%clc
%u = 0.55;
%g = 9.81;
%F = 150;
%m = 25;
%syms func(theta)
%func(theta) = ((u*m*g)/(cos(theta)+u*sin(theta))-F);
%[root,fx,ea,iter] = falsePosition(@(theta) func(theta), 0.7, 1.5);
