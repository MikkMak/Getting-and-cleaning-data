# Load needed libraries

library(data.table)
library(plyr)
library(dplyr)

# Set file URL for downloading data
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Create Data directory under your home directory.
# Download the dataset file and unzip the zip-file.

if(!file.exists("./Data")){
        dir.create("./Data")
}
if(!file.exists("./Data/UCI HAR Dataset")){
        download.file(fileUrl, destfile="./Data/dataset.zip", method="curl")
        unzip("./Data/dataset.zip", exdir="./Data/")
}

# Read text files into data tables
setwd("./Data/UCI HAR Dataset/")
activityLabels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

setwd("./test/")
subjectTest <- read.table("subject_test.txt")
XTest <- read.table("X_test.txt")
yTest <- read.table("y_test.txt")

setwd("../train/")
subjectTrain <- read.table("subject_train.txt")
XTrain <- read.table("X_train.txt")
yTrain <- read.table("y_train.txt")

# Replace activity label number data in yTest and yTrain with 
# descriptive activity label names
colnames(yTest) <- "activity"
colnames(yTrain) <- "activity"
yTest <- mutate(yTest, activity = activityLabels[activity,2])
yTrain <- mutate(yTrain, activity = activityLabels[activity,2])

# Set column names for XTest and XTrain with descriptions from features
colnames(XTest) <- features[,2]
colnames(XTrain) <- features[,2]

# Set column names for subjectTest and subjectTrain
colnames(subjectTest) <- "subject"
colnames(subjectTrain) <- "subject"

# Merge subject IDs with test and train data
totalTest <- cbind(subjectTest, yTest, XTest)
totalTrain <- cbind(subjectTrain, yTrain, XTrain)

# Merge the test and train data into one total data frame
totalAll <- rbind(totalTest, totalTrain)

# Filter for variables containing "mean" or "std" in column names
means <- grep("mean()\\b", names(totalAll))
stds <- grep("std()\\b", names(totalAll))
rightColumns <- c(1, 2, means, stds)
finalAll <- totalAll[ , rightColumns]

# Summarize by subject and activity and average columns to create final tidy dataset
tidyDataset <- ddply(finalAll, .(subject, activity), numcolwise(mean, na.rm=TRUE))

# Create a text file (tidydata.txt) from the tidy dataset
setwd("../../../")
write.table(tidyDataset, file = "tidydata.txt", row.names=FALSE)