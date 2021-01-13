function [attribute_img] = scan2attrimageSimple(pc)

% the original ouster scan's yaw is reversed in MulRan dataset
xyz = pc.Location;
attr = pc.Intensity;

x=  xyz(:, 1);
y = xyz(:, 2);
z = xyz(:, 3);

% init
attribute_img = reshape(attr, [64, 1024]);


end
