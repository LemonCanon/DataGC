#RP
#read from "UCI HAR Dataset/test" & "UCI HAR Dataset/train"
#   for each measurment dataset run apply(data, 1, sd) and apply(data, 1, mean) and create columns from those variables.

#clear the global environment
rm(list = ls())

#load all data
#test data:
test.X <- read.table("UCI HAR Dataset/test/X_test.txt")
test.Y <- read.table("UCI HAR Dataset/test/Y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

#train data: 
train.X <- read.table("UCI HAR Dataset/train/X_train.txt")
train.Y <- read.table("UCI HAR Dataset/train/Y_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")


#collect the means and standard deviation values from the X dataset using the 
#   following function.
getmesd <- function(data){
    features <- read.table("UCI HAR Dataset/features.txt")
    mesd <- features[
            (grepl("mean", features$V2) | grepl("std", features$V2))
            & 
            !grepl("Freq", features$V2),
        ]
    features.mesd <- data[,mesd[,1]]
    colnames(features.mesd) <- mesd[,2] 
    return(features.mesd)
    
}
test.mesd <- getmesd(test.X)
train.mesd <- getmesd(train.X)

#combine the individual data sets and add an indicator as to which original set
#   it came from
test.data <- data.frame(test.subject, test.Y, dataset = "test", test.mesd)
train.data <- data.frame(train.subject, train.Y, dataset = "train", train.mesd)

#merge the 2 datasets
comb.data <- merge(test.data, train.data, all = TRUE)

#clean up the data names by romoving the . from the extracted names
colnames(comb.data) <- gsub("\\.","",colnames(comb.data))

#Change the first letter in "std" and "mean" to caps

colnames(comb.data) <- sub("mean", "Mean", colnames(comb.data))
colnames(comb.data) <- sub("std", "Std", colnames(comb.data))

#change the dataset names frome the defualt
colnames(comb.data)[1:2] <- c("subjectID", "activity")

#change the activity labels from a number to a factor using the activity 
#   labels provided
library(dplyr)
active <- read.table("UCI HAR Dataset/activity_labels.txt")
comb.data <- mutate(comb.data, activity = as.factor(activity))
levels(comb.data[,2]) <- as.character(active[,2])
                    
#arrange by subject and then by activity
arrange(comb.data, subjectID, activity, dataset)

#write the table to file
write.table(comb.data, "cleaned_UCI_HAR_Dataset.txt", row.names = FALSE)

#clear the global environment
#rm(list = ls())

#todo gather data on SubjectID
#get mean of each column based on subjectID
#output second dataset