## The 'run_analysis.R' contains a series of functions and R Codes that performs
## the following, as specified in the course project:
## 
## You should create one R script called run_analysis.R that does the following. 
##    1. Merges the training and the test sets to create one data set.
##    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##    3. Uses descriptive activity names to name the activities in the data set
##    4. Appropriately labels the data set with descriptive activity names. 
##    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
## Author: Ma. Rowena C. Solamo
##
## This is a partial requirement to the Getting and Cleaning Data Course in coursera.org
## dated May 5 - June 2, 2014 Session under the guidance of Prof. Jeff Leek,
## Johns Hopkins Bloomberg School of Public Health.
##
## The course is part of the Data Science Specialization found in coursera.org.

## 'The run_analysis()' is the main function that starts the cleaning of the
## data to make it tidy as specified by the requirements of the project.
run_analysis <- function() {
     print("1. Merging the training and test sets. The process takes time.")
     theDataSet <- mergeDataSets()
     
     print("2. Extracting only means and standard deviation for each variable.")
     theDataSet <- extractMeanAndStd(theDataSet)
     
     print("3. Renaming activity IDs to their appropriate activiy names.")
     theDataSet <- renameActivities(theDataSet)
     
     print("4. Renaming column names to their appropriate descriptive names.")
     theDataSet <- renameColumnNames(theDataSet)
     
     print("5. Creating a second tidy data set.")
     newTidyDataSet <- createSecondDataSet(theDataSet)
     
     print("6. Writing the tidy data set to a file")
     writeToFile(newTidyDataSet)
}

## The 'mergeDataSet()' function merges the training data set and test data set.
## The input files for the training data set are as follows:
##        1.  "./UCI HAR DataSet/train/subject_train.txt", which contains the list
##             list of subjects who are performed the activity during the training phase.
##        2.  "./UCI HAR DataSet/train/y_train.txt", which contains a list of activities
##             performed by the subject.
##        3.  "./UCI HAR DataSet/train/X_train.txt", which contains the 561 values for each
##             561 variables or features that were recorded during the performance of the
##             activity by the subject in the training phase.
## The input files for the test data set are as follows:
##        1.  "./UCI HAR DataSet/test/subject_test.txt", which contains the list
##             list of subjects who are performed the activity during the test phase.
##        2.  "./UCI HAR DataSet/test/y_test.txt", which contains a list of activities
##             performed by the subject.
##        3.  "./UCI HAR DataSet/test/X_test.txt", which contains the 561 values for each
##             561 variables or features that were recorded during the performance of the
##             activity by the subject in the test phase.
##
## For the training data sets, the columns for the activity done, subject and 
## training sets were combined.
## For the test data sets, the columns for the activity done, subject and
## test data sets were combined.
##
## Then, the rows of the training sets and test sets were combined to produced
## the merged data sets.
## 
## The function returns a data frame containing training and test data sets.
mergeDataSets <- function() {
     ## 1. For getting the training data set, the following are performed:
     ##   1.1 Read the subject list.
     participantList <- read.csv("./UCI HAR DataSet/train/subject_train.txt", sep=" ", header=FALSE)

     ##   1.2 Read the activities that subjects have performed.
     activityDone <- read.csv("./UCI HAR DataSet/train/y_train.txt", sep=" ", header=FALSE)
          
     ##   1.3 Read the training set that contains the 561 features/variables
     ##        recorded.
     theConnection <- file("./UCI HAR DataSet/train/X_train.txt", open="rt")
     tempSet <- vector()
     while (length(input <- readLines(theConnection, n=1000)) > 0 ){
          for (i in 1:length(input)){
               tempSet <- rbind(tempSet, input[i])
          } # end of for i
     } # end of while
     close(theConnection)
     trainingSet <- vector()
     for (i in 1:length(tempSet)){
          print(i)
          temp <- unlist(strsplit(tempSet[i], split = " "))
          temp <- temp[temp != ""]
          trainingSet <- rbind(trainingSet, as.double(temp))
     }

     ## 1.4 Combine the columns of the activityDone, participantList and
     ## training Set
     trainingSet <- cbind(activityDone, participantList, trainingSet)
     
     ## 2. For the test data set, the following are performed:
     ##   2.1 Read the subject list.
     participantList <- read.csv("./UCI HAR DataSet/test/subject_test.txt", sep=" ", header=FALSE)
     
     ##   2.2 Read the activities that subjects have performed
     activityDone <- read.csv("./UCI HAR DataSet/test/y_test.txt", sep=" ", header=FALSE)
     
     ##   2.3 Reading the test set that contains the features/variables
     ##        recorded.
     theConnection <- file("./UCI HAR DataSet/test/X_test.txt", open="rt")
     tempSet <- vector()
     while (length(input <- readLines(theConnection, n=1000)) > 0 ){
          for (i in 1:length(input)){
               tempSet <- rbind(tempSet, input[i])
          } # end of for i
     } # end of while
     close(theConnection)
     testSet <- vector()
     for (i in 1:length(tempSet)){
          print(i)
          temp <- unlist(strsplit(tempSet[i], split = " "))
          temp <- temp[temp != ""]
          testSet <- rbind(testSet, as.double(temp))
     }
     
     ## 2.4 Combine the columns of activityDone, participantList and test set
     testSet <- cbind(activityDone, participantList, testSet)
     
     ## 3.0 Combine the records of the trainingSet and TestSet
     theDataSet <- rbind(trainingSet, testSet)
}

## The 'extractMeanAndStd()' function extracts only the mean and standard
## deviation variables in the merged data set returned by the function
## mergedDataSet().  This data set, called 'theDataSet' is passed as input 
## to the function.
##
## The input file needed by this function is:
##   1. "./UCI HAR DataSet/features.txt", which contains the features/
##        variables.
##
## The function returns a data frame containing only the columns which are
## means and standard deviations.  The records/rows are sorted according to
## activity and subject.
extractMeanAndStd <- function(theDataSet) {
     
     ## 1.  Read first the features or variables.
     featureList <- read.csv("./UCI HAR DataSet/features.txt", sep=" ", header=FALSE)
     colnames(featureList) <- c("featureID", "desc")
     
     ## 2. Extract the features or variables for the mean and
     ##    standard deviation.
     meanList <- featureList[(grep("mean", featureList$desc)), ]
     stdList <- featureList[(grep("std", featureList$desc)), ]
     
     ## 3. Combined the feature list to contain only those for
     ##    the mean and standard deviation.
     featureList <- rbind(meanList,stdList)
     
     ## 4.  Reconstruct the data set to only include the activity, subject and
     ## all features or variables that are means and standard deviation.
     theDataSet <- cbind(theDataSet[,1], theDataSet[,2], theDataSet[, as.character(featureList$featureID)])
     ## 5.  Return the data set sorted according to activity and subject
     theDataSet <- theDataSet[order(theDataSet$"theDataSet[, 1]", theDataSet$"theDataSet[, 2]"), ]
}

## The 'renameActivities()' function replaces the activityID to the
## appropriate activity description.  There are six activities performed
## in the experiment, namely, 'LAYING', 'SITTING', 'STANDING', 'WALKING',
## 'WALKING_DOWNSTAIRS' and 'WALKING_UPSTAIRS'.  The input to this function
## is the data set returned by the extractMeanAndStd() function.
##
## The input file needed by this function is:
##   1. "./UCI HAR DataSet/activity_labels.txt", which contains the
##        description of the type of activities performed.
##
## The function returns a data frame with the activity description column
## added at the end.
renameActivities <- function(theDataSet) {
     ## 1. Read the activity labels.
     activityLabels <- read.csv("./UCI HAR DataSet/activity_labels.txt", sep=" ", header=FALSE)
     colnames(activityLabels) <- c("activityID", "desc")
     
     ## 2. Merge the data set with the activity labels.  Another column
     ##   will be added which contains the description of the activity.
     theDataSet <- merge(theDataSet, activityLabels, by.x="theDataSet[, 1]", by.y="activityID")
}

## The 'renameColumnNames()' function changes the name of the
## columns to a more descriptive names.  The input to this function
## is the data set returned by the renameActivities() function.
##
## The input file needed by this function is:
##   1. "./UCI HAR DataSet/feature.txt", which contains the
##        features/variables
##
## The function returns a data frame with descriptive column names.
renameColumnNames <-  function(theDataSet) {

     ## 1. Read the features or variables
     featureList <- read.csv("./UCI HAR DataSet/features.txt", sep=" ", header=FALSE)
     colnames(featureList) <- c("featureID", "desc")
     
     ## 2. Extract the features for the means and standard deviations.
     meanList <- featureList[(grep("mean", featureList$desc)), ]
     stdList <- featureList[(grep("std", featureList$desc)), ]
     
     ## 3. Combine the feature list to contain only those for
     ##   the mean and standard deviation.
     featureList <- rbind(meanList,stdList)

     ## 4. For each feature/variable, remove "-", "\\(" and "\\)" in
     ## the description, replace them with "".
     fnames <- vector()
     for(i in 1:length(featureList$desc)){
          temp <- gsub("-", "", featureList[i,"desc"])
          temp <- gsub("\\(", "", temp)
          temp <- gsub("\\)", "", temp)
          fnames <- c(fnames, temp)
     }
     
     ## 5. Generate the list of column names with the descriptive
     ##   feature names.
     columnNames <- c("activityID", "subject", fnames, "activity")
     
     ## 6. Set the column names.
     colnames(theDataSet) <- columnNames
     
     ## 7. Return the data.frame with new column names.
     theDataSet
}

## The createSecondDataSet() function creates the second tidy data set
## which shows the average of each feature/variable for each activity 
## and each subject.
##
## The input of the function is a data set returned by the renameColumnNames()
## function.
##
## The function returns a data frame which is tidy that shows
## the average of each feature/variable for each activity
## and subject.
createSecondDataSet <- function(theDataSet) {
     ## 1. Load the 'reshape2' library
     library(reshape2)
     ## 2. Melt the data set by identifying the ids.
     ##   The ids are activity and subject.
     meltedDataSet <- melt(theDataSet, id=c("activity", "subject","activityID"))
     ## 3. Cast the melted data set by activity and subject and compute the
     ##    mean for each feature/variable.  Return this data set.
     newTidyDataSet <- dcast(meltedDataSet, activity + subject ~ variable, mean)
}

## The writeToFile() function writes the data set returned by the
## createSecondDataSet() function to a file called 'tidyDataSet.txt'.  The
## columns values are separated by a comma ",".
writeToFile <- function(theDataSet){
     write.table(theDataSet, file="./tidyDataSet.txt", sep=",")
}