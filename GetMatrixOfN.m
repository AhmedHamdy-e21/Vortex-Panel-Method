function [VMatrix,X,Y] = GetMatrixOfN(V,x,y,N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

X=linspace(-N,N-1,N)';
Y=linspace(-N,N-1,N)';

VMatrix=zeros(N,N);
for i=1:N
    
    for j=1:N
        VMatrix(i,j)=subs(V,[x,y] ,[X(j),Y(i)]);
        
    end

end

