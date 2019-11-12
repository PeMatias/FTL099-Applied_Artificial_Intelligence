function [Wn, bn] = learnNET(P,T,W,b)
%LEARNNET Regra unificada de aprendizagem do perceptron
%   Calcula as variações nos pesos e polarizações de um conjunto de
%   entradas P e o erro.
%    P = RxQ matriz dos vetores de entrada (P1..PQ), Pi = [p1..pR].  #1
%    T = SxQ vetor de saídas (t1..tQ), S = 1 para uma camada  #2
%    A = RxQ matriz dos vetores de saída com a aplicação da hardlim(W'A+b). 
%    E = SxQ matriz dos vetores de erro. 

cont = 0;
Wn = W;
bn = b;
E = testNET(P,T,Wn,bn);
disp(E);
while max(E) == 1 || min(E) == -1
        for i = 1:length(P) % 1 até Q
           if(E(i) ~= 0)
           disp(E(i))
               Wn = Wn + E(i)*P(:,i)  ;    % acessa o valor do vetor Pi
               bn = bn + E(i);
               break;
           end 
        end
    E = testNET(P,T,Wn,bn);
    disp(E);
    cont = cont +1;
end
disp(cont);       
end


