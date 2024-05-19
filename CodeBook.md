CodeBook
Project Overview
The purpose of this project is to demonstrate your ability to collect, work with, and clean a dataset. The goal is to prepare tidy data that can be used for later analysis. The data used in this project were collected from the accelerometers of the Samsung Galaxy S smartphone, focusing on human activity recognition.

Data Source
The dataset used in this project can be found at the UCI Machine Learning Repository. The specific data for this project can be downloaded from the following link:

UCI HAR Dataset
Summary of the Dataset
The dataset includes the following files:

train/X_train.txt: Training set.
train/y_train.txt: Training labels.
test/X_test.txt: Test set.
test/y_test.txt: Test labels.
train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
test/subject_test.txt: Same as subject_train.txt but for the test set.
features.txt: List of all features.
activity_labels.txt: Links the class labels with their activity name.
Steps to Create the Tidy Dataset
Step 1: Merging the Training and Test Sets
Load the training and test datasets.
Combine the training and test sets to create one data set.
Step 2: Extracting Mean and Standard Deviation Measurements
Identify the measurements on the mean and standard deviation for each measurement.
Subset the data to include only these measurements.
Step 3: Using Descriptive Activity Names
Load the activity labels.
Replace activity IDs in the dataset with descriptive activity names.
Step 4: Labeling the Dataset with Descriptive Variable Names
Clean and appropriately label the data set with descriptive variable names based on the feature names provided.
Step 5: Creating an Independent Tidy Dataset
From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
Detailed Description of Variables
Identifiers
subject: An identifier of the subject who carried out the experiment, ranging from 1 to 30.
activity: The activity performed by the subject during the measurements, with descriptive names such as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.
Measurements
The measurements are the mean and standard deviation for each of the following signals:

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
Transformations
Merged the training and test sets.
Extracted measurements on the mean and standard deviation.
Applied descriptive activity names to the activities.
Labeled the dataset with descriptive variable names.
Created a second tidy dataset with the average of each variable for each activity and each subject.
R Script: run_analysis.R
The run_analysis.R script performs the following operations:

Loads the necessary libraries and datasets.
Merges the training and test sets to create one data set.
Extracts the measurements on the mean and standard deviation.
Uses descriptive activity names for the activities.
Appropriately labels the dataset with descriptive variable names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Writes the tidy dataset to a file named tidy_dataset.txt.
