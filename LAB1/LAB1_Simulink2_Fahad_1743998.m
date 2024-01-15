t = 0:0.01:10; 
frequency = 5; 
amplitude = 1; 

sine_wave = amplitude * sin(2 * pi * frequency * t);
plot(t, sine_wave);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave Plot');
