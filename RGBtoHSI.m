function img_out = RGBtoHSI(img_in)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
[rows,cols,~] = size(img_in);
img_out = zeros(rows,cols,3);

for row = 1:rows
    for col = 1:cols
        R = cast(img_in(row,col,1),'double');
        G = cast(img_in(row,col,2),'double');
        B = cast(img_in(row,col,3),'double');
        
        I = (R + G + B) / 3;
        S = 1 - ((3 / (R + G + B)) * min([R,G,B]));
        H = acosd((2*R - G - B) / (2 * sqrt((R-G)^2 + (R-B)*(G-B))));
        
        img_out(row,col,1) = H;
        img_out(row,col,2) = S;
        img_out(row,col,3) = I;
    end
end

end

