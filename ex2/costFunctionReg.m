function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


hypo = sigmoid(X * theta);
J = (-1 * y' * log(hypo) - (1 - y)'*log(1-hypo))/m;


theta_sq_sum = theta;
theta_sq_sum(1) = 0;
theta_sq_sum = sum(theta_sq_sum .^ 2);
J = J + (lambda/(2*m)) * theta_sq_sum
disp('J: '), disp(J);

err = hypo - y;
delta = X' * err;
reg_theta = theta;
reg_theta(1) = 0;
grad = delta / m + (lambda / m) * reg_theta; 
disp('grad: '), disp(grad);



% =============================================================

end
