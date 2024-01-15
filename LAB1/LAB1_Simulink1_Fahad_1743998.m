amplitude = 2;     
frequency = 1;      
phase = 0;        

t = 0:0.01:10;    

sine_wave = amplitude * sin(2*pi*frequency*t + phase);

plot(t, sine_wave);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave');
 