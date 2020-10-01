%**************************************************************************
% Project: CE4951 LW3
% Script: ampShift
% Author: Andrew Iliescu
% Date: 9/22/20
% Provides: Creates waveforms based on user inputed byte
% Algorithm:
%   -Asks user for a binary byte and validates it
%   -Applys amplitude shift-kying to the byte
%   -Creates a waveform of the resulting sine wave
%   -Creates a waveform of the digital bits
%   -Creates a waveform of the modulating value
%**************************************************************************

byte = input("Enter a binary byte: ");
%Error check and if binary byte then do work 
if all(byte >= 0) && all(byte < 2) && length(byte)  == 8
    t = 1:.001:9;
    a = 5*sin(2*pi*4*t);
    s = a;
    current_time = 1;
    byteVal = [];
   
    for i=1:8              %Eight bits in the byte
        %Creates the values for the digital signals
        byteVal(current_time:current_time+1000) = byte(i);
        if byte(i) == 0
            %Zeros out the sine values based on the byte
            s(current_time:current_time+1000) = 0;
        end
        current_time = current_time+1000;  %Adjust current second
    end
    
    %Make plot figure
    tiledlayout(3,1);
    p1=nexttile;
    p2=nexttile;
    p3=nexttile;

    %Original sine waveform
    plot(p1,t,a);
    xlabel(p1,"Time t [s]");
    ylabel(p1,"Voltage V [volts]");
    title(p1,"5 sin(2\pi*4*t)");
    
    %Digtal data waveform
    plot(p2,t,byteVal);
    xlabel(p2,"Time t [s]");
    ylabel(p2,"Bit Values");
    title(p2,"Digital Data");
   
    %Modulated waveform
    plot(p3,t,s);
    xlabel(p3,"Time t [s]");
    ylabel(p3,"Voltage V [volts]");
    title(p3,"Modulated Signal");
end