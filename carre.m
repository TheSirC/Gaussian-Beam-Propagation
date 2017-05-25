function result=carre(d,a,b) 

% d: longueur.
% a,b: coordonnées du centre.
% nbpixel: dimensions de la fenetre en pixel.
% taille: dimension de la fenetre en cm.
global nbpixel taillefenetre;

result=zeros(nbpixel,nbpixel);
demilargeur=round(d/2*(nbpixel-1)/taillefenetre);

for i=a-demilargeur:a+demilargeur
   for j=b-demilargeur:b+demilargeur
      result(i,j)=1;
   end;
end