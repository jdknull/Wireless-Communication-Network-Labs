dataBits = [1 0 1 1 0 1 1];  % 7 message data bits
hammingCode = constructHammingCode(dataBits);

function hammingCode = constructHammingCode(dataBits)
    m = length(dataBits); % message data 
    r = 0; % redundant data
    while 2^r < m + r + 1
        r = r + 1;
    end

    % Initialize Hamming code bits with zeros 
    hammingCode = zeros(1, m + r); 
    disp('Message + redundant equal 11 bits, all bits will be sets as zeros:')
    disp(hammingCode)

    % Filling the array with message bits without parity bits
    hammingCode([3, 5:7, 9:11]) = dataBits;
    disp('Message bits without parity bits:')
    disp('    |r1|  |r2|  |m1|  |r4|  |m2|  |m3|  |m4|  |r8|  |m5|  |m6|  |m7| ');
    disp(hammingCode)

    % Calculate parity bits
    hammingCode(1) = mod(sum(hammingCode([3, 5, 7, 9, 11])), 2);
    hammingCode(2) = mod(sum(hammingCode([3, 6, 7, 10, 11])), 2);
    hammingCode(4) = mod(sum(hammingCode(5:7)), 2);
    hammingCode(8) = mod(sum(hammingCode(9:11)), 2);

    disp('Calculate parity bits DONE')
    
    disp('Parity |p1  |p2  |p4  |p8  ');
disp("Binary |"+hammingCode(1)+"   |"+hammingCode(2)+"   |"+ hammingCode(4)+"   |"+ hammingCode(8));
disp('----------------------------');

    disp('Hamming Code with Parity bits:');
    disp('    |p1|  |p2|  |m1|  |p4|  |m2|  |m3|  |m4|  |p8|  |m5|  |m6|  |m7| ');
    disp(hammingCode);
end