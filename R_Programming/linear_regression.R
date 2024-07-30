# Load necessary libraries
library(tidyverse)

# Load and inspect the 'cars' dataset
head(cars, 10)

# Perform linear regression
mod <- lm(dist ~ speed, data = cars)

# View summary of the regression model
summary(mod)

# Extract residuals and create a histogram
residuals_hist <- hist(mod$residuals)

# Predict distances for new speeds (10, 15, 20 mph)
new_speeds <- data.frame(speed = c(10, 15, 20))
predictions <- predict(mod, newdata = new_speeds) %>% round(1)
print(predictions)

# Alternative way to predict and round distances
predictions_alt <- cars %>%
  lm(dist ~ speed, data = .) %>%
  predict(data.frame(speed = c(10, 15, 20))) %>%
  round()

# Extract model parameters
intercept <- round(coef(mod)[1], 1)
slope <- round(coef(mod)[2], 1)
summary_mod <- summary(mod)
p_value <- summary_mod$coefficients[2, 4]
r_squared <- round(summary_mod$r.squared, 2)

# Plotting the data and regression line with residuals
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point(color = "red") +  # Scatter plot of the data points
  geom_smooth(method = "lm", col = "blue") +  # Add the regression line in blue
  geom_segment(aes(xend = speed, yend = fitted(mod)), color = "red", linetype = "dashed") +  # Add residuals in red
  labs(title = "The relationship between speed and stopping distance",
       x = "Speed of car (mph)",
       y = "Distance taken to stop (ft)") +
  annotate("text", x = 15, y = 100,
           label = paste("Y intercept =", intercept, "\nSlope =", slope, "\np =", format(p_value, digits = 3), "\nR2 =", r_squared),
           hjust = 0, vjust = 1, size = 5) +  
  theme_minimal()



