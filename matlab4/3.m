% Traitement final
pow = 2;
roewa = (roewa1.^pow+roewa2.^pow).^1/pow;
figure; imagesc(roewa(bord:end-bord, bord:end-bord));
title('Rd');
