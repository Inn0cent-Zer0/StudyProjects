# Svm is a supervised machine learning algorithm
# it can be used for both classification and regresssion
# the best way to explain how svm works ifs if i can use illustfation here  
# the data have been labeled very clearly . our objectiver here i we werd given a pss here to identify or draww a line that
# can split the two together in the most optimal  wa that is fundaamentally how svm works
# the goal is to arrive at the optimal hyperplane which seegments it so that there is a widest margin
# between  the line th ehyperland and the observations 
# svm is used for both linear and non linear classification
# svm is quite efficient  and quite handy if we will to perform nonlinear classification
# using what is referred to as a kernel trick and that basically basically uses

# Load necessary libraries
library(ggplot2)  # For data visualization
library(e1071)    # For support vector machine (SVM) implementation

# Plot the entire iris dataset
plot(iris)  # Generates scatterplot matrices for all combinations of variables in the iris dataset

# Plot Sepal.Length against Sepal.Width, coloring points by Species
plot(iris$Sepal.Length, iris$Sepal.Width, col=iris$Species)  # Scatterplot of Sepal Length vs Sepal Width colored by Species

# Plot Petal.Length against Petal.Width, coloring points by Species
plot(iris$Petal.Length, iris$Petal.Width, col=iris$Species)  # Scatterplot of Petal Length vs Petal Width colored by Species

# Sample 100 out of 150 observations for training
s <- sample(150, 100)  # Randomly sample 100 indices from 1 to 150

# Specify columns to be used
col <- c("Petal.Length", "Petal.Width", "Species")  # Columns to be used in the model

# Create training dataset from the sampled indices
iris_train <- iris[s, col]  # Subset iris data for training using sampled indices

# Create test dataset from the remaining indices
iris_test <- iris[-s, col]  # Subset iris data for testing using remaining indices

# Train the SVM model using the training dataset with a linear kernel
svmfit <- svm(Species ~ ., data=iris_train, kernel="linear", cost=.1, scale=FALSE)
# SVM model training:
# Species ~ . : Species as a function of all other variables
# data=iris_train: using training data
# kernel="linear": using linear kernel
# cost=.1: setting cost parameter to 0.1
# scale=FALSE: do not scale data

# Print the SVM model details
print(svmfit)  # Output details of the trained SVM model

# Plot the SVM model with the training data
plot(svmfit, iris_train[, col])  # Plot SVM classification boundaries along with training data

# Tune the SVM model to find the best cost parameter
tuned <- tune(svm, Species ~ ., data=iris_train, kernel="linear", ranges=list(cost=c(0.001, 0.01, 0.1, 1, 10, 100)))
# Hyperparameter tuning for SVM:
# Species ~ . : Species as a function of all other variables
# data=iris_train: using training data
# kernel="linear": using linear kernel
# ranges=list(cost=c(0.001, 0.01, 0.1, 1, 10, 100)): testing multiple cost values

# Print the summary of the tuning results
summary(tuned)  # Output the results of the hyperparameter tuning

# Predict species for the test dataset using the trained SVM model
p <- predict(svmfit, iris_test[, col], type="class")
# Prediction using the SVM model:
# svmfit: the trained SVM model
# iris_test[, col]: using test data
# type="class": predicting class labels

# Plot the predictions (note: this line might not work as intended, since 'plot' expects different input)
plot(p)  # Attempt to plot predictions (not meaningful for factor data, typically for numerical data)

# Create a confusion matrix comparing predictions to actual species in the test data
table(p, iris_test[, 3])  # Create confusion matrix comparing predicted and actual species

# Calculate and print the accuracy of the predictions
mean(p == iris_test[, 3])  # Calculate the mean accuracy of predictions
