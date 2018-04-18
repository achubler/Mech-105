function [s_matrix] = magic_matrix(r,cc);
% Magic matrix: this function creates a matrix where the value of each
% element in the first row is the number of the column and the value of
% each element in the first column is the number of the row. Additionally,
% the rest of the elements has a value equal to the sum of the
% element above it and element to the left.
% Input:
%   r - number of rows used
%   cc - number of columns used
% Outputs:
%  s_matrix - the special matrix created
%
%   Date: 1/30/2018
%   Author: Andrew Hubler
%--------------------------------------------------------------------------
if nargin < 2 || nargin > 2 %if the user inputs any more or less than two arguments, and error will be displayed
    error('Invalid amount of arguments!')
end
for i=1:r
    for j=1:cc
        if i == 1
            s_matrix(i,j)=j;    % the element in the first row is the number of the column
        elseif j == 1
            s_matrix(i,j)=i;    % the element in the first column is the number of the row
        else
            s_matrix(i,j)= s_matrix(i-1,j)+s_matrix(i,j-1); %the element is the sum of the element abouve it
        end                                                 %and the element to the left
    end
end
disp(s_matrix)  % This displays the final matrix according to its rows and columns

