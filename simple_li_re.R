#Simple Linear Regression

#Importing the dataset
dataset = read.csv('Salary_Data.csv')
#dataset=dataset[,2:3]


#Splitting the dataset into Training set and Testing set
#install.packages("caTools")
library(caTools)
set.seed(123)
split=sample.split(dataset$Salary,SplitRatio = 2/3)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)
 
#Fitting Simple Linear Regression to training set
regressor = lm(formula = Salary ~ YearsExperience,data = training_set)

#predicting the Test set results
y_pred=predict(regressor,newdata = test_set)

#Visualising the training set results
# install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),colour='red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set)),colour='blue')+
  ggtitle('Years of Experience vs Salary(Training Set)')+
  xlab('Years of Experience')+
  ylab('Salary')

#Visualising the test set results
# install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),colour='red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set)),colour='blue')+
  ggtitle('Years of Experience vs Salary(Test Set)')+
  xlab('Years of Experience')+
  ylab('Salary')
