%**************************************************************************
% Project: CE4951 LW3
% Script: freqShift
% Author: Andrew Iliescu
% Date: 9/22/20
% Provides: Creates waveforms based on user inputed byte
% Algorithm:
%   -Asks user for a binary byte and validates it
%   -Applys frequency shift-keying to the byte
%   -Creates a waveform of the resulting sine waves
%   -Creates a waveform of the digital bits
%   -Creates a waveform of the modulating value
%**************************************************************************

byte = input("Enter a binary byte: ");
%Error check and if binary byte then do work 
if all(byte >= 0) && all(byte < 2) && length(byte)  == 8
    t = 1:.001:9;
    a1 = 5*sin(2*pi*4*t);
    a2 = 5*sin(2*pi*2*t);
    s = [];
    c_time = 1;
    byteVal = [];
   
    for i=1:8              %Eight bits in the byte
        %Creates the values for the digital signals
        byteVal(c_time:c_time+1000) = byte(i);
        if byte(i) == 0
            %Uses freq 1 for sine wave
            s(c_time:c_time+1000) = a1(c_time:c_time+1000);
        elseif byte(i) == 1
            %Uses freq 2 for sine wave
            s(c_time:c_time+1000) = a2(c_time:c_time+1000);
        end
        c_time = c_time+1000;  %Adjust current second
    end
    
    %Make plot figure
    tiledlayout(4,1);
    p1=nexttile;
    p2=nexttile;
    p3=nexttile;
    p4=nexttile;

    %Sine waveform with freq 1
    plot(p1,t,a1);
    xlabel(p1,"Time t [s]");
    ylabel(p1,"Voltage V [volts]");
    title(p1,"5 sin(2\pi*4*t)");
    
    %Sine waveform with freq 2
    plot(p2,t,a2);
    xlabel(p2,"Time t [s]");
    ylabel(p2,"Voltage V [volts]");
    title(p2,"5 sin(2\pi*2*t)");
    
    %Digtal data waveform
    plot(p3,t,byteVal);
    xlabel(p3,"Time t [s]");
    ylabel(p3,"Bit Values");
    title(p3,"Digital Data");
   
    %Modulated waveform
    plot(p4,t,s);
    xlabel(p4,"Time t [s]");
    ylabel(p4,"Voltage V [volts]");
    title(p4,"Modulated Signal");
end