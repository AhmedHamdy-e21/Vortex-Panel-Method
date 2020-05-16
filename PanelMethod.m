clc;

% load= 'Circle';
AoA=0;
% numB=9;
% t0=22.5;
% theta=linspace(0,360,numB)';
% theta=theta+t0;
% 
% XB=cosd(theta);
% YB=sind(theta);
% numPan=length(XB)-1;
% 
% edge=zeros(numPan,1);
% for i=1:numPan
%     edge(i)=(XB(i+1)-XB(i))*(YB(i+1)+YB(i));
% end
% sumEdge=sum(edge);
% 
% if(sumEdge<0)
%     fprintf('Points are CCW');
%     XB=flipud(XB);
%     YB=flipud(YB);
% elseif (sumEdge>0)
%     fprintf('Points are CW');
%    Error using textscan
% Invalid file identifier. Use fopen to generate a valid file identifier.
% end
%%
saveFlnmAF = 'Airfoil';                                            % File name
fidAirfoil = fopen(saveFlnmAF);                                             % Open file for reading

dataBuffer = textscan(fidAirfoil,'%f %f','CollectOutput',1,...              % Read data from file
                                 'Delimiter','','HeaderLines',0);
fclose(fidAirfoil);                                                         % Close file
delete(saveFlnmAF);

% Separate boundary points
XB = dataBuffer{1}(:,1);                                                    % Boundary point X-coordinate
YB = dataBuffer{1}(:,2);  
edge=zeros(numPan,1);
for i=1:numPan
    edge(i)=(XB(i+1)-XB(i))*(YB(i+1)+YB(i));
end
sumEdge=sum(edge);

if(sumEdge<0)
    fprintf('Points are CCW');
    XB=flipud(XB);
    YB=flipud(YB);
elseif (sumEdge>0)
    
    fprintf('Points are CW');
end
numPan=length(XB)-1;
%%

XC=zeros(numPan,1);
 YC=zeros(numPan,1);
 S=zeros(numPan,1);
 PhiD=zeros(numPan,1);
 for i=1:numPan
     XC(i)=0.5*(XB(i)+XB(i+1));
     YC(i)=0.5*(YB(i)+YB(i+1));
     dx=XB(i+1)-XB(i);
     dy=YB(i+1)-YB(i);
     S(i)=sqrt((dx^2+dy^2));
     PhiD(i)=atan2d(dy,dx);
     if(PhiD(i)<0)
         PhiD(i)=PhiD(i)+360;
     end
 end
 deltaD=PhiD+90;
 betaD=deltaD-AoA;
 betaD(betaD>360)=betaD(betaD>360)-360;
 
 
 %%Plotting
%  T=linspace(0,360,1000);
%  x=cosd(T);
%  y=sind(T);
 
 figure(1);
 hold on;
 grid off;
 fill(XB,YB,'b');
 
%  
%  plot(x,y,'k--');
 
 
 for i=1:numPan
     X(1)=XC(i);  %%First point 
     X(2)=XC(i)+S(i)*cosd(deltaD(i)); %%the other boundary point
        
     Y(1)=YC(i);
     Y(2) = YC(i) + S(i)*sind(deltaD(i));                                    % Panel ending Y point
    if (i == 1)                                                             % For first panel
        p1 = plot(X,Y,'b-','LineWidth',2);                                  % Plot first panel normal vector
    elseif (i == 2)                                                         % For second panel
        p2 = plot(X,Y,'g-','LineWidth',2);                                  % Plot second panel normal vector
    else                                                                    % For every other panel
        plot(X,Y,'r-','LineWidth',2);                                       % Plot panel normal vector
    end
     
 end
 
 legend([p1,p2],{'Panel 1','Panel 2'});                                      % Add legend
xlabel('X Units');                                                          % Set X-label
ylabel('Y Units');                                                          % Set Y-label
axis equal;                                                                 % Set axes equal
zoom reset;  
 
 
 
 
 