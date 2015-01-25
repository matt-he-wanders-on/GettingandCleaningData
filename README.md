GettingandCleaningData
================================
Course Project 2015
================================

This is the R script (run_analysis.R) for the Week 3 project in Getting and Cleaning Data Course. 

This script follows the steps outlined in the project aims:
##Aims
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement
		Means and standard deviations were only included into this set 
		if the mean or standard was at the end of the variable name, 
		not with the first part of the variable name.
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, 
	creates a second, independent tidy data set with the 
	average of each variable for each activity and each subject.
	
The output file (Means.txt) contains means for each subject for each of the activities 
for each of the means and standard deviation variables of the full dataset 
(66 variables, with Subject and Activity as IDs). 

##Steps for the analysis
	*Loading Data
	*Loading Features (to assign Column Names)
	*Assigning column names to Test and Train using Features
	*SubsettingData
	*Loading Subject and Activity Labels
	*Converting Subject and Activity file format and information
	*Adding Activity Labels as a new column
	*Adding subject information as a new column
	*renaming Subject and Activity columns
	*Combine Training and Testing data into one table
	*Using dplyr:
	*arranged and grouped data by Subject and then Activity
	*summarised - resulting in a tidy set with the average of each variable (see codebook)
	for each activity by each subject 
	*write object 'means' out to a text file
