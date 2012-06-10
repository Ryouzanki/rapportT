function [ ligne ] = genligne( lambda, largeur, profondeur )
    % Géneration d'une ligne de pixel

    ligne = zeros(1, largeur); % Préallocation de la ligne
    
    i = 1; % Position du pixel courant
    k = 1; % k-ième intensité
    
    while(i <= largeur)
        valeur = randi(profondeur); % Génération de l'intensité
        poisson = ceil(exprnd(1/lambda)); % Largeur de l'intensité
        j = 0;
        while j <= poisson && i <= largeur
            ligne(1, i) = valeur;
            i = i + 1;
            j = j + 1;
        end
        k = k + 1;
    end
end
