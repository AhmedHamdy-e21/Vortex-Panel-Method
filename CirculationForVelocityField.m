%%
% The goal is to calculate the circulation for a given field values
% we need to define Field 
% Then define the velocity components 
% use interpolation to evaluate the velocity field on a given contour(Circle)
% 
N= 3;                                           %% number of points 

Vx=rand(N,N);
Vy=rand(N,N);
X=linspace(0,N-1,N)';

Y=linspace(0,N-1,N)';

[XX,YY]=meshgrid(X,Y);


%Create the contour (Circle)
r=2;
x0=2;
y0=2;
numOfPoints=50;                         %% resolution of points 

% Circulation computation


thetaEnd=2*pi-((2*pi)/numOfPoints);
t=linspace(0,thetaEnd,numOfPoints);
xCoor=r*cos(t)+x0;
yCoor=r*sin(t)+y0;
VxCoor=interp2(XX,YY,Vx,xCoor,yCoor);
VyCoor=interp2(XX,YY,Vy,xCoor,yCoor);

Gamma=-(trapz(xCoor,VxCoor)+trapz(yCoor,VyCoor));



quiver(XX,YY,Vx,Vy,'r-','AutoScale','off');   


