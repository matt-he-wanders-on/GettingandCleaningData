# run_analysis.r
#Load Data & Features to assign column names

	Train = read.table("./UCI HAR Dataset/train/X_train.txt") 
	Test = read.table("./UCI HAR Dataset/test/X_test.txt")
	Features = read.table("./UCI HAR Dataset/features.txt", header = FALSE)
	FeaturesNames <- Features[,2]
	
#Assign column names to Test and Train
	colnames(Train) = FeaturesNames
	colnames(Test) = FeaturesNames

#Extract the Mean and Standard deviation 
	Train_mean_std <- Train[, grep("mean[[:punct:]]|std[[:punct:]]",names(Train))]
	Test_mean_std <- Test[, grep("mean[[:punct:]]|std[[:punct:]]",names(Test))]

#Load Subject and Activity Labels
	TrainingSubjectLabels = read.table("./UCI HAR Dataset/train/subject_train.txt")
	TestSubjectLabels = read.table("./UCI HAR Dataset/test/subject_test.txt")
	TrainActivityLabel = read.table("./UCI HAR Dataset/train/y_train.txt") 
	TestActivityLabel = read.table("./UCI HAR Dataset/test/y_test.txt")

#Convert Reference files
	library(plyr)
	TrainActivityRELabel <- mapvalues(TrainActivityLabel$V1, c(1,2,3,4,5,6), c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                                "SITTING","STANDING","LAYING"))
	TestActivityRELabel <- mapvalues(TestActivityLabel$V1, c(1,2,3,4,5,6), c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                                                                           "SITTING","STANDING","LAYING"))
#Add Activity Labels as a new column
	Train_mean_std = cbind(TrainActivityRELabel,Train_mean_std)
	Test_mean_std  = cbind(TestActivityRELabel,Test_mean_std)

#Add subject information as a new column
	Train_mean_std<-cbind(as.integer(TrainingSubjectLabels$"V1"),Train_mean_std)
	Test_mean_std<-cbind(as.integer(TestSubjectLabels$"V1"),Test_mean_std) 

#Rename columns as outlined
	colnames(Train_mean_std)[1:2] <- c("Subject","Activity")
	colnames(Test_mean_std)[1:2] <- c("Subject","Activity")

##Combine Training and Testing data into one table
	JoinedData = as.data.frame(rbind(Train_mean_std,Test_mean_std))
 
#Grouping data by Subject and then Activity
	library(dplyr)
	Means <- JoinedData %>%
        arrange(Subject,Activity)%>%
        group_by(Subject,Activity)%>%
        summarise_each(funs(mean))
	Means
	write.table(Means, file = "Means.txt", row.names = FALSE)
 


