function [DCdecode,lenDC] = DCdecoding(sequence)
%DC decoding 
%recoding the first coding such as "010" and then calculate the remaing bits

if(strncmp(sequence,'010',3))           amplitude = 1;  codelen = 3;%record the amplitude length and the coded length
elseif(strncmp(sequence,'011',3))       amplitude = 1;  codelen = 3;
elseif(strncmp(sequence,'100',3))       amplitude = 2;  codelen = 3;
elseif(strncmp(sequence,'00',2))        amplitude = 3;  codelen = 2;
elseif(strncmp(sequence,'101',3))       amplitude = 4;  codelen = 3;
elseif(strncmp(sequence,'110',3))       amplitude = 5;  codelen = 3;
elseif(strncmp(sequence,'1110',4))      amplitude = 6;  codelen = 4;
elseif(strncmp(sequence,'11110',5))     amplitude = 7;  codelen = 5;
elseif(strncmp(sequence,'111110',6))    amplitude = 8;  codelen = 6;
elseif(strncmp(sequence,'1111110',7))   amplitude = 9;  codelen = 7;
elseif(strncmp(sequence,'11111110',8))  amplitude = 10; codelen = 8;
elseif(strncmp(sequence,'111111110',9)) amplitude = 11; codelen = 9;
end

%read the code of the remaining sequence
tmpsequence = sequence((codelen + 1):(codelen + amplitude));
DCdecode = bin2dec(tmpsequence);%binary change

%after decoding the first few numbers,the real number should be dealed by binary or its inverse binary bits
if(DCdecode >= 2^amplitude || DCdecode < 2^(amplitude - 1) || strncmp(sequence,'01',2))% smaller than 0 or error
    DCdecode = -(2^amplitude-1-bin2dec(tmpsequence));%inverse the binary ones
end
if(strncmp(sequence,'010',3))%no other bits
    DCdecode=0;
end
lenDC = amplitude + codelen;