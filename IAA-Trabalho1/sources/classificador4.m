close all,clear all,clc, format compact;

% P_i = [ caracteristica_1; caracteristica_2]
%    |  Cp1  |  Cp2  |  Cp3  |  Cp4  |
P = [ 1 1 2 2 6 6 7 7 6 6 7 7 1 1 2 2;
      7 6 7 6 7 6 7 6 1 2 1 2 1 2 1 2 ];
T = [ 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 ];
%    |  Cp1  |  Cp2  |  Cp3  |  Cp4  |

% Inicializando os valores de pesos e polarização
[W, b] = initNET(P,T);

% Tentativa inicial de classificação
f1 = figure('Name','Pesos e Polarização incializados');
plotpv(P,T, [0 9 0 9]) ;
plotpc(W', b);


[Wn,bn] = learnNET(P,T,W,b);
disp(Wn);
disp(bn);
% Plotagem
f2 = figure('Name','Rede Treinada');
plotpv(P,T, [0 9 0 9]) ;
plotpc(Wn', bn);

f3 = figure('Name','saída do neurônio sobre o intervalo de entradas');
[p1,p2] = meshgrid(0:0.05:10);
z = feval('hardlim',[p1(:) p2(:)]*Wn+bn);
z = reshape(z,length(p1),length(p2));
plot3(p1,p2,z);
grid on
xlabel('Entrada-1');
ylabel('Entrada-2');
zlabel('Saída do Neurônio');