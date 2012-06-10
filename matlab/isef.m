function [ ISEF ] = isef( image, lambda, order, L )
    % Generation du filre ISEF
    
    % Parametres
    muI = mean(mean(image));
    sigmaI = sqrt(var(reshape(image, 1, numel(image))));

    muR = muI;
    sigmaR = sqrt((L*sigmaI^2 - muI^2) / (L + 1));

    alpha = sqrt(((2*L*lambda) / (1 + (muR/sigmaR)^2))
        + lambda^2);
    C = alpha/2;
    
    % Generation de la réponse impulsionnelle du filtre ISEF
    ISEF = C * exp(-alpha*abs([-(order-1)/2:1:order/2]));

end

