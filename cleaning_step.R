dataset <- read.csv2("drone-phrase_related-fr.csv", sep=",")
dataset2 <- dataset


#Remove rows that contain certain words
competitor_list <- c("parrot", "dji")

for (i in 1:length(competitor_list)) {
  word_to_delete <- as.character(competitor_list[i])
  print(paste("Remove rows that contain", word_to_delete),sep="\n")
  dataset <- dataset[!grepl(word_to_delete, dataset$Keyword),]
}


#Remove rows with exact match words using a REGEX
parasites_list <- c("boulanger drone", "drone leclerc", "drone wikipedia")

for (i in 1:length(parasites_list)) {
  word_to_delete <- as.character(paste0("^",parasites_list[i],"$"))
  print(paste("Remove rows that contain", word_to_delete),sep="\n")
  dataset <- dataset[!grepl(word_to_delete, dataset$Keyword),]
}


#Display removed rows
library(dplyr)
removed_rows <- setdiff(dataset2,dataset)
removed_rows
