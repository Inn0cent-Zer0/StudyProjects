library(tidyverse)
data()
?starwars
dim(starwars)
str(starwars)
glimpse(starwars)
starwars$name
#built data for analysis and data command will show the data set available in 
# the installed version of r
attach(starwars)
names(starwars)
length(starwars)
class(starwars)
unique(hair_color)
View(sort(table(hair_color), decreasing=TRUE))
barplot(sort(table(eye_color),decreasing=TRUE))

starwars %>%
  select(hair_color) %>%
  count(hair_color) %>%
  arrange(desc(n)) %>%
  View()
View(starwars[is.na(hair_color),])

class(height)
length(height)
summary(height)
boxplot(height)
hist(height)