# Load necessary libraries
library(tm)
library(tidytext)
library(dplyr)
library(ggplot2)
library(textdata)
library(pdftools)

# Set the working directory to where your PDF files are located
setwd('D:/Vaishnavi/004_R_Programming')

# List and read PDF files
vikram <- list.files(pattern = "simba.pdf$")
arun <- lapply(vikram, pdf_text)
arun
All_opinions <- unlist(arun)

# Create a corpus of documents
document <- VCorpus(VectorSource(All_opinions))

# Preprocess text data
document <- tm_map(document, content_transformer(tolower))
document <- tm_map(document, removeNumbers)
document <- tm_map(document, removeWords, stopwords("en"))
document <- tm_map(document, removePunctuation, preserve_intra_word_dashes = TRUE)
document <- tm_map(document, stripWhitespace)

# Create document term matrix (DTM)
DTM <- DocumentTermMatrix(document)

# Convert DTM to tidy format for sentiment analysis
drug <- tidy(DTM)
View(drug)

# Load the sentiment lexicons
data(package = "textdata")

# Perform sentiment analysis using different lexicons
Drug_sentiments <- drug %>%
  inner_join(get_sentiments("bing"), by = c(term = "word"))

drug_afinn <- drug %>%
  inner_join(get_sentiments("afinn"), by = c(term = "word"))
drug_afinn
drug_nrcjoy <- get_sentiments("nrc") %>%
  filter(sentiment == "joy")
drug_nrcjoy <- drug %>%
  inner_join(nrcjoy, by = c(term = "word")) %>%
  count(word, sort = TRUE)
drug_nrcjoy
nrcfear <- get_sentiments("nrc") %>%
  filter(sentiment == "fear")
drug_nrcfear <- drug %>%
  inner_join(nrcfear, by = c(term = "word")) %>%
  count(word, sort = TRUE)
drug_nrcfear