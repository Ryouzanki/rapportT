%%
% Paramètres
mu = 100 % Nombre moyen de pixel entre deux ruptures d'intensité
lambda = 1/mu
L = 10 % Paramètre du bruit
bord = 10 % Largeur des bords ignoré (pour rétablir une échelle correcte)
seuil = 1.7 % Seuil de segmentation
order = 15 % Ordre du filtre

%%
% Chargement de l'image
load 'Bourges.mat'; % exporte la variable y
image = y;
imagesc(image);
title('Image SAR');

