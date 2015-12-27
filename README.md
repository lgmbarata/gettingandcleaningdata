# Getting and Cleaning Data Course Project
Repository created for sharing the source codes of the Getting and Cleaning Data course.

The *run_analysis.R* script reads the signal names, test/training raw data and subject IDs from text files then merges all data into one data frame called *dfAll*. A descriptive naming is applied for activities by substituing the IDs on the data frame with their respective activity name. Factors are set for all columns in the data frame then a intermediate data frame *dfIntermediate* is created with only standard deviation and mean valirables from the raw complete data frame. The final data frame *dfSummarized* is created from the intermediate through grouping the data into subject, activity and signal and calculation of the mean of its values.

For the script to run correctly all files must be stored within the working directory of the R session.

## Code Book

1. Subject
  - Represents the number ID of the subject which generated the raw data for the tests and training analysis.
2. Activity
  - A descriptive text that labels the activity of the subject when the raw data measurement was taken.
  - It can assume the values:
    - **WALKING**:            subject was walking during measurements.
    - **WALKING_UPSTAIRS**:   subject was walking upstairs during measurements.
    - **WALKING_DOWNSTAIRS**: subject was walking downstairs during measurements.
    - **SITTING**:            subject was sitting during measurements.
    - **STANDING**:           subject was standing still during measurements.
    - **LAYING**:             subject was laying down during measurements.
3. Signal
  - The signals come from the accelerometer and gyroscope 3-axial raw signals of smartphone devices. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of these signals (note the 'f' to indicate frequency domain signals).
  - It can assume the values:
    - **fBodyAcc**:               frequency domain (FFT) of the body linear acceleration signal.
    - **fBodyAccJerk**            frequency domain (FFT) of the body linear acceleration signal derived in time.
    - **fBodyAccMag**             magnitude on frequency domain (FFT) of the bode linear acceleration.
    - **fBodyBodyAccJerkMag**     magnitude on frequency domain (FFT) of the body linear acceleration signal derived in time.
    - **fBodyBodyGyroJerkMag**    magnitude on frequency domain (FFT) of the body gyroscopic acceleration signal derived in time.
    - **fBodyBodyGyroMag**        magnitude on frequency domain (FFT) of the body gyroscopic acceleration signal.
    - **fBodyGyro**               frequency domain (FFT) of the body gyroscopic acceleration signal.
    - **tBodyAcc**                time domain of the body linear acceleration signal.
    - **tBodyAccJerk**            time domain of the body linear acceleration derived signal.
    - **tBodyAccJerkMag**         magnitude on time domain of the body linear acceleration derived signal.
    - **tBodyAccMag**             magnitude on time domain of the body linear acceleration signal.
    - **tBodyGyro**               time domain of the body gyroscopic acceleration signal.
    - **tBodyGyroJerk**           time domain of the body gyroscopic acceleration derived signal.
    - **tBodyGyroJerkMag**        magnitude on time domain of the body gyroscopic acceleration derived signal.
    - **tBodyGyroMag**            magnitude on time domain of the body gyroscopic acceleration signal.
    - **tGravityAcc**             time domain of the calculated gravity signal.
    - **tGravityAccMag**          magnitude on time domain of the calculated gravity signal.
4. Average
 - The calculated average from the raw test and training data for each subject, activity and signal.
