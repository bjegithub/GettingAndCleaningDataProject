## function run_analysis reads in data from the UCI HAR Dataset (assumed to be
## in the working directory, and cleans the data and transforms it into
## a tidy dataset, writing the resulting data to a file named "tidy_data.txt"
##
## Class: Getting and Cleaning Data
## Author: Brian Engelhardt
## Date: 06/19/14

run_analysis <- function() {

	## read in the test data
	x_test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
	y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt")
	subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")

	## read in the training data
	x_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
	y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
	subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")

	## read in the feature labels and activity lables
	features <- read.table("UCI HAR Dataset\\features.txt")
	activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt")
	
	## change the col names of the activity lables table
	colnames(activity_labels) <- c("ActivityID", "ActivityLabels")
	
	## get a list of which cols have "std()" or "mean()" in the name
	std_cols <- grep("std()", features[,2])
	mean_cols <- grep("mean()", features[,2])
	cols <- c(std_cols, mean_cols)
	cols <- sort(cols)

	## clean up the list of col names to remove illegal characters, and then remove
	## multiple occurrences of ".." or "..." ("." is substituted for illegal chars)
	temp_names <- make.names(features[cols,2])
	temp_names <- gsub("\\.\\.", "\\.", temp_names) 
	temp_names <- gsub("\\.\\.", "\\.", temp_names) 

	## select just the cols we want from the test data set	
	x_test_sub <- x_test[,cols]
	colnames(x_test_sub) <- temp_names

	## select just the cols we want from the training data set
	x_train_sub <- x_train[,cols]
	colnames(x_train_sub) <- temp_names

	## name the cols correctly
	colnames(y_test) <- "ActivityID"
	colnames(y_train) <- "ActivityID"
	colnames(subject_test) <- "Subject"
	colnames(subject_train) <- "Subject"

	## col bind the test data together, and then the training data together
	full_test <- cbind(y_test, subject_test, x_test_sub)
	full_train <- cbind(y_train, subject_train, x_train_sub)

	## row bind the test data and the training data into one data set
	full_data <- rbind(full_test, full_train)

	## merge the activity labels into the data set, in place of the activity IDs
	full_data <- merge(x=full_data,y=activity_labels, by.x="ActivityID", by.y="ActivityID",all.x=TRUE)
	full_data[,1] <- full_data$ActivityLabels
	colnames(full_data)[1] <- "Activity"
	full_data$ActivityLabels <- NULL

	## summarize the data by activity & subject, and calculate the mean for each of the cols
	## when done, resort & re-do the row numbers
	aggregated_data <- aggregate(full_data, by=list(full_data$Activity, full_data$Subject), FUN=mean)
	aggregated_data<- aggregated_data[order(aggregated_data$Group.1, aggregated_data$Group.2),]
	rownames(aggregated_data) <- seq(length=nrow(aggregated_data))

	## clean up the grouping cols, so we don't have duplicates anymore
	aggregated_data$Activity <- NULL
	aggregated_data$Subject <- NULL
	colnames(aggregated_data)[1] <- "Activity"
	colnames(aggregated_data)[2] <- "Subject"

	## write the data out to a txt file
	write.table(aggregated_data, file="tidy_data.txt")	
}
