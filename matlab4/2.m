% Création du filtre ISEF
isef = isef(image, lambda, order, L);

% Direction 1
% Debruitage
im1_debruite = debruite(image, isef);
figure;
subplot(2, 2, 1);
imagesc(im1_debruite);
title('Debruitage horizontal');

% Application de l'operateur roewa
roewa1 = roewa(im1_debruite', isef)';
subplot(2, 2, 2);
imagesc(roewa1(bord:end-bord, bord:end-bord));
title('Application de l''operateur ROEWA verticalement');

% Direction 2
% Debruitage
im2_debruite = debruite(image', isef)';
subplot(2, 2, 3);
imagesc(im2_debruite);
title('Debruitage vertical');

% Application de l'operateur roewa
roewa2 = roewa(im2_debruite, isef);
subplot(2, 2, 4);
imagesc(roewa2(bord:end-bord, bord:end-bord));
title('Application de l''operateur ROEWA horizontalement');
