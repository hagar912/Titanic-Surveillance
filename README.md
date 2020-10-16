## Titanic survillance Analysis.
###### This project created on 9/12/2019.
In this project, you will see the usage of R to explore data related to titanic survillance analysis project using Big data techniques.

### Using Big data techniques to find the best performace for the model accuracy like : 
1. Naive Base technique.
2. logistics regression.
3. Support vector machine.
### Applying two main algorithms for finding a feature subspace that maximizes class separability for dimentionaity reduction :
* Linear Discriminant Analysis[LDA] :
LDA is a supervised which involves reducing the number of input variables or columns in modeling data.

* Principal Component Analysis[PCA] :
PCA is unsupervised which ignores class labels and consider as the most popular technique for dimensionality reduction in machine learning that can be used as a data preparation technique to create a projection of a dataset prior to fitting a model.

### The Datasets
We worked with 712 records and 12 attributes but using some of them as we choose the best features for the training.
The data has been split into two groups:
	1. training set.
	2. test set.

* survival	(Survival	0 = No, 1 = Yes)
* pclass	(Ticket class	1 = 1st, 2 = 2nd, 3 = 3rd)
* sex		(Sex 		female, male)	
* Age		(Age in years)
* sibsp		(# of siblings / spouses aboard the Titanic)
* parch		(# of parents / children aboard the Titanic)
* ticket	(Ticket number)	
* fare		(Passenger fare)
* cabin		(Cabin number)
* embarked	(Port of Embarkation	C = Cherbourg, Q = Queenstown, S = Southampton)

 ### What Software Do You Need?
 For working on your local machine, you will need to install R and working with RStudio.

### The Dataset Files :
* [`titanic_Dataset`](https://github.com/hagar912/blob/master/titanic_ds.csv)

### Analysis coding provided here :
* [`Titanic Analysis using LDA`](https://github.com/hagar912/Titanic-Surveillance/blob/master/LDA.R)
* [`Titanic Analysis using PCA`](https://github.com/hagar912/Titanic-Surveillance/blob/master/PCA.R)
