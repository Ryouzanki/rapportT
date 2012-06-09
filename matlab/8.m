%% Determination des transitions

seuil = 1.2 % Seuil de detection des transitions

p = 0;
trans = [];

figure
plot(ligne, 'b', 'LineWidth', 1); % Signal non bruite
hold on
plot(rmax-2, 'r'); % Rmax (-2 pour eviter les superpositions)

for i = 2:N-1;
    % Detection des maximums locaux
    if rmax(i-1)<rmax(i) && rmax(i)>rmax(i+1);
        % Verification que le maximum depasse le seuil
        if rmax(i) > seuil;
            p = p+1;
            trans(p) = i-1;
            x = [trans(p);trans(p)];
            y = [min(ligne(i-2:i+2)), max(ligne(i-2:i+2))];
            line(x, y, 'color','g', 'LineWidth', 2)
        end
    end
end
legend('Signal (avant bruitage)', 'Rmax', 'Transitions');

trans
