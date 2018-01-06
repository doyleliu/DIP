function [ACdecode,AClength,ACnum] = ACdecoding(x,lenx)
%the inverse step of the encoding function,we need to decode it to get the code length,the running length and the amplitude 
if(strncmp(x,'00',2))                    amplitude=1;codelen=2;Z=0;
elseif(strncmp(x,'01',2))                amplitude=2;codelen=2;Z=0;
elseif(strncmp(x,'100',3))               amplitude=3;codelen=3;Z=0;
elseif(strncmp(x,'1011',4))              amplitude=4;codelen=4;Z=0;
elseif(strncmp(x,'11010',5))             amplitude=5;codelen=5;Z=0;
elseif(strncmp(x,'1111000',7))           amplitude=6;codelen=7;Z=0;
elseif(strncmp(x,'11111000',8))          amplitude=7;codelen=8;Z=0;
elseif(strncmp(x,'1111110110',10))       amplitude=8;codelen=10;Z=0;
elseif(strncmp(x,'1111111110000010',16)) amplitude=9;codelen=16;Z=0;
elseif(strncmp(x,'1111111110000011',16)) amplitude=10;codelen=16;Z=0;

elseif(strncmp(x,'1100',4))              amplitude=1;codelen=4;Z=1;
elseif(strncmp(x,'11011',5))             amplitude=2;codelen=5;Z=1;
elseif(strncmp(x,'1111001',7))           amplitude=3;codelen=7;Z=1;
elseif(strncmp(x,'111110110',9))         amplitude=4;codelen=9;Z=1;
elseif(strncmp(x,'11111110110',11))      amplitude=5;codelen=11;Z=1;
elseif(strncmp(x,'1111111110000100',16)) amplitude=6;codelen=16;Z=1;
elseif(strncmp(x,'1111111110000101',16)) amplitude=7;codelen=16;Z=1;
elseif(strncmp(x,'1111111110000110',16)) amplitude=8;codelen=16;Z=1;
elseif(strncmp(x,'1111111110000111',16)) amplitude=9;codelen=16;Z=1;
elseif(strncmp(x,'1111111110001000',16)) amplitude=10;codelen=16;Z=1;
       
elseif(strncmp(x,'11100',5))             amplitude=1;codelen=5;Z=2;   
elseif(strncmp(x,'11111001',8))          amplitude=2;codelen=8;Z=2;
elseif(strncmp(x,'1111110111',10))       amplitude=3;codelen=10;Z=2;
elseif(strncmp(x,'111111110100',12))     amplitude=4;codelen=12;Z=2;
elseif(strncmp(x,'1111111110001001',16)) amplitude=5;codelen=16;Z=2;
elseif(strncmp(x,'1111111110001010',16)) amplitude=6;codelen=16;Z=2;
elseif(strncmp(x,'1111111110001011',16)) amplitude=7;codelen=16;Z=2;
elseif(strncmp(x,'1111111110001100',16)) amplitude=8;codelen=16;Z=2;
elseif(strncmp(x,'1111111110001101',16)) amplitude=9;codelen=16;Z=2;
elseif(strncmp(x,'1111111110001110',16)) amplitude=10;codelen=16;Z=2;
      
elseif(strncmp(x,'111010',6))            amplitude=1;codelen=6;Z=3;
elseif(strncmp(x,'111110111',9))         amplitude=2;codelen=9;Z=3;
elseif(strncmp(x,'111111110101',12))     amplitude=3;codelen=12;Z=3;
elseif(strncmp(x,'1111111110001111',16)) amplitude=4;codelen=16;Z=3;
elseif(strncmp(x,'1111111110010000',16)) amplitude=5;codelen=16;Z=3;
elseif(strncmp(x,'1111111110010001',16)) amplitude=6;codelen=16;Z=3;
elseif(strncmp(x,'1111111110010010',16)) amplitude=7;codelen=16;Z=3;
elseif(strncmp(x,'1111111110010011',16)) amplitude=8;codelen=16;Z=3;
elseif(strncmp(x,'1111111110010100',16)) amplitude=9;codelen=16;Z=3;
elseif(strncmp(x,'1111111110010101',16)) amplitude=10;codelen=16;Z=3;
       
elseif(strncmp(x,'111011',6))            amplitude=1;codelen=6;Z=4;
elseif(strncmp(x,'1111111000',10))       amplitude=2;codelen=10;Z=4;
elseif(strncmp(x,'1111111110010110',16)) amplitude=3;codelen=16;Z=4;
elseif(strncmp(x,'1111111110010111',16)) amplitude=4;codelen=16;Z=4;
elseif(strncmp(x,'1111111110011000',16)) amplitude=5;codelen=16;Z=4;
elseif(strncmp(x,'1111111110011001',16)) amplitude=6;codelen=16;Z=4;
elseif(strncmp(x,'1111111110011010',16)) amplitude=7;codelen=16;Z=4;
elseif(strncmp(x,'1111111110011011',16)) amplitude=8;codelen=16;Z=4;
elseif(strncmp(x,'1111111110011100',16)) amplitude=9;codelen=16;Z=4;
elseif(strncmp(x,'1111111110011101',16)) amplitude=10;codelen=16;Z=4;
       
elseif(strncmp(x,'1111010',7))           amplitude=1;codelen=7;Z=5;
elseif(strncmp(x,'11111110111',11))      amplitude=2;codelen=11;Z=5;
elseif(strncmp(x,'1111111110011110',16)) amplitude=3;codelen=16;Z=5;
elseif(strncmp(x,'1111111110011111',16)) amplitude=4;codelen=16;Z=5;
elseif(strncmp(x,'1111111110100000',16)) amplitude=5;codelen=16;Z=5;
elseif(strncmp(x,'1111111110100001',16)) amplitude=6;codelen=16;Z=5;
elseif(strncmp(x,'1111111110100010',16)) amplitude=7;codelen=16;Z=5;
elseif(strncmp(x,'1111111110100011',16)) amplitude=8;codelen=16;Z=5;
elseif(strncmp(x,'1111111110100100',16)) amplitude=9;codelen=16;Z=5;
elseif(strncmp(x,'1111111110100101',16)) amplitude=10;codelen=16;Z=5;
         
elseif(strncmp(x,'1111011',7))           amplitude=1;codelen=7;Z=6;
elseif(strncmp(x,'111111110110',12))     amplitude=2;codelen=12;Z=6;
elseif(strncmp(x,'1111111110100110',16)) amplitude=3;codelen=16;Z=6;
elseif(strncmp(x,'1111111110100111',16)) amplitude=4;codelen=16;Z=6;
elseif(strncmp(x,'1111111110101000',16)) amplitude=5;codelen=16;Z=6;
elseif(strncmp(x,'1111111110101001',16)) amplitude=6;codelen=16;Z=6;  
elseif(strncmp(x,'1111111110101010',16)) amplitude=7;codelen=16;Z=6;
elseif(strncmp(x,'1111111110101011',16)) amplitude=8;codelen=16;Z=6;
elseif(strncmp(x,'1111111110101100',16)) amplitude=9;codelen=16;Z=6;
elseif(strncmp(x,'1111111110101101',16)) amplitude=10;codelen=16;Z=6;
   
elseif(strncmp(x,'11111010',8))          amplitude=1;codelen=8;Z=7; 
elseif(strncmp(x,'111111110111',12))     amplitude=2;codelen=12;Z=7;
elseif(strncmp(x,'1111111110101110',16)) amplitude=3;codelen=16;Z=7;
elseif(strncmp(x,'1111111110101111',16)) amplitude=4;codelen=16;Z=7;
elseif(strncmp(x,'1111111110110000',16)) amplitude=5;codelen=16;Z=7;
elseif(strncmp(x,'1111111110110001',16)) amplitude=6;codelen=16;Z=7;
elseif(strncmp(x,'1111111110110010',16)) amplitude=7;codelen=16;Z=7;
elseif(strncmp(x,'1111111110110011',16)) amplitude=8;codelen=16;Z=7;
elseif(strncmp(x,'1111111110110100',16)) amplitude=9;codelen=16;Z=7;
elseif(strncmp(x,'1111111110110101',16)) amplitude=10;codelen=16;Z=7;
        
elseif(strncmp(x,'111111000',9))         amplitude=1;codelen=9;Z=8;
elseif(strncmp(x,'111111111000000',15))  amplitude=2;codelen=15;Z=8;
elseif(strncmp(x,'1111111110110110',16)) amplitude=3;codelen=16;Z=8;
elseif(strncmp(x,'1111111110110111',16)) amplitude=4;codelen=16;Z=8;
elseif(strncmp(x,'1111111110111000',16)) amplitude=5;codelen=16;Z=8;
elseif(strncmp(x,'1111111110111001',16)) amplitude=6;codelen=16;Z=8; 
elseif(strncmp(x,'1111111110111010',16)) amplitude=7;codelen=16;Z=8;
elseif(strncmp(x,'1111111110111011',16)) amplitude=8;codelen=16;Z=8;
elseif(strncmp(x,'1111111110111100',16)) amplitude=9;codelen=16;Z=8;
elseif(strncmp(x,'1111111110111101',16)) amplitude=10;codelen=16;Z=8;
       
elseif(strncmp(x,'111111001',9))         amplitude=1;codelen=9;Z=9;
elseif(strncmp(x,'1111111110111110',16)) amplitude=2;codelen=16;Z=9;
elseif(strncmp(x,'1111111110111111',16)) amplitude=3;codelen=16;Z=9;
elseif(strncmp(x,'1111111111000000',16)) amplitude=4;codelen=16;Z=9;
elseif(strncmp(x,'1111111111000001',16)) amplitude=5;codelen=16;Z=9;
elseif(strncmp(x,'1111111111000010',16)) amplitude=6;codelen=16;Z=9;
elseif(strncmp(x,'1111111111000011',16)) amplitude=7;codelen=16;Z=9;
elseif(strncmp(x,'1111111111000100',16)) amplitude=8;codelen=16;Z=9;
elseif(strncmp(x,'1111111111000101',16)) amplitude=9;codelen=16;Z=9;
elseif(strncmp(x,'1111111111000110',16)) amplitude=10;codelen=16;Z=9;
       
elseif(strncmp(x,'111111010',9))         amplitude=1;codelen=9;Z=10;
elseif(strncmp(x,'1111111111000111',16)) amplitude=2;codelen=16;Z=10;
elseif(strncmp(x,'1111111111001000',16)) amplitude=3;codelen=16;Z=10;
elseif(strncmp(x,'1111111111001001',16)) amplitude=4;codelen=16;Z=10;
elseif(strncmp(x,'1111111111001010',16)) amplitude=5;codelen=16;Z=10;
elseif(strncmp(x,'1111111111001011',16)) amplitude=6;codelen=16;Z=10;
elseif(strncmp(x,'1111111111001100',16)) amplitude=7;codelen=16;Z=10;
elseif(strncmp(x,'1111111111001101',16)) amplitude=8;codelen=16;Z=10;
elseif(strncmp(x,'1111111111001110',16)) amplitude=9;codelen=16;Z=10;
elseif(strncmp(x,'1111111111001111',16)) amplitude=10;codelen=16;Z=10;
       
elseif(strncmp(x,'1111111001',10))       amplitude=1;codelen=10;Z=11;
elseif(strncmp(x,'1111111111010000',16)) amplitude=2;codelen=16;Z=11;
elseif(strncmp(x,'1111111111010001',16)) amplitude=3;codelen=16;Z=11;
elseif(strncmp(x,'1111111111010010',16)) amplitude=4;codelen=16;Z=11;
elseif(strncmp(x,'1111111111010011',16)) amplitude=5;codelen=16;Z=11;
elseif(strncmp(x,'1111111111010100',16)) amplitude=6;codelen=16;Z=11;  
elseif(strncmp(x,'1111111111010101',16)) amplitude=7;codelen=16;Z=11;
elseif(strncmp(x,'1111111111010110',16)) amplitude=8;codelen=16;Z=11;
elseif(strncmp(x,'1111111111010111',16)) amplitude=9;codelen=16;Z=11;
elseif(strncmp(x,'1111111111011000',16)) amplitude=10;codelen=16;Z=11;  
        
elseif(strncmp(x,'1111111010',10))       amplitude=1;codelen=10;Z=12;
elseif(strncmp(x,'1111111111011001',16)) amplitude=2;codelen=16;Z=12;
elseif(strncmp(x,'1111111111011010',16)) amplitude=3;codelen=16;Z=12;
elseif(strncmp(x,'1111111111011011',16)) amplitude=4;codelen=16;Z=12;
elseif(strncmp(x,'1111111111011100',16)) amplitude=5;codelen=16;Z=12;
elseif(strncmp(x,'1111111111011101',16)) amplitude=6;codelen=16;Z=12;
elseif(strncmp(x,'1111111111011110',16)) amplitude=7;codelen=16;Z=12;
elseif(strncmp(x,'1111111111011111',16)) amplitude=8;codelen=16;Z=12;
elseif(strncmp(x,'1111111111100000',16)) amplitude=9;codelen=16;Z=12;
elseif(strncmp(x,'1111111111100001',16)) amplitude=10;codelen=16;Z=12;
        
elseif(strncmp(x,'11111111000',11))      amplitude=1;codelen=11;Z=13;
elseif(strncmp(x,'1111111111100010',16)) amplitude=2;codelen=16;Z=13;
elseif(strncmp(x,'1111111111100011',16)) amplitude=3;codelen=16;Z=13;
elseif(strncmp(x,'1111111111100100',16)) amplitude=4;codelen=16;Z=13;
elseif(strncmp(x,'1111111111100101',16)) amplitude=5;codelen=16;Z=13;
elseif(strncmp(x,'1111111111100110',16)) amplitude=6;codelen=16;Z=13;
elseif(strncmp(x,'1111111111100111',16)) amplitude=7;codelen=16;Z=13;
elseif(strncmp(x,'1111111111101000',16)) amplitude=8;codelen=16;Z=13;
elseif(strncmp(x,'1111111111101001',16)) amplitude=9;codelen=16;Z=13;
elseif(strncmp(x,'1111111111101010',16)) amplitude=10;codelen=16;Z=13;
        
elseif(strncmp(x,'1111111111101011',16)) amplitude=1;codelen=16;Z=14; 
elseif(strncmp(x,'1111111111101100',16)) amplitude=2;codelen=16;Z=14;
elseif(strncmp(x,'1111111111101101',16)) amplitude=3;codelen=16;Z=14;
elseif(strncmp(x,'1111111111101110',16)) amplitude=4;codelen=16;Z=14;
elseif(strncmp(x,'1111111111101111',16)) amplitude=5;codelen=16;Z=14;
elseif(strncmp(x,'1111111111110000',16)) amplitude=6;codelen=16;Z=14;
elseif(strncmp(x,'1111111111110001',16)) amplitude=7;codelen=16;Z=14;
elseif(strncmp(x,'1111111111110010',16)) amplitude=8;codelen=16;Z=14;
elseif(strncmp(x,'1111111111110011',16)) amplitude=9;codelen=16;Z=14;
elseif(strncmp(x,'1111111111110100',16)) amplitude=10;codelen=16;Z=14;
    
elseif(strncmp(x,'11111111001',11))      amplitude=0;codelen=11;Z=15;
elseif(strncmp(x,'1111111111110101',16)) amplitude=1;codelen=16;Z=15;
elseif(strncmp(x,'1111111111110110',16)) amplitude=2;codelen=16;Z=15;
elseif(strncmp(x,'1111111111110111',16)) amplitude=3;codelen=16;Z=15;
elseif(strncmp(x,'1111111111111000',16)) amplitude=4;codelen=16;Z=15;
elseif(strncmp(x,'1111111111111001',16)) amplitude=5;codelen=16;Z=15;
elseif(strncmp(x,'1111111111111010',16)) amplitude=6;codelen=16;Z=15;
elseif(strncmp(x,'1111111111111011',16)) amplitude=7;codelen=16;Z=15;
elseif(strncmp(x,'1111111111111100',16)) amplitude=8;codelen=16;Z=15;
elseif(strncmp(x,'1111111111111101',16)) amplitude=9;codelen=16;Z=15;
elseif(strncmp(x,'1111111111111110',16)) amplitude=10;codelen=16;Z=15;
else amplitude =0;codelen=0;Z=0;
end
%a strip of the code
ACdecode(1:Z)=0;
amplitude;
%ֵthe amplitude 
if amplitude==0  
    ACdecode(Z+1)=0;
else
    s=x((codelen+1):(codelen+amplitude));
    ACdecode(Z+1)=bin2dec(s);
    if(ACdecode(Z+1)<2^(amplitude-1) || ACdecode(Z+1)>=2^amplitude)% smaller than 0 or error
        ACdecode(Z+1)=-(2^amplitude-1-ACdecode(Z+1));
    end
end
AClength = codelen+amplitude;
ACnum = Z+1;