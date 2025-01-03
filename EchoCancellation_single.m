clc, clear;
close all
a=0.8; N=7000;
[mx,Fs]=audioread('C:\Users\Dell\Downloads\voice.m4a');
x=mx(:,1);
% Impulse Response
n=0:length(x);
h=(n==0)+a*(n==N);      % Impulse Respone
y=conv(h,x);            % Convolution y
for n=0:length(x)
    sum_new=0;
    for k=0:1000
        if n==k*N
        sum_new=sum_new+((-1)^k)*(a^k)*(n==k*N);
        h2(n+1)=sum_new; 
        end
    end
end
x_original_single= conv(y,h2);
h_sanity_check=conv(h,h2);
sound(x_original_single,Fs);
figure(1);
plot(x_original_single);
title('Expected original voice')
figure(2);
stem(h_sanity_check);
title('h1*h2')