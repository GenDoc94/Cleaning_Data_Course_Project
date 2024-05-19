# Project Overview

The purpose of this project is to demonstrate your ability to collect, work with, and clean a dataset. The goal is to prepare tidy data that can be used for later analysis. The data used in this project were collected from the accelerometers of the Samsung Galaxy S smartphone, focusing on human activity recognition.

## Data Source

The dataset used in this project can be found at the UCI Machine Learning Repository. The specific data for this project can be downloaded from the following link: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Summary of the Dataset

-   `X_train.txt`: Training set.
-   `y_train.txt`: Training labels.
-   `X_test.txt`: Test set.
-   `y_test.txt`: Test labels.
-   `subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
-   `subject_test.txt`: Same as subject_train.txt but for the test set.
-   `features.txt`: List of all features. activity_labels.txt: Links the class labels with their activity name.

## Steps to Create the Tidy Dataset Step

**Step 1.**: Merging the Training and Test Sets Load the training and test datasets. Combine the training and test sets to create one data set.

**Step 2.**: Extracting Mean and Standard Deviation Measurements Identify the measurements on the mean and standard deviation for each measurement. Subset the data to include only these measurements.

**Step 3.**: Using Descriptive Activity Names Load the activity labels. Replace activity IDs in the dataset with descriptive activity names.

**Step 4.**: Labeling the Dataset with Descriptive Variable Names Clean and appropriately label the data set with descriptive variable names based on the feature names provided.

**Step 5.**: Creating an Independent Tidy Dataset From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Detailed Description of Variables

### Identifiers

-   `subject`: An identifier of the subject who carried out the experiment, ranging from 1 to 30.
-   `activity`: The activity performed by the subject during the measurements, with descriptive names such as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

### Measurements

-   `tBodyAcc`
-   `tGravityAcc`
-   `tBodyAccJerk`
-   `tBodyGyro`
-   `tBodyGyroJerk`
-   `tBodyAccMag`
-   `tBodyAccJerkMag`
-   `tBodyGyroMag`
-   `tBodyGyroJerkMag`

## Transformations

-   Merged the training and test sets.
-   Extracted measurements on the mean and standard deviation.
-   Applied descriptive activity names to the activities.
-   Labeled the dataset with descriptive variable names.
-   Created a second tidy dataset with the average of each variable for each activity and each subject.

## R Script: run_analysis.R

R script performs the following operations:

**1.** Loads the necessary libraries and datasets.

**2.** Merges the training and test sets to create one data set.

**3.** Extracts the measurements on the mean and standard deviation.

**4.** Uses descriptive activity names for the activities.

**5.** Appropriately labels the dataset with descriptive variable names.

**6.** Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**7.** Writes the tidy dataset to a file named `tidyData.txt`.
