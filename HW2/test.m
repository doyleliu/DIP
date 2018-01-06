picture1 = imread('Sample.jpg');
picture1 = rgb2gray(picture1);
picture1=double(picture1);

% figure,imshow(uint8(picture1));title('lena');
imwrite(uint8(picture1),'lena.bmp');


