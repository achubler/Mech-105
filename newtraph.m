function [root,ea,iter] = newtraph(func,dfunc,xr,es,maxit,varargin)
%Newton-Raphson root location zeroes
% This function locates the zeros of the function
%input:
%   func = name of function
%   dfunc = name of derivative of funciton
%   xr = initial guess
%   es = desired relative errror
%   p1,p2 = additional parameters
%Outputs:
%   root = real root
%   ea  = approximate relative error
%   iter = number of iterations

if nargin<3
    error('at least 3 inputs arguments required')
end
if nargin<4|isempty(es)
    es = 0.0001;
end
if nargin<5|isempty(maxit)
    maxit = 200;
end
iter = 0;
while(1)
    xrold = xr;
    xr = xr - (func(xr))/(dfunc(xr));
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr - xrold)/xr) * 100;
    end
    if ea <= es | iter >= maxit
        break
    end
end
root = xr
