function dog_processing_example()
    clc;clear;                
    x_min = 71;
    y_min = 1;
    x_max = 192;
    y_max = 180;
    image_data = imread('readme_dog.jpg');

    cropped_image_data = image_data(y_min:y_max, x_min:x_max, :);
    figure(1)
    imshow(cropped_image_data);
    
    cropped_image_data = imresize(cropped_image_data,[150 NaN]);
    lvl = graythresh(cropped_image_data);
    processedImage = im2bw(cropped_image_data,lvl);
    
    figure(2)
    imshow(processedImage);
    
    [featureVector, hogVisualization] = extractHOGFeatures(processedImage);
    figure(3)
    plot(hogVisualization);
end