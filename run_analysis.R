#Task:
#Here are the data for the project: 
  #https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#You should create one R script called run_analysis.R that does the following. 
  #1Merges the training and the test sets to create one data set.
  #2Extracts only the measurements on the mean and standard deviation for each measurement. 
  #3Uses descriptive activity names to name the activities in the data set
  #4Appropriately labels the data set with descriptive variable names. 
  #5From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

        #Here are the data for the project: 
        #https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
        
        #You should create one R script called run_analysis.R that does the following. 
        #1Merges the training and the test sets to create one data set.
        #2Extracts only the measurements on the mean and standard deviation for each measurement. 
        #3Uses descriptive activity names to name the activities in the data set
        #4Appropriately labels the data set with descriptive variable names. 
        #5From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Obtaining data (We need 7 files below is what I used to read into my environment. Just uncomment and go) 
#Define working directory variables:
        wd <- "C:/Temp/rprogclass/data_clean/data/"
        dest1 <- paste(wd,"uci_dataset/test/subject_test.txt" , sep = "")
        dest2 <- paste(wd,"uci_dataset/test/y_test.txt" , sep = "")
        dest3 <- paste(wd,"uci_dataset/test/X_test.txt", sep = "")
        dest4 <- paste(wd,"uci_dataset/train/subject_train.txt", sep = "")
        dest5 <- paste(wd,"uci_dataset/train/y_train.txt", sep = "")
        dest6 <- paste(wd,"uci_dataset/train/x_train.txt", sep = "")
        dest7 <- paste(wd,"uci_dataset/features.txt", sep= "" )
        activ_test <- read.table(file=dest1)
        y_test_data <- read.table(file=dest2)
        x_test_data <- read.table(file=dest3)
        activ_train <- read.table(file=dest4)
        y_train_data <- read.table(file=dest5)
        x_train_data <- read.table(file=dest6)
        col_headers <- read.table(file=dest7)
        
#Merge rows of the training onto the test subjects
#Merge rows of the training activity onto test activity
      pr_dt2 <- rbind(y_train_data,y_test_data)
      pr_dt1 <- rbind(activ_train,activ_test)
#Now we want to read and apply a meaninful name to activity to each activity for train and test
# CODEX: 1 WALKING  2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING      
      pr_dt3 <- ifelse(
        pr_dt2[,1] == 1,"WALKING",ifelse(
          pr_dt2[,1] == 2, "WALKING_UPSTAIRS",ifelse(
            pr_dt2[,1] == 3, "WALKING_DOWNSTAIRS",ifelse(
              pr_dt2[,1] == 4,"SITTING",ifelse(
                pr_dt2[,1] == 5,"STANDING",ifelse(
                  pr_dt2[,1] == 6,"LAYING",NA))))))
#Now we combine the subject,activity, activity name together in preparation of combining it to actual data.      
      pre_col <- cbind(pr_dt1,pr_dt2,pr_dt3)
      colnames(pre_col) <- c("subject","activity","activity_name")
#apply meaningful col.names to x(train,test) data. This comes from features.txt. We only need only c2 from features.txt.
      colnames(x_train_data) <- col_headers[,2]
      colnames(x_test_data)<- col_headers[,2]
#Merges training data and test data.
      tot_data <- rbind(x_train_data,x_test_data)
#Merges the  subject&activity to the train and test data.
      nice_raw_data <- cbind(pre_col,tot_data)
#Make the column names non-duplicated and friendly for select(contain())
      unique_col_names <- make.names(names=names(nice_raw_data),unique=T,allow_=T)
      colnames(nice_raw_data) <- unique_col_names
# At this point: data(train,test) are merged. Subjct, and activity are attached as well.Column names are meaninful.
# Now we need to simplify the data set pulling out only means and standard deviations (and also subject and activity)      
# We store it in "result"
      library(dplyr)
      result <- nice_raw_data %>%
        select(subject,activity_name,contains("mean"),contains("std")) %>%
        arrange(subject,activity_name) %>%
        group_by(subject,activity_name) %>%
        summarise_each(funs(mean)) %>%
        print
      
      write.table(result,file="c:/Temp/rprogclass/data_clean/result.txt",sep="\t")

