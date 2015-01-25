<p><markdown>
#Markdown Live Editor#
Getting and Cleaning Data
================================
Course Project 2015
================================

This is the R script (run_analysis.R) for the Week 3 project in Getting and Cleaning Data Course. 

As a prerequisite you will need the **plyr** and **dplyr** packages installed for data manipulation.
If needed install using;

 - `install.packages("dplyr")` 
   
 - `install.packages("plyr")`

You will also need the UCI HAR Dataset, extracted to your working directory.

 - Download this from [here][1]

This script performs the following
##Aims

 1. Merges the training and the test sets to create one data set
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Steps
When executed the **run_analysis.r** script performs the following steps;

 1. Load Data & Features
 2. Assign column names
 3. Extract the Mean and Standard Deviation
 4. Load Subject and Activity Labels
 5. Convert Reference files
 6. Add Activity Labels as a new column
 7. Add subject information as a new column
 8. rename Columns
 9. Combine Training and Testing data into one table
 10. Grouping data by Subject and then Activity
 11. Write to "Means.txt" file

  [1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
</markdown></p>
