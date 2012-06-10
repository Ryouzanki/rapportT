function [ ligne ] = genligne( lambda, largeur, profondeur )
    % Generation d'une ligne de pixel
    ligne = zeros(1, largeur); % Preallocation de la ligne
    i = 1; % Position du pixel courant
    k = 1; % k-ieme intensite
    while(i <= largeur)
        valeur = randi(profondeur); % Generation de l'intensite
        poisson = ceil(exprnd(1/lambda)); % Largeur de l'intensite
        j = 0;
        while j <= poisson && i <= largeur
            ligne(1, i) = valeur;
            i = i + 1;
            j = j + 1;
        end
        k = k + 1;
    end
end
