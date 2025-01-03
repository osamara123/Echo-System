clc, clear;
close all
a=0.8; N=7000;
[mx,Fs]=audioread('C:\Users\Dell\Downloads\voice.m4a');
x=mx(:,1);
% Impulse Response
n=0:length(x);
h=(n==0)+a*(n==N);      % Impulse Respone
y=conv(h,x);            % Convolution y
sound(y,Fs);
figure(2);
plot(y);
title('Original+Echo');