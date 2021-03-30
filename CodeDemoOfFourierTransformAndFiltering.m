%Code to demonstrate some concepts in Digital Signal Processing
%namely Discerete Fourier Transform and Filtering
%Author: Dr Ambikesh Jayal, ambi1999@gmail.com
%Date: 30 March 2021.

%Set the Sampling Frequency
%Nyquist Theorem: The highest frequency in a signal can be maximum half of
%sampling fequency. 
%Set the sampling frequency so that it is atleast double
%the maximum analog frequency present in signal. Note that according to the 
%the Nyquist Theorem, in order to recreate the original signal the 
%highest frequency in a signal can be maximum of sampling fequency.

Fs=10;

%Create a vector named t that starts at 0, ends at 20, 
%and whose elements are spaced by 1/sampling frequency
t = 0:1/Fs:20;

y = sin(2*2*pi*t) + sin(4*2*pi*t);

%Apply a Lowpass filter to filter out any frequencies greater than 3 Hz.
yFiltered=lowpass(y,3,Fs);

%y contains original signal and yFiltered contains filtered signal.
tiledlayout(3,1) % Requires R2019b or later

% Top plot
nexttile
plot(t, y, '-o')
%plot(t,y,'Marker','square','MarkerIndices',1:7);
xlabel('Time');
ylabel('Magnitude');
%title('Matlab Code and output by Ambi /n Original Signal: Time domain plot');
title('Author: Dr Ambikesh Jayal, ambi1999@gmail.com') 
subtitle('Original Signal: Time domain plot: y = sin(2*2*pi*t) + sin(4*2*pi*t);')
nexttile
drawFourierTransform(Fs, y, 'Frequencines in the Signal using Discerete Fourier tansform (frequency of 2 and 4 Hz)')
xlabel('Magnitude');
ylabel('Frequency');

% Bottom plot
nexttile
drawFourierTransform(Fs, yFiltered, 'Frequencies in Filtered Signal. The 4Hz frequency has been filtered out using the low pass filter yFiltered=lowpass(y,3,Fs)')
xlabel('Magnitude');
ylabel('Frequency');

%Function to plot frequencies found using fourier transform
function drawFourierTransform(fs,ysignal, titletext)
    %A Fourier transform returns information about the frequency 
    %content of the signal. You can use the fft function to compute 
    %the discrete Fourier transform of a vector.
    yfft = fft(ysignal);

    %numel function: returns Number of array elements
    n=numel(ysignal);

    %The fft function in MATLAB uses only the sampled data to 
    %compute the Fourier transform. The f variable will represent 
    %the frequencies that correspond to the values in yfft.
    f = 0:fs/n:fs*(n-1)/n;

    %The output values from fft are complex numbers. 
    %To plot their magnitude, you can use the abs function.
    plot(f,abs(yfft))
    title(titletext)
end