%%
% The goal is to calculate the circulation for a given field values
% we need to define Field 
% Then define the velocity components 
% use interpolation to evaluate the velocity field on a given contour(Circle)
% 
clear;clc;
N= 5;                                           %% number of points 

Vx=rand(N,N)
Vy=rand(N,N);
X=linspace(0,N-1,N)';

Y=linspace(0,N-1,N)';

[XX,YY]=meshgrid(X,Y);


%Create the contour (Circle)
r=0.2;
x0=2;
y0=2;
numOfPoints=50;                         %% resolution of points 

% Circulation computation

Gamma= CalculateCirculationForField(numOfPoints,r,X,Y,Vx,Vy,x0,y0)



quiver(XX,YY,Vx,Vy,'r-','AutoScale','off');   


