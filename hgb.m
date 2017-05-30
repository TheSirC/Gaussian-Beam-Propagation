function [ U ] = hgb()
%HGB Hermite Gaussian Beams
%   Function computing the Hermitte-Gauss beam for a laser

global lambda nbpixel;
p = 50;

%% SET PARAMETERS
% Physical parameters
k = 2*pi/lambda;

% The two parameters for the gaussian beam (and derived quantities)
z0 = 1e-3;
A0 = 1;
W0 = sqrt(lambda*z0/pi);
W = @(z) W0*sqrt(1+(z/z0)^2);
R = @(z) z*(1+(z/z0)^2);
Zeta = @(z) atan(z/z0);

% The coefficients for the Hermite-Gaussian (HG) beam of order (l,m)
A = [   0   0   0   0;
        1   0   0   0;
        0   0   0   0;
        0   0   0   0];
 % Trouve les indices des lignes où il y a des 0 (seulement pour les colonnes de 2 à la fin)
[line_idx, col_idx] = find(A(:,[1:end])== 1);
 
% On s'assure de ne garder qu'une fois chaque ligne
line_idx = unique(line_idx);
% On s'assure de ne garder qu'une fois chaque colonne
col_idx = unique(col_idx);

% Display Parameters
z = 1e-9;
x = linspace(-p*W(z),p*W(z),nbpixel);
y = linspace(-p*W(z),p*W(z),nbpixel);
[X Y] = meshgrid(x,y);
X = X(:);
Y = Y(:);

%% RUN THE SIMULATION
% Preallocate Memory
U = zeros(length(X),1);
Utemp = zeros(length(X),1);
Utemp2 = zeros(length(X),1);
% Calculate Values that are independent of HG Polynomial order
lpf = exp(-1i*k*z - 1i*k*(X.^2 + Y.^2)/(2*R(z))); %lateral phase factor
u = sqrt(2)*X/W(z);
v = sqrt(2)*Y/W(z);
for l = 1:size(A,1)
    %if there are any terms of this order, calculate the x-HG (so you don't
    %need to repeat for each value of m)
    if sum(A(l,:) ~= 0) ~= 0
       Utemp2 = (W0/W(z))*polyval(hermitePoly(l-1),u).*exp(-u.^2/2); 
    else
       continue;
    end
    for m = 1:size(A,2)
        if A(l,m) ~= 0                
            Utemp = Utemp2.*(polyval(hermitePoly(m-1),v)).*exp(-v.^2/2);
            Utemp = A(l,m)*Utemp.*lpf*exp(1i*(l+m+1)*Zeta(z));
            U = U + Utemp;
        end
    end
end

U = reshape(U,nbpixel,nbpixel);
end

