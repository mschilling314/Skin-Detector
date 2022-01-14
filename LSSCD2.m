function img_out = LSSCD2(img_in,model)
%UNTITLED18 Summary of this function goes here
%   Detailed explanation goes here
[rows,cols,~] = size(img_in);
img_out = zeros(rows,cols,3);

imgHSI = RGBtoHSI(img_in);

for row = 1:rows
    for col = 1:cols
        pixel = imgHSI(row,col,:);
        h = pixel(1);
        s = pixel(2);
        if h >= 360
            mod(h,360);
        end
        if s == 1
            s = 0.99;
        end
        s = s * 100;
        h = cast(h,'uint16');
        s = cast(s,'uint16');
        h = h + 1;
        s = s + 1;
        
        if (model(h,s) >= 0.0000001) && ((h-1)^2 + (s-1)^2 < 1500)
            img_out(row,col,:) = img_in(row,col,:);
        end
    end
end

img_out = cast(img_out, 'uint8');
end

