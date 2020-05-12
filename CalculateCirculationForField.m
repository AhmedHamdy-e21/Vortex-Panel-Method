function Gamma= CalculateCirculationForField(numOfPoints,r,X,Y,Vx,Vy,x0,y0)
[XX,YY]=meshgrid(X,Y);
thetaEnd=2*pi-((2*pi)/numOfPoints);
t=linspace(0,thetaEnd,numOfPoints);
xCoor=r*cos(t)+x0;
yCoor=r*sin(t)+y0;
VxCoor=interp2(XX,YY,Vx,xCoor,yCoor);
VyCoor=interp2(XX,YY,Vy,xCoor,yCoor);

Gamma=-(trapz(xCoor,VxCoor)+trapz(yCoor,VyCoor));

end

