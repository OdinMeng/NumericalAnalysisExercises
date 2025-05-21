%--------------------------------------------------------%
% Primo esempio di interpolazione polinomiale
%--------------------------------------------------------%
% Interpolazione polinomiale della funzione seno in [-5,5]
%--------------------------------------------------------%

a=-5; b=5;
n=6; %numero di punti

%creazione di n nodi equispaziati
h=(b-a)/(n-1);
x=a:h:b; %nodi di interpolazione
y=sin(x);%ordinate 

%calcolo dell'interpolante
xval=linspace(a,b,101);
coef=polyfit(x,y,n-1);
yval=polyval(coef,xval);
%yval=interpol(x,y,xval);

%grafico
% Creazione del grafico di confronto (seno versus interpolante)
clf;
plot(xval,sin(xval),'b-','linewidth',2);
hold on;
plot(xval,yval,'r-','linewidth',2);
%plot(xval,sin(xval),'b-',xval,yval,'r-')
plot(x,y,'ko');hold off
%title('sin(x) e il suo interpolante polinomiale di grado 5');
legend('sin(x)','Interpolante','punti')




