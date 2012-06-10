%% Generation du filre ISEF

% Parametres
mu = 150 % Nombre moyen de pixel entre deux ruptures d'intensite
lambda = 1/mu

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
