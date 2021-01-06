clear
close all
clc

% Ex1
t = linspace(0,15)
x = cos(2*t)
y = sin(t)

figure(1)
plot(x, 'r')
hold on
plot(y, 'g')
legend('x = cos(2t)','y = sen(t)')
xlabel('t')

figure(2)
subplot(1,2,1)
plot(x,y,'b')
xlabel('x(t)')
ylabel('y(t)')

subplot(1,2,2)
plot(x,y.^3,'b')
xlabel('x(t)')
ylabel('y³(t)')

pause
