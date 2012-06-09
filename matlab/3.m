function [ perio ] = periodogramme( lambda, largeur, profondeur, fenetre, bruit)
    % Generation du periodogramme

    % Generation d'une ligne
    if nargin < 5
        ligne = genligne(lambda, largeur, profondeur);
    else
        ligne = genlignebruite(lambda, largeur, profondeur, bruit);
    end

    % On rend la moyenne nulle
    % (Pour supprimer le terme constant dans le periodogramme)
    ligne = ligne - mean(ligne);
    
    % Fenetrage
    ligne = ligne .* fenetre;
    
    % Generation du periodogramme
    perio = (abs(fft(ligne)).^2)./largeur;

end

