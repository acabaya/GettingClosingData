## Getting and Cleaning Course Project

# Background
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
    
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Purpose:
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 


Here are the data for the project:
    
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# Data Explanation

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
<ul>
<li>tBodyAcc-XYZ</li>
<li>tGravityAcc-XYZ</li>
<li>tBodyAccJerk-XYZ</li>
<li>tBodyGyro-XYZ</li>
<li>tBodyGyroJerk-XYZ</li>
<li>tBodyAccMag</li>
<li>tGravityAccMag</li>
<li>tBodyAccJerkMag</li>
<li>tBodyGyroMag</li>
<li>tBodyGyroJerkMag</li>
<li>fBodyAcc-XYZ</li>
<li>fBodyAccJerk-XYZ</li>
<li>fBodyGyro-XYZ</li>
<li>fBodyAccMag</li>
<li>fBodyAccJerkMag</li>
<li>fBodyGyroMag</li>
<li>fBodyGyroJerkMag</li>
</ul>
The set of variables that were estimated from these signals are: 

<ul>
<li>mean(): Mean value</li>
<li>std(): Standard deviation</li>
<li>mad(): Median absolute deviation</li> 
<li>max(): Largest value in array</li>
<li>min(): Smallest value in array</li>
<li>sma(): Signal magnitude area</li>
<li>energy(): Energy measure. Sum of the squares divided by the number of values.</li> 
<li>iqr(): Interquartile range</li> 
<li>entropy(): Signal entropy</li>
<li>arCoeff(): Autorregresion coefficients with Burg order equal to 4</li>
<li>correlation(): correlation coefficient between two signals</li>
<li>maxInds(): index of the frequency component with largest magnitude</li>
<li>meanFreq(): Weighted average of the frequency components to obtain a mean frequency</li>
<li>skewness(): skewness of the frequency domain signal</li> 
<li>kurtosis(): kurtosis of the frequency domain signal</li>
<li>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.</li>
<li>angle(): Angle between to vectors.</li>
</ul>
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
<ul>
<li>gravityMean</li>
<li>tBodyAccMean</li>
<li>tBodyAccJerkMean</li>
<li>tBodyGyroMean</li>
<li>tBodyGyroJerkMean</li>
</iul>

The complete list of variables of each feature vector is available in 'features.txt'


# Script Overview

The script called run_analysis.R peforms the following:

0. Downloads the data the data from the URL provided above and extracts to the working directory set in the ‘dirData’
1. Merge the training and the test sets to create one data set.
	1.1 subject_train.txt, Y_train.txt and X_train.txt found in the train folder are loaded to tables and are merged by column.
	1.2 subject_test.txt, Y_test.txt and X_test.txt found in the test folder are loaded to tables and are merged by column.
	1.3 both of the data tables are then merged by row.

2. Extract only the measurements on the mean and standard deviation for each measurement.
	2.1 Load the column names from the features.txt included in the data set 
	2.2 Determine Required Columns with strings “mean()” or “std()” included in their names 
	2.3 Remove unnecessary columns from the Total data frame


3. Use descriptive activity names to name the activities in the data set
	3.1 Load the activity labels from the data set activity_labels.txt
	3.2 Replace the Activity Factors with the corresponding labels.

4. Appropriately labels the data set with descriptive variable names.
	4.1 Remove "()" from the original column names
	4.2 Replace original variable labels with the new one below

5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
	5.1 Melt the Data Set with the Subject and Activity as ID
	5.2 Recast with the mean calculated for each group
	5.3 Save the result to tidy.txt in the declared working directory “dirResults”
