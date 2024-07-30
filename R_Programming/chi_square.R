library(tidyverse)
library(forcats)
view(gss_cat)
my_data <- gss_cat %>%
  select(marital) %>%
  filter(marital %in% c("Married","Never Married","Divorced"))%>%
  mutate(marital = fct_drop(marital))
my_table <- table(my_data)
view(my_table)
#use chi-squre
chisq.test(my_table)
my_data %>%
  table() %>%
  chisq.test()
