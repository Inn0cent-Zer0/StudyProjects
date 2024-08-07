# To do Ridge, Lasso and Elastic Net Regression in R, we will use the glmnet library
# the glm means for Generalized Linear Models
# which means that this tool can be applied to Linear Regression & Logistic
# Regression as well as a few other models.
# the net part is Elastic-Net
# we will use the package glmnet, which does not use the model formula
# language, so we will set up x and y

# Load the necessary libraries
library(glmnet)  # For Ridge, Lasso, and Elastic Net regression
library(ISLR)    # For accessing the Hitters dataset

# Load the Hitters dataset and remove rows with missing values
data(Hitters)        # Load the Hitters dataset
Hitters <- na.omit(Hitters)  # Remove rows with missing values

# Create the matrix of predictor variables (x) and the response variable (y)
x <- model.matrix(Salary ~ ., data = Hitters)[,-1]  # Predictor variables matrix, excluding the intercept column
y <- Hitters$Salary  # Response variable (Salary)

# Split data into training and test sets
set.seed(123)  # Set seed for reproducibility
train_index <- sample(1:nrow(x), nrow(x) * 0.7)  # Randomly select 70% of the data for training
train <- train_index  # Training indices
test <- setdiff(1:nrow(x), train_index)  # Test indices

# Fit a Ridge Regression model
fit.ridge = glmnet(x, y, alpha = 0)  # Fit Ridge regression model (alpha = 0 for Ridge)
plot(fit.ridge, xvar = "lambda", label = TRUE)  # Plot Ridge regression model coefficients vs. lambda

# Perform cross-validation for Ridge Regression to select the best lambda
cv.ridge = cv.glmnet(x, y, alpha = 0)  # Cross-validation for Ridge regression
plot(cv.ridge)  # Plot the cross-validation results

# Fit a Lasso Regression model
fit.lasso = glmnet(x, y, alpha = 1)  # Fit Lasso regression model (alpha = 1 for Lasso)
plot(fit.lasso, xvar = "lambda", label = TRUE)  # Plot Lasso regression model coefficients vs. lambda

# Perform cross-validation for Lasso Regression to select the best lambda
cv.lasso = cv.glmnet(x, y, alpha = 1)  # Cross-validation for Lasso regression
plot(cv.lasso)  # Plot the cross-validation results
coef(cv.lasso)  # Get the coefficients of the best Lasso model

# Fit Lasso model on training data
lasso.tr = glmnet(x[train, ], y[train], alpha = 1)  # Fit Lasso model on training set

# Predict on test data
pred = predict(lasso.tr, newx = x[test, ])  # Predict using the fitted Lasso model on test set

# Calculate RMSE (Root Mean Squared Error) for different lambda values
rmse = sqrt(apply((y[test] - pred)^2, 2, mean))  # Calculate RMSE for each lambda value

# Plot RMSE vs. log(lambda)
plot(log(lasso.tr$lambda), rmse, type = 'b', xlab = "Log(Lambda)", ylab = "RMSE")  # Plot RMSE vs. log(lambda)

# Select the best lambda based on minimum RMSE
lam.best = lasso.tr$lambda[order(rmse)[1]]  # Best lambda based on RMSE
lam.best  # Display the best lambda value

# Get the coefficients for the best Lasso model
coef(lasso.tr, s = lam.best)  # Coefficients of the Lasso model for the selected lambda
