function out=avg_filtering(x,n)  
%��ֵ�˲�
matrix = ones(n,n);   %ȡnXn��С������ 
% matrix = [1 1 1;1 1 1; 1 1 1];
% tmp = sum(matrix);
% matrix = matrix.*(n*n/tmp);

[M, N]=size(x);   %ͼƬ��С
x1=x;  
% �Ӿ������Ͻǿ�ʼ��·��ȡnXn��С���������ȡ��ֵ����
for i = 1:M-n+1
    for j = 1:N-n+1
        filter = x1(i:i+(n-1),j:j+(n-1)).*matrix;%����matrix�涨��Ȩֵ��Сȡ�þ�ֵ
        mtx_sum = sum(filter(:)); %���
        x1(i+(n-1)/2,j+(n-1)/2) = 1/(n*n)*mtx_sum;%���Ƹ��м�Ԫ��
    end
end
out = x1; 