# Codebook

## Data

The source data used for creating the output file tidydata.txt is wearable computing accelerometer data collected from Samsung Galaxy S smartphones. A full description of the source data set can be found from the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original source data set for analysis can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Dictionary

Column 1: Subject
* ID number for person (subject) the measurements are collected from

Column 2: Activity
* Activity labels describing the activities measured
* Activities: laying, sitting, standing, walking, walking downstairs, walking upstairs

Columns 3 through 68: mean and standard deviation values for a set of following variables
* Column 3 tBodyAcc-mean()-X
* Column 4 tBodyAcc-mean()-Y
* Column 5 tBodyAcc-mean()-Z
* Column 6 tGravityAcc-mean()-X
* Column 7 tGravityAcc-mean()-Y
* Column 8 tGravityAcc-mean()-Z
* Column 9 tBodyAccJerk-mean()-X
* Column 10 tBodyAccJerk-mean()-Y
* Column 11 tBodyAccJerk-mean()-Z
* Column 12 tBodyGyro-mean()-X
* Column 13 tBodyGyro-mean()-Y
* Column 14 tBodyGyro-mean()-Z
* Column 15 tBodyGyroJerk-mean()-X
* Column 16 tBodyGyroJerk-mean()-Y
* Column 17 tBodyGyroJerk-mean()-Z
* Column 18 tBodyAccMag-mean()
* Column 19 tGravityAccMag-mean()
* Column 20 tBodyAccJerkMag-mean()
* Column 21 tBodyGyroMag-mean()
* Column 22 tBodyGyroJerkMag-mean()
* Column 23 fBodyAcc-mean()-X
* Column 24 fBodyAcc-mean()-Y
* Column 25 fBodyAcc-mean()-Z
* Column 26 fBodyAccJerk-mean()-X
* Column 27 fBodyAccJerk-mean()-Y
* Column 28 fBodyAccJerk-mean()-Z
* Column 29 fBodyGyro-mean()-X
* Column 30 fBodyGyro-mean()-Y
* Column 31 fBodyGyro-mean()-Z
* Column 32 fBodyAccMag-mean()
* Column 33 fBodyBodyAccJerkMag-mean()
* Column 34 fBodyBodyGyroMag-mean()
* Column 35 fBodyBodyGyroJerkMag-mean()
* Column 36 tBodyAcc-std()-X
* Column 37 tBodyAcc-std()-Y
* Column 38 tBodyAcc-std()-Z
* Column 39 tGravityAcc-std()-X
* Column 40 tGravityAcc-std()-Y
* Column 41 tGravityAcc-std()-Z
* Column 42 tBodyAccJerk-std()-X
* Column 43 tBodyAccJerk-std()-Y
* Column 44 tBodyAccJerk-std()-Z
* Column 45 tBodyGyro-std()-X
* Column 46 tBodyGyro-std()-Y
* Column 47 tBodyGyro-std()-Z
* Column 48 tBodyGyroJerk-std()-X
* Column 49 tBodyGyroJerk-std()-Y
* Column 50 tBodyGyroJerk-std()-Z
* Column 51 tBodyAccMag-std()
* Column 52 tGravityAccMag-std()
* Column 53 tBodyAccJerkMag-std()
* Column 54 tBodyGyroMag-std()
* Column 55 tBodyGyroJerkMag-std()
* Column 56 fBodyAcc-std()-X
* Column 57 fBodyAcc-std()-Y
* Column 58 fBodyAcc-std()-Z
* Column 59 fBodyAccJerk-std()-X
* Column 60 fBodyAccJerk-std()-Y
* Column 61 fBodyAccJerk-std()-Z
* Column 62 fBodyGyro-std()-X
* Column 63 fBodyGyro-std()-Y
* Column 64 fBodyGyro-std()-Z
* Column 65 fBodyAccMag-std()
* Column 66 fBodyBodyAccJerkMag-std()
* Column 67 fBodyBodyGyroMag-std()
* Column 68 fBodyBodyGyroJerkMag-std()

For full details on each variable please see downloaded features_info.txt file under /Data/UCI HAR Dataset.

## Process for creating the tidy data set

The code for creating the tidy data set is included in run_analysis.R file. Running the code will create a /Data/ directory under your working directory and download the dataset there. 

The code will execute the following sequence to get data and work on downloaded files:
* Create a /Data/ directory under working directory
* Download the dataset.zip file, and unzip the file
* Read the unzipped .txt files into R data tables
* Replace data in the yTest and yTrain data frames with descriptive activity labels from the activityLabels data frame
* Set column names for the XTest and XTrain measurement data with descriptions from the features data frame
* Set column names for subjectTest and subjectTrain to be “subject”
* Merge the subjectTest, yTest, XTest data frames to make a test dataset
* Merge the subjectTrain, yTrain, XTrain data frames to make a train dataset 
* Combine the test and train datasets
* Subset only the mean and standard deviation measurements from the total merged dataset
* Produce a tidy dataset by taking the average of each variable for each subject and activity
* Output a tidydata.txt file under your working directory

