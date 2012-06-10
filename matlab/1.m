mu = 10; % parametre pour la loi exponentielle
N = 500; % nombre de pixel
k = 1; % compteur a ne pas toucher
Suite_symbole = zeros(1,N); % Preallocation de la memoire

while(k<N)
    i = floor(rand*255);  % Une intensite entre 0 et 255
    for j = 1:ceil(exprnd(mu))
        Suite_symbole(k) = i; % propager i sur j pixel
        k = k+1;
    end
end

R = Suite_symbole(1:500);  % On ampute le signal des valeurs en trop

plot(R)
