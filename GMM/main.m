 X = load('dataset/g2-2-30.txt');
 plotData2D(X);
 p = gmm(X,2);
 maxx = max(p,[],2);
 figure
 scatter(X(p(:,1)==maxx,1),X(p(:,1)==maxx,2),'r');
 hold on;
 scatter(X(p(:,2)==maxx,1),X(p(:,2)==maxx,2),'b');
 hold off;