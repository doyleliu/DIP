clc;
clear;

picture1 = imread('lena.bmp');picture1 = rgb2gray(picture1);
figure,imshow(uint8(picture1));title('original picture');

% test by the example in the textbook
% picture1 = [52,55,61,66,70,61,64,73;
%         63,59,66,90,109,85,69,72;
%         62,59,68,113,144,104,66,73;
%         63,58,71,122,154,106,70,69;
%         67,61,68,104,126,88,68,70;
%         79,65,60,70,77,63,58,75;
%         85,71,64,59,55,61,65,83;
%         87,79,69,68,65,76,78,94];
OriginalImage = picture1;
picture1 = double(picture1);
calpicture1 = picture1;
%shift
picture1 = picture1 - 128;

[M,N] = size(picture1);
[Row,Col]=size(picture1);
blocknum = M*N/64;

%dct transform
F_picture1 =  blkproc(picture1,[8 8],'mydct2');
%quantization matrix in text book
normal_mtx=[16,11,10,16,24,40,51,61;
        12,12,14,19,26,58,60,55;
        14,13,16,24,40,57,69,56;
        14,17,22,29,51,87,80,62;
        18,22,37,56,68,109,103,77;
        24,35,55,64,81,104,113,92;
        49,64,78,87,103,121,120,101;
        72,92,95,98,112,100,103,99];

%quantization fuction
quantization1 = blkproc(F_picture1,[8 8],'myquantization',normal_mtx);
quantization1 = round(quantization1);

% block=zeros(8,8,M*N/64);
%take the matrix into blocks
m = 0;
for i = 1:M/8
    for j = 1:N/8
        m = m + 1;
        block(:,:,m)=quantization1(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8));
    end
end

%dc coefficents
for i = 1:m
    dcnum(i) = block(1,1,i);
end
%calculate dc differences
dcdiff(M*N/64) =0;
dcdiff(1) = dcnum(1);
for i = 2:(M*N/64)
    dcdiff(i) = dcnum(i) - dcnum(i-1);
end
m=0;
for i = 1:M/8
    for j = 1:N/8
        m = m + 1;
        block(1,1,m) = dcdiff(m);
    end
end

m=0;
for i = 1:M/8
    for j = 1:N/8
        m = m + 1;
        block_change(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8))=block(:,:,m);
    end
end

Picturebit=[];
Picturelength=[];

% read the matrix
Mtmpnum=0;
for row = 1 : M/8
    Ntmpnum=0;
    for col = 1:N/8
        matrix(1:8,1:8) = block_change((row-1)*8+1:(row-1)*8+8,(col-1)*8+1:(col-1)*8+8);
        matrix = round(matrix);
        %zigzag function
        zig_mtx = zigzag(matrix);
        
        w = 0;
        u = 64;
        %read from the final bit and record the end of block
        while(u > 0)  
            if(zig_mtx(u) ~= 0)
                w = u;
                break;
            end
            u = u - 1;
        end
        
        if w == 0
            w = 1;
        end
        
        e(w) = 0;
        %the exsited bit
        for i = 1: w
            e(i) = zig_mtx(i);
        end
        %DCHuffman encoding function
        [PartDCbit,PartDCbit_len]=DCHuffmanEncoding(e(1));
        eob_seq = dec2bin(10,4);%eob=1010 
		
        PartACbit = []; 
        PartACbit_len = []; 
        tmpz_seq = []; tmpt_seq = []; 
        zerolen=0; zero_num=0;
         if (numel(e)==1)
		 %length equals one
          PartACbit=[];
          PartACbit_len=[PartDCbit,eob_seq];
          blockbit_len=length(PartACbit_len);
       else 
          for i=2:w
              if ( e(i)==0 & zero_num<16)
                  zero_num=zero_num+1;
              elseif (e(i)==0 & zero_num==16); 
                  bitsequence=dec2bin(2041,11);
                  zero_num=1;
                  PartACbit=[PartACbit,bitsequence];
              elseif (e(i)~=0 & zero_num==16)
                  tmpz_seq=dec2bin(2041,11);
                  amplitude=e(i);
                  tmpt_seq=ACHuffmanEncoding(0,amplitude);
                  bitsequence=[tmpz_seq,tmpt_seq];
                  PartACbit=[PartACbit,bitsequence];
                  zero_num=0;
              elseif(e(i))
                  zerolen=zero_num;          
                  amplitude=e(i); 
                  zero_num=0;
                  bitsequence=ACHuffmanEncoding(zerolen,amplitude);
                  PartACbit=[PartACbit,bitsequence];
              end
          end
       end                 
       PartACbit_len=[PartDCbit,PartACbit,eob_seq];
       blockbit_len=length(PartACbit_len);
       %save the image bit sequence
       Picturebit=[Picturebit,PartACbit_len];
       Picturelength=numel(Picturebit);       
       Ntmpnum=Ntmpnum+1;
   end
   Mtmpnum=Mtmpnum+1;
end
Picturebit;
Picturelength;

% fid = fopen('lena.dat','wt');
% fprintf(fid,'%s\n',Picturebit);
% fclose(fid);
%save the data by saving the ascii number of 0 or 1
save 'lena.dat' Picturebit -ascii
% savefile = 'lena.dat';
% save(savefile,'Picturebit');

%read the data
Sequence = load('lena.dat', '-ascii');
CodeBitLength = length(Sequence);
CodeBitSequence = '';
%transform the read bit into string in "0" or "1"
for i = 1:CodeBitLength
    CodeBitSequence = [CodeBitSequence , [dec2bin(Sequence(i)-48)]];
end
% CodeBitSequence =  dlmread('lena.dat');
CodeBitLength = length(CodeBitSequence);
%decode the bit sequence
picturedecode = myjpegdecode(CodeBitSequence,blocknum,M);
%dequantization by times the normal_matrix one by one
denormalization = blkproc(picturedecode,[8 8],'mydequantization',normal_mtx);
%use inverse dct function
A_picture =  blkproc(denormalization,[8 8],'myidct2');
A_picture = A_picture + 128;
A_picture = round(A_picture);
%calculate the compress ration
CompressionRatio = Row*Col*8/Picturelength;
%show the picture
figure,imshow(uint8(A_picture));title('JPEG picture');
A_picture1 = double(A_picture);
MES=sum(sum((calpicture1-A_picture1).^2))/(M*N);     
PSNR=20*log10((2^8-1)/sqrt(MES));   

%write the picture
imwrite(uint8(picture1),'lena2.bmp');
        








