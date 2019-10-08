%% Matlab Monday 1
% Grace Jiang
% (1)Using images 01, 02, and 03, do the following:
% a.Display a center (or near center) slice through each plane (use the subplot command)
% i.Label the axes with the correct dimensions (Resolution is located in image_0X.dim)
% ii.Adjust aspect ratio using ‘axis’ command
% iii.Adjust Display range
% b.Calculate the cross-sectional area from the central slice (image_0X.im(:,:,central_slice))
% c.Read up on the ‘montage’ command.  Then useit to visualize the slices
% d.Create a movie to visualize moving through the slices
% i.
% Use a ‘for’ loop, ‘pause’, ‘drawnow’ commands
% e.What do you think this is an image of?
%%
clear all; close all; clc;
load matlab_monday_00.mat
%% (1) Center slice through each plane using 'subplot'

%% (12) Display image

% assign resolution and matrix size
[sy,sx,sz] = size(image_01.im);
res_x = .15625; % resolution in the x-direction is 0.15625 mm
res_y = .15625; % resolution in the y-direction is 0.15625 mm;
res_z = .15625; % resolution in the z direction is 1 mm;

imagesc(image_01.im(:,:,5)) %look at 5th slice

%% (13) What is the field of view?
%%
% calculate the field of view
fov_x = res_x*sx;
fov_y = res_y*sy;
fov_z = res_z*sz;
disp(['x-dir: ' num2str(fov_x) ' mm.'])  
disp(['y-dir: ' num2str(fov_y) ' mm.'])  
disp(['z-dir: ' num2str(fov_z) ' mm.'])  

%% Displaying voxels with right aspect ratio

imagesc([1:sy]*res_y,[1:sx]*res_x,image_01.im(:,:,10)) %create array from 1 to 256 and multiply by voxel so it ranges in mm from 0 to 44

axis image; % correct aspect ratio
colormap(gray)
title('Image 01','FontSize',20)
ylabel('Position (mm)','FontSize',20)
xlabel('Position (mm)','FontSize',20)
set(gca,'FontSize',15)

%% (15) Can we visualize a different slice orientation? (cross-section)

% * squeeze command! 
imagesc([1:sz]*res_z,[1:sx]*res_x,squeeze(image_01.im(100,:,:))) 

axis image;
colormap(gray)
title('Image_01','FontSize',20)
ylabel('Position (mm)','FontSize',20)
xlabel('Position (mm)','FontSize',20)
set(gca,'FontSize',15)


%% (16) Can we visualize more slices at once?
%%
% Subplot/for loops
for z = 1:sz
subplot(4,4,z) % there will be 16 subplots
imagesc(image_01.im(:,:,z));
drawnow
    
end
montage(mri_rat)

%% subplot all orthogonal views

subplot(1,4,1)
imagesc([1:sy]*res_y,[1:sx]*res_x,squeeze(image_01.im(:,:,sz/2))) 

axis image;
colormap(gray)
title('Image_01: z slice','FontSize',20)
ylabel('Position (mm)','FontSize',20)
xlabel('Position (mm)','FontSize',20)
set(gca,'FontSize',10)

subplot(1,4,2)
imagesc([1:sx]*res_x,[1:sz]*res_z,squeeze(image_01.im(:,sy/2,:))) 

axis image;
colormap(gray)
title('Image_01: y slice','FontSize',20)
ylabel('Position (mm)','FontSize',20)
xlabel('Position (mm)','FontSize',20)
set(gca,'FontSize',10)

subplot(1,4,3)
imagesc([1:sy]*res_y,[1:sz]*res_z,squeeze(image_01.im(sx/2,:,:))) 

axis image;
colormap(gray)
title('Image_01: x slice','FontSize',20)
ylabel('Position (mm)','FontSize',20)
xlabel('Position (mm)','FontSize',20)
set(gca,'FontSize',10)


subplot(1,4,4)
imagesc([1:sy]*res_y,[1:sz]*res_z,squeeze(image_01.im(sx/2,:,:))) 
imagesc([1:sz]*res_z,[1:sy]*res_y,squeeze(image_01.im(sx/2,:,:))) 



axis image;
colormap(gray)
title('Image_01: x slice','FontSize',20)
ylabel('Position (mm)','FontSize',20)
xlabel('Position (mm)','FontSize',20)
set(gca,'FontSize',10)