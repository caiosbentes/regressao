st = transpose(importfile('STP-20161121152409392.csv', 2, 202)); % importa dados da minha Série temporal
Z = st(1:180); %Parte da série que será utilizada para modelagem.
N= 7; %Ordem da função que modela a tendência 
T = minimos(length(Z),N); % Obtenção da matriz T
anos = 15; %anos utilizados para modelagem
D = obtemD(anos); %obtenção da matriz D
X = [T D]; %Monto a matriz X

gama = inv(transpose(X)*X)*transpose(X)*transpose(Z); % obtenho gama

figure(1)
plot(st,'r')%plotagem da série original com todos os pontos
legend('plotagem da série completa', 'Location','northoutside','Orientation','horizontal')
Zest = gama'*X'; % Obtenho meu Z estimado
figure(2)
plot(Z,'r');hold on;plot(Zest, 'g'); %Ploto na mesma figura a serie original(em verde) e a série estimada(em vermelho)
legend('15 primeiros anos da minha série','gráfico do meu modelo','Location','northoutside','Orientation','horizontal')
figure(3)
residuo = Z-Zest; plot(residuo, 'b');%gráfico do resíduo
legend('gráfico do meu reśiduo','Location','northoutside','Orientation','horizontal')
erro = mean((log(Z)-log(Zest)).^2)
figure(4)
plot
hist(residuo);%histograma do meu resíduo
legend('histograma do meu resíduo','Location','northoutside','Orientation','horizontal')
mean(residuo);
    
% aqui eu vou fazer a minha previsão.
T2 = minimos(204,N);
D2 = obtemD(17); %obtenção uma nova matriz D
X2= [T2 D2]; %Monto a=uma nova matriz X
Zest2 = gama'*X2'; % Obtenho meu Z2 estimado

figure(6)
plot(st,'r');hold on;plot(Zest2(1:180),'B');plot( [181:201],Zest2(181:201),'g')
%ploto a serie, a serie estimada e a previsão
legend('Parte da série utilizada na modelagem','Modelo criado','previsões do modelo','Location','northoutside','Orientation','horizontal')