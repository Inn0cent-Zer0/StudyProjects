#Manipulate data
# Rename a variable
# Reorder variables 
# Change a variable type
# Select variables to work with
#  Filter and arrange data
# Recode data
# Change data
# Select variables to work with
# Filter and arrange data
# Recode data
# Change data (mutate)1w
# Conditions changes(if_else)
# Reshape Dataframe
#        Wide to Long
#        Long to wide
#Load the package
library(tidyverse)
#View data
?msleep 
glimpse(msleep)
View(msleep)
#Rename a variable
msleep 

msleep %>%
  rename("conserv" = "conservation")

#Reorder Variables
msleep %>%
  select(vore,name,everything())

#Change a variable type  

class(msleep$vore)
msleep$vore <-  as.factor(msleep$vore)
glimpse(msleep)

msleep%>%
  mutate(vore= as.character(vore)) %>%
  glimpse()


#Select Variables to work with


names(msleep)

msleep %>%
 select(2:4,
       awake,
       starts_with("sleep"),
       contains("wt")) %>%
  names()

#Filter and Arrange data

unique(msleep$order)

msleep %>%
  filter((order == "Carnivora" |
            order == "Primates") &
           sleep_total > 8) %>%
  select(name,order,sleep_total) %>%
  arrange(-sleep_total) %>%
  View

msleep %>%
  filter(order %in% c("Carnivora","Primates") &
           sleep_total > 8) %>%
  select(name,order,sleep_total) %>%
  arrange(order) %>%
View
 
#Change Observations (Mutate)
msleep %>%
mutate(brainwt = brainwt *1000) %>%
  View

msleep %>%
mutate(brainwt_in_grams = brainwt *1000) %>%
  View()

#Conditional Changes(if_else)
#Logical vector based on a condition
msleep$brainwt 
msleep$brainwt >0.01

size_of_brain <- msleep %>%
  select(name, brainwt) %>%
  drop_na(brainwt) %>% 
  mutate(brain_size = if_else(brainwt > 0.01,
                             "large",
                             "small" ))
size_of_brain
  
# Recode data and rename a variable
# Change Observations of large & small intonations
size_of_brain %>%
  mutate(brain_size = recode(brain_size,
                             "large" =1,
                             "small" = 2))
# Reshape the data from wide to long or long to wide  
library(gapminder)
View(gapminder)
data <- select(gapminder, country, year,lifeExp)
View(data) 


wide_data <- data %>%
  pivot_wider(names_from = year, values_from = lifeExp)

View(wide_data)

long_data <- wide_data %>%
  pivot_longer(2:13,
               names_to = "year",
               values_to = "lifeExp")