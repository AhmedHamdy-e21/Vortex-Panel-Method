% % http://www2.math.umd.edu/~jmr/241/lineint1.html#1
% % http://www2.math.umd.edu/~jmr/241/homework.html

%

clear; clc;

syms x y z t                                                        %% Define the variables

realdot=@(u,v) u*transpose(v);                                      %% Define the dot product inside the integral

F = [y^2,sqrt(4-z^2),x];                                            %% The function components itself AKA Velocity field

tcube= [t,t^2,t^3];                                                 %% The parameters, or the given contour that we will substitute with

Fpar=subs(F,[x,y,z],tcube);                                         %% Fpar is the parametrized version of the velocity field

integrand=realdot(Fpar,diff(tcube,t));                              %% The integrand inside after we get the dot product

Integral=double(int(integrand,t,0,1));                              %% Finally the value of the line integral within the contour (tcube)

alternate= quadl(@(t) eval(vectorize(integrand)),0,1);               %% lobatto quadrature integration, Another way of calculating the integral. We can use Gauss Quadrature.. etc




%%
% Polar parametrization

clear;
clc;
syms x y  theta r                                                   %% Define the independant variables

u=y/((x^2)+(y^2));                                                  %% the given velocity field in the u direction

v=-x/((x^2)+(y^2));                                                 %% the given velocity field in the v direction

G=[u,v];                                                            %% Total velocity field 

unitcircle=[r*cos(theta),r*sin(theta)];                             %% contour around a unit circle (r is one here) but we realize that the integral value is independant of r

Gpar=subs(G,[x,y],unitcircle);                                      %% The parametrized version of the velocity field (G parametrized)

realdot=@(u,v) u*transpose(v);                                      %% Dot product definition 

integrand=realdot(Gpar,diff(unitcircle,theta));                     %% integrand

integral=-int(integrand,theta,0,2*pi);                                  %% the value of circulation ^_^, be careful of the negative sign, it's conventional in circulation to take it CW



N=10;
step=0.01;


r=1;
x0=0;
y0=0;
numOfPoints=200;                         %% resolution of points 

[U,X,Y]=GetMatrixOfN(u,x,y,N);
[V,X,Y]=GetMatrixOfN(v,x,y,N);


Gamma= CalculateCirculationForField(numOfPoints,r,X,Y,V,U,x0,y0)



