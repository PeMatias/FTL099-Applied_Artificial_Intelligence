function [e,a] = testNET(p,t,W,b)
%LEARNNET Regra unificada de aprendizagem do perceptron
%   Calcula as variações nos pesos e polarizações de um conjunto de
%   entradas P e o erro.
%    P[Rx1] vetor entrada de R caracteristcas #1
%    T[Sx1] vetor de saídas   #2
%    W[SxR]
%    A[Rx1] matriz dos vetores de saída com a aplicação da hardlim(W'A+b). 
%    E [Sx1] matriz dos vetores de erro. 
n = W*p + b; % N[Sx1] numero de saídas por amostras
a = hardlim(n); % aplicação da função de ativação para Q amostras
e = t - a; % e[Sx1], onde cada coluna e_i é o erro relacionado a uma amostra
end


