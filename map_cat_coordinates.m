function map_cat_coordinates()

    coors = [175 160 239 162 199 199 149 121 137 78 166 93 281 101 312 96 296 133];
    
    %image_data size is    500tall   375wide     3
    image_data = imread('readme_cat.jpg');
    
    for i=1:2:length(coors)
        right = coors(i);
        down = coors(i+1);
        image_data(down, right, 1) = 0;
        image_data(down, right, 2) = 0;
        image_data(down, right, 3) = 255;
    end
    
    imshow(image_data);
    

end

