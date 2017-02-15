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
