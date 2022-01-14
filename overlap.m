function count = overlap(im_in, SE)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(SE);
count = 0;
for a = 1:m
    for b = 1:n
        if (im_in(a,b) == SE(a,b)) % if the image and SE overlap inc. count
            count = count + 1;
        end
    end
end
end

