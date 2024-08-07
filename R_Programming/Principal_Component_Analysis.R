#Unsupervised Learning - hence Converting iris data to unlabelled

library(stats)
library(dplyr)
#viewing iris data, 5 columns
# View
#Unsupervised LEarning - hence Converting iris data to unlabelled
#from the iris data set 
# i select the first four columns 

mydata <-select(iris,c(1,2,3,4))
mydata
#Check PCA Eligibility
#one of the aim is combine or transform linearly correlated variables
# into a set of new variables called Principal Variables
#we need to check whether they are linearly dependent or not
#if the avg correlation is above 0.3 or below minus 0.3
#we can say that there is evidence that variables
# are highly correlated to each other
cor(mydata)
mean(cor(mydata))
#Principal Componsnet Analysis

#PCA
PCA = princomp(mydata)
#PCA Loadings abd there four components four variables without naming
#Evaluating PCA #
# Two ways to evaluate PCA :-
# 1. Check whether PCS Capture the essence of the origianl variable
# 2. Check whether the PCS are indepent
#PC Loadings
PCA$loadings
#Principal Components

PC = PCA$scores
# View(PC)
cor(PC)