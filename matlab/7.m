%% Rapport des moyennes ponderees exponentiellement

% Separation des parties droite et gauche du filtre ISEF
ISEF1 = [ISEF(1, 1:ceil(order/2)) zeros(1, ceil(order/2))];
ISEF2 = [zeros(1, ceil(order/2)) ISEF(1, ceil(order/2):end)];

% Filtrage du signal par les deux filtres
mu1 = abs(filter(ISEF1, 1, [ligne_debruite zeros(1, floor(order/2))]));
mu1 = mu1(1, floor(order/2):end); % Suppression du retard
mu2 = abs(filter(ISEF2, 1, [ligne_debruite zeros(1, floor(order/2))]));
mu2 = mu2(1, floor(order/2):end); % Suppression du retard

figure;
subplot(5, 1, 1);
plot(mu1);
title('mu1');
subplot(5, 1, 2);
plot(mu2);
title('mu2');
subplot(5, 1, 3);
plot(mu1./mu2);
title('mu1/mu2');
subplot(5, 1, 4);
plot(mu2./mu1);
title('mu2/mu1');
subplot(5, 1, 5);
% Calcul de Rmax
rmax = max(mu1./mu2, mu2./mu1);
plot(rmax);
title('Rmax');

% Observation de Rmax supperpose avec le signal bruite
figure;
plot(ligne_bruite, 'b');
hold on;
plot(rmax, 'r', 'LineWidth', 1.5);
legend('Signal bruite', 'Rmax');
hold off
