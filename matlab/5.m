function [ corr_sym ] = correlogramme( lambda, largeur, profondeur, fenetre, zlargeur )

    ligne = genligne(lambda, largeur, profondeur);
    
    ligne = ligne .* fenetre;
    
    corr = xcov(ligne, 'biased');
    
    part1 = corr(1, largeur:end);
    part2 = zeros(1, zlargeur);
    part3 = 0;
    part4 = part2;
    part5 = corr(1, end-1:-1:largeur);
    
    corr_sym = [part1 part2 part3 part4 part5];
    
end

