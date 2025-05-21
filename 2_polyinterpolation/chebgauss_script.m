% represents CGL nodes for n=10, n=20
clf;

xc_10 = chebgauss(-1, 1, 10); xc_20 = chebgauss(-1, 1, 20);


plot(xc_10, zeros(10), 'r.'); hold on;
plot(xc_20, ones(20), 'b.'); 
title("test");
legend('n=10','n=20');
ylim([-1.5, 1.5]);
xlim([-1.5, 1.5]);hold off;

