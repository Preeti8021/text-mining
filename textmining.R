#install required packages
install.packages("tm")
install.packages("wordcloud")

# Load required libraries
library(tm)
library(wordcloud)

# Read the text file into R
#text <- tolower(readLines("C:/Users/preet/Desktop/txt.txt", warn = FALSE))

# Read the text from website 
text <- readLines("https://preeti8021.github.io/text-mining.github.io/",warn=FALSE)

# Create a doc
doc <- Corpus(VectorSource(text))

# Preprocess the text
doc <- tm_map(doc, content_transformer(tolower))
doc <- tm_map(doc, removePunctuation)
doc <- tm_map(doc, removeNumbers)
doc <- tm_map(doc, removeWords, stopwords())
doc <- tm_map(doc, stripWhitespace)

#to check the processed text till now
inspect(doc[[1]])

# Create a document-term matrix dtm
dtm <- DocumentTermMatrix(doc)

# Convert DTM to a matrix
matrix <- as.matrix(dtm)

# Calculate word frequencies
word_freq <- colSums(matrix)
word_freq

# Create a word cloud
wordcloud(names(word_freq), word_freq, min.freq = 3,scale=c(4,0.6),colors=brewer.pal(3, "Dark2"))