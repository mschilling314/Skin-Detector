function model = Training(~)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
model = zeros(360,100);

% First, do imread iteratively on training images, call RGBtoHSI on each,
% convert to 2D histogram, and amalgamate
for x = 1:10
    file = strcat('Training', num2str(x), '.jpg');
    img = imread(file);
    imgHSI = RGBtoHSI(img);
    model = model + HS2DHisto(imgHSI);
end

model = model ./ 10;

end

