## CodeBook.md for run_analysis.R

Course Project for "Getting and Cleaning Data"
Author: Brian Engelhardt
Date: 06/19/14

## Study Design

The data for this project is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data was collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto in the following method:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

## Data Transformations

The following describes the steps taken to clean up the dataset into tidy data:

1. The test data (x, y & subject) & the training data (x, y & subject) is read into tables
2. The feature descriptions and activity labels are read into tables, and properly labeled
3. Search through the feature descriptions for ones that contain "std()" or "mean()"
4. Extract the subset of cols that contain "std()" and "mean()"
5. Clean up those cols names using make.names()
6. Subset just the cols from the x test data that matches the subset of cols from step 4.
7. Subset just the cols from the x training data that matches the subset of cols from step 4.
8. Use cbind to col bind all of the test data (y, subject, x) together
9. Use cbind to col bind all of the training data (y, subject, x) together
10. Use rbind to row bind all of the test & training data together
11. Use merge to marge the Activity Labels into the data set, keying on the ActivityID already in the dataset
12. Use aggregate to summarize the data, taking the mean of each col, organized by Activity & Subject
13. Write the now tidy data into a text file named "tidy_data.txt"

## Code Book

The following are the details of the data in the columns of the resulting tidy_data.txt file:

|1|Activity|Activity Description|
|2|Subject|Subject ID|
|3|tBodyAcc.mean.X|Mean of the tBodyAcc.mean.X data from the original dataset for the given activity & subject|
|4|tBodyAcc.mean.Y|Mean of the tBodyAcc.mean.Y data from the original dataset for the given activity & subject|
|5|tBodyAcc.mean.Z|Mean of the tBodyAcc.mean.Z data from the original dataset for the given activity & subject|
|6|tBodyAcc.std.X|Mean of the tBodyAcc.std.X data from the original dataset for the given activity & subject|
|7|tBodyAcc.std.Y|Mean of the tBodyAcc.std.Y data from the original dataset for the given activity & subject|
|8|tBodyAcc.std.Z|Mean of the tBodyAcc.std.Z data from the original dataset for the given activity & subject|
|9|tGravityAcc.mean.X|Mean of the tGravityAcc.mean.X data from the original dataset for the given activity & subject|
|10|tGravityAcc.mean.Y|Mean of the tGravityAcc.mean.Y data from the original dataset for the given activity & subject|
|11|tGravityAcc.mean.Z|Mean of the tGravityAcc.mean.Z data from the original dataset for the given activity & subject|
|12|tGravityAcc.std.X|Mean of the tGravityAcc.std.X data from the original dataset for the given activity & subject|
|13|tGravityAcc.std.Y|Mean of the tGravityAcc.std.Y data from the original dataset for the given activity & subject|
|14|tGravityAcc.std.Z|Mean of the tGravityAcc.std.Z data from the original dataset for the given activity & subject|
|15|tBodyAccJerk.mean.X|Mean of the tBodyAccJerk.mean.X data from the original dataset for the given activity & subject|
|16|tBodyAccJerk.mean.Y|Mean of the tBodyAccJerk.mean.Y data from the original dataset for the given activity & subject|
|17|tBodyAccJerk.mean.Z|Mean of the tBodyAccJerk.mean.Z data from the original dataset for the given activity & subject|
|18|tBodyAccJerk.std.X|Mean of the tBodyAccJerk.std.X data from the original dataset for the given activity & subject|
|19|tBodyAccJerk.std.Y|Mean of the tBodyAccJerk.std.Y data from the original dataset for the given activity & subject|
|20|tBodyAccJerk.std.Z|Mean of the tBodyAccJerk.std.Z data from the original dataset for the given activity & subject|
|21|tBodyGyro.mean.X|Mean of the tBodyGyro.mean.X data from the original dataset for the given activity & subject|
|22|tBodyGyro.mean.Y|Mean of the tBodyGyro.mean.Y data from the original dataset for the given activity & subject|
|23|tBodyGyro.mean.Z|Mean of the tBodyGyro.mean.Z data from the original dataset for the given activity & subject|
|24|tBodyGyro.std.X|Mean of the tBodyGyro.std.X data from the original dataset for the given activity & subject|
|25|tBodyGyro.std.Y|Mean of the tBodyGyro.std.Y data from the original dataset for the given activity & subject|
|26|tBodyGyro.std.Z|Mean of the tBodyGyro.std.Z data from the original dataset for the given activity & subject|
|27|tBodyGyroJerk.mean.X|Mean of the tBodyGyroJerk.mean.X data from the original dataset for the given activity & subject|
|28|tBodyGyroJerk.mean.Y|Mean of the tBodyGyroJerk.mean.Y data from the original dataset for the given activity & subject|
|29|tBodyGyroJerk.mean.Z|Mean of the tBodyGyroJerk.mean.Z data from the original dataset for the given activity & subject|
|30|tBodyGyroJerk.std.X|Mean of the tBodyGyroJerk.std.X data from the original dataset for the given activity & subject|
|31|tBodyGyroJerk.std.Y|Mean of the tBodyGyroJerk.std.Y data from the original dataset for the given activity & subject|
|32|tBodyGyroJerk.std.Z|Mean of the tBodyGyroJerk.std.Z data from the original dataset for the given activity & subject|
|33|tBodyAccMag.mean.|Mean of the tBodyAccMag.mean. data from the original dataset for the given activity & subject|
|34|tBodyAccMag.std.|Mean of the tBodyAccMag.std. data from the original dataset for the given activity & subject|
|35|tGravityAccMag.mean.|Mean of the tGravityAccMag.mean. data from the original dataset for the given activity & subject|
|36|tGravityAccMag.std.|Mean of the tGravityAccMag.std. data from the original dataset for the given activity & subject|
|37|tBodyAccJerkMag.mean.|Mean of the tBodyAccJerkMag.mean. data from the original dataset for the given activity & subject|
|38|tBodyAccJerkMag.std.|Mean of the tBodyAccJerkMag.std. data from the original dataset for the given activity & subject|
|39|tBodyGyroMag.mean.|Mean of the tBodyGyroMag.mean. data from the original dataset for the given activity & subject|
|40|tBodyGyroMag.std.|Mean of the tBodyGyroMag.std. data from the original dataset for the given activity & subject|
|41|tBodyGyroJerkMag.mean.|Mean of the tBodyGyroJerkMag.mean. data from the original dataset for the given activity & subject|
|42|tBodyGyroJerkMag.std.|Mean of the tBodyGyroJerkMag.std. data from the original dataset for the given activity & subject|
|43|fBodyAcc.mean.X|Mean of the fBodyAcc.mean.X data from the original dataset for the given activity & subject|
|44|fBodyAcc.mean.Y|Mean of the fBodyAcc.mean.Y data from the original dataset for the given activity & subject|
|45|fBodyAcc.mean.Z|Mean of the fBodyAcc.mean.Z data from the original dataset for the given activity & subject|
|46|fBodyAcc.std.X|Mean of the fBodyAcc.std.X data from the original dataset for the given activity & subject|
|47|fBodyAcc.std.Y|Mean of the fBodyAcc.std.Y data from the original dataset for the given activity & subject|
|48|fBodyAcc.std.Z|Mean of the fBodyAcc.std.Z data from the original dataset for the given activity & subject|
|49|fBodyAcc.meanFreq.X|Mean of the fBodyAcc.meanFreq.X data from the original dataset for the given activity & subject|
|50|fBodyAcc.meanFreq.Y|Mean of the fBodyAcc.meanFreq.Y data from the original dataset for the given activity & subject|
|51|fBodyAcc.meanFreq.Z|Mean of the fBodyAcc.meanFreq.Z data from the original dataset for the given activity & subject|
|52|fBodyAccJerk.mean.X|Mean of the fBodyAccJerk.mean.X data from the original dataset for the given activity & subject|
|53|fBodyAccJerk.mean.Y|Mean of the fBodyAccJerk.mean.Y data from the original dataset for the given activity & subject|
|54|fBodyAccJerk.mean.Z|Mean of the fBodyAccJerk.mean.Z data from the original dataset for the given activity & subject|
|55|fBodyAccJerk.std.X|Mean of the fBodyAccJerk.std.X data from the original dataset for the given activity & subject|
|56|fBodyAccJerk.std.Y|Mean of the fBodyAccJerk.std.Y data from the original dataset for the given activity & subject|
|57|fBodyAccJerk.std.Z|Mean of the fBodyAccJerk.std.Z data from the original dataset for the given activity & subject|
|58|fBodyAccJerk.meanFreq.X|Mean of the fBodyAccJerk.meanFreq.X data from the original dataset for the given activity & subject|
|59|fBodyAccJerk.meanFreq.Y|Mean of the fBodyAccJerk.meanFreq.Y data from the original dataset for the given activity & subject|
|60|fBodyAccJerk.meanFreq.Z|Mean of the fBodyAccJerk.meanFreq.Z data from the original dataset for the given activity & subject|
|61|fBodyGyro.mean.X|Mean of the fBodyGyro.mean.X data from the original dataset for the given activity & subject|
|62|fBodyGyro.mean.Y|Mean of the fBodyGyro.mean.Y data from the original dataset for the given activity & subject|
|63|fBodyGyro.mean.Z|Mean of the fBodyGyro.mean.Z data from the original dataset for the given activity & subject|
|64|fBodyGyro.std.X|Mean of the fBodyGyro.std.X data from the original dataset for the given activity & subject|
|65|fBodyGyro.std.Y|Mean of the fBodyGyro.std.Y data from the original dataset for the given activity & subject|
|66|fBodyGyro.std.Z|Mean of the fBodyGyro.std.Z data from the original dataset for the given activity & subject|
|67|fBodyGyro.meanFreq.X|Mean of the fBodyGyro.meanFreq.X data from the original dataset for the given activity & subject|
|68|fBodyGyro.meanFreq.Y|Mean of the fBodyGyro.meanFreq.Y data from the original dataset for the given activity & subject|
|69|fBodyGyro.meanFreq.Z|Mean of the fBodyGyro.meanFreq.Z data from the original dataset for the given activity & subject|
|70|fBodyAccMag.mean.|Mean of the fBodyAccMag.mean. data from the original dataset for the given activity & subject|
|71|fBodyAccMag.std.|Mean of the fBodyAccMag.std. data from the original dataset for the given activity & subject|
|72|fBodyAccMag.meanFreq.|Mean of the fBodyAccMag.meanFreq. data from the original dataset for the given activity & subject|
|73|fBodyBodyAccJerkMag.mean.|Mean of the fBodyBodyAccJerkMag.mean. data from the original dataset for the given activity & subject|
|74|fBodyBodyAccJerkMag.std.|Mean of the fBodyBodyAccJerkMag.std. data from the original dataset for the given activity & subject|
|75|fBodyBodyAccJerkMag.meanFreq.|Mean of the fBodyBodyAccJerkMag.meanFreq. data from the original dataset for the given activity & subject|
|76|fBodyBodyGyroMag.mean.|Mean of the fBodyBodyGyroMag.mean. data from the original dataset for the given activity & subject|
|77|fBodyBodyGyroMag.std.|Mean of the fBodyBodyGyroMag.std. data from the original dataset for the given activity & subject|
|78|fBodyBodyGyroMag.meanFreq.|Mean of the fBodyBodyGyroMag.meanFreq. data from the original dataset for the given activity & subject|
|79|fBodyBodyGyroJerkMag.mean.|Mean of the fBodyBodyGyroJerkMag.mean. data from the original dataset for the given activity & subject|
|80|fBodyBodyGyroJerkMag.std.|Mean of the fBodyBodyGyroJerkMag.std. data from the original dataset for the given activity & subject|
|81|fBodyBodyGyroJerkMag.meanFreq.|Mean of the fBodyBodyGyroJerkMag.meanFreq. data from the original dataset for the given activity & subject|
