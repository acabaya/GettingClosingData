# _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# _/                                                                          _/
# _/ Peer Graded Project for Getting and Cleaning Data Course                 _/
# _/ by acabaya                                                               _/
# _/ July 2, 2017                                                             _/
# _/ Written on RStudio Ver. 1.0.143                                          _/
# _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

# clear the enmvironment
rm(list=ls())

# Load needed library
library(reshape2)
# reshape2 package version 1.4.2

#
# 0.00 Download the File if stil not exists in the working directory
#

# 0.01 Set the working directory
dirData <- "."     #R defaul
dirResults <- "."  #R defaul

urlData <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI_HAR_DATASET.zip"


# 0.02 Check is zip file was downloaded elese download from given URL
setwd(dirData)
if (!file.exists(zipFile)) {
    download.file(urlData, zipFile, method="curl")
}

# 0.03 Check if zip file was "unzipped" else perform unzip
if (!file.exists("UCI HAR Dataset")) { 
    unzip(zipFile) 
}



# 
# 1.00 Merge the training and the test sets to create one data set.     
# 


# 1.01 Load the 'train' data set
Subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
Activity <- read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE)
XData <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)

# 1.02 Bind all columns from train folder
Train <- cbind(Subject, Activity, XData)

# 1.03 Load the 'test' data set
Subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
Activity <- read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE)
XData <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)

# 1.04 Bind all columns from test folder
Test <- cbind(Subject, Activity, XData)

# 1.05 Bind Train and Test
Total <- rbind(Train, Test)

# 1.06 Cleanup the environment of unnecessary data!
rm(Activity, Subject, XData, Test, Train)



#
# 2.00 Extract only the measurements on the mean and standard deviation
#      for each measurement.                                              
# 

# 2.01 Load the features from the data set
features <- read.table("UCI HAR Dataset/features.txt")

# 2.02 Determine Required Columns with mean() or std()
reqdCol <- grep(".*mean.*|.*std.*", features[,2], invert = FALSE)

# 2.03 Offset by 2 column count due to "Subject" and "Activity"
reqdCol <- reqdCol + 2

# 2.04 Remove unnecessary columns from the Total data frame
Total <- subset(Total, select = c(1,2, reqdCol))



# 
# 3.00 Use descriptive activity names to name the activities in the
#      data set
#

# 3.01 Load the activity labels from the data set
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")


# 3.02 Replace the Activity No with the corresponding Activity Label
Total[,2] <- factor(Total[,2], levels = actLabels[,1], labels = actLabels[,2])



#
# 4.00 Appropriately labels the data set with descriptive variable names.
#

# 4.01 remove "()" from the original column names
reqdCol <- reqdCol - 2
VarNames <- gsub('[()]', '', features[reqdCol,2])

# 4.02 replace original variable labels with the new one below
colnames(Total) <- c("Subject", "Activity", VarNames)



# 
# 5.00 From the data set in step 4, create a second, independent
#      tidy data set with the average of each variable for each activity
#      and each subject.
#

# 5.01 Melt the Data Set with the Subject and Activity as ID
melted <- melt(Total, id = c("Subject", "Activity")) 

# 5.02 Recast with the mean calculated for each varialbe
meanTotal <- dcast(melted, Subject + Activity ~ variable, mean)

# 5.03 result is saved in tidy.txt
setwd(dirResults)
write.table(meanTotal, "tidy.txt", row.names = FALSE, quote = FALSE)


# Clean-up Environment! 

rm(list=ls())
