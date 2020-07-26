#Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd 

#Importing the datasets
dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:,:-1].values
Y = dataset.iloc[:,1].values



#Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train,X_test,Y_train,Y_test=train_test_split(X,Y,test_size=0.2,random_state=0)

#Training Simple Linear Regression
from sklearn.linear_model import LinearRegression
regressor =LinearRegression()
regressor.fit(X_train,Y_train)

#predicting the test set results
y_pred=regressor.predict(X_test)

#visualising training set
plt.scatter(X_train,Y_train,color='red')
plt.plot(X_train,regressor.predict(X_train),color='blue')
plt.title('Salary vs Experience(Training Set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()

#visualising test set
plt.scatter(X_test,Y_test,color='red')
plt.plot(X_train,regressor.predict(X_train),color='blue')
#plt.scatter(X_test,y_pred,color='green')
plt.title('Salary vs Experience(Training Set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()