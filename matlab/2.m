L = 1; % nombre de vues moyennees
N = 500; % nombre de valeur
Nc = 80; % nombre de classe

%Generer l'histogramme normalise
bruit_mult = gamrnd(L, 1/L, 1, N);
[hist abs] = hist(bruit_mult,Nc);
bruit_th = gampdf(abs, L, 1/L);
Nc = 50; 
dx = (max(bruit_mult)-min(bruit_mult))/Nc;
%Affichage de l'histogramme normalise
figure('name', 'Bruit multiplicatif n(x)')
bar(abs, hist/(dx*length(bruit_mult)));
title('Histogramme normalise et fonction de repartition de loi Gamma')
hold on
%Affichage de la fonction de repartition theorique
plot(abs, bruit_th, 'r');

n = bruit_mult;
