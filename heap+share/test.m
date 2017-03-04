indi = [1 1 2 6 5 8 3 7 7 4]';
indj = [1 3 4 5 2 3 6 7 6 8]';
indsn = [100 0 202 173 305 410 550 323 0 121]';
inds = [100 0 202 173 305 410 550 0 0 121]';
n=8;
% Create sparse matrix
W = sparse(indi, indj, inds,n,n);
%indsn(indsn~=0)
for i=1:n
    if sum(inds(indi==i))==0
        m = min(indsn((indi==i)&(indsn~=0)))
        %j = find(indsn==m)
        j=find((indsn==m)&(indi==i))
        inds(j) = m
    end
end
