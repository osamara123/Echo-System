clc, clear;
close all
a=0.8;      % must be between 0 and 1
N=7000;     % Delay 
[x,Fs]=audioread('C:\Users\Dell\Downloads\voice.m4a');
for n=1:length(x)
    if (n<N)
        y(n)=x(n);                  % Original Echo
    elseif (n>N)
        y(n)=x(n)+(a*x(n-N));       % Echo Generation 
    end
end
% create the Echo file in Matlab destination  
audiowrite('Echo.wav',y,Fs);
sound(y,Fs);        % Echo Sound
figure(1);          % Orignal Echo Graph
plot(x);
title('Original voice')
% Signle Echo Generation Graph
figure(2);
plot(y);
title('Original+Echo');