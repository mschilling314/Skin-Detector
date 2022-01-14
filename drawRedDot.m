function imo = drawRedDot(imi, pt)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
imo = imi;

imo(pt(1),pt(2),1) = 255;
imo(pt(1),pt(2),2) = 0;
imo(pt(1),pt(2),3) = 0;
end

