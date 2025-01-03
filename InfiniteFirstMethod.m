clc, clear;
close all
a=0.8;  % must be between 0 and 1 
N=7000; % Delay
[mx,Fs]=audioread('C:\Users\Dell\Downloads\voice.m4a');
x=mx(:,1);
for n=1:length(x)
    if n<N
        y(n)=x(n);
    elseif n>N
        sum=0;
        for k=0:100
            if n>k*N
                sum=sum+(a^k)*x(n-k*N);
            end
        end
        y(n)=sum;
    end
end
sound(y,Fs);
plot(y);