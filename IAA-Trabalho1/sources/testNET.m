function [E] = testNET(P,T,W,b)
%LEARNNET Regra unificada de aprendizagem do perceptron
%   Calcula as variações nos pesos e polarizações de um conjunto de
%   entradas P e o erro.
%    P = RxQ matriz dos vetores de entrada (P1..PQ), Pi = [p1..pR].  #1
%    T = SxQ vetor de saídas (t1..tQ), S = 1 para uma camada  #2
%    A = RxQ matriz dos vetores de saída com a aplicação da hardlim(W'A+b). 
%    E = SxQ matriz dos vetores de erro. 


n = W'*P +b;
a = hardlim(n);
E = T - a;
end


