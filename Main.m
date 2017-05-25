%% Diffraction par une fente
clear all; close all;

%----------- déclarations -------------------
global nbpixel;     % nombre de pixels par ligne (et par colonne car fenetre carrée)
global nb; % la moitié
global lambda;       % en cm
global taillefenetre;   % en cm
global m;
global n;

%------------ paramètres fixés ----------------------
nbpixel = 1024;
lambda = 0.8e-4; % en cm
taillefenetre =  10;  % en cm
b = 0.1; % taille diaphragme carré en cm (0.25)

%------------ paramètres optimisés ----------------------

e = 100; % "épaisseur de phase" en Âµm
P = 700; % mW %10, 300, 500, 2000

%-----------------------------------------------

dx = taillefenetre/(nbpixel-1);
nb = nbpixel/2;
[m,n]=meshgrid([1:nbpixel]);

%------ initialisation collimatée -------%

%entree = hypergauss2(1, 1, nb+1, nb+1);
entree = hgb;
figure;
imagesc(abs(entree).^2); title('Intensité en entrée'); 

%---------------------------------------

% % diaph = carre(b,nb,nb);
% diaph = 1;
% % figure;
% % imagesc(diaph); title('Forme du diaphragme');
% % entree = abs(reshape(entree,nb,nb)).^2.*diaph;
% entree = entree.*diaph; 

%------ TEST PROPA ---------------%
prop = abs(propagation(entree,1)).^2; %
prop1 = abs(propagation(entree,1e3)).^2; %
figure;
subplot(1,2,1); imagesc(prop);title('Intensité sur le capteur à 1m');
subplot(1,2,2); imagesc(prop1);title('Intensité sur le capteur à 10m');
