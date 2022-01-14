function [CAtot,CBtot,CCtot] = HistoAmal(imgs)
%HistoTraining Creates histograms from images and amalgamates.
%   imgs is a tensor with 4 dimensions.  The first two are standard, the
%   third allows differentiation between colors, and the
%   fourth allows the distinction between images.  Meant to be used to
%   gather and synthesize training data.
CAtot = zeros(1,256);
CBtot = zeros(1,256);
CCtot = zeros(1,256);

[~,~,~,imgnum] = size(imgs);

for x = 1:imgnum
    [CA,CB,CC] = TricolorHistogramMaker(imgs(:,:,:,imgnum));
    CAtot = CAtot + CA;
    CBtot = CBtot + CB;
    CCtot = CCtot + CC;
end

CAtot = CAtot ./ imgnum;
CBtot = CBtot ./ imgnum;
CCtot = CCtot ./ imgnum;

end

