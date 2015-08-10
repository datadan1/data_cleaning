---
title: "Codebook"
author: "datadan1"
date: "August 9, 2015"
output: html_document
---

Here are the data link for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The entire script is included in this REPO.  The script: run_analysis.r assumes all files from the link above are downloaded and unzipped in a directory "data" in your working directory.

****EDIT SCRIPT to set wd = to your working directory to the UCI dataset
If you downloaded and unzipped data to c:/temp/class/data/UCIDATAset....
then set wd = wd <- "C:/Temp/rprogclass/data_clean/data/"
It assumes windows format (sorry unix/linux/mac users....)

#Steps:

1) Download data from link store in ..../data/ 
2) set wd = "C:/..../data/"
3) Run run_analysis.r which does the following:
  a) binds active_train onto active_test (These are the human subjects doing the activities)
  b) binds y_train_data onto y_test_data (These are the activities they do)
  c) combines those two into 1 data frame.
  d) add a meaninful description to the y_test_data which is a description of the activity being down by each test subject.
  e) bind x_train_data onto x_test_data (These are the results of the activities done by the human subjects)
  f) assignns meaninful headers from features.txt.
  g) pulls out 86 of the 561 columns relating to mean and standard deviation.
  h) arrange,groups, and finds the average (using the mean() function) on those 86 columns and subtotals.
  i) Output to a txt file for exporting.
  
  
  
#variable information.  
The 88 columns in the files are included below (a more complete description of what these headers means comes from the feature.info.txt file included after the 88 files.)
1                               subject : The human subject who did the activity.
2                         activity_name : The activity they did.

3                     tBodyAcc.mean...X
4                     tBodyAcc.mean...Y
5                     tBodyAcc.mean...Z
6                  tGravityAcc.mean...X
7                  tGravityAcc.mean...Y
8                  tGravityAcc.mean...Z
9                 tBodyAccJerk.mean...X
10                tBodyAccJerk.mean...Y
11                tBodyAccJerk.mean...Z
12                   tBodyGyro.mean...X
13                   tBodyGyro.mean...Y
14                   tBodyGyro.mean...Z
15               tBodyGyroJerk.mean...X
16               tBodyGyroJerk.mean...Y
17               tBodyGyroJerk.mean...Z
18                   tBodyAccMag.mean..
19                tGravityAccMag.mean..
20               tBodyAccJerkMag.mean..
21                  tBodyGyroMag.mean..
22              tBodyGyroJerkMag.mean..
23                    fBodyAcc.mean...X
24                    fBodyAcc.mean...Y
25                    fBodyAcc.mean...Z
26                fBodyAcc.meanFreq...X
27                fBodyAcc.meanFreq...Y
28                fBodyAcc.meanFreq...Z
29                fBodyAccJerk.mean...X
30                fBodyAccJerk.mean...Y
31                fBodyAccJerk.mean...Z
32            fBodyAccJerk.meanFreq...X
33            fBodyAccJerk.meanFreq...Y
34            fBodyAccJerk.meanFreq...Z
35                   fBodyGyro.mean...X
36                   fBodyGyro.mean...Y
37                   fBodyGyro.mean...Z
38               fBodyGyro.meanFreq...X
39               fBodyGyro.meanFreq...Y
40               fBodyGyro.meanFreq...Z
41                   fBodyAccMag.mean..
42               fBodyAccMag.meanFreq..
43           fBodyBodyAccJerkMag.mean..
44       fBodyBodyAccJerkMag.meanFreq..
45              fBodyBodyGyroMag.mean..
46          fBodyBodyGyroMag.meanFreq..
47          fBodyBodyGyroJerkMag.mean..
48      fBodyBodyGyroJerkMag.meanFreq..
49          angle.tBodyAccMean.gravity.
50 angle.tBodyAccJerkMean..gravityMean.
51     angle.tBodyGyroMean.gravityMean.
52 angle.tBodyGyroJerkMean.gravityMean.
53                 angle.X.gravityMean.
54                 angle.Y.gravityMean.
55                 angle.Z.gravityMean.
56                     tBodyAcc.std...X
57                     tBodyAcc.std...Y
58                     tBodyAcc.std...Z
59                  tGravityAcc.std...X
60                  tGravityAcc.std...Y
61                  tGravityAcc.std...Z
62                 tBodyAccJerk.std...X
63                 tBodyAccJerk.std...Y
64                 tBodyAccJerk.std...Z
65                    tBodyGyro.std...X
66                    tBodyGyro.std...Y
67                    tBodyGyro.std...Z
68                tBodyGyroJerk.std...X
69                tBodyGyroJerk.std...Y
70                tBodyGyroJerk.std...Z
71                    tBodyAccMag.std..
72                 tGravityAccMag.std..
73                tBodyAccJerkMag.std..
74                   tBodyGyroMag.std..
75               tBodyGyroJerkMag.std..
76                     fBodyAcc.std...X
77                     fBodyAcc.std...Y
78                     fBodyAcc.std...Z
79                 fBodyAccJerk.std...X
80                 fBodyAccJerk.std...Y
81                 fBodyAccJerk.std...Z
82                    fBodyGyro.std...X
83                    fBodyGyro.std...Y
84                    fBodyGyro.std...Z
85                    fBodyAccMag.std..
86            fBodyBodyAccJerkMag.std..
87               fBodyBodyGyroMag.std..
88           fBodyBodyGyroJerkMag.std..

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean