% Load training and test data using imageSet.
syntheticDir   = fullfile(toolboxdir('vision'), 'visiondata','digits','synthetic');
handwrittenDir = fullfile(toolboxdir('vision'), 'visiondata','digits','handwritten');

% imageSet recursively scans the directory tree containing the images.
trainingSet = imageSet(syntheticDir,   'recursive');
testSet     = imageSet(handwrittenDir, 'recursive');

% Show training and test samples
figure;

subplot(2,3,1);
imshow(trainingSet(2).ImageLocation{3});

subplot(2,3,2);
imshow(trainingSet(4).ImageLocation{23});

subplot(2,3,3);
imshow(trainingSet(9).ImageLocation{4});

subplot(2,3,4);
imshow(testSet(2).ImageLocation{2});

subplot(2,3,5);
imshow(testSet(4).ImageLocation{5});

subplot(2,3,6);
imshow(testSet(9).ImageLocation{8});