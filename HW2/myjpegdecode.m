function out = myjpegdecode(bit,blocknum,M)

% %test
% Sequence = load('lena.dat', '-ascii');
% CodeBitLength = length(Sequence);
% CodeBitSequence = '';
% for i = 1:CodeBitLength
%     CodeBitSequence = [CodeBitSequence , [dec2bin(Sequence(i)-48)]];
% end
% % CodeBitSequence =  dlmread('lena.dat');
% CodeBitLength = length(CodeBitSequence);
% 
% bit = CodeBitSequence;
% blocknum = 1;
% M = 8
%begin
Picture(8,8,blocknum) = 0;
%get every symbol to be decoded
for i = 1:blocknum
    bitlength = length(bit);
    %DCdecoding
    [DCdecode,DClength] = DCdecoding(bit);    
 
    if i == 1
        Picture(1,1,i) = DCdecode;
    else
        Picture(1,1,i) = Picture(1,1,i-1) + DCdecode;
    end
    %the sequence remained
    tmpp = bit((DClength+1):bitlength);
    length2 = length(tmpp);
    
    %ACdecoding
    ACnum = 0;
    ACdecode = [];
    while(length2)
        if(strncmp(tmpp,'1010',4))
            bit = tmpp(5:length2);%end of block
            break;
        else
            [AC_decode2,AC_length2,AC_num2] = ACdecoding(tmpp,length2);
            ACnum = ACnum + AC_num2;
            ACdecode = [ACdecode,AC_decode2];
            tmpp = tmpp((AC_length2 + 1):length2);
            length2 = length(tmpp);
        end
    end
    %compensate the matrix with 0
    if ACnum < 63
        ACdecode((ACnum + 1):63) = 0;
    end
    
    %zigzag sequence
    Picture(1,2,i) = ACdecode(1);   Picture(1,3,i) = ACdecode(5);  Picture(1,4,i) = ACdecode(6);   Picture(1,5,i) = ACdecode(14);  Picture(1,6,i) = ACdecode(15); Picture(1,7,i) = ACdecode(27); Picture(1,8,i) = ACdecode(28);
    Picture(2,1,i) = ACdecode(2);  Picture(2,2,i) = ACdecode(4);   Picture(2,3,i) = ACdecode(7);  Picture(2,4,i) = ACdecode(13);  Picture(2,5,i) = ACdecode(16);  Picture(2,6,i) = ACdecode(26); Picture(2,7,i) = ACdecode(29); 
	Picture(2,8,i) = ACdecode(42);Picture(3,1,i) = ACdecode(3);  Picture(3,2,i) = ACdecode(8);   Picture(3,3,i) = ACdecode(12); Picture(3,4,i) = ACdecode(17);  Picture(3,5,i) = ACdecode(25);  Picture(3,6,i) = ACdecode(30); 
	Picture(3,7,i) = ACdecode(41); Picture(3,8,i) = ACdecode(43);Picture(4,1,i) = ACdecode(9);  Picture(4,2,i) = ACdecode(11);  Picture(4,3,i) = ACdecode(18); Picture(4,4,i) = ACdecode(24);  Picture(4,5,i) = ACdecode(31);  
	Picture(4,6,i) = ACdecode(40); Picture(4,7,i) = ACdecode(44); Picture(4,8,i) = ACdecode(53);Picture(5,1,i) = ACdecode(10); Picture(5,2,i) = ACdecode(19);  Picture(5,3,i) = ACdecode(23); Picture(5,4,i) = ACdecode(32);  
	Picture(5,5,i) = ACdecode(39);  Picture(5,6,i) = ACdecode(45); Picture(5,7,i) = ACdecode(52); Picture(5,8,i) = ACdecode(54); Picture(6,1,i) = ACdecode(20); Picture(6,2,i) = ACdecode(22);  Picture(6,3,i) = ACdecode(33); 
	Picture(6,4,i) = ACdecode(38);  Picture(6,5,i) = ACdecode(46);  Picture(6,6,i) = ACdecode(51); Picture(6,7,i) = ACdecode(55); Picture(6,8,i) = ACdecode(60);Picture(7,1,i) = ACdecode(21); Picture(7,2,i) = ACdecode(34);  
	Picture(7,3,i) = ACdecode(37); Picture(7,4,i) = ACdecode(47);  Picture(7,5,i) = ACdecode(50);  Picture(7,6,i) = ACdecode(56); Picture(7,7,i) = ACdecode(59); Picture(7,8,i) = ACdecode(61); Picture(8,1,i) = ACdecode(35); 
	Picture(8,2,i) = ACdecode(36);  Picture(8,3,i) = ACdecode(48); Picture(8,4,i) = ACdecode(49);  Picture(8,5,i) = ACdecode(57);  Picture(8,6,i) = ACdecode(58); Picture(8,7,i) = ACdecode(62); Picture(8,8,i) = ACdecode(63);
end

N = 64*blocknum/M;
out(M,N) = 0;
n = 0;
for row = 1:M/8
    for col = 1:N/8
        n = n + 1;
        out(((row - 1) * 8 + 1):(row * 8),((col - 1) * 8 + 1):(col * 8)) = Picture(:,:,n);
   end
end