picture1 = imread('PicSample.jpg');
picture1 = rgb2gray(picture1);%�Ҷ�ת��
figure;
imshow(picture1);
title('beforefirst');%��һ��ԭͼ
picture1=double(picture1);

picture2 = imread('PicSample2.jpg');
picture2 = rgb2gray(picture2);
figure;
imshow(picture2);
title('beforesecond');%�ڶ���ԭͼ
picture2 = double(picture2);%ת��Ϊdouble����

[M,N] = size(picture1);
[V,W] = size(picture2);

F_picture1 = zeros(M,N);
F_picture2 = zeros(V,W);

F_picture1 = mydft2(picture1);
F_picture2 = mydft2(picture2);

%test = zeros(M,N);
%��λ��Ϣ
P_picture1 = angle(F_picture1);
P_picture2 = angle(F_picture2);

%�û����Ⱥ���λ��Ϣ
p_picture1_tmp = i.*P_picture1;
p_picture2_tmp = i.*P_picture2;
ex_p_picture1 = abs(F_picture1).*(exp(p_picture2_tmp));
ex_p_picture2 = abs(F_picture2).*(exp(p_picture1_tmp));

ifft_F_Picture1 = real(myidft2(ex_p_picture1));
ifft_F_Picture2 = real(myidft2(ex_p_picture2));

figure;
imshow(im2uint8(mat2gray(ifft_F_Picture1)));
title('Afterfirst');%�û���ĵ�һ��ͼ(��λ��Ϣ��ԭ�ڶ���ͼ)

figure;
imshow(im2uint8(mat2gray(ifft_F_Picture2)));
title('Aftersecond');%�û���ĵڶ���ͼ(��λ��Ϣ��ԭ��һ��ͼ)

