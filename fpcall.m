clear
clc
u = 0.55;
g = 9.81;
F = 150;
m = 25;
syms func(theta)
func(theta) = ((u*m*g)/(cos(theta)+u*sin(theta))-F);
[root,fx,ea,iter] = falsePosition(@(theta) func(theta), 0.7, 1.5);
