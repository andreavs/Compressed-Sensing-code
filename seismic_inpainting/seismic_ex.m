% load GulfOfSuez128
% 
% X = D(:,:,64);
X = double(imread('data_seismic.jpg')); 
[n1,n2] = size(X);
p = 0.75;
idxr = 3:4:n2;
idx = 1:n2;
idx(idxr) = [];
mask = zeros(n1,n2);
mask(:,idx) = 1;


[n1,n2] = size(X);


% X = X(1:128, 1:128);
% [n1,n2] = size(X);

% 
% 
% M = opColumnRestrict(n1,n2,idx,'discard'); 
% B = opTranspose(opCurvelet2d(n1,n2)); 
% A = opFoG(M,B); 
% 
% b = M(X(:),1); 
% [x, r, g, info] = spgl1(A, b, 0, 0, []);
% 
% y   = B(x,1);
% res_curve = reshape(y,n1,n2);
% 
% 
% 
% M = opColumnRestrict(n1,n2,idx,'discard'); 
% B = opTranspose(opFFT2d(n1,n2)); 
% A = opFoG(M,B); 
% 
% b = M(X(:),1); 
% [x, r, g, info] = spgl1(A, b, 0, 0, []);
% 
% y   = B(x,1);
% res_dft = reshape(y,n1,n2);
% 
% %  export_fig res_dft -transparent -pdf -eps -png
% 

% XX = X(1:128, 1:128);
% [n1,n2] = size(X);
M = opColumnRestrict(n1,n2,idx,'discard'); 
B = opTranspose(opWaveAtom(n1,n2)); 
A = opFoG(M,B); 

b = M(X(:),1); 
[x, r, g, info] = spg_bpdn(A, b, 5);

y   = B(x,1);
res_wave1 = reshape(y,n1,n2);

%  export_fig res_wa -transparent -pdf -eps -png

% XX = X(129:256, 1:128);
% [n1,n2] = size(XX);
% M = opColumnRestrict(n1,n2,idx,'discard'); 
% B = opTranspose(opWaveAtom(n1,n2)); 
% A = opFoG(M,B); 
% 
% b = M(XX(:),1); 
% [x, r, g, info] = spgl1(A, b, 0, 0, []);
% 
% y   = B(x,1);
% res_wave2 = reshape(y,n1,n2);
% imagesc(real(res_wave))
% colormap gray
% xlabel('Receiver number'); ylabel('Time sample')
% fix_fig(gcf)
% title('Wave Atom restoration');
%  export_fig res_wa -transparent -pdf -eps -png



% XX = X(257:384, 1:128);
% [n1,n2] = size(XX);
% M = opColumnRestrict(n1,n2,idx,'discard'); 
% B = opTranspose(opWaveAtom(n1,n2)); 
% A = opFoG(M,B); 
% 
% b = M(XX(:),1); 
% [x, r, g, info] = spgl1(A, b, 0, 0, []);
% 
% y   = B(x,1);
% res_wave3 = reshape(y,n1,n2);
% imagesc(real(res_wave))
% colormap gray
% xlabel('Receiver number'); ylabel('Time sample')
% fix_fig(gcf)
% title('Wave Atom restoration');
%  export_fig res_wa -transparent -pdf -eps -png


% 
% XX = X(385:512, 1:128);
% [n1,n2] = size(XX);
% M = opColumnRestrict(n1,n2,idx,'discard'); 
% B = opTranspose(opWaveAtom(n1,n2)); 
% A = opFoG(M,B); 
% 
% b = M(XX(:),1); 
% [x, r, g, info] = spgl1(A, b, 0, 0, []);
% 
% y   = B(x,1);
% res_wave4 = reshape(y,n1,n2);
% imagesc(real(res_wave))
% colormap gray
% xlabel('Receiver number'); ylabel('Time sample')
% fix_fig(gcf)
% title('Wave Atom restoration');
%  export_fig res_wa -transparent -pdf -eps -png
% save('results2')
% 
% imagesc(X)
% colormap gray
% xlabel('Receiver number'); ylabel('Time sample')
% fix_fig(gcf)
% title('Shot gather');
% caxis([120,150])
% saveas(gcf, 'fulldata.fig')
% export_fig fulldata -transparent -pdf -eps -png
% 
% imagesc(mask)
% colormap gray
% fix_fig(gcf)
% title('Mask');
% saveas(gcf, 'mask.fig')
% export_fig mask -transparent -pdf -eps -png
% 
imagesc(mask.*X)
colormap gray
xlabel('Receiver number'); ylabel('Time sample')
fix_fig(gcf)
title('Masked Shot gather');
caxis([120,150])
saveas(gcf, 'masked.fig')
export_fig masked -transparent -pdf -eps -png

% imagesc(res_curve)
% colormap gray
% xlabel('Receiver number'); ylabel('Time sample')
% fix_fig(gcf)
% title('Curvelet restoration');
% colorbar
% %caxis([-100, 100])
% caxis([120,150])
% saveas(gcf, 'res_curve.fig')
% export_fig res_curve -transparent -pdf -eps -png
% 
imagesc(abs(res_curve - X))
colormap gray
xlabel('Receiver number'); ylabel('Time sample')
fix_fig(gcf)
title('Curvelet Error');
%caxis([-100, 100])
colorbar
caxis([0,20])
saveas(gcf, 'res_curve_error.fig')
export_fig res_curve_error -transparent -pdf -eps -png
% 
% 
% imagesc(real(res_dft))
% colormap gray
% xlabel('Receiver number'); ylabel('Time sample')
% fix_fig(gcf)
% title('DFT restoration');
% colorbar
% caxis([120,150])
% saveas(gcf, 'res_dft.fig')
% export_fig res_dft -transparent -pdf -eps -png
% 
imagesc(abs(res_dft-X))
colormap gray
xlabel('Receiver number'); ylabel('Time sample')
fix_fig(gcf)
title('DFT Error');
colorbar
caxis([0,20])
saveas(gcf,'res_dft_error.fig')
export_fig res_dft_error -transparent -pdf -eps -png
% 
% 
% imagesc(real(res_wave1))
% colormap gray
% xlabel('Receiver number'); ylabel('Time sample')
% fix_fig(gcf)
% title('Wave Atom restoration');
% colorbar
% caxis([120,150])
% saveas(gcf, 'res_wa.fig')
% export_fig res_wa -transparent -pdf -eps -png
% 
imagesc(abs(res_wave1-X))
colormap gray
xlabel('Receiver number'); ylabel('Time sample')
fix_fig(gcf)
title('Wave Atom Error');
colorbar
caxis([0,20])
saveas(gcf,'res_wa_error.fig')
export_fig res_wa_error -transparent -pdf -eps -png
% 
% PSNR(X,res_dft)
% PSNR(X,res_wave1)
% PSNR(X,res_curve)
% PSNR(X,mask.*X)