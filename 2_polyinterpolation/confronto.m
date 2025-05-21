n=41;
a=-1;
b=1;
clf;
xgc = chebgauss(a,b,n); % calcolo dei nodi di Gauss-Chebyshev
xgcl = chebgausslob(a,b,n); %di Gauss-Chebyshev-Lobatto
plot(xgc,0.5 * ones(length(xgc),1),'r.');hold on;
plot(xgcl,ones(length(xgcl),1),'b*');
ylim([0, 1.5]);
xlim([-1.5, 1.5]);
title('Confronto tra nodi di CG (rosso) e di GCL (blue)');
legend('Nodi GC',' Nodi GCL');
hold off
