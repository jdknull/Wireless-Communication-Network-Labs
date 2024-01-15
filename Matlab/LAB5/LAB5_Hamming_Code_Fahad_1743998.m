% Received bits with error
rx_bits = [1 0 0 0 1 0 1];  

% Calculate parity bits 
p1 = mod(sum(rx_bits([7 5 3 1])),2);
p2 = mod(sum(rx_bits([6 5 2 1])),2);
p4 = mod(sum(rx_bits([4 3 2 1])),2);


syn = [p4 p2 p1];

disp('Parity |p4  |  p2  |  p1:');
disp("Binary |"+syn(1)+"   |  "+ syn(2)+"   |  "+ syn(3)); 

% Detect error 
if sum(syn)==0
   disp('No error');
else
   % Convert binary to decimal
   error_bit = bi2de(fliplr(syn));
   
   disp('Error detected at bit:');
   disp(error_bit);
   
   % Correct error based on bit  
   if error_bit == 7
       rx_bits(1) = ~rx_bits(1); 
   elseif error_bit == 6   
       rx_bits(2) = ~rx_bits(2);
   elseif error_bit == 5
       rx_bits(3) = ~rx_bits(3); 
   elseif error_bit == 3
       rx_bits(5) = ~rx_bits(5);
   elseif error_bit == 4
       rx_bits(4) = ~rx_bits(4);
   elseif error_bit == 1
       rx_bits(7) = ~rx_bits(7);
   elseif error_bit == 2
       rx_bits(6) = ~rx_bits(6);
   end
   
   disp('Corrected received bits:');
   disp(rx_bits);  
end