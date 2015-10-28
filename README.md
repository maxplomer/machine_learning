# machine_learning
A Matlab app that uses support vector machines to classify whether a picture has a cat or dog face in it


#Datasets

I am using the Cat Annotation Dataset from 

Weiwei Zhang, Jian Sun, and Xiaoou Tang, "Cat Head Detection - How to Effectively Exploit Shape and Texture Features", Proc. of European Conf. Computer Vision, vol. 4, pp.802-816, 2008.

and Stanford Dogs Dataset from 

http://vision.stanford.edu/aditya86/ImageNetDogs/

#Todos

- With problem of telling between cat or dog, will need to precrop faces for best results. Could have 3rd value of neither, and search picture (by breaking up into windows) for either cat or dog faces. Or just dog or not face, etc.