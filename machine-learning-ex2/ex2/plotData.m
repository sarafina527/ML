function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
m = size(y);
Xp = zeros(m,2);
cp = 0;
Xn = zeros(m,2);
cn = 0;
for i=1:m
  if y(i)>0,
    cp = cp+1;
    Xp(cp,:) = X(i,:);
  else
    cn = cn+1;
    Xn(cn,:) = X(i,:);
  end
end
plot(Xp(1:cp,1),Xp(1:cp,2),'k+','LineWidth', 2,'MarkerSize',7);
plot(Xn(1:cn,1),Xn(1:cn,2),'ko','MarkerFaceColor','y','MarkerSize',7);
%clear Xp,Xn,cp,cn;
% =========================================================================



hold off;

end
