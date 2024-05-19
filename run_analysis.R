#READING LIBRARIES
library(dplyr)

#CREATING FOLDERS
if(!file.exists("./data")) {
        dir.create("./data")
}

#READING DATA FROM WEB
linkURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(linkURL, destfile = "./data/UCIHARDataset.zip")
rm(linkURL)
unzip(zipfile = "./data/UCIHARDataset.zip", exdir = "./data")
file.rename(from = "./data/UCI HAR Dataset", to = "./data/Dataset")
file.remove("./data/UCIHARDataset.zip")

#LOADING DATA
#Main tables
x_train <- read.table("./data/Dataset/train/X_train.txt")
x_test <- read.table("./data/Dataset/test/X_test.txt")
y_train <- read.table("./data/Dataset/train/y_train.txt")
y_test <- read.table("./data/Dataset/test/y_test.txt")
s_train <- read.table("./data/Dataset/train/subject_train.txt")
s_test <- read.table("./data/Dataset/test/subject_test.txt")

#Features
ft <- read.table("./data/Dataset/features.txt")

#Labels
dActivity <- read.table("./data/Dataset/activity_labels.txt")
colnames(dActivity) <- c("activityID", "activityType")

#Asigning colnames
colnames(x_train) <- ft[, 2]; colnames(x_test) <- ft[, 2]
colnames(y_train) <- "activityID"; colnames(y_test) <- "activityID"
colnames(s_train) <- "subjectID"; colnames(s_test) <- "subjectID"