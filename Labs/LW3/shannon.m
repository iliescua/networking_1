%**************************************************************************
% Project: CE4951 LW3
% Script: shannon
% Author: Andrew Iliescu
% Date: 9/22/20
% Provides: Calculates the Shannon bit rate based on user input
% Algorithm:
%   -Uses the Shannon equation C = Blog2(1+SNR) [bits/sec]
%   -SNR will be calculated using SNRdb = 10log10(SNR)
%   -SNRdb will be entered by user
%   -B is entered as a value from the user
%   -Outputs the Shannon value C
%**************************************************************************

B = input("Enter a valid bandwidth freq in Hz: ");
%Validate bandwidth value entered by user
while(B <= 0)
    fprintf("The bandwidth should be a positive value \n");
    B = input("Enter a valid bandwidth freq in Hz: ");
end

SNRdb = input("Enter the SNR value in dB: ");
%Validate the SNRdb value entered by user
while(SNRdb <= 0)
 fprintf("The SNRdb should be a positive value > 0 \n");
 SNRdb = input("Enter the SNR value in dB: ");
end

%Calculate the SNR to solve for C
SNR = 10^(SNRdb/10);

%Calculate Shannon bit rate
C = B*log2(1+SNR)

   