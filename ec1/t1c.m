clear
close all
clc

r=0.006;
S=100;
T=30*12;
alpha=0.009;
I=zeros(1,T);
x=zeros(1,T);
y=zeros(1,T);

for k=1:T-1
   I(k) = max(0, 0.0015*(S/r - x(k)));
   x(k+1) = (1+r)*x(k) + I(k);
   y(k+1) = (1+alpha)*y(k) + max(0.3*S - I(k), 0);
end

tempo=((1:T)-1);
figure(1)
subplot(3,1,1)
plot(tempo,x,'g')
title('X')
subplot(3,1,2)
plot(tempo,y,'r')
title('Y')
subplot(3,1,3)
plot(tempo,I,'b')
title('I')