function [ corr_sym ] = correlogramme( lambda, largeur, profondeur, fenetre, zlargeur )

    % Generation d'une ligne
    ligne = genligne(lambda, largeur, profondeur);
    
    % Fenetrage
    ligne = ligne .* fenetre;
    
    % Fonction d'autocorrelation
    corr = xcov(ligne, 'biased');
    
    % Symetrisation de la fonction d'autocorrelation 
    part1 = corr(1, largeur:end);
    part2 = zeros(1, zlargeur);
    part3 = 0;
    part4 = part2;
    part5 = corr(1, end-1:-1:largeur);
    
    corr_sym = [part1 part2 part3 part4 part5];
    
end

