# Code Book
## Description
This code book describes the data found in the tidy.txt

## Source Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws


## Data Transformations Performed

The data from the following files were merged: 

- 'train/subject_train.txt'
- 'train/X_train.txt'
- 'train/y_train.txt'.
- 'test/subject_test.txt'
- 'test/X_test.txt'
- 'test/y_test.txt'

The Activity Data originally in numbers were replaced with its corresonding label found in the following file: 
 
- 'activity_labels.txt'

Only the variables with mean() and std() were taken and the rest were discarded.
The average for each variable for each subject and activity were calculated and is saved in the tidy.txt

## List of Variables 
The tidy.txt composed of 2 identifiers and 79 Variables.
### Identifiers
1. Subject (int) - Suibject ID
2. Activity (Factor w/ 6 levels) - Activity performed 

### Variables
The values for each row in the tiny.txt are the averages of the following variables for each subject and activity:

3. tBodyAcc-mean-X (num)
4. tBodyAcc-mean-Y (num)
5. tBodyAcc-mean-Z (num)
6. tBodyAcc-std-X  (num)
7. tBodyAcc-std-Y  (num)
8. tBodyAcc-std-Z  (num)
9. tGravityAcc-mean-X (num)
10. tGravityAcc-mean-Y (num)
11. tGravityAcc-mean-Z (num)
12. tGravityAcc-std-X (num)
13. tGravityAcc-std-Y (num)
14. tGravityAcc-std-Z (num)
15. tBodyAccJerk-mean-X (num)
16. tBodyAccJerk-mean-Y (num)
17. tBodyAccJerk-mean-Z (num)
18. tBodyAccJerk-std-X (num)
19. tBodyAccJerk-std-Y (num)
20. tBodyAccJerk-std-Z (num)
21. tBodyGyro-mean-X (num)
22. tBodyGyro-mean-Y (num)
23. tBodyGyro-mean-Z (num)
24. tBodyGyro-std-X (num)
25. tBodyGyro-std-Y (num)
26. tBodyGyro-std-Z (num)
27. tBodyGyroJerk-mean-X (num)
28. tBodyGyroJerk-mean-Y (num)
29. tBodyGyroJerk-mean-Z (num)
30. tBodyGyroJerk-std-X (num)
31. tBodyGyroJerk-std-Y (num)
32. tBodyGyroJerk-std-Z (num)
33. tBodyAccMag-mean (num)
34. tBodyAccMag-std (num)
35. tGravityAccMag-mean (num)
36. tGravityAccMag-std (num)
37. tBodyAccJerkMag-mean (num)
38. tBodyAccJerkMag-std (num)
39. tBodyGyroMag-mean (num)
40. tBodyGyroMag-std (num)
41. tBodyGyroJerkMag-mean (num)
42. tBodyGyroJerkMag-std (num)
43. fBodyAcc-mean-X (num)
44. fBodyAcc-mean-Y (num)
45. fBodyAcc-mean-Z (num)
46. fBodyAcc-std-X (num)
47. fBodyAcc-std-Y (num)
48. fBodyAcc-std-Z (num)
49. fBodyAcc-meanFreq-X (num)
50. fBodyAcc-meanFreq-Y (num)
51. fBodyAcc-meanFreq-Z (num)
52. fBodyAccJerk-mean-X (num)
53. fBodyAccJerk-mean-Y (num)
54. fBodyAccJerk-mean-Z (num)
55. fBodyAccJerk-std-X (num)
56. fBodyAccJerk-std-Y (num)
57. fBodyAccJerk-std-Z (num)
58. fBodyAccJerk-meanFreq-X (num)
59. fBodyAccJerk-meanFreq-Y (num)
60. fBodyAccJerk-meanFreq-Z (num)
61. fBodyGyro-mean-X (num)
62. fBodyGyro-mean-Y (num)
63. fBodyGyro-mean-Z (num)
64. fBodyGyro-std-X (num)
65. fBodyGyro-std-Y (num)
66. fBodyGyro-std-Z (num)
67. fBodyGyro-meanFreq-X (num)
68. fBodyGyro-meanFreq-Y (num)
69. fBodyGyro-meanFreq-Z (num)
70. fBodyAccMag-mean (num)
71. fBodyAccMag-std (num)
72. fBodyAccMag-meanFreq (num)
73. fBodyBodyAccJerkMag-mean (num)
74. fBodyBodyAccJerkMag-std (num)
75. fBodyBodyAccJerkMag-meanFreq (num)
76. fBodyBodyGyroMag-mean (num)
77. fBodyBodyGyroMag-std (num)
78. fBodyBodyGyroMag-meanFreq (num)
79. fBodyBodyGyroJerkMag-mean (num)
80. fBodyBodyGyroJerkMag-std (num)
81. fBodyBodyGyroJerkMag-meanFreq (num)


## Activity Factor
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

##License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.