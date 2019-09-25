np=1e5; nd=10; nl=4;

hp = gcp('nocreate');
if isempty(hp), hp=parpool(nl); end

d=zeros(np,1);
tic;
spmd
    if(labindex==1)
        A=randn(np,nd); B=rand(np,nd);
        C = A - B;
        labSend(C,2);
    elseif(labindex==2)
        C = labReceive(1);
        D = C.^2;
        labSend(D,3);
    elseif(labindex==3)
        D = labReceive(2);
        E = sum(D,2);
        labSend(E,4);
    elseif(labindex==4)
        E = labReceive(3);
        F = sqrt(E);
    end
end
t=toc;
d=F{4};