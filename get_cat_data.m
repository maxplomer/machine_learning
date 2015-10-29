function [ picture_array, xmin, xmax, ymin, ymax ] = get_cat_data()

    str = fileread('cat_dataset/listing.json');
    str = strrep(str, '"', '''');
    str = strrep(str, '[', '{');
    str = strrep(str, ']', '}');
    picture_array = eval(str);
    
    
    
    
    


end
