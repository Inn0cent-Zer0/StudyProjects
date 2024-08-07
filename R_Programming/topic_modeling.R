# Assuming your entire script is loaded, start with loading required libraries
library(tidytext)
library(pdftools)
library(topicmodels)
library(tm)
library(ggplot2)
library(dplyr)
setwd('D:/R_Programming/pdfs')
# List all PDF files in the directory
All_Files <- list.files(pattern = "pdf$")
All_Files

# Extract text from all PDF files
All_opinions <- lapply(All_Files, pdf_text)
All_opinions

# Create a corpus of documents
document <- VCorpus(VectorSource(unlist(All_opinions)))

# Preprocess text data
document <- tm_map(document, content_transformer(tolower))
document <- tm_map(document, removeNumbers)
document <- tm_map(document, removeWords, stopwords("en"))
document <- tm_map(document, removePunctuation, preserve_intra_word_dashes = TRUE)
document <- tm_map(document, stripWhitespace)

# Create document term matrix (DTM)
DTM <- DocumentTermMatrix(document)
DTM

# Create LDA model with 4 topics
model_lda <- LDA(DTM, k = 4, control = list(seed = 1234))
model_lda

# Extract beta values (word probabilities per topic)
beta_topics <- tidy(model_lda, matrix = "beta")
beta_topics

# Group and select top terms by topic based on beta values
beta_top_terms <- beta_topics %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, desc(beta))

beta_top_terms

# Display top terms by topic in a grouped bar chart
plot1 <- beta_top_terms %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(beta, term, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~topic, scales = "free") +
  scale_y_reordered()

plot1  # Check if this plot displays

# Filter and arrange terms by count in the document-term matrix
tidy(DTM) %>%
  filter(document == 3) %>%
  arrange(desc(count))

# Extract gamma values (document-topic probabilities)
gamma_documents <- tidy(model_lda, matrix = "gamma")
gamma_documents

# Create a data frame with gamma results and add a chapter column
doc_gamma.df <- data.frame(gamma_documents)
doc_gamma.df$chapter <- rep(1:dim(DTM)[1], each = 4)

# Plot gamma results showing document-topic probabilities over chapters
plot2 <- ggplot(data = doc_gamma.df, aes(x = chapter, y = gamma,
                                         group = factor(topic), color = factor(topic))) +
  geom_line() +
  facet_wrap(~factor(topic), ncol = 1)

plot2  # Check if this plot displays
