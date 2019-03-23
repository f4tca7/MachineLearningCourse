function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    %temp_theta = theta;
    %temp_theta(1) = theta(1) - alpha*(sum((X * theta) - y) / m);
    
    hypo = theta(1) * X(:,1) + theta(2) * X(:,2);
    tmp_gen = hypo - y;
    
    tmp_theta_0 = (sum(hypo - y)) / m;
    tmp_theta_0 = theta(1) - tmp_theta_0 * alpha;
    
    
    tmp_theta_1 = tmp_gen .* X(:,2);
    tmp_theta_1 = sum(tmp_theta_1) / m;
    tmp_theta_1 = tmp_theta_1 * alpha;  
    tmp_theta_1 = theta(2) - tmp_theta_1;
    theta = [tmp_theta_0; tmp_theta_1];
    
    disp ("The value of theta is:"), disp (theta);
    
    %temp_a = theta(2) - alpha*(sum(((X * theta) - y)) / m);
    %temp_a
    %theta = temp_theta;
  



    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
