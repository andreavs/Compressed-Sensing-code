
parfor i = 86:100
    i
    X = double(imread('data_seismic.jpg')); 
    [n1,n2] = size(X);
    Np=100;
    plist = linspace(0.01, 1, Np);
    curve_errors = zeros(1,Np);
    wave_errors = zeros(1,Np);
    dft_errors = zeros(1,Np);
    % idxl = randperm(n2);

    p = plist(i); 
    nn = round(p*n2);
    
    idx = idxl(1:nn);
    mask = zeros(n1,n2);
    mask(:,idx) = 1;


    [n1,n2] = size(X);


    % X = X(1:128, 1:128);
    % [n1,n2] = size(X);



    M = opColumnRestrict(n1,n2,idx,'discard'); 
    B = opTranspose(opCurvelet2d(n1,n2,6,32)); 
    A = opFoG(M,B); 

    b = M(X(:),1); 
    [x, r, g, info] = spgl1(A, b, 0, 0, []);

    y   = B(x,1);
    res_curve = reshape(y,n1,n2);
    curve_errors(i) = sum(sum((abs(X-res_curve))));


    M = opColumnRestrict(n1,n2,idx,'discard'); 
    B = opTranspose(opFFT2d(n1,n2)); 
    A = opFoG(M,B); 

    b = M(X(:),1); 
    [x, r, g, info] = spgl1(A, b, 0, 0, []);

    y   = B(x,1);
    res_dft = reshape(y,n1,n2);
    dft_errors(i) = sum(sum((abs(X-res_dft))));
    %  export_fig res_dft -transparent -pdf -eps -png


    % XX = X(1:128, 1:128);
    % [n1,n2] = size(X);
    M = opColumnRestrict(n1,n2,idx,'discard'); 
    B = opTranspose(opWaveAtom(n1,n2)); 
    A = opFoG(M,B); 

    b = M(X(:),1); 
    [x, r, g, info] = spgl1(A, b, 0, 0, []);

    y   = B(x,1);
    res_wave1 = reshape(y,n1,n2);
    wave_errors(i) = sum(sum((abs(X-res_wave1))));
    
    filename = sprintf('seismic_iterate_%i.mat', i);
    parsave(filename, X, idx, mask, res_curve, res_wave1, res_dft, dft_errors, wave_errors, curve_errors)
    
end



