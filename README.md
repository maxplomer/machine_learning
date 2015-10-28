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

- provided is a listing.json file 

    ["CAT_00/00000001_000",
     "CAT_00/00000001_005",
     "CAT_00/00000001_008",
     "CAT_00/00000001_011",
     "CAT_00/00000001_012",
     "CAT_00/00000001_016",
     "CAT_00/00000001_017",
     ...



