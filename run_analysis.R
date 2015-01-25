# run_analysis.r
#You should create one R script called run_analysis.R that does the following. 
    #1. Merges the training and the test sets to create one data set.
    #2. Extracts only the measurements on the mean and standard deviation 
    #   for each measurement. 
    #3. Uses descriptive activity names to name the activities in the data set
    #4. Appropriately labels the data set with descriptive variable names. 
    #5. From the data set in step 4, 
        #creates a second, independent tidy data set 
        #with the average of each variable for each activity and each subject.

##Loading Data##

	Train = read.table("./UCI HAR Dataset/train/X_train.txt") 
	Test = read.table("./UCI HAR Dataset/test/X_test.txt")

#Loading Features (to assign Column Names)
	Features = read.table("./UCI HAR Dataset/features.txt", header = FALSE)
	FeaturesNames <- Features[,2]
#Assigning column names to Test and Train using Features
	colnames(Train) = FeaturesNames
	colnames(Test) = FeaturesNames

#SubsettingData
#Extracts only the measurements on the mean and standard deviation for each measurement.
	Train_mean_std <- Train[, grep("mean[[:punct:]]|std[[:punct:]]",names(Train))]
	Test_mean_std <- Test[, grep("mean[[:punct:]]|std[[:punct:]]",names(Test))]

#Loading Subject and Activity Labels
	TrainingSubjectLabels = read.table("./UCI HAR Dataset/train/subject_train.txt")
	TestSubjectLabels = read.table("./UCI HAR Dataset/test/subject_test.txt")
	TrainActivityLabel = read.table("./UCI HAR Dataset/train/y_train.txt") 
	TestActivityLabel = read.table("./UCI HAR Dataset/test/y_test.txt")

#Converting Reference files
	library(plyr)
	TrainActivityRELabel <- mapvalues(TrainActivityLabel$V1, c(1,2,3,4,5,6), c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                                "SITTING","STANDING","LAYING"))
	TestActivityRELabel <- mapvalues(TestActivityLabel$V1, c(1,2,3,4,5,6), c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                                                                           "SITTING","STANDING","LAYING"))
##Adding Activity Labels as a new column
	Train_mean_std = cbind(TrainActivityRELabel,Train_mean_std)
	Test_mean_std  = cbind(TestActivityRELabel,Test_mean_std)

#Adding subject information as a new column
	Train_mean_std<-cbind(as.integer(TrainingSubjectLabels$"V1"),Train_mean_std)
	Test_mean_std<-cbind(as.integer(TestSubjectLabels$"V1"),Test_mean_std) 

#renaming columns
	colnames(Train_mean_std)[1:2] <- c("Subject","Activity")
	colnames(Test_mean_std)[1:2] <- c("Subject","Activity")

##Combine Training and Testing data into one table##
	JoinedData = as.data.frame(rbind(Train_mean_std,Test_mean_std))
 
#Grouping data by Subject and then Activity
	library(dplyr)
	Means <- JoinedData %>%
        arrange(Subject,Activity)%>%
        group_by(Subject,Activity)%>%
        summarise_each(funs(mean))
	Means
	write.table(Means, file = "Means.txt", row.names = FALSE)
#Please upload the tidy data set created in step 5 of the instructions. 
#Please upload your data set as a txt file created with write.table() using row.name=FALSE 


