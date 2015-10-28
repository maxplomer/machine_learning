# machine_learning
A Matlab app that uses support vector machines to classify whether a picture has a cat or dog face in it


#Datasets

For training the classifier am using the Cat Annotation Dataset from 

Weiwei Zhang, Jian Sun, and Xiaoou Tang, "Cat Head Detection - How to Effectively Exploit Shape and Texture Features", Proc. of European Conf. Computer Vision, vol. 4, pp.802-816, 2008.

and the Stanford Dogs Dataset from 

http://vision.stanford.edu/aditya86/ImageNetDogs/

#Todos

- With problem of telling between cat or dog, will need to precrop faces for best results. Could have 3rd value of neither, and search picture (by breaking up into windows) for either cat or dog faces. Or just dog or not face, etc.



#Cat Annotation Dataset

###Structure

    |-- cat_dataset
        |-- CAT_00
            |-- 00000001_000.jpg
            |-- 00000001_000.jpg.cat
            |-- 00000001_005.jpg
            |-- 00000001_005.jpg.cat
            ...
        |-- CAT_01
        |-- CAT_02
        |-- CAT_03
        |-- CAT_04
        |-- CAT_05
        |-- CAT_06

Provided is a listing.json file 

    ["CAT_00/00000001_000",
     "CAT_00/00000001_005",
     "CAT_00/00000001_008",
     "CAT_00/00000001_011",
     "CAT_00/00000001_012",
     "CAT_00/00000001_016",
     "CAT_00/00000001_017",
     ...

A .cat file contains 19 numbers

    9 175 160 239 162 199 199 149 121 137 78 166 93 281 101 312 96 296 133 

The first is always 9, and the next pairs[x to right, y down] are 

- Left Eye
- Right Eye
- Mouth
- Left Ear-1
- Left Ear-2
- Left Ear-3
- Right Ear-1
- Right Ear-2
- Right Ear-3

Here is the cat for those coordinates


![](readme_cat.jpg)


Here is the cat with blue pixels where the coordinates exists


![](readme_cat_dots.jpg)

