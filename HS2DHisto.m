function histo = HS2DHisto(img_in)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

H = zeros(1,360);
S = zeros(1,100);
[R,C,~] = size(img_in);

for r = 1:R
    for c = 1:C
        h = img_in(r,c,1);
        s = img_in(r,c,2);
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
        %fprintf("%lu, %lu \n", h,s);
        H(h) = H(h) + 1;
        S(s) = S(s) + 1;
    end
end

H = H / (R*C);
S = S / (R*C);

histo = (H.') * S;

end

