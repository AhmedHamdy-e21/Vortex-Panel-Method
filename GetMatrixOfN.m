function [X,Y,VMatrix] = GetMatrixOfN(V,x,y,N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

X=linspace(1,N,N);
Y=linspace(1,N,N);
disp(X(1))
for i=1:N
    
    for j=1:N
        VMatrix(i,j)=subs(V,[x,y] ,[X(j),Y(i)]);
        
    end

end
