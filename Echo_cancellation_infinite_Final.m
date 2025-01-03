clc, clear;
close all
a=0.8;  % must be between 0 and 1
N=7000; % Delay
[mx,Fs]=audioread('C:\Users\Dell\Downloads\voice.m4a');
x=mx(:,1);
for n=0:length(x)
   if n==0
       h(1)=1;
   elseif n>=N
       sum=0;
       for k=0:100
           sum=sum+(a^k)*(n==k*N);
           h(n+1)=sum;
       end
   end
end
y=conv(x,h);
n=0:N;
h2=(n==0)-a*(n==N);
x_original=conv(y,h2);
h_sanity_check=conv(h2,h);
figure(1)
stem(h_sanity_check)
sound(x_original,Fs);
title('h1*h2')
figure(2)
plot(x_original)
title('Expected original voice')