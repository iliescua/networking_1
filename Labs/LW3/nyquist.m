%**************************************************************************
% Project: CE4951 LW3
% Script: nyquist
% Author: Andrew Iliescu
% Date: 9/22/20
% Provides: Calculates the Nyquist bit rate based on user input
% Algorithm:
%   -Uses the Nyquest equation C = 2Blog2(M) [bits/sec]
%   -M is entered as an array of symbols from the user
%   -B is entered as a value from the user
%   -Outputs the Nyquist value C
%**************************************************************************

B = input("Enter a valid bandwidth freq in Hz: ");
%Validate bandwidth value entered by user
while(B <= 0)
    fprintf("The bandwidth should be a positive value \n");
    B = input("Enter a valid bandwidth freq in Hz: ");
end

numSym = input("Enter the number of desired symbols: ");
%Validate the number of symbols entered by user
while(numSym <= 0)
 fprintf("The number of symbols should be a positive value > 0 \n");
 numSym = input("Enter the number of desired symbols: ");
end
M = [numSym, 1];
%Populate symbols array with proper symbols values
for i = 1:1:numSym
    M(i) = 2^i;
end

C = 2*B*log2(M)