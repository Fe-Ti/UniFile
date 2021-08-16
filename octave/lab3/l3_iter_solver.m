function X=l3_iter_solver(A,B,eps)
  format long e
  delta = eps * (1 - norm(A)) / norm(A);
  X0 = B;
  X1 = A * X0 + B;
  while norm(X1 - X0) > delta
    X0 = X1;
    X1 = A * X0 + B;
  end;
  X = X1;
end