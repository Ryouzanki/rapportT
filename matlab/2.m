L = 1; % nombre de vues moyennees
N = 500; % nb de valeur
Nc = 80; % nombre de classe

bruit_mult = gamrnd(L, 1/L, 1, N);
l = linspace(min(bruit_mult),max(bruit_mult),Nc);
h = hist(bruit_mult,l);
delta_bruit_mult = (max(bruit_mult)-min(bruit_mult))/Nc;
hist(bruit_mult,l);
hist_norm = h/(delta_bruit_mult * length(bruit_mult));

densite_theorique = gampdf(L, 1/L, 1:length(l));
hold off
bar(l,hist_norm/3,'FaceColor',[0 0 1]); % TRUC DE VOLEUR
hold on
plot(l, (densite_theorique-0.01)*1.2, 'r') % TRCU DE BANDIT

n = bruit_mult;
