%% Diffraction par une fente
clear all; close all;

%----------- d�clarations -------------------
global nbpixel;     % nombre de pixels par ligne (et par colonne car fenetre carr�e)
global nb; % la moiti�
global lambda;       % en cm
global taillefenetre;   % en cm
global m;
global n;

%------------ param�tres fix�s ----------------------
nbpixel = 256;
lambda = 0.8e-4; % en cm
taillefenetre =  10;  % en cm
b = 0.1; % taille diaphragme carr� en cm (0.25)
dx = taillefenetre/(nbpixel-1);
nb = nbpixel/2;
[m,n]=meshgrid([1:nbpixel]);

%------ initialisation collimat�e -------%

entree = hgb;
%entree = hypergauss2(1, 1e-2, nb+1, nb+1);
figure;
imagesc(abs(entree).^2); title('Intensité en entrée'); 
figure
imagesc(arg(entree)); title('phae initiale');

%---------------------------------------

% % diaph = carre(b,nb,nb);
% diaph = 1;
% % figure;
% % imagesc(diaph); title('Forme du diaphragme');
% % entree = abs(reshape(entree,nb,nb)).^2.*diaph;
% entree = entree.*diaph; 

%------ TEST PROPA ---------------%
prop = propagation(entree,1000); %
prop1 = propagation(entree,5000); %
figure;
subplot(1,2,1); imagesc(abs(prop).^2);title('Intensité sur le capteur à 1m');
subplot(1,2,2); imagesc(abs(prop1).^2);title('Intensité sur le capteur à 10m');
