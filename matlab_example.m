% This is an example  "Digit Classification Using HOG Features"
% found here: 
% http://www.mathworks.com/help/vision/examples/digit-classification-using-hog-features.html
clc;clear;

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

% Show pre-processing results
exTestImage = read(testSet(4), 5);
lvl = graythresh(exTestImage);
processedImage = im2bw(exTestImage,lvl);

figure;

subplot(1,2,1)
imshow(exTestImage)

subplot(1,2,2)
imshow(processedImage)

img = read(trainingSet(3), 4);

% Extract HOG features and HOG visualization
[hog_2x2, vis2x2] = extractHOGFeatures(img,'CellSize',[2 2]);
[hog_4x4, vis4x4] = extractHOGFeatures(img,'CellSize',[4 4]);
[hog_8x8, vis8x8] = extractHOGFeatures(img,'CellSize',[8 8]);

% Show the original image
figure;
subplot(2,3,1:3); imshow(img);

% Visualize the HOG features
subplot(2,3,4);
plot(vis2x2);
title({'CellSize = [2 2]'; ['Feature length = ' num2str(length(hog_2x2))]});

subplot(2,3,5);
plot(vis4x4);
title({'CellSize = [4 4]'; ['Feature length = ' num2str(length(hog_4x4))]});

subplot(2,3,6);
plot(vis8x8);
title({'CellSize = [8 8]'; ['Feature length = ' num2str(length(hog_8x8))]});

cellSize = [4 4];
hogFeatureSize = length(hog_4x4);

% The trainingSet is an array of 10 imageSet objects: one for each digit.
% Loop over the trainingSet and extract HOG features from each image. A
% similar procedure will be used to extract features from the testSet.

trainingFeatures = [];
trainingLabels   = [];

for digit = 1:numel(trainingSet)

    numImages = trainingSet(digit).Count;
    features  = zeros(numImages, hogFeatureSize, 'single');

    for i = 1:numImages

        img = read(trainingSet(digit), i);

        % Apply pre-processing steps
        lvl = graythresh(img);
        img = im2bw(img, lvl);

        features(i, :) = extractHOGFeatures(img, 'CellSize', cellSize);
    end

    % Use the imageSet Description as the training labels. The labels are
    % the digits themselves, e.g. '0', '1', '2', etc.
    labels = repmat(trainingSet(digit).Description, numImages, 1);

    trainingFeatures = [trainingFeatures; features];   %#ok<AGROW>
    trainingLabels   = [trainingLabels;   labels  ];   %#ok<AGROW>

end

% fitcecoc uses SVM learners and a 'One-vs-One' encoding scheme.
classifier = fitcecoc(trainingFeatures, trainingLabels);

% Extract HOG features from the test set. The procedure is similar to what
% was shown earlier and is encapsulated as a helper function for brevity.
[testFeatures, testLabels] = helperExtractHOGFeaturesFromImageSet(testSet, hogFeatureSize, cellSize);

% Make class predictions using the test features.
predictedLabels = predict(classifier, testFeatures);

% Tabulate the results using a confusion matrix.
confMat = confusionmat(testLabels, predictedLabels);

helperDisplayConfusionMatrix(confMat)

