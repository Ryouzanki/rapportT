function [ p ] = periocumule( lambda, largeur, profondeur, fenetre, cumule, bruit )
    % Creer un periodogramme cumule
    
    p = zeros(1, largeur); % Preallocation de la memoire
    for i = 1:cumule;
        % Ajout d'un nouveau periodogramme
        if nargin < 6
            p = p + periodogramme(lambda, largeur, profondeur, fenetre);
        else
            p = p + periodogramme(lambda, largeur, profondeur, fenetre, bruit);
        end
    end
    
    % Moyennage
    p = p ./ cumule;
    
end

