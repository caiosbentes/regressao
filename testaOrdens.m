st = transpose(importfile('STP-20161121152409392.csv', 2, 202)); % importa dados da minha Série temporal
Z = st(1:180); %Parte da série que será utilizada para modelagem.
anos = 15; %anos utilizados para modelagem
D = obtemD(anos); %obtenção da matriz D
for N=1:8
    T = minimos(length(Z),N); % Obtenção da matriz T
    X = [T D]; %Monto a matriz X
    gama = inv(transpose(X)*X)*transpose(X)*transpose(Z); % obtenho gama
    Zest = gama'*X'; % Obtenho meu Z estimado
    erro(N) = log(mean((Z-Zest).^2))
    T=0;X=0;gama=0;Zest=0;
end
plot(erro);
legend('Gráfico do log(erro) X ordem d polinômio de aproximação','Location','northoutside','Orientation','horizontal')
[valorMinimo ordem]= min(erro)




