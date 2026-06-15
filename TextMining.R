###Bag of words 
setwd("Desktop")

#do install the packages
install.packages("tm")
install.packages("SnowballC")
install.packages("qdap")

library(tm)
library(SnowballC)
library(dplyr)
library(qdap)

##first, we upload the dataset 
tweets=read.csv("tweets.csv", stringsAsFactors = FALSE)
View(tweets)
str(tweets)

##Now we observe the frequency of the words in the review  
fr=freq_terms(tweets)
fr
plot(fr)

##Let's create documents
twcr=Corpus(VectorSource(tweets$Tweet))
twcr[[2]]$content


#1. Changing words to lower case
twcr= twcr %>%
  tm_map(tolower)
twcr[[2]]$content

#2. Removing punctuations
twcr = twcr %>%
  tm_map(removePunctuation)
twcr[[7]]$content

#3. Removing the stopwords 
stopwords("english")
twcr =twcr %>%
  tm_map(removeWords, c("apple", "iphone","ios" stopwords("english")))
twcr[[3]]$content

#4. Removing numbers
twcr = twcr %>%
  tm_map(removeNumbers)
twcr[[4]]$content