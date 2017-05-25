function image=propagation(source,z) 
% Fonction de propagation en approximation scalaire non paraxiale
% source est une matrice (plan objet)
% z la distance en cm.

global lambda;
global nbpixel;
global nb;
global m;
global n;
global taillefenetre;

TFsource=fft2(fftshift(source));    % TF de source
%[m,n]=meshgrid([1:nbpixel]);

noyau1=exp(1i*(2*pi/lambda)*z*sqrt(1-lambda^2*((m-nb-1).^2+(n-nb-1).^2)/taillefenetre^2));

noyau2=fftshift(noyau1);

image=fftshift(ifft2(noyau2.*TFsource));

