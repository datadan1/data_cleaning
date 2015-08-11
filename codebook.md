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

  1. Download and unzip data from link store in ..../data/ 
  2. set wd = "C:/..../data/"
  3. Run run_analysis.r which does the following:
    1. binds active_train onto active_test (These are the human subjects doing the activities)
    2. binds y_train_data onto y_test_data (These are the activities they do)
    3. combines those two into 1 data frame.
    4. add a meaninful description to the y_test_data which is a description of the activity being down by each test subject. Here it is important to note that only spaces and characters were removed. The lab's descriptions were kept to presever the integrity of what they were measuring
    5. bind x_train_data onto x_test_data (These are the results of the activities done by the human subjects)
    6. assignns meaninful headers from features.txt.
    7. pulls out 86 of the 561 columns relating to mean and standard deviation.
    8. arrange,groups, and finds the average (using the mean() function) on those 86 columns and subtotals.
    9. Output to a txt file for exporting.
  
  
  
#variable information.  
The 88 columns in the files are included below (a more complete description of what these headers means comes from the feature.info.txt file included after the 88 files.)

     1.                           subject : The human who did the activity.
     2.                          activity : The activity performed by the human
     3.                     tBodyAccmeanX
     4.                     tBodyAccmeanY
     5.                     tBodyAccmeanZ
     6.                  tGravityAccmeanX
     7.                  tGravityAccmeanY
     8.                  tGravityAccmeanZ
     9.                 tBodyAccJerkmeanX
     10.                 tBodyAccJerkmeanY
     11.                 tBodyAccJerkmeanZ
     12.                    tBodyGyromeanX
     13.                    tBodyGyromeanY
     14.                    tBodyGyromeanZ
     15.                tBodyGyroJerkmeanX
     16.                tBodyGyroJerkmeanY
     17.                tBodyGyroJerkmeanZ
     18.                   tBodyAccMagmean
     19.                tGravityAccMagmean
     20.               tBodyAccJerkMagmean
     21.                  tBodyGyroMagmean
     22.              tBodyGyroJerkMagmean
     23.                     fBodyAccmeanX
     24.                     fBodyAccmeanY
     25.                     fBodyAccmeanZ
     26.                 fBodyAccmeanFreqX
     27.                 fBodyAccmeanFreqY
     28.                 fBodyAccmeanFreqZ
     29.                 fBodyAccJerkmeanX
     30.                 fBodyAccJerkmeanY
     31.                 fBodyAccJerkmeanZ
     32.             fBodyAccJerkmeanFreqX
     33.             fBodyAccJerkmeanFreqY
     34.             fBodyAccJerkmeanFreqZ
     35.                    fBodyGyromeanX
     36.                    fBodyGyromeanY
     37.                    fBodyGyromeanZ
     38.                fBodyGyromeanFreqX
     39.                fBodyGyromeanFreqY
     40.                fBodyGyromeanFreqZ
     41.                   fBodyAccMagmean
     42.               fBodyAccMagmeanFreq
     43.           fBodyBodyAccJerkMagmean
     44.       fBodyBodyAccJerkMagmeanFreq
     45.              fBodyBodyGyroMagmean
     46.          fBodyBodyGyroMagmeanFreq
     47.          fBodyBodyGyroJerkMagmean
     48.      fBodyBodyGyroJerkMagmeanFreq
     49.          angletBodyAccMeangravity
     50.  angletBodyAccJerkMeangravityMean
     51.     angletBodyGyroMeangravityMean
     52. angletBodyGyroJerkMeangravityMean
     53.                 angleXgravityMean
     54.                 angleYgravityMean
     55.                 angleZgravityMean
     56.                      tBodyAccstdX
     57.                      tBodyAccstdY
     58.                      tBodyAccstdZ
     59.                   tGravityAccstdX
     60.                   tGravityAccstdY
     61.                   tGravityAccstdZ
     62.                  tBodyAccJerkstdX
     63.                  tBodyAccJerkstdY
     64.                  tBodyAccJerkstdZ
     65.                     tBodyGyrostdX
     66.                     tBodyGyrostdY
     67.                     tBodyGyrostdZ
     68.                 tBodyGyroJerkstdX
     69.                 tBodyGyroJerkstdY
     70.                 tBodyGyroJerkstdZ
     71.                    tBodyAccMagstd
     72.                 tGravityAccMagstd
     73.                tBodyAccJerkMagstd
     74.                   tBodyGyroMagstd
     75.               tBodyGyroJerkMagstd
     76.                      fBodyAccstdX
     77.                      fBodyAccstdY
     78.                      fBodyAccstdZ
     79.                  fBodyAccJerkstdX
     80.                  fBodyAccJerkstdY
     81.                  fBodyAccJerkstdZ
     82.                     fBodyGyrostdX
     83.                     fBodyGyrostdY
     84.                     fBodyGyrostdZ
     85.                    fBodyAccMagstd
     86.            fBodyBodyAccJerkMagstd
     87.               fBodyBodyGyroMagstd
     88.           fBodyBodyGyroJerkMagstd

#Feature Selection 
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