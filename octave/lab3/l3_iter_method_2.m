% AX = B
disp(sprintf('\nUsing the 2nd transformation method\n'));
d = [ 10^-8 10^-7 10^-9 10^-6;
      10^-9 10^-6 10^-8 10^-7;
      10^-8 10^-6 10^-8 10^-10;
      10^-8 10^-7 10^-9 10^-6 ]; % random very small numbers
%  (inv(A) - d) * AX == (inv(A) - d) * B
alpha = d * A
beta = (inv(A) - d) * B
norm_alpha = norm(alpha)
X6 = l3_iter_solver(alpha, beta, 10^-5)
disp(sprintf('X6 error is %ld', norm(A * X6-B)));
