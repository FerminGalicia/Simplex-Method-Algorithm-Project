clc; clear all; close all;
% Turning on diary command 
diary on
% Simplex Algorithm 

fprintf('*******\n');
fprintf('Problem 1: \n');
% Input matrix A, and vectors b and c in chronological order.
A1 = [0 0 1 0 1 0; -0.3 0 0 1 1.5 0; 1 0 0 0 -1 1; 1 1 0 0 -1 0];
b1 = [2100; 2700; 400; 1400];
c1 = [2 0 0 0 -18 0 25200];

x1 = simplexfunc(A1,b1,c1);

fprintf('********\n');
fprintf('Problem 2: \n');
A2 = [0 3000 1 0 5000; 0 1 0 1 1; 1 0 0 0 -1];
b2 = [25000; 7; 5];
c2 = [0 -15000 0 0 -20000 100000];

x2 = simplexfunc(A2,b2,c2);

fprintf('*********\n');
fprintf('Problem 3: \n');
A3 = [5000 3000 2000 1 0 0; 1 1 1 0 1 0; 1 0 0 0 0 1];
b3 = [50000; 12; 5];
c3 = [-20000 -15000 -12000 0 0 0 0];

x3 = simplexfunc(A3,b3,c3);

fprintf('*************\n');
fprintf('Problem 4: \n');
A4 = [-1 0 1 1; 2 1 0 -1];
b4 = [150; 50];
c4 = [250 0 0 -225 18750];

x4 = simplexfunc(A4,b4,c4);
% Turning off diary command
diary off