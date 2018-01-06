function out=avg_filtering(x,n)  
%均值滤波
matrix = ones(n,n);   %取nXn大小的区域 
% matrix = [1 1 1;1 1 1; 1 1 1];
% tmp = sum(matrix);
% matrix = matrix.*(n*n/tmp);

[M, N]=size(x);   %图片大小
x1=x;  
% 从矩阵左上角开始沿路径取nXn大小的区域进行取均值操作
for i = 1:M-n+1
    for j = 1:N-n+1
        filter = x1(i:i+(n-1),j:j+(n-1)).*matrix;%按照matrix规定的权值大小取得均值
        mtx_sum = sum(filter(:)); %求和
        x1(i+(n-1)/2,j+(n-1)/2) = 1/(n*n)*mtx_sum;%复制给中间元素
    end
end
out = x1; 