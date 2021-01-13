function [xyz_image, range_img] = scan2image(scan, so3)

% the original ouster scan's yaw is reversed in MulRan dataset
scan_new = so3 * scan(:, 1:3)';
x=  scan_new(1,:);
y = scan_new(2,:);
z = scan_new(3,:);

% init
depth = sqrt(x.*x + y.*y);
range_image = reshape(depth, [64, 1024]);
% intensity_img = range_image;

% config
offset = repmat([0, 6, 12, 18]', 16, 1);
H = 64;
W = 1024;

xyz_image = zeros(H, W, 3);
for u = 1:H
    for v = 1:W
        vv = mod((v + offset(u)), W);
        index = vv * H + u;
        pt = scan(index, :);
%         pt_i = scan(index, 4);

        range_img(u, v) = norm(pt);
%         intensity_img(u, v) = 
        xyz_image(u, v, :) = pt;
    end
end

end
