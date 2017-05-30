%fonction hypergaussienne d'ordre n et de waist w (cm),en amplitude.

function y=hypergauss2(n,w,a,b) 

% n : ordre de l'hypergaussienne
% w : waist en cm
% a,b : coordonnées du centre en pixels en partant du haut à gauche


global nbpixel;
global taillefenetre;
global nb;
global lambda;

[i,j]=meshgrid([1:nbpixel]);              % coordonnées en pixels (point (1,1) en haut à gauche)
w_pixel=(w*(nbpixel-1)/taillefenetre);    % taille du waist en pixels
r_pixel=sqrt((i-a).^2+(j-b).^2);  % matrice avec le zéro au centre. C'est la distance en pixels

y=exp(-r_pixel.^(2*n)/w_pixel^(2*n));  % hypergaussienne d'ordre n

%y=exp(-(k-nb).^n/w_pixel^n).*exp(-(l-nb).^n/w_pixel^n); % front de phase plan.
