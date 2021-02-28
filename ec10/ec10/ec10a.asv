clear;
clc;
close all;

La = 1;
Ra = 1;
J = 10;
c = 1;
Kma = 0.1;
Kb = 1;

G1 = tf([1/La], [1 Ra/La]);
G2 = tf(Kma, 1);
G3 = tf([1/J], [1 c/J]);
H = tf(Kb, 1);

G1 = ss(G1);
T(1, 1) = zpk(feedback(series(series(G1, G2), G3), H));
T(1, 2) = zpk(feedback(G3, -H*G1*G2, 1))
pause

bode(T)
grid

G1 = [G1 -G1];
G1.inputname = {'Va', 'Vb'};
G1.outputname = 'Ia';

G2.inputname={'Ia'};
G2.outputname = 'Tm';

G3 = [G3 G3];
G3.inputname = {'Tm', 'Td'};
G3.outputname = 'w';

H.inputname = 'w';
H.outputname = 'Vb';

T = connect(G1, G2, G3, H, {'Va', 'Td'}, 'w')

zpk(T)
pause

T = minreal(T);
zpk(T)
get(T)

figure(2)
step(T, 'b')
xlabel('tempo')
ylabel('x(t)')
title('Resposta a degrau')

figure(3)
impulse(T, 'r')
xlabel('tempo')
ylabel('x(t)')
title('Resposta a impulso')