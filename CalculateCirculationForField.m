function Gamma= CalculateCirculationForField(numOfPoints,r,X,Y,Vx,Vy,x0,y0,N)
[XX,YY]=meshgrid(X,Y);
thetaEnd=2*pi-((2*pi)/numOfPoints);
t=linspace(0,thetaEnd,numOfPoints);
xCoor=r*cos(t)+x0;
yCoor=r*sin(t)+y0;
VxCoor=interp2(XX,YY,Vx,xCoor,yCoor);
VyCoor=interp2(XX,YY,Vy,xCoor,yCoor);

Gamma=-(trapz(xCoor,VxCoor)+trapz(yCoor,VyCoor));




figure(1);                                                                      
hold on;                                                                          % Get ready for plotting
quiver(XX,YY,Vx,Vy,'r-','AutoScale','off');                                       % Grid velocity vectors
plot(XX,YY,'ko','MarkerFaceColor','k');                                           % Grid points
quiver(xCoor,yCoor,VxCoor,VyCoor,'b-','AutoScale','off');                         % Circle velocity vectors
plot(xCoor,yCoor,'ko','MarkerFaceColor','b');                                     % Circle contour


end

