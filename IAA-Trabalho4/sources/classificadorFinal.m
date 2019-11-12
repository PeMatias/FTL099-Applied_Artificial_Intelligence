close all,clear all,clc;

C0 = 0.5;
C1 = 0.4045;
C2 = 0.1545;
R = [C0 C1; C1 C0];
h = [C1;C2];
x = inv(R)*h; % Ponto minimo da função
F = C0 - 2*x'*h + x'*R*x;
A = 2*R;  % Matriz Hessiana
[v, lambda] = eig(A); % Auto valores e auto vetores


f = @(W1,W2) C0 - 2*[W1 , W2]*h + [W1 ,W2]*R*[W1 ; W2];
figure
fcontour(f);
hold on;
scatter(x(1),x(2),'o');
quiver(x(1),x(2),v(1,1),v(2,1),sqrt(2));
quiver(x(1),x(2),v(1,2),v(2,2),sqrt(2));
hold off
grid on
title({'Contorno do erro','-5 < w_{1,1} < 5 e -5 < w_{1,2} < 5 '});
xlabel('w_{1,1}');
ylabel('w_{1,2}');

%% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% 

% Padrões de treinamento
k = 0:9; % 10 amostras
y = sin(k*pi/5);

% Prototipo de entrada P
P = [sin((k-1)*pi/5);sin((k-2)*pi/5)];
t = y; 

% Taxa máxima de aprendizagem 
alpha = 1/max(max(lambda));
 
%% Algortimos LMS
W = [0 , 0];
trajetoria = [0,0];
E = [];
for epoca=1:40
    i = mod(epoca,length(k))+1;
    p = P(:,i); % extrai um padrão de entrada
    a = W*p;
    e = t(i) - a; % calculo do erro
    E(end+1) = e;
    W = W + 2 * alpha * e * p'; %LMS Algoritmo
    trajetoria(end+1,:) = W;  % Armazena a trajetoria dos pesos     
end

figure
fcontour(f,[-3 3]);
hold on;
scatter(x(1),x(2),'o');
line(trajetoria(:,1)',trajetoria(:,2)','Color','b','LineStyle','--','Marker','.','LineWidth',0.7,'MarkerSize',10);
hold off
grid on
title({'Contorno do erro'});
xlabel('w_{1,1}');
ylabel('w_{1,2}');

figure
plot(0:39,E);
grid on
title({'Erro vs Iterações'});
xlabel('iteração');
ylabel('erro(i)');


