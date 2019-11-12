function [W,b] = initNET(P,T)
%INITNET Retorna a matriz de pesos e a polarização
%   Gera valores iniciais para os pesos e as polarização de um único
%   neurônio, sendo feito por um número aleatório simétrico próximo de
%   zero. Sendo estes números normalmente distribuídos.
%   P = RxQ matriz dos vetores de entrada (P1..PQ), Pi = [p1..pR].  #1 
%   T = SxQ vetor de saídas (t1..tQ), S = 1 para uma camada  #2

% R - entradas da rede neural
[R , Qp] = size(P);
[S , Qt] = size(T);
if(Qp == Qt)
    W = randn(R,1); % Matriz SxR , S = 1, somente um neuronio
    b = randn(); % Matriz Sx1, S = 1, idem
else
    error('Deve haver correspondência de Q colunas de entradas e saídas(targets).');
end

