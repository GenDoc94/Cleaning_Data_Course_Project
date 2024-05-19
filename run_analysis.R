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


#MERGING AND DELETING
train <- cbind(y_train, s_train, x_train)
test <- cbind(y_test, s_test, x_test)
alldata <- rbind(train, test)
rm(train); rm(test)

#DELETING ADDITIONAL DATASETS
vars <- ls()
vars_rm <- vars[grepl("^s_|^x_|^y_|ft", vars)]
rm(list = (vars_rm)); rm(vars); rm(vars_rm)

#SUBSET MEAN_SD
logical_mean_sd <- grepl("activityID|subjectID|mean\\(\\)|std\\(\\)", colnames(alldata))
alldata_ms <- alldata[, logical_mean_sd]
rm(logical_mean_sd)

#SUBSET MEAN_DATA + ACTIVITY
alldata_ms_a <- merge(alldata_ms, dActivity, by = "activityID", all.x = TRUE)
rm(dActivity)

#CHANGING COLNAMES
colnames(alldata_ms_a) <- gsub("Acc", "Accelerometer", colnames(alldata_ms_a))
colnames(alldata_ms_a) <- gsub("Gyro", "Gyroscope", colnames(alldata_ms_a))
colnames(alldata_ms_a) <- gsub("Mag", "Magnitude", colnames(alldata_ms_a))
colnames(alldata_ms_a) <- gsub("BodyBody", "Body", colnames(alldata_ms_a))
colnames(alldata_ms_a) <- gsub("^t", "time", colnames(alldata_ms_a))
colnames(alldata_ms_a) <- gsub("^f", "frequency", colnames(alldata_ms_a))
colnames(alldata_ms_a)<- gsub("-mean()", "Mean", colnames(alldata_ms_a), ignore.case = TRUE)
colnames(alldata_ms_a)<- gsub("\\(\\)", "", colnames(alldata_ms_a), ignore.case = TRUE)
colnames(alldata_ms_a)<-gsub("-std()", "SD", colnames(alldata_ms_a), ignore.case = TRUE)
colnames(alldata_ms_a)<-gsub("-freq()", "Frequency", colnames(alldata_ms_a), ignore.case = TRUE)

# 5. Creating a second, independent tidy data set with the avg of each variable for each activity and subject
tidyData <- alldata_ms_a %>%
        group_by(subjectID, activityID, activityType) %>%
        summarise_all(mean)

# Writing second tidy data set into a txt file
write.table(tidyData, "tidyData.txt", row.names = FALSE)