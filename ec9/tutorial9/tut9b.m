clear
close all
clc

A = [1 1; 0 1];
B = [1 0; 0 1];
C = [1 0; 0 1];
D = 0;

H = ss(A, B, C, D, 1)
pause

H = tf(H)
pause

H = H(1, 2)
pause

zpk(H)
pause

[Residuos, Polos, GanhoDireto] = residue(H.num{1}, H.den{1})
%syms k
%h = Residuos(1) * Polos(1) ^ (k - 1) * heaviside(k - 1) + Residuos(2) * Polos(2) ^ (k - 1) * (k - 1) * heaviside(k - 1);
%pretty(h)
%pause

ezplot('0.3961 * exp(-100 * t) + 2 * (-0.1980 * cos(11.7709 * t)-1.6792 * sin(11.7709 * t)) * exp(-0.2 * t)', [0 20])
hold on
impulse(H, 'r', 20)
xlabel('tempo')
ylabel('\theta(t)')
title('Resposta a impulso')

figure
step(H)
xlabel('tempo')
ylabel('\theta(t)')
title('Resposta a degrau')

tempo = 0:1:30;
u = 0.1 * cos(tempo);
figure
lsim(H, u, tempo)
legend('\theta')