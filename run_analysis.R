# Review criterialess 
# The submitted data set is tidy.
# The Github repo contains the required scripts.

# GitHub contains a code book that modifies and updates the available codebooks with the data to indicate 
# all the variables and summaries calculated, along with units, and any other relevant information.
# The README that explains the analysis files is clear and understandable.

# The work submitted for this project is the work of the student who submitted it.
# Getting and Cleaning Data Course Projectless 
# The purpose of this project is to demonstrate your ability to collect, work with, 
# and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
# You will be graded by your peers on a series of yes/no questions related to the project. 
# You will be required to submit: 
#   1) a tidy data set as described below
#   2) a link to a Github repository with your script for performing the analysis 
#   3) a code book that describes the variables, the data, and any transformations 
#      or work that you performed to clean up the data called CodeBook.md. 
# You should also include a README.md in the repo with your scripts. 
# This repo explains how all of the scripts work and how they are connected.
# 
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article . 
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
# The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
# A full description is available at the site where the data was obtained:
#     
#     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# 
# Here are the data for the project:
#     
#     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Good luck!

#load data files
#get mean and std of measurment files
#combine data and label

#X = setAVG, setSTD
#Y = Activity
#subject = VolunteerID
#body_acc_[x-z] = accellerationAVG[x-z], accellerationSTD[x-z]
#body_gyro_[x-z] = angularVelAVG[x-z], angularVelSTD[x-z]
#total_acc[x-y] = totalaccelleration[x-z]
#add a variable indicating the original data set: Train or Test

#read from "UCI HAR Dataset/test" & "UCI HAR Dataset/train"
#for each measurment dataset run apply(data, 1, sd) and apply(data, 1, mean) and create columns from those variables.

#clear the global environment
rm(list = ls())

#load all data
#test data:
test.X <- read.table("UCI HAR Dataset/test/X_test.txt")
test.Y <- read.table("UCI HAR Dataset/test/Y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.accX <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
test.accY <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
test.accZ <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
test.gyroX <-  read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
test.gyroY <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
test.gyroZ <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
test.totaccX <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
test.totaccY <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
test.totaccZ <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

#train data: 
train.X <- read.table("UCI HAR Dataset/train/X_train.txt")
train.Y <- read.table("UCI HAR Dataset/train/Y_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train.accX <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
train.accY <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
train.accZ <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
train.gyroX <-  read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
train.gyroY <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
train.gyroZ <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
train.totaccX <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
train.totaccY <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
train.totaccZ <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

sumUp <- function(data){
    avg <- apply(data, 1, mean)
    stan <- apply(data, 1, sd)
    result <- data.frame(avg, stan)
    return(result)
}

#summarize measurement data by SD and Mean
test.measurement <- data.frame(
    X = sumUp(test.X),
    accX = sumUp(test.accX),
    accY = sumUp(test.accY),
    accZ = sumUp(test.accZ),
    gyroX = sumUp(test.gyroX),
    gyroY = sumUp(test.gyroY),
    gyroZ = sumUp(test.gyroZ),
    totaccX = sumUp(test.totaccX),
    totaccY = sumUp(test.totaccY),
    totaccZ = sumUp(test.totaccZ)
)

train.measurement <- data.frame(
    X = sumUp(train.X),
    accX = sumUp(train.accX),
    accY = sumUp(train.accY),
    accZ = sumUp(train.accZ),
    gyroX = sumUp(train.gyroX),
    gyroY = sumUp(train.gyroY),
    gyroZ = sumUp(train.gyroZ),
    totaccX = sumUp(train.totaccX),
    totaccY = sumUp(train.totaccY),
    totaccZ = sumUp(train.totaccZ)
)

test.data <- data.frame(subject = test.subject, 
                        activity = test.Y, 
                        dataSet = "test", 
                        test.measurement)
train.data <- data.frame(subject = train.subject, 
                         activity = train.Y, 
                         dataSet = "train",
                         train.measurement)


#extract activity names
act <- read.table("UCI HAR Dataset/activity_labels.txt")
act <- as.character(act[,2])

library(dplyr)
final.data <- merge( test.data, train.data, all = TRUE) 
colnames(final.data)[1] <- "subjectID"
colnames(final.data)[2] <- "activity"
final.data <- mutate(final.data, activity = as.factor(final.data[,2]))
levels(final.data[,2]) <- act 

write.csv(final.data, file = "cleaned_UCI_HAR_Dataset.csv", row.names = FALSE)
rm(list = ls())
