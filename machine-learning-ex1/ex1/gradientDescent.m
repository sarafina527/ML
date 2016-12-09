function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1); %J of every step vector
n = size(X,2)-1;

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    hthetaX = X*theta;
    gradJtheta = zeros(n+1,1);
    tmp1 = 0;tmp2 = 0;
    for i = 1:m
      %gradJtheta += (X(i,:)*theta-y(i))*X(i,:)';  %vectorization method
      tmp1 += (hthetaX(i)-y(i))*X(i,1);
      tmp2 += (hthetaX(i)-y(i))*X(i,2);
    end
    %gradJtheta /=m;   %vectorization method
    gradJtheta(1) = tmp1/m; %sim update
    gradJtheta(2) = tmp2/m;
    theta = theta - alpha*gradJtheta;
      





    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
