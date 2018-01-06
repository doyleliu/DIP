function out=myquantization(x,mask)
%deal with the same bit in the matrix
x = x./mask;
out = x;