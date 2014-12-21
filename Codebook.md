##Summary of Human Activity Recognition Using Smartphones Data Set Codebook



This dataset is a summary subset of a larger "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors".[[1]](#1)

Description of measurements adapted from features_info.txt in the original dataset:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Features are normalized and bounded within [-1,1].

In the summary dataset, the mean and standard deviation of each of these variables is presented for each subject and for each possible activity. Variables are created in the form **fBodyAcc_mean_X** and **fBodyAcc_std_X**. The full list of variables and data types is below.  

###Variables in the dataset

**subject** (integer)

An identifying integer (1-6) for the subject of the test.

**activity_label** (factor)

A factor variable identifying the possible activity states of the experiment particpants. The factor levels and labels are:
```
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
```

**fBodyAcc_mean_X** (numeric)

**fBodyAcc_mean_Y** (numeric)

**fBodyAcc_mean_Z** (numeric)

**fBodyAcc_std_X** (numeric)

**fBodyAcc_std_Y** (numeric)

**fBodyAcc_std_Z** (numeric)

**fBodyAccJerk_mean_X** (numeric)

**fBodyAccJerk_mean_Y** (numeric)

**fBodyAccJerk_mean_Z** (numeric)

**fBodyAccJerk_std_X** (numeric)

**fBodyAccJerk_std_Y** (numeric)

**fBodyAccJerk_std_Z** (numeric)

**fBodyAccJerkMag_mean** (numeric)

**fBodyAccJerkMag_std** (numeric)

**fBodyAccMag_mean** (numeric)

**fBodyAccMag_std** (numeric)

**fBodyGyro_mean_X** (numeric)

**fBodyGyro_mean_Y** (numeric)

**fBodyGyro_mean_Z** (numeric)

**fBodyGyro_std_X** (numeric)

**fBodyGyro_std_Y** (numeric)

**fBodyGyro_std_Z** (numeric)

**fBodyGyroJerkMag_mean** (numeric)

**fBodyGyroJerkMag_std** (numeric)

**fBodyGyroMag_mean** (numeric)

**fBodyGyroMag_std** (numeric)

**tBodyAcc_mean_X** (numeric)

**tBodyAcc_mean_Y** (numeric)

**tBodyAcc_mean_Z** (numeric)

**tBodyAcc_std_X** (numeric)

**tBodyAcc_std_Y** (numeric)

**tBodyAcc_std_Z** (numeric)

**tBodyAccJerk_mean_X** (numeric)

**tBodyAccJerk_mean_Y** (numeric)

**tBodyAccJerk_mean_Z** (numeric)

**tBodyAccJerk_std_X** (numeric)

**tBodyAccJerk_std_Y** (numeric)

**tBodyAccJerk_std_Z** (numeric)

**tBodyAccJerkMag_mean** (numeric)

**tBodyAccJerkMag_std** (numeric)

**tBodyAccMag_mean** (numeric)

**tBodyAccMag_std** (numeric)

**tBodyGyro_mean_X** (numeric)

**tBodyGyro_mean_Y** (numeric)

**tBodyGyro_mean_Z** (numeric)

**tBodyGyro_std_X** (numeric)

**tBodyGyro_std_Y** (numeric)

**tBodyGyro_std_Z** (numeric)

**tBodyGyroJerk_mean_X** (numeric)

**tBodyGyroJerk_mean_Y** (numeric)

**tBodyGyroJerk_mean_Z** (numeric)

**tBodyGyroJerk_std_X** (numeric)

**tBodyGyroJerk_std_Y** (numeric)

**tBodyGyroJerk_std_Z** (numeric)

**tBodyGyroJerkMag_mean** (numeric)

**tBodyGyroJerkMag_std** (numeric)

**tBodyGyroMag_mean** (numeric)

**tBodyGyroMag_std** (numeric)

**tGravityAcc_mean_X** (numeric)

**tGravityAcc_mean_Y** (numeric)

**tGravityAcc_mean_Z** (numeric)

**tGravityAcc_std_X** (numeric)

**tGravityAcc_std_Y** (numeric)

**tGravityAcc_std_Z** (numeric)

**tGravityAccMag_mean** (numeric)

**tGravityAccMag_std** (numeric)

###References

<a name="1"></a>

[1] Description from the original dataset abstract at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 