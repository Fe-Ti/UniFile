isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0; % detecting type of CAS
% Creating a simple anonymous function 
% for translating SymPy's flat expression to MATLAB/Octave styled one 
sympy2mos = @ (exp_str) strrep(exp_str,"**","^"); % simply replace python power


disp(sprintf('Task 1\n------'));
disp(sprintf('Part 1\n------'));
a1 = 1;
b1 = sym(144)/100; 
syms sx;
fsx = 1 + sym(9)/10 * sx + sym(8)/10 * sx ^ 2 + sym(7)/10 * sx ^ 3 + sym(5)/10 * sx ^ 4;

nd_I = int(fsx);
d_I = int(fsx,a1,b1);

I = double(d_I)
if isOctave  % Use SymPy flat output as it should be (by default) in MATLAB.
  disp(sprintf("nd_I = %s",sympy2mos(nd_I.flat)));
  disp(sprintf("d_I = %s",d_I.flat));
else % or simply output in MATLAB
  nd_I
  d_I
end

% plotting
gx = [0:0.001:10];
plot(gx, l4t1_fnc(gx));
grid on; ylabel "f(x)"; xlabel "x"; title 'l4t1';

fsx_d1 = diff(fsx, 1);
fsx_d2 = diff(fsx_d1, 1);
fsx_d4 = diff(fsx_d2, 2);

if isOctave % And again use flat output as it should be (by default) in MATLAB.
  disp(sprintf("fsx_d1 = %s", sympy2mos(fsx_d1.flat)));
  disp(sprintf("fsx_d2 = %s", sympy2mos(fsx_d2.flat))); 
  disp(sprintf("fsx_d4 = %s", fsx_d4.flat)); 
else % or if not in Octave simply output the values
  fsx_d1
  fsx_d2
  fsx_d4
end

a = 1; b = 1.44;
x = a:0.001:b;
h = b - a;

M1 = max(abs(2.*x.^3 + 21.*x.^2./10 + 8.*x./5 + 9./10))
M2 = max(abs(6.*x.^2 + 21.*x./5 + 8./5))
M4 = 12

I_lr = h * l4t1_fnc(a)
taR_lr = (M1 * (b - a) * h) / 2
trR_lr = taR_lr / I
eaR_lr = abs(I - I_lr)
erR_lr = eaR_lr / I

I_rr = h * l4t1_fnc(b)
taR_rr = (M1 * (b - a) * h) / 2
trR_rr = taR_rr / I
eaR_rr = abs(I - I_rr)
erR_rr = eaR_rr / I

I_mr = h * l4t1_fnc((a + b)/2)
taR_mr = (M2 * (b - a) * h^2) / 24
trR_mr = taR_mr / I
eaR_mr = abs(I - I_mr)
erR_mr = eaR_mr / I

I_tr = h * (l4t1_fnc(a) + l4t1_fnc(b)) / 2
taR_tr = (M2 * (b - a) * h^2) / 12
trR_tr = taR_tr / I
eaR_tr = abs(I - I_tr)
erR_tr = eaR_tr / I

I_sm = h / 6 * (l4t1_fnc(a) + 4 * l4t1_fnc((a + b) / 2) + l4t1_fnc(b))
taR_sm = (M4 * h^5) / 2880
trR_sm = taR_sm / I
eaR_sm = abs(I - I_sm)
erR_sm = eaR_sm / I

disp('------');
disp(sprintf('Part 2\n------'));
error = 0.0001
lr_e = 1;
mr_e = lr_e;
rr_e = lr_e;
tr_e = lr_e;
sm_e = lr_e;
while (sm_e > error) || (tr_e > error) || (rr_e > error) || (mr_e > error) || (lr_e > error)
  h = h / 2;
  lr_e = (M1 * (b - a) * h) / 2;
  mr_e = (M2 * (b - a) * h^2) / 24;
  rr_e = lr_e;
  tr_e = (M2 * (b - a) * h^2) / 12;
  sm_e = (M4 * h^5) / 2880;
end

disp(sprintf("lr_e = %d", lr_e));
disp(sprintf("rr_e = %d", rr_e));
disp(sprintf("mr_e = %d", mr_e));
disp(sprintf("tr_e = %d", tr_e));
disp(sprintf("sm_e = %d", sm_e));
disp(sprintf("h = %d", h));
n = (b-a)/h

sum_fxi_0_n1 = 0;
sum_fxi_1_n = 0;
sum_fxi12_0_n1 = 0;
sum_fxi_1_n1 = 0;
for i = 1:n
  sum_fxi_0_n1 = sum_fxi_0_n1 + l4t1_fnc(a + (i - 1) * h);
  sum_fxi_1_n = sum_fxi_1_n + l4t1_fnc(a + i * h);
  sum_fxi12_0_n1 = sum_fxi12_0_n1 + l4t1_fnc(a + (i - 1) * h + h / 2);
  if i < n
    sum_fxi_1_n1 = sum_fxi_1_n1 + l4t1_fnc(a + i * h);
  end
end

I_lr_c = h * sum_fxi_0_n1
taR_lr = (M1 * (b - a) * h) / 2
trR_lr = taR_lr / I
eaR_lr = abs(I - I_lr_c)
erR_lr = eaR_lr / I

I_rr_c = h * sum_fxi_1_n
taR_rr = (M1 * (b - a) * h) / 2
trR_rr = taR_rr / I
eaR_rr = abs(I - I_rr_c)
erR_rr = eaR_rr / I

I_mr_c = h * sum_fxi12_0_n1
taR_mr = (M2 * (b - a) * h^2) / 24
trR_mr = taR_mr / I
eaR_mr = abs(I - I_mr_c)
erR_mr = eaR_mr / I

I_tr_c = h * ((l4t1_fnc(a) + l4t1_fnc(b)) / 2 + sum_fxi_1_n1)
taR_tr = (M2 * (b - a) * h^2) / 12
trR_tr = taR_tr / I
eaR_tr = abs(I - I_tr_c)
erR_tr = eaR_tr / I

I_sm_c = h / 6 * (l4t1_fnc(a) + 4*sum_fxi12_0_n1 + 2*sum_fxi_1_n1 + l4t1_fnc(b))
taR_sm = (M4 * h^5) / 2880
trR_sm = taR_sm / I
eaR_sm = abs(I - I_sm_c)
erR_sm = eaR_sm / I
