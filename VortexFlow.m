Strength=10;
x0=0;
y0=0;
N=10;
R=5;
CircleResolution=200;
X=linspace(-N,N,N);
Y=linspace(-N,N,N);
[XX,YY]=meshgrid(X,Y);
for i = 1:N                                                          
    for j = 1:N                                                      
        x       = XX(i,j);
        y       = YY(i,j);
        dx      = x - x0;
        dy      = y - y0;
        r       = sqrt(dx^2 + dy^2);
        Vx(i,j) = (Strength*dy)/(2*pi*r^2);
        Vy(i,j) = (-Strength*dx)/(2*pi*r^2);
    end
end
Gamma=CalculateCirculationForField(CircleResolution,R,X,Y,Vx,Vy,x0,y0,N)