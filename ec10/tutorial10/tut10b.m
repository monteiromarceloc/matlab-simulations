clear;
clc;
close all;

w = 1633;
k = 8.35e5;
c = 0.6e3;
M = 30;
m = 29;
r = 2e-2;
  
x0 = 3e-2;

G = tf([1], [M c k]);
figure
bodemag(G);

amplitude = m * r * w^2 * abs(freqresp(G, w))

ww = 10.^(-2:0.01:3);
[gr, indwr] = max(abs(freqresp(G, ww)));
wr = ww(indwr)

[gr, wr] = norm(G, Inf)

F = m * r * w^2 * tf([w], [1 0 w^2]);
X = series(G, F);
t = 0:0.002:0.7;
xf = impulse(X, t);

X0 = x0 * tf([M c], [M c k]);
xt0 = impulse(X0, t);

figure
y = xf + xt0
plot(t, y)

amplitude1 = max(y(end / 2:end))