function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
theta_bench = theta;
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    
    % Step-by-step gradient descent
    theta_temp = zeros(size(theta), 1);    
    hypo = zeros(size(X(:,1)), 1);
    for i = 1 : m
      for j = 1 : size(theta)
        hypo(i) = hypo(i) + theta(j) * X(i,j);        
      endfor      
    endfor
    
    for k = 1 : size(theta)
      delta = 0;
      for l = 1 : m  
        err = hypo(l) - y(l);        
        delta = delta + err * X(l,k);   
      endfor
      theta_loc = delta / m;
      theta_loc = theta(k) - theta_loc * alpha;
      theta_temp(k) = theta_loc;
    endfor
    theta = theta_temp;
      
    % Vectorized version of the code above:
##     hypo = X * theta;
##     err = hypo - y;
##     delta = X' * err;
##     theta = theta - (alpha / m) * delta;
    
      
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
