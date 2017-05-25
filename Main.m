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
nbpixel = 1024;
lambda = 0.8e-4; % en cm
taillefenetre =  10;  % en cm
b = 0.1; % taille diaphragme carr� en cm (0.25)

%------------ param�tres optimis�s ----------------------

e = 100; % "�paisseur de phase" en µm
P = 700; % mW %10, 300, 500, 2000

%-----------------------------------------------

dx = taillefenetre/(nbpixel-1);
nb = nbpixel/2;
[m,n]=meshgrid([1:nbpixel]);

%------ initialisation collimat�e -------%

%entree = hypergauss2(1, 1, nb+1, nb+1);
entree = hgb;
figure;
imagesc(abs(entree).^2); title('Intensit� en entr�e'); 

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
subplot(1,2,1); imagesc(prop);title('Intensit� sur le capteur � 1m');
subplot(1,2,2); imagesc(prop1);title('Intensit� sur le capteur � 10m');
