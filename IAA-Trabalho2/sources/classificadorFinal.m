close all,clear all,clc;

%% DEFINIÇÃO DAS AMOSTRAS DE TREINAMENTO

% Prototipo de entrada
S = 7; % Neuronios
Q = 21; % Sao 7 padroes de teste
% A entrada da rede é um vetor p_i de R linhas, onde i =1 ... Q, Q é o
% numero de amostras
% ------ Fonte 1 - Treinar  ----------
Trabalho2_fonte1;
p1 = p1'; p1 = p1(:); % Transformando mariz em vetor coluna ,linhas em sequencia
p2 = p2'; p2 = p2(:);
p3 = p3'; p3 = p3(:);
p4 = p4'; p4 = p4(:);
p5 = p5'; p5 = p5(:);
p6 = p6'; p6 = p6(:);
p7 = p7'; p7 = p7(:);
% P é uma matriz de  Q amostras de entradas
P1 = [p1 p2 p3 p4 p5 p6 p7];
% ------ Fonte 2 - Treinar  ----------
Trabalho2_fonte2;
p1 = p1'; p1 = p1(:); % Transformando mariz em vetor coluna ,linhas em sequencia
p2 = p2'; p2 = p2(:);
p3 = p3'; p3 = p3(:);
p4 = p4'; p4 = p4(:);
p5 = p5'; p5 = p5(:);
p6 = p6'; p6 = p6(:);
p7 = p7'; p7 = p7(:);
% P é uma matriz de  Q amostras de entradas
P2 = [p1 p2 p3 p4 p5 p6 p7];
% ------ Fonte 3 - Treinar  ----------
Trabalho2_fonte3;
p1 = p1'; p1 = p1(:); % Transformando mariz em vetor coluna ,linhas em sequencia
p2 = p2'; p2 = p2(:);
p3 = p3'; p3 = p3(:);
p4 = p4'; p4 = p4(:);
p5 = p5'; p5 = p5(:);
p6 = p6'; p6 = p6(:);
p7 = p7'; p7 = p7(:);
% P é uma matriz de  Q amostras de entradas
P3 = [p1 p2 p3 p4 p5 p6 p7];
%% TREINAMENTO 
P = [P1 P2 P3]; % OS padrões de todas as fontes
% A saída desejada t_i é um vetor de S linhas , onde i= 1 ...Q, Q é o
% número de amostras. Cada t_i(S) é ativado uma unica vez
% Para esse CASO (S) T_j é exatamente a matriz identidade [SxQ]
T = [eye(7) eye(7) eye(7)]; % Para as três fontes
    
% Inicializando os valores de pesos e polarização
[W, b] = initNET(P,T); % W matriz SxR e B matriz SxQ,
%% Para tabelar os valores de saida inicial
A = zeros(size(T));
 for j = 1:Q
        p = P(:,j);
        t = T(:,j);
        [~, A(:,j)] = testNET(p,t,W,b);
        
 end
 
 save('treinamento.txt','A','-ascii'); % Para salvar os dados

%Aprendizagem
[Wn,bn,epoca] = learnNET(P,T,W,b);




%% GENERALIZAÇÃO
% ------ Fonte 1 - Teste ----------
Trabalho2_fonte1_teste;
p1 = p1'; p1 = p1(:); % Transformando mariz em vetor coluna ,linhas em sequencia
p2 = p2'; p2 = p2(:);
p3 = p3'; p3 = p3(:);
p4 = p4'; p4 = p4(:);
p5 = p5'; p5 = p5(:);
p6 = p6'; p6 = p6(:);
p7 = p7'; p7 = p7(:);
% P é uma matriz de  Q amostras de entradas
P1 = [p1 p2 p3 p4 p5 p6 p7];
% ------ Fonte 2 - Teste  ----------
Trabalho2_fonte2_teste;
p1 = p1'; p1 = p1(:); % Transformando mariz em vetor coluna ,linhas em sequencia
p2 = p2'; p2 = p2(:);
p3 = p3'; p3 = p3(:);
p4 = p4'; p4 = p4(:);
p5 = p5'; p5 = p5(:);
p6 = p6'; p6 = p6(:);
p7 = p7'; p7 = p7(:);
% P é uma matriz de  Q amostras de entradas
P2 = [p1 p2 p3 p4 p5 p6 p7];
% ------ Fonte 3 - Teste  ----------
Trabalho2_fonte3_teste;
p1 = p1'; p1 = p1(:); % Transformando mariz em vetor coluna ,linhas em sequencia
p2 = p2'; p2 = p2(:);
p3 = p3'; p3 = p3(:);
p4 = p4'; p4 = p4(:);
p5 = p5'; p5 = p5(:);
p6 = p6'; p6 = p6(:);
p7 = p7'; p7 = p7(:);
% P é uma matriz de  Q amostras de entradas
P3 = [p1 p2 p3 p4 p5 p6 p7];

%% Para tabelar os valores de saida com a rede treinada
B = zeros(size(T));
 for j = 1:Q
        p = P(:,j);
        t = T(:,j);
        [~,B(:,j)] = testNET(p,t,Wn1,bn1); % So é 0 ou 1
 end
 save('teste.txt','B','-ascii'); % Para salvar os dados

