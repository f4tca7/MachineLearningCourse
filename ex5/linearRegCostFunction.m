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


hypo = X * theta;
sqErr = (hypo - y).^2;
J = (1/(2*m)) * sum(sqErr);

theta_sq_sum = theta;
theta_sq_sum(1) = 0;
theta_sq_sum = sum(theta_sq_sum .^ 2);
J = J + (lambda/(2*m)) * theta_sq_sum;



err = hypo - y;
delta = X' * err;
reg_theta = theta;
reg_theta(1) = 0;
grad = delta / m + (lambda / m) * reg_theta; 

% =========================================================================

grad = grad(:);

end
