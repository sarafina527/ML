%% Initialization
clear ; close all; clc

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%  The following code will load the dataset into your environment and plot
%  the data.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

% Load from ex5data1: 
% You will have X, y, Xval, yval, Xtest, ytest in your environment
load ('ex5data1.mat');   %contain X,Xtest,Xval y,ytest,yval

% m = Number of examples
m = size(X, 1);

% Plot training data
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
hold on;
% Plot validate data
plot(Xval,yval,'bo','MarkerSize',10,'LineWidth',1.5);
% Plot validate data
plot(Xtest,ytest,'go','MarkerSize',10,'LineWidth',1.5);
hold off;

%Feature Mapping
p = 8;
% Map X onto Polynomial Features and Normalize
X_poly = polyFeatures(X, p);
[X_poly, mu, sigma] = featureNormalize(X_poly);  % Normalize
X_poly = [ones(m, 1), X_poly];                   % Add Ones

% Map X_poly_test and normalize (using mu and sigma)
X_poly_test = polyFeatures(Xtest, p);
X_poly_test = bsxfun(@minus, X_poly_test, mu);
X_poly_test = bsxfun(@rdivide, X_poly_test, sigma);
X_poly_test = [ones(size(X_poly_test, 1), 1), X_poly_test];         % Add Ones

% Map X_poly_val and normalize (using mu and sigma)
X_poly_val = polyFeatures(Xval, p);
X_poly_val = bsxfun(@minus, X_poly_val, mu);
X_poly_val = bsxfun(@rdivide, X_poly_val, sigma);
X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val];           % Add Ones

%Adjusting the regularization parameter
lambda = 1;
theta = trainLinearReg(X_poly, y, lambda);

% Plot training data and fit
figure(1);
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
plotFit(min(X), max(X), mu, sigma, theta, p);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
axis([-80 80 0 160]);
title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));

% Plot learning curve
figure(2);
[error_train, error_val] = ...
    learningCurve(X_poly, y, X_poly_val, yval, lambda);
plot(1:m, error_train, 1:m, error_val);

title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Train', 'Cross Validation')

lambda = 100;
theta = trainLinearReg(X_poly, y, lambda);

% Plot training data and fit
figure(3);
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
plotFit(min(X), max(X), mu, sigma, theta, p);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
axis([-80 80 0 40]);
title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));

% Plot learning curve
figure(4);
[error_train, error_val] = ...
    learningCurve(X_poly, y, X_poly_val, yval, lambda);
plot(1:m, error_train, 1:m, error_val);

title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 200])
legend('Train', 'Cross Validation')

% best lambda=3
lambda = 3;
theta = trainLinearReg(X_poly, y, lambda);
% test error
error_test = linearRegCostFunction(X_poly_test,ytest,theta,0);
printf('test errot(lambda = %f) is %f\n', lambda,error_test);

%random
lambda = 0.01;
Jtrain = zeros(m,1);
Jval = zeros(m,1);
for i=1:m
  for j=1:50
    randiv = randperm(m)(1:i);
    Xi = X_poly(randiv,:);
    yi = y(randiv);
    theta = trainLinearReg(Xi,yi,lambda);
    X_vali = X_poly_val(randiv,:); 
    yvali = yval(randiv);
    error_testi = linearRegCostFunction(Xi,yi,theta,0);
    error_vali = linearRegCostFunction(X_vali,yvali,theta,0);
    Jtrain(i)+=error_testi;
    Jval(i)+=error_vali;
  end
  Jtrain(i) /=50;
  Jval(i) /=50;
end;
% Plot learning curve
figure(5);
plot(1:m, Jtrain, 1:m, Jval);

title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Train', 'Cross Validation')
  
