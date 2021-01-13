addpath(genpath('src'));

% data_dir = "/home/user/Documents/data/Jige/20201229_jige_ambient_test/scan/parsed/2020-12-29-17-10-40/";
data_dir = "/home/user/Documents/data/Jige/20201229_jige_ambient_test/scan/parsed/2020-12-29-17-22-17/";

data_filenames = listdir(data_dir);

for ii = 100:length(data_filenames)
    
    data_filename = data_filenames{ii};
    data_filepath = fullfile(data_dir, data_filename);
    disp(data_filepath);
    
    pc_info = readOusterBinIRAP(data_filepath);
    points_xyz = pc_info(:, [1,2,3]);
    pc = pointCloud(points_xyz);
    pc_ring = pc_info(:, 5);
    
    % Information: 
    % 1: x
    % 2: y
    % 3: z
    % 4: intensity
    % 5: ring
    % 6: range
    % 7: noise
    % 8: reflectivity

    pc.Intensity = pc_info(:, 4);
    intensity_img = scan2attrimage(pc);
    pc.Intensity = pc_info(:, 6);
    range_img = scan2attrimage(pc);
    pc.Intensity = pc_info(:, 7);
    ambient_img = scan2attrimage(pc);
    pc.Intensity = pc_info(:, 8);
    reflect_img = scan2attrimage(pc);


    % viz 
    figure(2); clf;
    num_imgs = 4;

    ax1 = subplot(num_imgs,1, 1);
    imagesc(intensity_img); 
    colormap (ax1, bone); caxis(ax1, [0, 300]); 
    title('intensity');

    ax2 = subplot(num_imgs,1, 2);
    imagesc(reflect_img); 
    colormap (ax2, bone); caxis(ax2, [0, 10000]); 
    title('reflectivity');

    ax3 = subplot(num_imgs,1, 3);
    imagesc(range_img); 
    colormap (ax3, bone); caxis(ax3, [0, 30]); 
    title('range');

    ax4 = subplot(num_imgs,1, 4);
    imagesc(ambient_img); 
    colormap (ax4, bone); caxis(ax4, [0, 100]); 
    title('noise (ambient)');


    %     axis equal;
    pause(0.05);
    
end