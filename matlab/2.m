L = 1; % nombre de vues moyennees
N = 500; % nb de valeur
Nc = 80; % nombre de classe

%Générer l'histogramme normalisé
bruit_mult = gamrnd(L, 1/L, 1, N);
[hist abs] = hist(bruit_mult,Nc);
bruit_th = gampdf(abs, L, 1/L);
Nc = 50; 
dx = (max(bruit_mult)-min(bruit_mult))/Nc;
%Affichage de l'histogramme normalisé
figure('name', 'Bruit multiplicatif n(x)')
bar(abs, hist/(dx*length(bruit_mult)));
title('Histogramme normalisé et fonction de répartition de loi Gamma')
hold on
%Affichage de la fonction de répartition théorique
plot(abs, bruit_th, 'r');

n = bruit_mult;
