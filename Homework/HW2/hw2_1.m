%**************************************************************************
% Project: CE4951 HW2
% Script: hw2_1
% Author: Andrew Iliescu
% Date: 9/21/20
% Provides: Calculates the Nyquist bit rate based on different symbols
% Algorithm:
%   -Uses the Nyquist equation C = 2Blog2(M) [bits/sec]
%   -M is entered as an array of symbols
%   -B is a set value of 3020 [Hz]
%   -Outputs the Nyquist value C
%**************************************************************************

B = 3020;
M = [2 4 8 16 32];
C = 2*B*log2(M); 

%Create table for the Nyquist data
table(C, 'VariableNames', "C [bps]")

%Create plot for the data
plot(M,C)
xlabel('Symbols M','FontSize',16)
ylabel('Nyquist Freq. C [bits/sec]','FontSize',16)
title('Nyquist Rate vs. Number of Symbols', 'FontSize', 16)