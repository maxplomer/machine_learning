function [ picture_array, xmin_array, xmax_array, ymin_array, ymax_array ] = get_cat_data()

    str = fileread('cat_dataset/listing.json');
    str = strrep(str, '"', '''');
    str = strrep(str, '[', '{');
    str = strrep(str, ']', '}');
    cat_listing_array = eval(str);
    
    picture_array = cell(9997,1);
    xmin_array = zeros(9997,1);
    xmax_array = zeros(9997,1);
    ymin_array = zeros(9997,1);
    ymax_array = zeros(9997,1);
    
    for i=1:length(cat_listing_array)
        filename = strcat(cat_listing_array{i}, '.jpg');
        filename = strcat('cat_dataset/', filename);
        picture_array{i} = filename;  
    end
  
    
    
    
    for i=1:length(cat_listing_array)
        annotation_filename = strcat(picture_array{i}, '.cat');
        fileID = fopen(annotation_filename);
        formatSpec = '%d';
        picture_crop_values = fscanf(fileID,formatSpec);
        fclose(fileID);
        
        
        picture_crop_values
        
    end
    
    
    
    
    
    
    
end
