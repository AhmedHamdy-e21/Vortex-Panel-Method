r=1;
x0=0;
y0=0;
Points=200;
Vinf=5;
Alpha=0;
N=10;
X=linspace(-N,N,N);
Y=linspace(-N,N,N);
[XX,YY]=meshgrid(X,Y);
for i=1 :N
    for j=1:N
       Vx(i,j)=Vinf*cos(Alpha);
       Vy(i,j)=Vinf*sin(Alpha);
    end
    
end

G=CalculateCirculationForField(Points,r,X,Y,Vx,Vy,x0,y0,N);