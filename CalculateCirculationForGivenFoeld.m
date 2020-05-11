% % http://www2.math.umd.edu/~jmr/241/lineint1.html#1
% % http://www2.math.umd.edu/~jmr/241/homework.html
syms x y z t 
realdot=@(u,v) u*transpose(v);

F = [y^2,sqrt(4-z^2),x];

tcube= [t,t^2,t^3];

Fpar=subs(F,[x,y,z],tcube);     %% so we can substitute for instance by the polar form here

integrand=realdot(Fpar,diff(tcube,t));   %% I'm happy 

integral=double(int(integrand,t,0,1));    %% int is not an integer however is a integral that takes the variable and limits
alternate=quadl(@(t) eval(vectorize(integrand)),0,1)                     %% lobatto quadrature integration




%%
%problem 1
syms x y z t r
u=y/((x^2)+(y^2));
v=-x/((x^2)+(y^2));
G=[u,v];
unitcircle=[r*cos(t),r*sin(t)]

Gpar=subs(G,[x,y],unitcircle);

integrand=realdot(Gpar,diff(unitcircle,t))
integral=int(integrand,t,0,2*pi)

% integral=double(int(integrand,t,0,2))

N = 5;   
X  = linspace(0,N-1,N)';                             % X grid points
Y  = linspace(0,N-1,N)';   
[XX,YY] = meshgrid(X,Y);   
                                                     % Y-axis label


x= 0:0.01:10;
y= 0:0.01:10;% X grid points

plot3(y,x,u);






