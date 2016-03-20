## DataGC
Repo for the final assignment for Getting and Cleaning data course on Coursera.
by RP 12-3-2016

### contents
* UCI HAR Dataset
* cleaned_UCI_HAR_Dataset.txt
* CodeBook.txt
* README.md
* run_analysis.R

### Inputs
Data:
	"UCI HAR Dataset/test/X_test.txt"
	"UCI HAR Dataset/test/Y_test.txt"
	"UCI HAR Dataset/test/subject_test.txt"
	
	"UCI HAR Dataset/train/X_train.txt"
	"UCI HAR Dataset/train/Y_train.txt"
	"UCI HAR Dataset/train/subject_train.txt"
Labels:
	"UCI HAR Dataset/features.txt"
	"UCI HAR Dataset/activity_labels.txt"
	
###	Outputs

	"cleaned_UCI_HAR_Dataset.txt"
	"UCI_HAR_Dataset_bySubject.txt"
	
### explanation
The data used in this project originated from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and was downloaded on Mar 8, 2016

First the script run_analysis.R reads the input data. The script then selects the rows containing standard deviation and
mean values using the labels for the X_*.txt data in the features.txt file. The script then combines the X_*.txt, Y_*.txt
and subject_*.txt  of each dataset and adds the "dataset" column containing "test" and "train" factors indicating which 
dataset a specific data observation came from. 

Then the script combines the two separate datasets into a single table. The script then cleans the headers by removing ".",
changing them to camel caps (to increase readability without making the label longer) and where "bodybody" occurs it reduces
it to "body". The activity column is changed from a numeric value to corisponding activity names found in activity_labels.txt.
The script then outputs "cleaned_UCI_HAR_Dataset.txt".

The script continues on to group the data by subjectID and activity and then takes the mean of each variable for each (the
script removes the dataset variable from this new table because it is not numeric). The script then outputs the new data as
"UCI_HAR_Dataset_bySubject.txt"

