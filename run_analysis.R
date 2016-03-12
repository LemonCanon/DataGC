
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

write.table(final.data, file = "cleaned_UCI_HAR_Dataset.txt", row.names = FALSE)
rm(list = ls())
