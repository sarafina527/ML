dist=randperm(9)
%%A=build_max_heap(A)
nn = [1:9];
nn = heap_index(nn,dist,3);
for i=4:9
    if(dist(i)<dist(nn(1)))
        temp = nn(1);
        nn(1) = i;
        nn = max_heapifyindex(nn,dist,3,1);
    end
end
dist(nn)