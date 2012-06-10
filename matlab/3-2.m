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
