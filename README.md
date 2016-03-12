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
The UCI HAR Dataset was the dataset supplied to perform this data cleaning assignment on
the data is explained within UCI HAR Dataset/README.txt . The cleaned_UCI_HAR_Dataset.txt
is a cleaned data table created by the run_analysis.R script. It reads the data files and
finds the standard deviation and mean for each set of measurement data, then assembles the 
resulting table with the identification sets (the subject and activity). 

Before combining the two seperate datasets (train and test) it ads a variable indicating 
which set it originated from. Once the data is combined it changes the activity ID from a 
number into a factor containing a discription of the activity (using the list provided in
the data files)
