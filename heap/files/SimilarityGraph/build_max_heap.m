function [ A ] = build_max_heap( A )
%  A should be 1 by n array
%  yilai max_heapify
[~,n]=size(A);
for i=floor(n/2):-1:1
    A=max_heapify(A,n,i);
end
end

function [ A ] = max_heapify( A,n,i )
% 
%   
l=left(i);
r=right(i);
if l<=n&&A(l)>A(i)
    largest=l;
else
    largest=i;
end
if r<=n&&A(r)>A(largest)
    largest=r;
end
if largest~=i
    temp=A(i);
    A(i)=A(largest);
    A(largest)=temp;
    A=max_heapify(A,n,largest);
end
end

function [ pIndex ] = parent( i )
% input the child index
% return the parent index
pIndex=floor(i/2);

end



function [ lIndex ] = left( i )
% input the parent index
% return the left child index
lIndex=2*i;

end

function [ rIndex ] = right( i )
% input the parent index
% return the right child index
rIndex=2*i+1;
end
