function [W,b] = initNET(P,T)
%INITNET Retorna a matriz de pesos e a polarização
%   Gera valores iniciais para os pesos e as polarização de um único
%   neurônio, sendo feito por um número aleatório simétrico próximo de
%   zero. Sendo estes números normalmente distribuídos.
%   P = RxQ matriz dos vetores de entrada (P1..PQ), pi = [p1..pR]. R é número de caracteristicas e Q de amostras  #1 
%   T = SxQ vetor de saídas (t1..tQ), S = numero de neuronios e Q numero de amostras para uma camada  #2

% R - entradas da rede neural
[R , Qp] = size(P);
[S , Qt] = size(T);
if(Qp == Qt)
    W = randn(S,R); % Matriz SxR 
    b = randn(S,1); % Matriz Sx1, 
else
    error('Deve haver correspondência de Q colunas de entradas e saídas(targets).');
end

