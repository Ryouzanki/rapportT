%% Generation du signal bruite par un bruit de scintillement multiplicatif

% Parametres
profondeur = 32 % Precision de la quantification
N = 2000 % Taille de notre ligne en pixel
mu = 150 % Nombre moyen de pixel entre deux ruptures d'intensite
lambda = 1/mu
L = 500 % Parametre du bruit

% Generation d'une ligne de pixels
ligne = genligne(lambda, N, profondeur);
subplot(3, 1, 1);
plot(ligne);
title('Ligne non bruite');

% Generation du bruit de scintillement
bruit = gamrnd(L, 1/L, 1, N);
subplot(3, 1, 2);
plot(bruit)
title('Bruit de scintillement');

% Multiplication de notre ligne par le bruit
ligne_bruite = ligne .* bruit;
subplot(3, 1, 3);
plot(ligne_bruite);
title('Ligne bruite');
figure;


%% Generation du filre ISEF

% Parametres
muI = mean(ligne);
sigmaI = sqrt(var(ligne_bruite));

muR = muI;
sigmaR = (L*sigmaI^2 - muI^2) / (L + 1);

alpha = sqrt(((2*L*lambda) / (1 + (muR/sigmaR)^2)) + lambda^2);
C = alpha/2;

order = 199

% Generation de la reponse impulsionnelle
ISEF = C * exp(-alpha*abs([-(order-1)/2:1:order/2]));
plot(ISEF);
title('Impulse reponse of ISEF');

% Filtrage du signal. Celui-ci est alonge de la longueur du retard afin
% de pouvoir effectuer le filtrage jusqu'au bout.
ligne_debruite = filter(ISEF, 1, [ligne_bruite zeros(1, ceil(order/2))]);
ligne_debruite = ligne_debruite(1, ceil(order/2):end); % Suppression du retard
figure
plot(ligne_bruite, 'b');
hold on
plot(ligne_debruite, 'r');
title('Comparaison signal bruite et signal debruite');
legend('Signal bruite', 'Signal debruite');
