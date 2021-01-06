clear
close all
clc

a=1;
b=-1;
N=100
x=linspace(0,10,N);
y=a*x+b+0.05*randn(1, 100);

plot(y)
