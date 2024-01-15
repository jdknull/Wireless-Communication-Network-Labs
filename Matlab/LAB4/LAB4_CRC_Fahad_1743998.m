% The program generates CRC code for any given input message stream &
% generator polynomial
msg=[1 0 1 0 1 0 1 0 1 0];
disp('The message')
disp(msg)
%msg=input('Input Message sequence :');
poly=[1 1 0 0 1];
disp('The Polynomial')
disp(poly)
%poly=input('Input Generator Polynomial :');
[M, N]=size(poly);
mseg=[msg zeros(1,N-1)];
[q, r]=deconv(mseg,poly);
r=abs(r);
for i=1:length(r)
    a=r(i);
    if ( mod(a,2)== 0 )
        r(i)=0;
    else
        r(i)=1;
    end
end

crc=r(length(msg)+1:end);
disp('Resever:')
disp(crc);
frame = bitor(mseg,r);
disp(frame);