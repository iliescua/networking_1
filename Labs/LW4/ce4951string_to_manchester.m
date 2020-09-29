%**************************************************************************
% Project: CE4951 LW4
% Script: ce4951string_to_manchester
% Author: Andrew Iliescu
% Date: 9/29/20
% Provides: Encodes a word into Manchester encoding 
% Algorithm:
%   -Asks user for a word
%   -Determines the length of the word
%   -Creates an output vector of the proper size
%   -Converts the word to binary
%   -Applies manchester encoding to the binary value
%**************************************************************************

%Get user word
word = input("Enter a word surronded in single quaotes: ");
%Zeros output for manchester in bits for word length
output = zeros(8*strlength(word)*2, 1);
count = 1;

%Iterates through the word and converts letters to binary equivalent
for i = 1:1:strlength(word)
    charBin = dec2bin(word(i), 8);
    %Iterates through each binary value to convert to manchester
    for j = 1:1:length(charBin) 
        if charBin(j) == '0'
            output(count) = 1;
        else
            output(count+1) = 1;
        end
        count =  count + 2;
    end
end

%This is used to format the ouput nicely 
for i = 1:1:length(output)
    fprintf("%d", output(i));
    %16 is used because manchester takes 8 bits -> 16 bits
    if mod(i, 16) == 0
        fprintf(" ");
    end
end 