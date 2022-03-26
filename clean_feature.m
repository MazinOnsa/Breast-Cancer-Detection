function [newX,new_y] = clean_feature(Xin,y_in)
[n,N]=size(Xin);
newX = [];
new_y = [];

for k=1:N
if sum(isnan(Xin(:,k)))==0
    newX = [newX ,  Xin(:,k)];
    new_y = [new_y , y_in(k)];
end
end