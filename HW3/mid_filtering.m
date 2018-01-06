 function out=mid_filtering(x,n)  %正方窗   
[M, N]=size(x);   %窗的大小
x1=x;
x2=x1;   
%从矩阵左上角开始沿路径取规定大小的区域进行取中值操作
for i=1:M-n+1  
    for j=1:N-n+1  
        matrix=x1(i:i+(n-1),j:j+(n-1)); %从中取出窗  
        %将矩阵取出并将其并为一行
        col=matrix(1,:);     
        for k=2:n  
            col=[col,matrix(k,:)];        
        end  
        %取得中值
        medium=median(col);     
        x2(i+(n-1)/2,j+(n-1)/2)=medium;   %赋中值  
    end  
end   
out = x2;  