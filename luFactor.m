function [L,U,P] = luFactor(A)
% This algorithm uses LU Factorization with parital pivoting to determine
% the Lower and Upper matrixes of the square matrix
%   
%INPUTS:
% A - coefficient matrix
%OUTPUTS
% L - Lower triangular matrix
% U - Upper triangular matrix
% P - the pivot matrix
%
%Author: Andrew Hubler
%Date Created: 3/21/2018
%--------------------------------------------------------------------------
format long
[n,m]=size(A); %determine the rows and colums of the matrix
if n~=m
    error('Matrix A must be square');   %display an error if the matrix is not a square
end
if nargin > 1
    error('Too many input arguments.') %display an error if the user tries to input more than one matrix
end
    [m, n] = size(A); L=eye(n); P=eye(n); %make L and P into an identity matrix
    U=A;  
    for k=1:m-1                %Run for the amount of variables that you need to solve besides the last one.
        pivot=max(abs(U(k:m,k)));   %Partial pivoting 
        for j=k:m
            if(abs(U(j,k))==pivot)  %The use of the absolut value is to find the number with the greatest magnitude in the column
                ind=j;              
            end
        end
        U([k,ind],k:m)=U([ind,k],k:m); %interchange rows
        L([k,ind],1:k-1)=L([ind,k],1:k-1); %interchange rows
        P([k,ind],:)=P([ind,k],:); %interchange rows
        for j=k+1:m
            L(j,k)=U(j,k)/U(k,k);   %Determines final L matrix
            U(j,k:m)=U(j,k:m)-L(j,k)*U(k,k:m); %Determines final U matrix
        end
    end
L=L  %For displaying purposes only
U=U
P=P
end

