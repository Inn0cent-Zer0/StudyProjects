
# Load necessary libraries/packages for analysis and visualization
library(rmdformats)   # For R Markdown formats
library(corrgram)     # For graphical correlation matrix
library(MASS)         # For various statistical functions
library(ggplot2)      # For advanced plotting
library(naniar)       # For missing data visualization
library(reshape2)     # For data manipulation
library(e1071)        # For machine learning algorithms
library(lattice)      # For lattice graphics
library(caret)        # For machine learning and model evaluation
library(caTools)      # For data splitting
library(car)          # For regression diagnostics
library(knitr)        # For dynamic report generation

#  I  have downloaded the data set from 
#  https://www.kaggle.com/datasets/piyushgoyal443/red-wine-dataset?resource=download
#  the data set is free to download 
# video link : https://youtu.be/oYjnB3c4o1Q?si=ut2IHEjJy7H2o9A0
# this is the video from which I have learned to write this program.
# Feel Free to Blame 
  
# Load the dataset (replace the path with your actual file path)
senior <- read.csv('D:/004_R_Programming/wineQualityReds.csv')
wineds <- senior   # Create a copy of the dataset for manipulation

# Display structure and summary of the dataset
str(wineds)
summary(wineds)
colnames(wineds)

# Remove duplicate rows from the dataset
wineds <- wineds[!duplicated(wineds),]
dim(wineds)

# Check for NA values in the dataset
sum(is.na(wineds))


# Visualize missing data patterns graphically
vis_miss(wineds)

# Count occurrences of each quality rating in the dataset
table(wineds$quality)

# Calculate and display the correlation matrix rounded to two decimal places
round(cor(wineds, method = "pearson"), 2)

# Generate a graphical correlation matrix using corrgram
corrgram(wineds, type = "data", lower.panel = panel.conf, upper.panel = panel.shade,
         main = "Corrgram for wine quality", order = TRUE, cex.labels = 1.2)

# Attach the dataset for easier access to variables
attach(wineds)

# Barplots for categorical variables
par(mfrow = c(2, 2), oma = c(1, 1, 0, 0) + 0.1, mar = c(3, 3, 1, 1) + 0.1)

barplot(table(fixed.acidity), col = c("red", "blue", "darkorchid", "coral", "yellow"))
mtext("Fixed Acidity", side = 1, outer = FALSE, line = 2, cex = 0.8)

barplot(table(volatile.acidity), col = c("red", "blue", "darkorchid", "coral", "yellow"))
mtext("Volatile Acidity", side = 1, outer = FALSE, line = 2, cex = 0.8)

barplot(table(citric.acid), col = c("red", "blue", "darkorchid", "coral", "yellow"))
mtext("Citric Acid", side = 1, outer = FALSE, line = 2, cex = 0.8)

barplot(table(residual.sugar), col = c("red", "blue", "darkorchid", "coral", "yellow"))
mtext("Residual Sugar", side = 1, outer = FALSE, line = 2, cex = 0.8)

# Boxplots for continuous variables
par(mfrow = c(2, 2), oma = c(1, 1, 0, 0) + 0.1, mar = c(3, 3, 1, 1) + 0.1)

boxplot(fixed.acidity, col = "cadetblue", pch = 19)
mtext("Fixed Acidity", side = 1, outer = FALSE, line = 2, cex = 0.8)

boxplot(volatile.acidity, col = "coral", pch = 19)
mtext("Volatile Acidity", side = 1, outer = FALSE, line = 2, cex = 0.8)

boxplot(citric.acid, col = "darkviolet", pch = 19)
mtext("Citric Acid", side = 1, outer = FALSE, line = 2, cex = 0.8)

boxplot(residual.sugar, col = "darkred", pch = 19)
mtext("Residual Sugar", side = 1, outer = FALSE, line = 2, cex = 0.8)

# Additional boxplots for other continuous variables...
par(mfrow = c(2,2), oma = c(1,1,0,0) +0.1, mar = c(3,3,1,1) +0.1)

boxplot(chlorides, col = "darkgreen", pch = 19)
mtext("chlorides", cex = 0.8, side = 1,line = 2)

boxplot(alcohol, col = "gold", pch = 19)
mtext("alcohol", cex = 0.8, side = 1,line = 2)

par(mfrow = c(2,2), oma = c(1,1,0,0) +0.1, mar = c(3,3,1,1) +0.1)

boxplot(density, col = "slategray2", pch = 19)
mtext("density", cex = 0.8, side = 1,line = 2)

boxplot(free.sulfur.dioxide, col = "magenta", pch = 19)
mtext("free.sulfur.dioxide", cex = 0.8, side = 1,line = 2)

par(mfrow = c(2,2), oma = c(1,1,0,0) +0.1, mar = c(3,3,1,1) +0.1)

boxplot(pH,col = "navy", pch = 19)
mtext("ph", cex = 0.8, side = 1,line = 2)

boxplot(sulphates, col = "maroon", pch = 19)
mtext("sulphates", cex = 0.8, side = 1,line = 2)

boxplot(total.sulfur.dioxide, col = "plum", pch = 19)
mtext("total.sulfur.dioxide", cex = 0.8, side = 1,line = 2)


str(wineds)
# Checking the skewness of the individual variables of the data
# to check whether the data is normally distributed or not 

skewness(fixed.acidity)
skewness(volatile.acidity)
skewness(citric.acid)
skewness(residual.sugar)
skewness(chlorides)
skewness(free.sulfur.dioxide)
skewness(total.sulfur.dioxide)
skewness(density)
skewness(pH)
skewness(sulphates)
skewness(alcohol)
skewness(quality)

# Train - Test Set
set.seed(100)
trainingRowIndex <- sample(1:nrow(wineds),0.8 *nrow(wineds))
winedstrain <- wineds[trainingRowIndex,]
winedstest <- wineds[- trainingRowIndex,]

# Model Selection 
linear0 <- lm(quality ~., winedstrain)
summary(linear0)

# Checking MultiCollinearity
vif(linear0)

# vif comes under multi collinearity
# we can see multi collinearity over here
# we remove density cause it exhibits multi collinearity.


linear1 <- lm(quality ~. -density, winedstrain)
summary(linear1)

vif(linear1)
# so we will remove the unwanted variables
# from the data set to avoid  multi-collinearity
# and we will fit the model 
# we will try to fit the model
# until we get the  perfect model 
# then we will plot the model 

linear2 <- lm(quality ~ . -density - fixed.acidity, winedstrain)
summary(linear2)

linear3 <- lm(quality ~ . -density - fixed.acidity -citric.acid, winedstrain)
summary(linear3)

vif(linear3)


par(mfrow = c(2,2), oma = c(1,1,0,0) + 0.1 , mar =  c(3,3,1,1) +0.1)
plot(linear3)
return
# we can see after performing the plot model function 
# we will get the plotted in the plot section
# after that we will be predciting the train data set
# the we will be getting the confusion matrix of the train set 

# Predicting - Trained Set
distPred <- predict(linear3, winedstrain)
head(distPred)

distPred1 <- ceiling(distPred)
head(distPred1)
# Training Data Confusion Matrix
trn_tab <- table(predicted = distPred1, actual = winedstrain$quality)
trn_tab

# the we will say the accuracy for the same

# Accuracy for the Linear Model
sum(diag(trn_tab))/ length(winedstest$quality)
#Accuracy Prediction over train set Linear Model is 25%
# further we will be doing other models like ogistic model 
# and also binomial model to get the comparison
#  then we will test the model
# then we will check the accuracy for the same 

# Testing or Validating the Model
distPred <- predict(linear3, winedstest)
head(distPred)

distPred1 <- ceiling(distPred)
head(distPred1)

tst_tab <- table(predicted = distPred1, actual = winedstest$quality)
tst_tab

# Checking the accuracy of the test data
sum(diag(tst_tab))/length(winedstest$quality)

#Accuracy Prediction over test set Linear Model
# then we will be going for logistic regression
# again same  process that is test and train the data 
# and get the accuracy 
# then we will fit the model 
# using plor function - this 
# function is used to fit the ordinal regression model 
# the we will find the vif 
# further we will train the 
# then we will check the accuaracy  of the training data set
# 
# Assumptions for Logistic Regression

wineds$quality2 <- as.factor(wineds$quality)

# Train - test set
set.seed(3000)
spl = sample.split(wineds$quality2, SplitRatio = 0.7)


winedstrain  = subset(wineds, spl = TRUE)
winedstest =  subset(wineds, spl = FALSE)

head(winedstrain)

# Fitting Model

# polr() is the function used to fit the ordinal logistic regression model.
o_lrm <- polr(quality2 ~. -quality, data = winedstrain, Hess = TRUE)

vif(o_lrm)

summary(o_lrm)
o_lr = step(o_lrm)
head(fitted(o_lr))

#Training Set Accuracy

p <- predict(o_lr, type = "class")
head(p)

#Confusion Matrix Train Set
# the confusion matrix is used for 
#   Evaluation of the model performance
#   Understanding Error 
#   Metrics Calculation
#   Class Imblance Handling
#   Decision making 
#   Visual Representation

cml = as.matrix(table(Actual = winedstrain$quality2,Predicted = p))
cml

sum(diag(cml))/length(winedstrain$quality2)
#Training Set Accuracy is 53.08%

#Test Set Accuracy
tst_pred <- predict(o_lr, newdata = winedstest, type = "class")

# Confusion Matrix Test Set

cm2 <- table(predicted = tst_pred, actual = winedstest$quality2)
cm2

sum(diag(cm))/length(winedstrain$quality2)
#Test Set Accuracy 22.79%

#Binomial Logistic Regression Model
wineds$category[wineds$quality <=5] <- 0
wineds$category[wineds$quality >5] <- 1

wineds$category <- as.factor(wineds$category)

head(wineds)

#Train Test Split

set.seed(3000)

spl = sample.split(wineds$category, SplitRatio =0.7 )

winedstrain = subset(wineds, spl == TRUE)
winedstest = subset(wineds, spl = FALSE)

head(winedstrain)

# we will use the glm( ) - Generalized Linear Model 
# Command to run a logistic regression. 

model_glm <- glm(category ~ .  - quality - quality2, data = winedstrain, family = binomial(link = "logit"))
model_gl <- step(model_glm)
# Predictions - Train set

head(fitted(model_gl))

head(predict(model_gl))

head(predict(model_gl, type = "response"))

# Categorizing set
trn_pred <- ifelse(predict(model_gl, type = "response") > 0.5, "Good Wine", "Bad Wine")
head(trn_pred)

# Confusion Matrix Training set

trn_tab <- table(predicted = trn_pred, actual = winedstrain$category)
trn_tab
# Training Set Accuracy
sum(diag(trn_tab)) / length(winedstrain$category)
# we can see the Bionomial Logistic Regression gives an training set accuracy of 74.97

# Confusion Matrix Test set

tst_pred <- ifelse(predict(model_gl, newdata = winedstest,
                           type = "response") >0.5,"Good Wine","Bad Wine")
tst_tab <- table(predicted = tst_pred, actual = winedstest$category)
tst_tab

# Test Set Accuarcy
sum(diag(tst_tab))/length(winedstest$category)
# we can see the Bionomial Logistic Regression gives an training set accuracy of 74.97
# after doing all the algorithms on the data set we can conclude that the 
# Binomial Logistic Regression  is the best for getting the accuracy 
# as you can see the accuracy is best in binomial and the 
# other two linear and logisitc are getting lesser accuracy 
# than the binomial 
# thank you 
