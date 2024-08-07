# Load necessary libraries
library(ggplot2)  # For creating plots
library(cowplot)  # For enhanced plotting functionalities (though not used directly in this script)
library(randomForest)  # For building and evaluating random forest models

# Define the URL where the data is located
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"

# Read the data from the URL into a dataframe
data <- read.csv(url, header=FALSE)

# Display the first few rows of the dataframe to check its structure
head(data)

# Assign column names to the dataframe for better readability
colnames(data) <- c(
  "age", "sex", "cp", "trestbps", "chol", "fbs", "restecg", "thalach",
  "exang", "oldpeak", "slope", "ca", "thal", "hd"
)

# Display the first few rows again to confirm column names
head(data)

# Display the structure of the dataframe including data types and summary
str(data)

# Replace missing values denoted by "?" with NA
data[data == "?"] <- NA

# Convert numerical gender values to factor levels with meaningful labels
data[data$sex == 0,]$sex <- "F"
data[data$sex == 1,]$sex <- "M"
data$sex <- as.factor(data$sex)

# Convert categorical columns to factors for modeling
data$cp <- as.factor(data$cp)
data$fbs <- as.factor(data$fbs)
data$restecg <- as.factor(data$restecg)
data$exang <- as.factor(data$exang)
data$slope <- as.factor(data$slope)

# Convert 'ca' and 'thal' to integer, then to factors
data$ca <- as.integer(data$ca)
data$ca <- as.factor(data$ca)
data$thal <- as.integer(data$thal)
data$thal <- as.factor(data$thal)

# Convert the target variable 'hd' to a binary factor with meaningful labels
data$hd <- ifelse(test=data$hd == 0, yes="Healthy", no="Unhealthy")
data$hd <- as.factor(data$hd)

# Display the structure of the modified dataframe
str(data)

# Set the random seed for reproducibility
set.seed(42)

# Perform imputation of missing values using Random Forest
data.imputed <- rfImpute(hd ~ ., data = data, iter=6)

# Build a Random Forest model to predict 'hd' using the imputed data
model <- randomForest(hd ~ ., data=data.imputed, proximity=TRUE)

# Display the Random Forest model summary
model

# Create a dataframe for out-of-bag (OOB) error rates for plotting
oob.error.data <- data.frame(
  Trees=rep(1:nrow(model$err.rate), times=3),
  Type=rep(c("OOB", "Healthy", "Unhealthy"), each=nrow(model$err.rate)),
  Error=c(model$err.rate[,"OOB"], 
          model$err.rate[,"Healthy"], 
          model$err.rate[,"Unhealthy"])
)

# Plot OOB error rates over the number of trees in the Random Forest
ggplot(data=oob.error.data, aes(x=Trees, y=Error)) +
  geom_line(aes(color=Type))

# Rebuild the Random Forest model with 1000 trees
model <- randomForest(hd ~ ., data=data.imputed, ntree=1000, proximity=TRUE)

# Display the updated Random Forest model summary
model

# Create a new dataframe for OOB error rates after rebuilding the model
oob.error.data <- data.frame(
  Trees=rep(1:nrow(model$err.rate), times=3),
  Type=rep(c("OOB", "Healthy", "Unhealthy"), each=nrow(model$err.rate)),
  Error=c(model$err.rate[,"OOB"], 
          model$err.rate[,"Healthy"], 
          model$err.rate[,"Unhealthy"])
)

# Plot OOB error rates with the new model configuration
ggplot(data=oob.error.data, aes(x=Trees, y=Error)) +
  geom_line(aes(color=Type))

# Initialize a vector to store out-of-bag error rates for different 'mtry' values
oob.values <- vector(length=10)

# Loop over different values of 'mtry' to find the optimal number
for(i in 1:10) {
  temp.model <- randomForest(hd ~ ., data=data.imputed, mtry=i, ntree=1000)
  oob.values[i] <- temp.model$err.rate[nrow(temp.model$err.rate),1]
}

# Display the out-of-bag error rates for different 'mtry' values
oob.values

# Find the minimum OOB error rate
min(oob.values)

# Determine the 'mtry' value that resulted in the minimum OOB error rate
which(oob.values == min(oob.values))

# Build the final Random Forest model using the optimal 'mtry' value
model <- randomForest(hd ~ ., data=data.imputed, ntree=1000, proximity=TRUE, mtry=which(oob.values == min(oob.values)))

# Compute the distance matrix based on the proximity matrix from the Random Forest model
distance.matrix <- as.dist(1-model$proximity)

# Perform Multidimensional Scaling (MDS) on the distance matrix to reduce dimensions
mds.stuff <- cmdscale(distance.matrix, eig=TRUE, x.ret=TRUE)

# Calculate the percentage of variance explained by each MDS dimension
mds.var.per <- round(mds.stuff$eig/sum(mds.stuff$eig)*100, 1)

# Extract MDS coordinates
mds.values <- mds.stuff$points

# Create a dataframe for MDS coordinates including sample labels and status
mds.data <- data.frame(Sample=rownames(mds.values),
                       X=mds.values[,1],
                       Y=mds.values[,2],
                       Status=data.imputed$hd)

# Plot the MDS results with sample labels and status
ggplot(data=mds.data, aes(x=X, y=Y, label=Sample)) + 
  geom_text(aes(color=Status)) +
  theme_bw() +
  xlab(paste("MDS1 - ", mds.var.per[1], "%", sep="")) +
  ylab(paste("MDS2 - ", mds.var.per[2], "%", sep="")) +
  ggtitle("MDS plot using (1 - Random Forest Proximities)")
