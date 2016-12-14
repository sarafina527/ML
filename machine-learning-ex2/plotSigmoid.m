figure(1);
x = (-100:0.02:100);
g = 1./(1+exp(-x));
plot(x,g);
title('sigmoid function g(x)');
xlabel('x');
ylabel('g');
figure(2);

