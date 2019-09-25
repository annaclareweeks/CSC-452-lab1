np=1e5; nd=10; nl = 8;

hp = gcp('nocreate');
if isempty(hp), hp=parpool(nl); end

tic;
spmd
    nppl = round(np/nl);
    A = randn(nppl,nd); B = randn((nppl),nd);
    d = zeros(nppl,1);

    for i = 1:nppl
        for j = 1:nd
            d(i) = d(i) + (B(i,j) - A(i,j)).^2;
        end
        d(i) = sqrt(d(i));
    end
    da = gcat(d,1,1);
end
t = toc;
d1 = da{1};