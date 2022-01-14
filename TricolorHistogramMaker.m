function [CA,CB,CC] = TricolorHistogramMaker(img)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
[rows, cols, ~] = size(img);
CA = zeros(1,256);
CB = zeros(1,256);
CC = zeros(1,256);

for r = 1:rows
    for c = 1:cols
        Ia = img(r,c,1) + 1;
        Ib = img(r,c,2) + 1;
        Ic = img(r,c,3) + 1;
        CA(Ia) = CA(Ia) + 1;
        CB(Ib) = CB(Ib) + 1;
        CC(Ic) = CC(Ic) + 1;
    end
end

CA = CA ./ (rows * cols);
CB = CB ./ (rows * cols);
CC = CC ./ (rows * cols);

end

