close all
clear
clc

%x[n] = 0.9*delta(n)
Ts = 1;
t = 1:Ts:20;
x = 0.9 * dirac(t);

idx = x == inf;
x(idx) = 1;

X = fft(x);

N = length(t);
f = (0:(N - 1)) / (N * Ts);

figure
subplot(2, 1, 1)
plot(f, abs(X)); % gráfico de magnitude
ylabel('|X|')
subplot(2, 1, 2)
plot(f, angle(X) * 180/pi); % gráfico de fase
xlabel('f [Hz]')
ylabel('\angle X [deg]')
fprintf('O resultado está de acordo com o esperado, pois delta(n) só assume valor infinito em n = 0, e a simulação começa em n = 1.\n');

%x[n] = 0.9*delta(n-5)
Ts = 1;
t = 1:Ts:20;
x = 0.9 * dirac(t - 5);

idx = x == inf;
x(idx) = 1;

X = fft(x); % transformada

N = length(t);
f = (0:(N - 1)) /( N * Ts);

figure
subplot(2, 1, 1)
plot(f, abs(X)); % gráfico de magnitude
ylabel('|X|')
subplot(2, 1, 2)
plot(f, angle(X) * 180/pi); % gráfico de fase
xlabel('f [Hz]')
ylabel('\angle X [deg]')
fprintf('A transformada de um impulso é um fasor de módulo 1, o que está de acordo com os gráficos.');

%x(t) = sin(t)
Ts = 0.01;
t = 0:Ts:20;
x = sin(t);

X = fft(x); % transformada

N = length(t);
f = (0:(N - 1)) / (N * Ts);

figure
subplot(2, 1, 1)
plot(f, abs(X)); % gráfico de magnitude
ylabel('|X|')
subplot(2, 1, 2)
plot(f, angle(X) * 180/pi); % gráfico de fase
xlabel('f [Hz]')
ylabel('\angle X [deg]')