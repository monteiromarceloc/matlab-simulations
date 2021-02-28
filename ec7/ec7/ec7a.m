clear
close all
clc

sim('mod7a');

figure(1)
plot(E)
xlabel('tempo')
ylabel('Desvio')
title('Erro % de posicionamento da agulha')

figure(2)
plot(Disturbio)
xlabel('tempo')
ylabel('x(t)')
title('Disturbio aplicado')