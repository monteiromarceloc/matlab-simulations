clear
close all
clc

r=2.7
T=100
x=zeros(1,T)
x(1)=0.1

for i = 1:T-1
  x(i+1) = exp(-4.9*x(i)^2)-1
end

tempo=(1:T)-1;
stem(tempo,x)
xlabel('tempo')
ylabel('população')
xeq=1-exp(1)
hold on
plot(tempo, xeq*ones(length(tempo), 1), 'r')
legend('simulação', 'equilíbrio')
axis([-1 T -1 1])

