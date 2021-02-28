clear
close all
clc

m = 0.1;
l = 0.5;
g = 9.8;
b = 0.01;
thetabar = 45 / 180 * pi;

G = tf([1], [m*l^2 b g*l*cos(thetabar)])
F = tf([100], [1 100])
pause

numH = conv(G.num{1}, F.num{1});
denH = conv(G.den{1}, F.den{1});
H = tf(numH, denH)
pause

zpk(H)
pause

[Residuos, Polos, GanhoDireto] = residue(H.num{1}, H.den{1})
%syms t
%h = Residuos(1) * exp(Polos(1) * t) * heaviside(t) + 2 * (real(Residuos(2)) * cos(imag(Polos(2)) * t) - imag(Residuos(2)) * sin(imag(Polos(2)) * t)) * exp(real(Polos(2)) * t) * heaviside(t);
%pretty(h)
%pause

ezplot('0.3961 * exp(-100 * t) + 2 * (-0.1980 * cos(11.7709 * t) - 1.6792 * sin(11.7709 * t)) * exp(-0.2 * t)', [0 30])
hold on
impulse(H, 'r')
xlabel('tempo')
ylabel('\theta(t)')
title('Resposta a impulso')
pause

figure
step(H)
xlabel('tempo')
ylabel('\theta(t)')
title('Resposta a degrau')
pause

tempo = 0:0.2:30;
u = 0.1 * cos(tempo);
figure
lsim(H, u, tempo)
legend('\theta')