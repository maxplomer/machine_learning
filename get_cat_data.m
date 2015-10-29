function [ picture_array, xmin, xmax, ymin, ymax ] = get_cat_data()

    str = fileread('cat_dataset/listing.json');
    str = strrep(str, '"', '''');
    str = strrep(str, '[', '{');
    str = strrep(str, ']', '}');
    cat_listing_array = eval(str);
    
    picture_array = cell(9997,1);
    xmin = cell(9997,1);
    xmax = cell(9997,1);
    ymin = cell(9997,1);
    ymax = cell(9997,1);
    
    for i=1:length(cat_listing_array)
        filename = strcat(cat_listing_array(i), '.jpg');
        filename = strcat('cat_dataset/', filename);
        picture_array{i} = filename;  
    end
  
    
    
    
    
    
    
    
    
    
    
    
end
