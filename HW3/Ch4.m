clc;
clear;
picture1 = imread('Mypic.bmp');% 读入图像
picture1 = rgb2gray(picture1);%灰度化处理
figure,imshow(picture1);title('Primitive gray level image'); %原始图像

picture2 = imnoise(picture1,'salt & pepper',0.02); %加入椒盐躁声
% picture2 = rgb2gray(picture2);
picture2= double(picture2);
figure,imshow(uint8(picture2));title('salt & pepper noise');

picture3 = imnoise(picture1,'gaussian',0,0.01); %加入高斯躁声
% picture3 = rgb2gray(picture3);
picture3= double(picture3);
figure,imshow(uint8(picture3));title('gaussian noise');

%average filtering均值滤波
picture2_filtering = avg_filtering(picture2,3);
figure,imshow(uint8(picture2_filtering));title('salt & pepper noise after average filtering');
%medium filterring中值滤波
picture2_filtering2 = mid_filtering(picture2,3);
figure,imshow(uint8(picture2_filtering2));title('salt & pepper noise after median filtering');
%average filtering均值滤波
picture3_filtering = avg_filtering(picture3,3);
figure,imshow(uint8(picture3_filtering));title('gaussian noise after average filtering');
%medium filterring中值滤波
picture3_filtering2 = mid_filtering(picture3,3);
figure,imshow(uint8(picture3_filtering2));title('gaussian noise after median filtering');
