#Describe and Summarizze Data
#Range?/ Spread
# Centrality
# Variance
# Summarize your data
# Create tables
library(tidyverse)
#Lets look at the data
# data()
# View(msleep)
# glimpse(msleep)
#Describe the spread, centrality and variance of 
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)
mean(msleep$awake)
median(msleep$awake)
var(msleep$awake)

#Summarise selected variables
summary(msleep)
summary(msleep$sleep_total)

msleep %>%
  select(sleep_total, brainwt) %>%
  summary()

# select two variables from data in the msleep
#create a summary table
# for each category of "vore"
# show the min,max,difference
# and the average "sleep_total"
#and arrange data by the average

msleep %>%
  select(name,vore,sleep_total)
#drop_na to drop all the missing values from the spefic variable 
#here I have used drop_na to drop missing values from vore variable and 
# have also used the group_by function to
# group data based the vore data 
# Have also summarised the data  into the columns like
# lower - the minimum amount of the sleep 
# upper maximum of the sleep
# difference - 
msleep %>%
  drop_na(vore) %>%
  group_by(vore) %>%
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
                      Upper = max(sleep_total),
                      Difference =
                      max(sleep_total) - min(sleep_total)) %>%
  arrange(Average) %>%
  View()
# we are going to arrange the data based on the average of sleep total

#Create conntigency tables

library(MASS)
attach(Cars93)
View(Cars93)
#categorical variables which I am interested are  AirBags,Origin

table(Origin)
#Summarised the Origin in the table
table(AirBags,Origin)
#Summarised the Cars based Origin and AirBags
addmargins(table(AirBags,Origin),1)
#if i put in the end of the above line, i will get the sum of row
# whereas if i put number 2, i will get the sum of column
# if i dont put the none of the numbers, i will get both
table(AirBags,Origin)
prop.table(table(AirBags,Origin),2) *100
round(prop.table(table(AirBags,Origin),2) *100)

Cars93 %>%
  group_by(Origin, AirBags) %>%
  summarise(number = n()) %>%
  pivot_wider(names_from = Origin,
              values_from = number)
#group by two variables and summarise
# pivot wider - airbag s as the row headings 
#headings created out of  what appeared