function int = MITGaussHermite(n)
% returns int struct for gaussHermite quadrature with n points
% int.x = points
% int.w = weights
% int.n = number of points
% 
% recall that sum(f(x).*w) =~ int f(x) exp(-x^2) dx from -infty to +infty
%
% see http://mathworld.wolfram.com/Hermite-GaussQuadrature.html
% for algorithm

  Hn = hermitePoly(n);
  Hn_1 = hermitePoly(n-1);
  int.n = n;
  int.x = zeros(n,1); % just to make sure column vectors
  int.w = int.x; 
  int.x = roots(Hn);
  int.w = 2^(n-1)*factorial(n)*sqrt(pi) ./ ...
          (n*polyval(Hn_1,int.x)).^2;
  % sort x
  [int.x order]=sort(int.x);
  int.w=int.w(order); % make w same order
end