# Getting-and-cleaning-data

This repository includes the files and script for the Coursera Getting and Cleaning Data course project.

## Assignment

The goal of the assignment is to create a tidy data set from a larger set of wearable computing data and demonstrate ability to collect, work with and clean data.

## Data

The data used in the project is wearable computing accelerometer data collected from Samsung Galaxy S smartphones. A full description of the source data set can be found from the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This is the original source data set for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Code

The code in run_analysis.R file downloads the wearable computing data set above and creates a tidy version of the data set. Running the code will create a /Data directory under your working directory (if one does not already exist), download and unzip the data set. The code produces an output in your working directory in the form of a tidydata.txt file which contains average measurements of 66 variables for 30 subjects and 6 activities. Please see Codebook.md for more information on the variables and the process of modifying the data set.  
