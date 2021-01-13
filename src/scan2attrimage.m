function [attribute_img] = scan2attrimage(pc)

% the original ouster scan's yaw is reversed in MulRan dataset
xyz = pc.Location;
attr = pc.Intensity;

x=  xyz(:, 1);
y = xyz(:, 2);
z = xyz(:, 3);

% init
depth = sqrt(x.*x + y.*y);
attribute_img = reshape(depth, [64, 1024]);

% config
offset = repmat([0, 6, 12, 18]', 16, 1);
% offset = repmat([0, 12, 24, 36]', 16, 1);

H = 64;
W = 1024;

for u = 1:H
    for v = 1:W
        vv = mod((v + offset(u)), W);
        index = vv * H + u;
%         pt = xyz(index, :);
        
        attribute_img(u, v) = attr(index);
        
    end
end

end
