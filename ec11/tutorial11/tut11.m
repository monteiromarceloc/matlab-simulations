close all
clear
clc

Ts = 0.01;
t = 0:Ts:8;
x = cos(2*pi*t).* sin(6*pi*t); % sinal no tempo
X = fft(x); % transformada

N = length(t);
f = (0:(N - 1)) / (N * Ts); % compare com a expressão do tutorial

figure
subplot(2, 1, 1)
plot(f, abs(X)); % gráfico de magnitude
ylabel('|X|')
subplot(2, 1, 2)
plot(f, angle(X) * 180 / pi); % gráfico de fase
xlabel('f [Hz]')
ylabel('\angle X [deg]')

figure
plot(t, x)
xlabel('t [s]')
ylabel('x(t)')

%-------------- Outro sinal --------------
G = tf([10], [1 1 10]); % função de transferência do sistema
u = 0.2 * randn(N, 1); % ruído de entrada
y = lsim(G, u, t'); % resposta do sistema

figure
plot(t, u, t, y)
legend('u', 'y')
xlabel('t [s]')

Y = fft(y);
figure
subplot(2, 1, 1)
semilogx(f(1:end/2), 20*log10(abs(Y(1:end/2))));
ylabel('|Y|')
subplot(2, 1, 2)
semilogx(f(1:end/2), unwrap(angle(Y(1:end/2))) * 180/pi);
xlabel('f [Hz]')
ylabel('\angle Y [deg]')

U = fft(u);
G2 = Y./U; % função de transferência estimada
figure
[mag, pha, w] = bode(G);
subplot(2, 1, 1)
semilogx(w / (2 * pi), 20*log10(squeeze(mag)), 'b');
hold on
semilogx(f(1:end/2), 20*log10(abs(G2(1:end/2))), 'r');
ylabel('|G|')
legend('conhecida', 'estimada')
subplot(2, 1, 2)
semilogx(w / (2 * pi), squeeze(pha), 'b');
hold on
semilogx(f(1:end/2), unwrap(angle(G2(1:end/2))) * 180/pi, 'r');
ylabel('\angle G')
xlabel('f [Hz]')

a = [1 2 3 4 5];
b = [5 1 2 3 4];
c = conv(a, b) % convolução no tempo

A = fft(a);
B = fft(b);

C = ifft(A.*B) % DFT inversa

la = length(a);
lb = length(b);

a = [a zeros(1, lb - 1)] % zero-padding
b = [b zeros(1, la - 1)] % zero-padding

A = fft(a);
B = fft(b);

C = ifft(A.*B)
