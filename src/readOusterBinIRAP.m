function points_info = readOusterBinIRAP(bin_path)

%% Information: 
% 1: x
% 2: y
% 3: z
% 4: intensity
% 5: ring
% 6: range
% 7: noise
% 8: reflectivity


%% Read 
fid = fopen(bin_path, 'rb'); raw_data = fread(fid, [8 inf], 'single'); fclose(fid);
points_info = raw_data';

% points_xyz = points_info(:, [1,2,3]);
% points_xyz_pc = pointCloud(points_xyz);
% points_xyz_pc.Intensity = points_info(:, 7);
% figure(1); clf;
% pcshow(points_xyz_pc)

end % end of function

