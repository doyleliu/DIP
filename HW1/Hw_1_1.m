picture1 = imread('PicSample.jpg');
picture1 = rgb2gray(picture1);%灰度转化
figure;
imshow(picture1);
title('beforefirst');%第一幅原图
picture1=double(picture1);

picture2 = imread('PicSample2.jpg');
picture2 = rgb2gray(picture2);
figure;
imshow(picture2);
title('beforesecond');%第二幅原图
picture2 = double(picture2);%转化为double类型

[M,N] = size(picture1);
[V,W] = size(picture2);

F_picture1 = zeros(M,N);
F_picture2 = zeros(V,W);

F_picture1 = mydft2(picture1);
F_picture2 = mydft2(picture2);

%test = zeros(M,N);
%相位信息
P_picture1 = angle(F_picture1);
P_picture2 = angle(F_picture2);

%置换幅度和相位信息
p_picture1_tmp = i.*P_picture1;
p_picture2_tmp = i.*P_picture2;
ex_p_picture1 = abs(F_picture1).*(exp(p_picture2_tmp));
ex_p_picture2 = abs(F_picture2).*(exp(p_picture1_tmp));

ifft_F_Picture1 = real(myidft2(ex_p_picture1));
ifft_F_Picture2 = real(myidft2(ex_p_picture2));

figure;
imshow(im2uint8(mat2gray(ifft_F_Picture1)));
title('Afterfirst');%置换后的第一幅图(相位信息是原第二幅图)

figure;
imshow(im2uint8(mat2gray(ifft_F_Picture2)));
title('Aftersecond');%置换后的第二幅图(相位信息是原第一幅图)

