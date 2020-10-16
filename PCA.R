#install.packages('h2o')
#for deep leaning
#library(h2o)
#h2o.init(nthreads = -1)
##for classification
library(e1071)
##for pre-processing train , test set
library(caTools)
#FOR PCA
library(caret)
##for LDA
library(MASS)
library(dplyr)

df<-read.csv('titanic_ds.csv',header = TRUE)
#subset from data 
df=df[c(2,4,5,6,7,9,12)] 
##df1<- df[1:200 ,]
View(df)
summary(df$Survived)

##preprocessing data for the string to numeric 
df$Survived = factor(df$Survived,
                     levels = c('No', 'Yes'),
                     labels = c(0, 1))

df$Sex = as.numeric(df$Sex,
                     levels = c('male', 'female'),
                     labels = c(0, 1))
#as.integer(df$Sex)


##training , test dataset
set.seed(123)
split = sample.split(df$Survived, SplitRatio = 0.8)
training_df = subset(df, split == TRUE)
test_df = subset(df, split == FALSE)
# Feature Scaling
training_df[-7] = scale(training_df[-7])
test_df[-7] = scale(test_df[-7])


#.....................................................................................................
##applying PCA for the dimentionaity reduction for 2 indepemdent cols. with dependent(supervisied)
pca = preProcess(x = training_df[-7], method = 'pca', pcaComp = 2)
training_df = predict(pca, training_df)
View(training_df)
#re-order cols nums
training_df = training_df[c(2, 3, 1)]
##apply dim red to be 2 cols with PCA for test data
test_df = predict(pca, test_df)
test_df = test_df[c(2, 3, 1)]


#.....................................................................................................
######## Fitting SVM to the Training set
help(svm)
classifier = svm(formula = Survived ~ .,
                 data = training_df,
                 type = 'C-classification',
                 kernel = 'linear')
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_df[-3])
y_pred
# Making the Confusion Matrix
cm = table(actual=test_df[,3],predicted= y_pred)
cm

#.........................................................
####### applying naive base
help("naiveBayes")
clas=naiveBayes(x=training_df[-3],
                y=training_df$Survived)
y_pred = predict(clas, newdata = test_df[-3])
cm = table(test_df[,3], y_pred)


#.........................................................
#######applying logistics regression 
help(glm)
classifier = glm(formula = Survived ~ .,
                 family = binomial,
                 data = training_df)
# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_df[-7])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
# Making the Confusion Matrix
cm = table(test_df[,7], y_pred)

