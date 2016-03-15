## DataGC
Repo for the final assignment for Getting and Cleaning data course on Coursera.
by RP 12-3-2016

### contents
* UCI HAR Dataset
* cleaned_UCI_HAR_Dataset.txt
* CodeBook.txt
* README.md
* run_analysis.R

### explanation
The data used in this project originated from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and was downloaded on Mar 8, 2016

The UCI HAR Dataset was the dataset supplied to perform this data cleaning assignment on
the data is explained within UCI HAR Dataset/README.txt . The cleaned_UCI_HAR_Dataset.txt
is a cleaned data table created by the run_analysis.R script. It reads the data files and
then assembles the resulting table with the identification sets (the subject and activity)
and data containing mean and std from the X_*.txt file. 

Before combining the two seperate datasets (train and test) it adds a variable indicating 
which set an observation originated from. Once the data is combined it changes the activity 
ID from a number into a factor containing a discription of the activity (using the list of 
activity names provided in the data files). The headers from X_*.txt are cleaned by removing 
"."s from the text and applying camel case to increase readability.

Further discription of the dataset can be found in CodeBook.txt and the README.txt and 
features_info.txt files found in DataGC/UCI HAR Dataset
