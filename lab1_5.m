function [d,t] = lab1_5(np,nd)
if (nargin < 1), np = 1e5; nd = 10; end
hp = gcp('nocreate');
if isempty(hp), hp = parpool(8); end
dA=distributed.randn(np,nd); 
dB=distributed.randn(np,nd);
tic;
dc=(dA-dB); clear dA dB;
dd=(dc).^2; clear dc;
de=sum(dd,2); clear dd;
df=sqrt(de); clear de;
d=gather(df); clear df;
t = toc;