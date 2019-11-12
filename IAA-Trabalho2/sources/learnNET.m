function [Wn, bn,epoca] = learnNET(P,T,W_old,b_old)
%LEARNNET Regra unificada de aprendizagem do perceptron
%   Calcula as variações nos pesos e polarizações de um conjunto de
%   entradas P e o erro.
%    P[RxQ] matriz dos vetores de entrada (P1..PQ), Pi = [p1..pR].  #1
%    T[SxQ] matriz de saídas (t1..tQ), S = 1 para uma camada  #2
%    W[SxR] matriz de pesos
%    b[Sx1] vetor de polarizações associada aos neuronios por amostras
% RETORNA
%   epoca = numero de ajustes dos pesos sinápticos e limiares da rede
%   Wn matriz de pesos atualizada
%   bn vetor de polarização atualizada

epoca = 0;
Wn = W_old;
bn = b_old;
x = size(T);
a = zeros(x);
Q = x(2);
check = 0;

while check <= Q  % Se a verificação nao atingir a quantidade de amostras de sucesso
    for j = 1:Q
        p = P(:,j);
        t = T(:,j);
        [erro,a(:,j)] = testNET(p,t,Wn,bn); % erro da amostra p_j associado a t_j
        if max(erro)~=0 || min(erro)~=0 % SE ha erros atualiza os pesos
            Wn = Wn + erro*p';
            bn = bn + erro;
            epoca = epoca +1;
            check = 0; % reinicia o ciclo de checagens
        else
            check = check +1; % se não avalia proxima amostra
        end
    end
end
end


