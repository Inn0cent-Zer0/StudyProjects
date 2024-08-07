library(ggplot2)
library(e1071)

# The above library is commonly used for SVM
str(iris)
qplot(Petal.Length, Petal.Width, data=iris, color=Species)

# Support Vector Machine (SVM)
# We are looking for an optimal separating hyperplane between classes,
# which we achieve by maximizing the margin around the hyperplane.
# Points that lie on this boundary are called support vectors, and this boundary is
# the separating hyperplane.
# In situations where we cannot obtain a linear separator, data points
# are projected into higher dimensional space so that they become linearly separable.
# We use kernels for this purpose. An algorithm that helps us perform
# these activities is called a Support Vector Machine.

mymodel <- svm(Species ~ ., data=iris)
summary(mymodel)

# We want to predict the species in this dataset using all other
# variables. We have 4 numeric variables, and by using a dot (.)
# we include all these variables in the model. Our data is 'iris',
# providing the formula and data used.
# Some parameters to note: the SVM type is C-classification,
# which is the default since we are dealing with a factor variable (Species).
# If we were doing regression, we would use a different SVM type.
# The kernel used is the radial basis function (RBF).

plot(mymodel, data=iris, 
     Petal.Width ~ Petal.Length, 
     slice=list(Sepal.Width=3, Sepal.Length=4))

# The plot displays support vectors represented by crosses
# and decision boundaries for three species.
# Data points are categorized into each species, represented by colors in the background.

# Confusion Matrix and Misclassification Error
# Let's predict each species using our model, referred to as "my model".
# We will make predictions for the entire iris dataset.
# We create a table comparing predicted versus actual data.

pred <-predict(mymodel,iris)
tab <-table(Predicted = pred,Actual = iris$Species)
tab
1-sum(diag(tab))/sum(tab)
# There is a difference in classification when using the Linear kernel.
# When we plot the model for the two variables,
#we can observe a slight change in the way 
#they are classified compared to the radial basis classification.
# This was observed with radial basis classification.

mymodel <- svm(Species ~ ., data=iris,kernel="linear")
summary(mymodel)

plot(mymodel, data=iris, 
     Petal.Width ~ Petal.Length, 
slice=list(Sepal.Width=3, Sepal.Length=4))
# When calculating the Confusion Matrix and Misclassification,
# there is a slightly higher misclassification rate of 23.3%.
# Similarly, if we try polynomial kernel (degree 1)...

#Tuning 
# Tuning is also hyper parameter optimization and it helps to select the 
#  best model lets set a random see at one two three 
# we will make use of the tune function for doing the tuning and we will use support
# we will makes use of ranges 
# so we make use of a sequence which starts with zero and goes up to one with 
# the increment of 0.1 so basically values
# for  epsilon will be 0.1, 0.2 to 1 so we will have 11 different values
# another parameter that we want to use for fine-tuning is cosgy
# so causee captures the cost of constraint violation and default value for cost 
# is  one and it cost is to high it will mean high peanlty for ono spetable points 
#  and what may happen is the model may store too many support vectors 
# and that will lead to overfitting whereas if the cost value is too 
# small we may end up  with under fitting and model may not be very accurate so that is why we
# make use  of a large range so that we are able to 
# capture optimal cost value so that is why  we make use of 2 to the power of 2 up to 9
mymodel <- svm(Species ~ ., data=iris,kernel="sigmoid")
summary(mymodel)
set.seed(123)
tmodel <- tune(svm,Species~., data=iris,
     ranges= list(epilson = seq(0,1,0.1), cos = 2^(2:7)))
plot(tmodel)

# this gives us performance evaluation of svm for these 
# parameters that we had used and darker regions means better results are in these 
# these regions which means lower values for cosgt and various different values 
# for epsilon so in fact  instead of going from 2 to the power of 2 which is 4 upto 
# 512 even if we do our  search withing maybe less than 200 we should be fine so instead of 9
# we can also do at 7 
#
pred <-predict(mymodel,iris)
tab <-table(Predicted = pred,Actual = iris$Species)
tab
1-sum(diag(tab))/sum(tab)
plot(mymodel, data=iris, 
     Petal.Width ~ Petal.Length, 
     slice=list(Sepal.Width=3, Sepal.Length=4))