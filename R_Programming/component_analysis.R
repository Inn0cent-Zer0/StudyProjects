# Load necessary libraries
library(psych)       # For data manipulation and visualization
library(devtools)    # For installing packages from GitHub
# install_github("vqv/ggbiplot")
library(ggbiplot)    # For creating biplots with ggplot2

# Load and inspect the 'iris' dataset
str(iris)
summary(iris)

# Set seed for reproducibility
set.seed(111)

# Split the dataset into training and testing sets
ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.8, 0.2))
training <- iris[ind == 1, ]
testing <- iris[ind == 2, ]

# Visualize the relationships between variables using pairs.panels
pairs.panels(training[, -5],  # Exclude the Species column
             gap = 0,
             bg = c("red", "yellow", "blue")[training$Species],
             pch = 21)

# Perform Principal Component Analysis (PCA) on the training data
pc <- prcomp(training[, -5],  # Exclude the Species column
             center = TRUE,
             scale. = TRUE)

# View attributes and summary of the PCA object
attributes(pc)
print(pc)
summary(pc)

# Visualize the principal components using pairs.panels
pairs.panels(pc$x,
             gap = 0,
             bg = c("red", "yellow", "blue")[training$Species],
             pch = 21)

# Create a biplot using ggbiplot
g <- ggbiplot(pc,
              obs.scale = 1,
              var.scale = 1,
              groups = training$Species,
              ellipse = TRUE,
              circle = TRUE,
              ellipse.prob = 0.68)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal',
               legend.position = 'top')
print(g)

# Predict PCA scores for training and testing datasets
trg <- predict(pc, newdata = training)
trg <- cbind(trg, Species = training$Species)
tst <- predict(pc, newdata = testing)
tst <- cbind(tst, Species = testing$Species)

# Build a multinomial logistic regression model
library(nnet)  # Load nnet package for multinom function
mymodel <- multinom(formula = Species ~ PC1 + PC2, data = trg)

# Predict classifications for training data
p <- predict(mymodel, newdata = trg)
tab <- table(predicted = p, actual = trg$Species)
tab

# Predict classifications for testing data
p1 <- predict(mymodel, newdata = tst)
tab1 <- table(predicted = p1, actual = tst$Species)
tab1
