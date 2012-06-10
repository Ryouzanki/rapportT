L = 1; % nombre de vues moyennees
N = 500; % nombre de valeurs

bruit = gamrnd(L, 1/L, 1, N);

ligne = ligne .* bruit;
