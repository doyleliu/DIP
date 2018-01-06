function [bitnum,len]=DCHuffmanEncoding(sequence) 
% the dc encoding in the text bool
temp=sequence;
tmpvalue=abs(sequence);
if (tmpvalue==0);amplitude=1;codelen=3;codenum=2;% codenum=010
elseif(tmpvalue==1);amplitude=1;codelen=3;codenum=3;% codenum=011 
elseif(tmpvalue >=    2 && tmpvalue <=    3);amplitude= 2;codelen = 3;codenum=  4;  % codenum=010;
elseif(tmpvalue >=    4 && tmpvalue <=    7);amplitude= 3;codelen = 2;codenum=  0;  % codenum=00;
elseif(tmpvalue >=    8 && tmpvalue <=   15);amplitude= 4;codelen = 3;codenum=  5;  % codenum=101; 
elseif(tmpvalue >=   16 && tmpvalue <=   31);amplitude= 5;codelen = 3;codenum=  6;  % codenum=110;
elseif(tmpvalue >=   32 && tmpvalue <=   63);amplitude= 6;codelen = 4;codenum= 14;  % codenum=1110;
elseif(tmpvalue >=   64 && tmpvalue <=  127);amplitude= 7;codelen = 5;codenum= 30;  % codenum=11110;
elseif(tmpvalue >=  128 && tmpvalue <=  255);amplitude= 8;codelen = 6;codenum= 62;  % codenum=111110;
elseif(tmpvalue >=  256 && tmpvalue <=  511);amplitude= 9;codelen = 7;codenum=126;  % codenum=1111110;
elseif(tmpvalue >=  512 && tmpvalue <= 1023);amplitude=10;codelen = 8;codenum=254;  % codenum=11111110;
elseif(tmpvalue >= 1024 && tmpvalue <= 2047);amplitude=11;codelen = 9;codenum=510;  % codenum=111111110;
end
if (temp>0) 
% the codenum plus the binary num of the value directly
	bitnum=[dec2bin(codenum,codelen),dec2bin(tmpvalue,amplitude)];
else
% the codenum plus the inversed binary num of the value directly
    bitnum=[dec2bin(codenum,codelen),dec2bin(2^amplitude-1-tmpvalue,amplitude)];
end
len = numel(bitnum);

