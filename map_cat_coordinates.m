function map_cat_coordinates()
    clc;clear;

    coors = [175 160 239 162 199 199 149 121 137 78 166 93 281 101 312 96 296 133];
    
    %image_data size is    500tall   375wide     3
    image_data = imread('readme_cat.jpg');
    
    for i=1:2:length(coors)
        right = coors(i);
        down = coors(i+1);
        image_data((down-2):(down+2), (right-2):(right+2), 1) = 255;
        image_data((down-2):(down+2), (right-2):(right+2), 2) = 255;
        image_data((down-2):(down+2), (right-2):(right+2), 3) = 0;
    end
    
    figure(1)
    imshow(image_data);
    
    even = coors(2:2:length(coors));
    odd = coors(1:2:length(coors));
    y_min = min(even);
    y_max = max(even);
    x_min = min(odd);
    x_max = max(odd);
    
    cropped_image_data = imread('readme_cat.jpg');
    cropped_image_data = cropped_image_data(y_min:y_max, x_min:x_max, :);
    
    figure(2)
    imshow(cropped_image_data);
    
    
    larger_cropped_image_data = imread('readme_cat.jpg');
    
    [y_limit, x_limit, ~] = size(larger_cropped_image_data);
    
    width = x_max - x_min;
    height = y_max - y_min;
    
    y_min = y_min - 0.25 * height;
    y_max = y_max + 0.25 * height;
    x_min = x_min - 0.25 * width;
    x_max = x_max + 0.25 * width; 
    
    if x_min < 1
        x_min = 1;
    end
    if y_min < 1
        y_min = 1;
    end    
    if x_max > x_limit
        x_max = x_limit;
    end
    if y_max > y_limit
        y_max = y_limit;
    end
    %set each to xmax ymax or 0 if out of bounds    
    larger_cropped_image_data = larger_cropped_image_data(y_min:y_max, x_min:x_max, :);
    
    figure(3)
    imshow(larger_cropped_image_data);
    
    larger_cropped_image_data = imresize(larger_cropped_image_data,[150 NaN]);
    lvl = graythresh(larger_cropped_image_data);
    processedImage = im2bw(larger_cropped_image_data,lvl);
    
    figure(4)
    imshow(processedImage);
    
    
    [featureVector, hogVisualization] = extractHOGFeatures(processedImage);
    figure(5)
    plot(hogVisualization);
    
    
    

end

