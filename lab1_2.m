function [d,t] = lab1part2(np,nd,nw)
if (nargin < 1), np = 1e7; nd = 10; nw = 2; end
hp = gcp('nocreate');
if isempty(hp), hp=parpool(nw); end

A = randn(np,nd); B = randn(np,nd);
d = zeros(np,1);

tic;
parfor i = 1:np
    e=0;
    for j = 1:nd
        e=e + (B(i,j) - A(i,j)).^2;
    end
    d(i) = sqrt(e);
end
t = toc;

delete(hp);