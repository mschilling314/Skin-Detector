function hist_amal = HistoAmal2D(imgs)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
hist_amal = zeros(360,100);
[~,~,~,N] = size(imgs);
for n = 1:N
    hist_amal = hist_amal + HS2DHisto(imgs(:,:,:,n));
end

hist_amal = hist_amal ./ N;

end

