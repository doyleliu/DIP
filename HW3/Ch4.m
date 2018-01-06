clc;
clear;
picture1 = imread('Mypic.bmp');% ����ͼ��
picture1 = rgb2gray(picture1);%�ҶȻ�����
figure,imshow(picture1);title('Primitive gray level image'); %ԭʼͼ��

picture2 = imnoise(picture1,'salt & pepper',0.02); %���뽷������
% picture2 = rgb2gray(picture2);
picture2= double(picture2);
figure,imshow(uint8(picture2));title('salt & pepper noise');

picture3 = imnoise(picture1,'gaussian',0,0.01); %�����˹����
% picture3 = rgb2gray(picture3);
picture3= double(picture3);
figure,imshow(uint8(picture3));title('gaussian noise');

%average filtering��ֵ�˲�
picture2_filtering = avg_filtering(picture2,3);
figure,imshow(uint8(picture2_filtering));title('salt & pepper noise after average filtering');
%medium filterring��ֵ�˲�
picture2_filtering2 = mid_filtering(picture2,3);
figure,imshow(uint8(picture2_filtering2));title('salt & pepper noise after median filtering');
%average filtering��ֵ�˲�
picture3_filtering = avg_filtering(picture3,3);
figure,imshow(uint8(picture3_filtering));title('gaussian noise after average filtering');
%medium filterring��ֵ�˲�
picture3_filtering2 = mid_filtering(picture3,3);
figure,imshow(uint8(picture3_filtering2));title('gaussian noise after median filtering');
