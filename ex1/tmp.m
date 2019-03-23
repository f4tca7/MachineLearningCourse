X = magic(7);
##A = magic(7);
##B = magic(7);
##C = magic(7);
##D = magic(7);

for i = 1:7
  for j = 1:7
    A(i, j) = log(X(i, j));
    B(i, j) = X(i, j) ^ 2;
    C(i, j) = X(i, j) + 1;
    D(i, j) = X(i, j) / 4;
  end
end

A
B
C
D

C1 = X + 1
D1 = X/4
B1 = X.^2
B2 = X^2