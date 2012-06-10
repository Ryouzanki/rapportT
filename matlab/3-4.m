% Observation de Rmax supperpose avec le signal bruite
figure;
plot(ligne_bruite, 'b');
hold on;
plot(rmax, 'r', 'LineWidth', 1.5);
legend('Signal bruite', 'Rmax');
hold off
