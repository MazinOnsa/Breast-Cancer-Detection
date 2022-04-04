# Breast-Cancer-Detection
SVM for Breast Cancer Detection from mammogram Using MatLAB

The code solves the Lagrange dual problem of SVM by using quadprog to find alpha, support vectors and bias


<a href="url"><img src="https://user-images.githubusercontent.com/59888707/160241528-a3529967-f0af-425f-9d79-6501a3a4fc41.png" align="Center" height="150" width="400" ></a>


## Dataset
4 features 
800 instances 
Missing values available


F1-score, Precision and recall of the test set then calculated 

RBF found to be the best Kernel of SVM to classify the dataset

optimal sigma for RBF is choosen to be the one who brings the larger variance between the transformed data (generally easier to classify)

main code is [here](https://github.com/MazinOnsa/Breast-Cancer-Detection/blob/main/main.m)
