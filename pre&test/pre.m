data = load('data\Aggregation.txt');
X = data(:, 1:2);
y = data(:, 3);
dlmwrite('pre\Aggregation.nld',X,',');
dlmwrite('pre\Aggregation.cvs',y,',');

