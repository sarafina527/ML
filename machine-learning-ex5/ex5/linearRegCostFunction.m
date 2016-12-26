function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
hthetaX = X*theta;
examp = 1/2/m*(hthetaX-y)'*(hthetaX-y);
w = theta(2:end);
regularizer = lambda/2/m*sum(w.*w);
J = examp + regularizer;

exampgrad = 1/m*X'*(hthetaX-y);
regugrad = lambda/m*theta;
regugrad(1) = 0;
grad = exampgrad+regugrad;


% =========================================================================

grad = grad(:);

end
