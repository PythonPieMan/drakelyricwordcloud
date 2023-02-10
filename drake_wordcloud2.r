# Set Working Directory
setwd("C:/Users/dwarner/Downloads")

# Calling libraries
library(rtweet)
library(tm)
library(dplyr)
library(data.table)
library(ggplot2)
library(ggthemes)
library(tidyr)
library(SnowballC)
library(wordcloud)
library(wordcloud2)
library(readxl)
library(xlsx)
library(dplyr)
library(stringr)
library(tidyr)
library(lubridate)
library(reshape2)
library(zoo)
library(summarytools)
library(caTools)
library(relaimpo)
library(ggplot2)
library(ggrepel)
library(NLP)
library(tm)
library(stringr)

# Read in CSV

drake_lyrics <- read.csv('drake_lyrics.csv')

##########################################################

# Cleaning Lyrics
colnames(drake_lyrics)

mycorpus <- Corpus(VectorSource(drake_lyrics$lyrics))
mycorpus <- tm_map(mycorpus, removeWords, stopwords())

mystopwords <- c(stopwords('english'), "the", "ver", "and", " and", "now", "just", "like", "get", "got", "can", "one", "say", "think", "come",
                 "need", "will", "said", "find", "see", "came", "ask",
                 "plea", "wait", "put", "ive", "cant", "still", "tell",
                 "let", "gotta", "use", "last", "late", "way", "aint",
                 "caus", "stay", "dont", "take", "keep", "look", "realli")
mycorpus <- tm_map(mycorpus, removeWords, mystopwords)

# Removing URLs
remove_url <- function(x) gsub("http[^[:space:]]*","",x)
mycorpus <- tm_map(mycorpus, content_transformer(remove_url))

# Remove anything other than english letters and space
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*","",x)
mycorpus <- tm_map(mycorpus, content_transformer(removeNumPunct))
mycorpus <- tm_map(mycorpus, removePunctuation)
mycorpus <- tm_map(mycorpus, content_transformer(tolower))
mycorpus <- tm_map(mycorpus, stripWhitespace)
mycorpus <- tm_map(mycorpus, stemDocument)

# Creating a Document-Term Matrix
dtm <- TermDocumentMatrix(mycorpus)
inspect(dtm[51:60,10:20])

dtm2 <- as.matrix(dtm)
frequency <- sort(rowSums(dtm2), decreasing = T)
head(frequency)
words <- names(frequency)

# Visualization of the data
plot(frequency, col="darkblue")

df <- data.frame(names(frequency), frequency)

# Visualization via wordcloud2 package
??wordcloud2
install.packages("devtools")
library(devtools)
install_github("lchiffon/wordcloud2")
install.packages("RColorBrewer")
library(RColorBrewer)
library(wordcloud2)
figPath <- "nwts2.jpg"
wordcloud2(df, size = 1, figPath = figPath, backgroundColor = "#107fc9", color = "#86412c")

wordcloud(mycorpus, min.freq = 10, max.words = 100, random.order = F)
