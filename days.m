function[nd] = days(mo,da,leap);
% This is a function that determines the elapsed days in a year. 
% Inputs
%   mo - number of months
%   da - number of days in a month
%   leap - leap year
% Output
%   nd - total number of elapsed days
%
%   Author: Andrew Hubler
%   Date: 1/30/2018
%--------------------------------------------------------------------------
dayspermonth = [31 28 31 30 31 30 31 31 30 31 30 31];
calender = [0 31 59 90 120 151 181 212 243 273 304 334];
if nargin < 2 || nargin >3 
    error('Incorrect number of input arguments');
elseif nargin == 2
    leap = 0
end
if leap == 1
    dayspermonth(2) = 29;
    calender = [0 31 60 91 121 151 182 213 244 273 305 335];
end
if mo < 0 || mo > 11
    error('Incorrect number of months in the year');
elseif da < 0 || da > dayspermonth(mo)
    error('Incorrect number of days in a month'); 
elseif leap < 0 || leap > 1
    error('Leap year can only be 0 or 1');
end
days_in_months = calender(mo);
nd = days_in_months+da;
fprintf('%3.d elapsed days to date',nd);
end


