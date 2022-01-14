function [imb, SEb] = superpose(ima,SE,pixel)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(SE);

%fprintf("(%d, %d)\n", pixel(1), pixel(2));

li = ceil(pixel(1) - m/2); % this is leftmost point from ima
ri = floor(pixel(1) + m/2); % this is the rightmost point from ima
ui = ceil(pixel(2) - n/2); % this is the uppermost point from ima
bi = floor(pixel(2) + n/2); % this is the bottommost point from ima

%fprintf("Range in x: %d - %d, range in y: %d - %d\n", li, ri, ui, bi);

lxbound = li >= 1; % this gives whether superposing SE on pixel 
                              % will cross the left boundary
rxbound = ri <= size(ima,1); % this gives whether we're within
                                         % the right bound
uybound = ui >= 1; % within upper bound?
bybound = bi <= size(ima,2); % within bottom bound?

%first, we implement the normal case (pixel in middle of ima)
if (lxbound && rxbound && uybound && bybound)
    %first, we implement the normal case (pixel in middle of ima)
    imb = ima(li:ri,ui:bi);
    SEb = SE;
else
    % otherwise, we will create new bounds that directly translate to
    % indices for ima
    liSEb = 1;
    lib = li;
    riSEb = m;
    rib = ri;
    uiSEb = 1;
    uib = ui;
    biSEb = n;
    bib = bi;
    
    if (~lxbound)
        lib = 1;
        liSEb = lib - li + 1;
    end
    if (~rxbound)
        rib = size(ima,1);
        riSEb = rib - lib + 1; % ensure SE and imb are same size
    end
    if (~uybound)
        uib = 1;
        uiSEb = uib - ui + 1;
    end
    if (~bybound)
        bib = size(ima,2);
        biSEb = bib - uib + 1; % ensure SE and imb are same siz
    end
    imb = ima(lib:rib,uib:bib);
    SEb = SE(liSEb:riSEb,uiSEb:biSEb);
    %fprintf("For SE:: x: %d - %d; y: %d - %d \n",liSEb,riSEb,uiSEb,biSEb);
    %fprintf("For IMG:: x: %d - %d; y: %d - %d \n\n",lib,rib,uib,bib);
end

end

