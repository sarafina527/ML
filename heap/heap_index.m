function [ nn ] = heap_index(nn,dist,n)
%  A should be 1 by n array
%  yilai max_heapify
%[~,n]=size(nn);
for i=floor(n/2):-1:1
    nn=max_heapifyindex(nn,dist,n,i);
end
end

function [ nn ] = max_heapifyindex( nn,dist,n,i )
l=left(i);
r=right(i);
if l<=n&&dist(nn(l))>dist(nn(i))
    largest=l;
else
    largest=i;
end
if r<=n&&dist(nn(r))>dist(nn(largest))
    largest=r;
end
if largest~=i
    temp=nn(i);
    nn(i)=nn(largest);
    nn(largest)=temp;
    nn=max_heapifyindex(nn,dist,n,largest);
end
end

function [ pIndex ] = parent( i )
% input the child index
% return the parent index
pIndex=floor(i/2);
end






