# We are comparing two means and their values in a t-test.
# When we introduce a third variable between the two variables being compared,
# ANOVA performs this task by analyzing variance. However, the fundamental
# principle remains unchanged: the null hypothesis.
# Let's assume there is no difference in the mean life expectancy across all three continents.
# We formulate a null hypothesis stating that the life expectancy means from all
# three continents are the same.
# Alpha value represents the threshold in hypothesis testing. Assuming no difference
# in life expectancy (i.e., the difference in means is 0),
# what is the probability that we would obtain a sample with the observed difference?
# If this probability is very small and less than our chosen threshold,
# we reject the hypothesis that the means are equal and accept that the difference is real.

# Load necessary libraries
library(tidyverse)     # Tidyverse includes a collection of packages for data manipulation and visualization.
library(patchwork)     # Patchwork is used for combining plots.
library(gapminder)     # Gapminder provides data on global development.
library(forcats)       # Forcats helps with categorical data manipulation.

# data()
head(gapminder)

# Load the Gapminder dataset and filter for the year 2007 and continents Americas, Europe, and Asia
gapdata <- gapminder %>%
  filter(year == 2007 & continent %in% c("Americas", "Europe", "Asia")) %>%
  select(continent, lifeExp)

#Take a look at the distribution of means

gapdata %>%
  group_by(continent) %>%
  summarise(Mean_life = mean(lifeExp)) %>%
  arrange(Mean_life)
#Research Question := Is the life expectancy 
#                     in these three continents
#                     different

# Create ANOVA Model
gapdata %>%
  aov(lifeExp ~ continent, data = .) %>%
  summary()

aov_model <- gapdata %>%
  aov(lifeExp ~ continent, data =.)

# is this significance being driven by a particular continent ?

gapdata %>%
  aov(lifeExp ~ continent, data =.) %>%
  TukeyHSD() %>%
  plot()
