 function out=mid_filtering(x,n)  %������   
[M, N]=size(x);   %���Ĵ�С
x1=x;
x2=x1;   
%�Ӿ������Ͻǿ�ʼ��·��ȡ�涨��С���������ȡ��ֵ����
for i=1:M-n+1  
    for j=1:N-n+1  
        matrix=x1(i:i+(n-1),j:j+(n-1)); %����ȡ����  
        %������ȡ�������䲢Ϊһ��
        col=matrix(1,:);     
        for k=2:n  
            col=[col,matrix(k,:)];        
        end  
        %ȡ����ֵ
        medium=median(col);     
        x2(i+(n-1)/2,j+(n-1)/2)=medium;   %����ֵ  
    end  
end   
out = x2;  