## Coursera Programming Assignment - "Getting and Cleaning the Data" 
## This is executed after loading and unzipping the files into R data directory
##
## SET UP Environment
## Load the Data Table and dplyr Library
library(data.table)
library(dplyr)
## Set the directory 
setwd("~/Desktop/R/Data/UCI HAR Dataset")
##
## STEP 1
## Read the Test Files
{
    body_acc_test_x <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
    body_acc_test_y <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
    body_acc_test_z <- read.table("./test/Inertial Signals/body_acc_z_test.txt")
    body_gyro_test_x <- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
    body_gyro_test_y <- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
    body_gyro_test_z <- read.table("./test/Inertial Signals/body_gyro_z_test.txt")
    total_acc_test_x <- read.table("./test/Inertial Signals/total_acc_x_test.txt")
    total_acc_test_y <- read.table("./test/Inertial Signals/total_acc_y_test.txt")
    total_acc_test_z <- read.table("./test/Inertial Signals/total_acc_z_test.txt")
    ## Read the results and the activity files for test
    X_test <- read.table("./test/X_test.txt")
    colnames(X_test) <- c(1:561)
    y_test <- read.table("./test/y_test.txt")
    ## Read the subject Data
    subject_test <- read.table("./test/subject_test.txt")
    ## Merge all Data into one data frame
    test_data <- data.frame(subject_test,y_test,body_acc_test_x,body_acc_test_y,body_acc_test_z,body_gyro_test_x,body_gyro_test_y,body_gyro_test_z,X_test)
    colnames(test_data)[1:2] <- c("Subject", "Activity")
}
## Now do the same for training data
{
    body_acc_train_x <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
    body_acc_train_y <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
    body_acc_train_z <- read.table("./train/Inertial Signals/body_acc_z_train.txt")
    body_gyro_train_x <- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
    body_gyro_train_y <- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
    body_gyro_train_z <- read.table("./train/Inertial Signals/body_gyro_z_train.txt")
    total_acc_train_x <- read.table("./train/Inertial Signals/total_acc_x_train.txt")
    total_acc_train_y <- read.table("./train/Inertial Signals/total_acc_y_train.txt")
    total_acc_train_z <- read.table("./train/Inertial Signals/total_acc_z_train.txt")
    ## Read the results and the activity files for test
    X_train <- read.table("./train/X_train.txt")
    colnames(X_train) <- c(1:561)
    y_train <- read.table("./train/y_train.txt")
    ## Read the subject Data
    subject_train <- read.table("./train/subject_train.txt")
    ## Merge all Data into one data frame
    train_data <- data.frame(subject_train,y_train,body_acc_train_x,body_acc_train_y,body_acc_train_z,body_gyro_train_x,body_gyro_train_y,body_gyro_train_z,X_train)
    colnames(train_data)[1:2] <- c("Subject", "Activity")
}
## 
## STEP 2
## Now merge both Data Sets
##
    merged_data <-merge(test_data, train_data, all = TRUE)
##
## STEP 3
## Extract only the measurements on the mean and standard deviation for each measurement. 
## Subset all data except Subject, Activity and X Columns
## The columns for Mean and Standard Devaition are given in features.txt
## For example columns 1 to 6 of X, give tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X, tBodyAcc-std()-Y
## tBodyAcc-std()-Z
extracted_data <- select(merged_data, Subject, Activity, X1:X6, X41:X46, X81:X86, X121:X126, X161:X166, X201:X202, X214:X215, X227:X228, X240:X241, X253:X254, X266:X271, X345:X350, X424:X429, X503:X504, X516:X517, X529:X530, X542:X543, X555:X561)
##
## STEP 4
##
## Rename Activities to meaningful names as in activity_lables.txt
# 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LYING
#

## STEP 5
## Now rename the results to meaningful names, as specified in features.txt
##
##
extracted_data <- rename(extracted_data, tBodyAcc_mean_X=X1, tBodyAcc_mean_Y=X2, tBodyAcc_mean_Z=X3, tBodyAcc_std_X=X4, tBodyAcc_std_Y=X5, tBodyAcc_std_Z=X6,
                         tGravityAcc_mean_X=X41, tGravityAcc_mean_Y=X42, tGravityAcc_mean_Z=X43, tGravityAcc_std_X=X44, tGravityAcc_std_Y=X45, tGravityAcc_std_Z=X46,
                         tBodyAccJerk_mean_X=X81, tBodyAccJerk_mean_Y=X82, tBodyAcc_mean_Z=X83, tBodyAcc_std_X=X84, tBodyAcc_std_Y=X85, tBodyAcc_std_Z=X86, 
                         tBodyGyro_mean_X=X121, tBodyGyro_mean_Y=X122, tBodyGyro_mean_Z=X123, tBodyGyro_std_X=X124, tBodyGyro_std_Y=X125, tBodyGyro_std_Z=X126,
                         tBodyGyroJerk_mean_X=X161, tBodyGyroJerk_mean_Y=X162, tBodyGyroJerk_mean_Z=X163, tBodyGyroJerk_std_X=X164, tBodyGyroJerk_std_Y=X165, tBodyGyroJerk_std_Z=X166,
                         tBodyAccMag_mean=X201, tBodyAccMag_std=X202,
                         tGravityAccMag_mean=X214, tGravityAccMag_std=X215,
                         tBodyAccJerkMag_mean=X227, tBodyAccJerkMag_std=X228,
                         tBodyGyroMag_mean=X240, tBodyGyroMag_std=X241,
                         tBodyGyroJerkMag_mean=X253, tBodyGyroJerkMag_std=X254,
                         fBodyAcc_mean_X=X266, fBodyAcc_mean_Y=X267, fBodyAcc_mean_Z=X268, fBodyAcc_std_X=X269, fBodyAcc_std_Y=X270, fBodyAcc_std_Z=X271,
                         fBodyAccJerk_mean_X=X345, fBodyAccJerk_mean_Y=X346, fBodyAcc_mean_Z=X347, fBodyAcc_std_X=X348, fBodyAcc_std_Y=X349, fBodyAcc_std_Z=X350,
                         fBodyGyro_mean_X=X424, fBodyGyro_mean_Y=X425, fBodyGyro_mean_Z=X426, fBodyGyro_std_X=X427, fBodyGyro_std_Y=X428, fBodyGyro_std_Z=X429,
                         fBodyGyroMag_mean=X503, fBodyGyroMag_std=X504,
                         fBodyGyroJerkMag_mean=X516, fBodyGyroJerkMag_std=X517,
                         fBodyGyroMag_mean=X529, fBodyGyroMag_std=X530,
                         Angle_tBodyAcc_mean_Gravity=X555, Angle_tBodyAccJerk_mean_Gravity=X556, 
                         Angle_tBodyGyro_mean_Gravity=X557, Angle_tBodyGyroJerk_mean_Gravity=X558, 
                         Angle_X_mean_Gravity=X559, Angle_Y_mean_Gravity=X560,Angle_X_mean_Gravity=X561)
##
## STEP 5
##


