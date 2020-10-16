#install.packages('caret')
##for classification
##for pre-processing train , test set
library(e1071)
library(caTools)
#FOR PCA
library(caret)
##for LDA
library(MASS)


df<-read.csv('titanic_ds.csv',header = TRUE)
##for numeric data only
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

##training , test dataset
set.seed(123)
split = sample.split(df$Survived, SplitRatio = 0.8)
training_df = subset(df, split == TRUE)
test_df = subset(df, split == FALSE)
# Feature Scaling
training_df[-7] = scale(training_df[-7])
test_df[-7] = scale(test_df[-7])


##applying LDA for the dimentionaity reduction that is supervisied working with classes
lda = lda(formula = Survived ~ ., data = training_df)
## converting from matrix to data frame
training_df = as.data.frame(predict(lda, training_df))
View(training_df)
training_df = training_df[c(4, 1)]
test_df = as.data.frame(predict(lda, test_df))
test_df = test_df[c(4, 1)]


######## Fitting SVM to the Training set formula = class instead of survived
help(svm)
classifier = svm(formula = class ~ .,
                 data = training_df,
                 type = 'C-classification',
                 kernel = 'linear')

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_df[-2])
# Making the Confusion Matrix
cm = table(actual=test_df[,2],predicted= y_pred)


############# applying naive base with best accuracy than SVM bacause of 0 in false negative
clas=naiveBayes(x=training_df[-3],
                y=training_df$class)
y_pred = predict(clas, newdata = test_df[-3])
cm = table(test_df[,2], y_pred)
View(training_df)
