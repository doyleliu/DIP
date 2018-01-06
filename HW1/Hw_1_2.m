picture1 = imread('PicSample.jpg');
picture1 = rgb2gray(picture1);
picture1=double(picture1);
[M,N] = size(picture1);

F_picture1 = zeros(M,N);
F_picture2 = zeros(M,N);

%ԭʼͼ����dct�ֿ�任����任
F_picture1 = blkproc(picture1,[8 8],'mydct2');
I_picture1 = blkproc(F_picture1,[8 8],'myidct2');
figure,imshow(uint8(F_picture1));
figure,imshow(uint8(I_picture1));

%����5��DCT�任ϵ��
mask = [ 1 1 0 0 0 0 0 0 
         1 1 0 0 0 0 0 0
         1 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
    ];
mask = double(mask);
%��8x8����DCT,ͬʱ����ϵ��
F_picture5 =  blkproc(picture1,[8 8],'mydct2',mask);
I_picture5 = blkproc(F_picture5,[8 8],'myidct2',mask);
figure,imshow(uint8(F_picture5));title('5DCTFrequency');
figure,imshow(uint8(I_picture5));title('5DCTPic');

%����10��DCT�任ϵ��
mask = [ 1 1 0 1 0 0 0 0 
         0 0 1 1 0 0 0 0
         1 1 1 0 0 0 0 0
         1 1 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
    ];
mask = double(mask);
F_picture10 =  blkproc(picture1,[8 8],'mydct2',mask);
I_picture10 = blkproc(F_picture10,[8 8],'myidct2',mask);
figure,imshow(uint8(F_picture10));title('10DCTFrequency');
figure,imshow(uint8(I_picture10));title('10DCTPic');

%����20��DCT�任ϵ��
mask = [ 1 1 1 1 1 0 0 0 
         1 1 1 1 1 0 0 0
         1 1 1 1 0 0 0 0
         1 1 1 1 0 0 0 0
         1 1 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
         0 0 0 0 0 0 0 0
    ];
mask = double(mask);
F_picture20 =  blkproc(picture1,[8 8],'mydct2',mask);
I_picture20 = blkproc(F_picture20,[8 8],'myidct2',mask);
figure,imshow(uint8(F_picture20));title('20DCTFrequency');
figure,imshow(uint8(I_picture20));title('20DCTPic');


%�����PSNR   
picture1 = double(picture1);
MES_5=sum(sum((I_picture5-picture1).^2))/(M*N);     
PSNR_5=20*log10((2^8-1)/sqrt(MES_5));    

MES_10=sum(sum((I_picture10-picture1).^2))/(M*N);     
PSNR_10=20*log10((2^8-1)/sqrt(MES_10));   

MES_20=sum(sum((I_picture20-picture1).^2))/(M*N);     
PSNR_20=20*log10((2^8-1)/sqrt(MES_20));   

%����PSNR�Ա�ͼ
X = [5 10 20];
Y = [PSNR_5 PSNR_10 PSNR_20];
figure;
bar(X,Y);
title 'PSNR����ǰ����ϵ���仯ͼ';
