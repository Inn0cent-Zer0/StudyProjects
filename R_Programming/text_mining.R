#tidy text format is defined as a table with one token
#per row. A token is a meaningful unit of text, such as a word,
#we are interested in using for analysis, and tokenization
#is the process of splitting text into tokens.
#For tidy text mining, the token that is stored in each row is
#most often a single word, but can also be an n.gram,
#sentence, or paragraph.
#Source: Silge, Julia; Robinson, David. Text Mining with R: A
#Tidy Approach . O'Reilly Media. Kindle Edition.
library(dplyr) # package required for data frame manipulation
library(tidytext) #package used to tokenize words
# The process of creating visualizations from text data involves the following steps:
# 1. Text Data: Start with the raw text data.
# 2. Tidy Text: Use the `unnest_tokens` function from the `tidytext` 
# package to convert the raw text data into tidy text format.
# 3. Summarized Text: Use `dplyr` and `tidyr` packages to count
# and summarize the tidy text data.
# 4. Visualizations: Use the `ggplot2` package to create
# visualizations from the summarized text data.

# create a character vector
text <- c("When things go wrong as they sometimes will",
          "When the road you're trudging seems uphill",
          "when the funds are low, and the debts are high",
          "And you want to smile, but you have to sigh",
          "when care is pressing you down a bit",
          "Rest if you must, but don't you quit.")
text
# converting vector into data frame
textdf <- data.frame(line = 1:6, text = text)
textdf
# change the poem into tokens/ a token is a word in this example
results_token <- textdf %>%
  unnest_tokens(word,text)
results_token