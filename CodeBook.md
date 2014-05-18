Getting and Cleaning Data: Course Project
========================================================

This is the CodeBook.md for the course project for the course, Getting and Cleaning Data, of the Data Science Specialization Track.

Author: Ma. Rowena C. Solamo

This is a partial requirement to the Getting and Cleaning Data Course in coursera.org dated May 5 - June 2, 2014 Session under the guidance of Prof. Jeff Leek, Johns Hopkins Bloomberg School of Public Health.

Course Project Purpose:
-----------------------

The purpose of the project is to demonstrate your ability to collect, work
with, and clean a data set.  The goal is to prepare tidy data that can be
used for later analysis.

You will be graded by your peers on a series of yes/no questions related to the project.  You are required to submit:

1. tidy data set
2. a link to your Github repository with your script for performing analysis
3. a code book, CodeBook.md, that describes the variables, the data, and any transformations or work that you performed to clean up the data
4. a README.md that explains the purpose of the repository and list the essential files of the course project


The Input:
----------
The input for the project came from data collected from the accelerometers from the Samsung Galaxy S smartphones.  The full description can be found: 
  
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data set can be downloaded from:

[Smartphone Data Sets](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


For more information about the input files, please read 'README.txt'.

### License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

The Transformation: run_analysis.R
----------------------------------

The **_run_analysis.R_** contains the R Code that transforms the input data to
the necessary output data.  It contains the **run_analysis()** function
which is the main function that calls the following functions:

1. **mergeDataSets()** function which merges the training and the test sets to create one data set.
2. **extractMeanAndStd()** function which extracts only the measurements on the mean and standard deviation for each measurement. 
3. **renameActivities()** function which uses descriptive activity names to name the activities in the data set.
4. **renameColumnNames()** function which appropriately labels the column of the data set with descriptive features/variable names. 
5. **createSecondData()** function which creates a second, independent tidy data set which shows the average of each variable for each activity and each subject.
6. **writeToFile()** function that writes the second tidy data set into a file called './tidyDataSet.txt' with values separated by commas (",").

For more details of each function, check the run_analysis.R file.

Extract the data set in your current working directory.  It will produce a folder, named **_"UCI HAR Dataset"_**.  Ensure also that the **_run_analysis.R_** file is in the current working directory.

To run the code, simply type the following in the R console:

```
> source("run_analysis.R")
> run_analysis()
```

The Output:
-----------

The output of the course project is the tidy data stored in the './tidyDataSet.txt' file.
```r
tidydata <- read.csv("./tidyDataSet.txt")
```

The features/variables are as follows:
```r
str(tidydata)
```

```
## 'data.frame':	180 obs. of  81 variables:
##  $ activity                    : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ subject                     : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ tBodyAccmeanX               : num  0.222 0.281 0.276 0.264 0.278 ...
##  $ tBodyAccmeanY               : num  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...
##  $ tBodyAccmeanZ               : num  -0.113 -0.107 -0.101 -0.111 -0.108 ...
##  $ tGravityAccmeanX            : num  -0.249 -0.51 -0.242 -0.421 -0.483 ...
##  $ tGravityAccmeanY            : num  0.706 0.753 0.837 0.915 0.955 ...
##  $ tGravityAccmeanZ            : num  0.446 0.647 0.489 0.342 0.264 ...
##  $ tBodyAccJerkmeanX           : num  0.0811 0.0826 0.077 0.0934 0.0848 ...
##  $ tBodyAccJerkmeanY           : num  0.00384 0.01225 0.0138 0.00693 0.00747 ...
##  $ tBodyAccJerkmeanZ           : num  0.01083 -0.0018 -0.00436 -0.00641 -0.00304 ...
##  $ tBodyGyromeanX              : num  -0.01655 -0.01848 -0.02082 -0.00923 -0.02189 ...
##  $ tBodyGyromeanY              : num  -0.0645 -0.1118 -0.0719 -0.093 -0.0799 ...
##  $ tBodyGyromeanZ              : num  0.149 0.145 0.138 0.17 0.16 ...
##  $ tBodyGyroJerkmeanX          : num  -0.107 -0.102 -0.1 -0.105 -0.102 ...
##  $ tBodyGyroJerkmeanY          : num  -0.0415 -0.0359 -0.039 -0.0381 -0.0404 ...
##  $ tBodyGyroJerkmeanZ          : num  -0.0741 -0.0702 -0.0687 -0.0712 -0.0708 ...
##  $ tBodyAccMagmean             : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...
##  $ tGravityAccMagmean          : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...
##  $ tBodyAccJerkMagmean         : num  -0.954 -0.988 -0.979 -0.97 -0.98 ...
##  $ tBodyGyroMagmean            : num  -0.875 -0.95 -0.952 -0.93 -0.947 ...
##  $ tBodyGyroJerkMagmean        : num  -0.963 -0.992 -0.987 -0.985 -0.986 ...
##  $ fBodyAccmeanX               : num  -0.939 -0.977 -0.981 -0.959 -0.969 ...
##  $ fBodyAccmeanY               : num  -0.867 -0.98 -0.961 -0.939 -0.965 ...
##  $ fBodyAccmeanZ               : num  -0.883 -0.984 -0.968 -0.968 -0.977 ...
##  $ fBodyAccmeanFreqX           : num  -0.159 -0.146 -0.074 -0.274 -0.136 ...
##  $ fBodyAccmeanFreqY           : num  0.0975 0.2573 0.2385 0.3662 0.4665 ...
##  $ fBodyAccmeanFreqZ           : num  0.0894 0.4025 0.217 0.2013 0.1323 ...
##  $ fBodyAccJerkmeanX           : num  -0.957 -0.986 -0.981 -0.979 -0.983 ...
##  $ fBodyAccJerkmeanY           : num  -0.922 -0.983 -0.969 -0.944 -0.965 ...
##  $ fBodyAccJerkmeanZ           : num  -0.948 -0.986 -0.979 -0.975 -0.983 ...
##  $ fBodyAccJerkmeanFreqX       : num  0.132 0.16 0.176 0.182 0.24 ...
##  $ fBodyAccJerkmeanFreqY       : num  0.0245 0.1212 -0.0132 0.0987 0.1957 ...
##  $ fBodyAccJerkmeanFreqZ       : num  0.0244 0.1906 0.0448 0.077 0.0917 ...
##  $ fBodyGyromeanX              : num  -0.85 -0.986 -0.97 -0.967 -0.976 ...
##  $ fBodyGyromeanY              : num  -0.952 -0.983 -0.978 -0.972 -0.978 ...
##  $ fBodyGyromeanZ              : num  -0.909 -0.963 -0.962 -0.961 -0.963 ...
##  $ fBodyGyromeanFreqX          : num  -0.00355 0.10261 -0.08222 -0.06609 -0.02272 ...
##  $ fBodyGyromeanFreqY          : num  -0.0915 0.0423 -0.0267 -0.5269 0.0681 ...
##  $ fBodyGyromeanFreqZ          : num  0.0105 0.0553 0.1477 0.1529 0.0414 ...
##  $ fBodyAccMagmean             : num  -0.862 -0.975 -0.966 -0.939 -0.962 ...
##  $ fBodyAccMagmeanFreq         : num  0.0864 0.2663 0.237 0.2417 0.292 ...
##  $ fBodyBodyAccJerkMagmean     : num  -0.933 -0.985 -0.976 -0.962 -0.977 ...
##  $ fBodyBodyAccJerkMagmeanFreq : num  0.266 0.342 0.239 0.274 0.197 ...
##  $ fBodyBodyGyroMagmean        : num  -0.862 -0.972 -0.965 -0.962 -0.968 ...
##  $ fBodyBodyGyroMagmeanFreq    : num  -0.1398 0.0186 -0.0229 -0.2599 0.1024 ...
##  $ fBodyBodyGyroJerkMagmean    : num  -0.942 -0.99 -0.984 -0.984 -0.985 ...
##  $ fBodyBodyGyroJerkMagmeanFreq: num  0.1765 0.2648 0.1107 0.2029 0.0247 ...
##  $ tBodyAccstdX                : num  -0.928 -0.974 -0.983 -0.954 -0.966 ...
##  $ tBodyAccstdY                : num  -0.837 -0.98 -0.962 -0.942 -0.969 ...
##  $ tBodyAccstdZ                : num  -0.826 -0.984 -0.964 -0.963 -0.969 ...
##  $ tGravityAccstdX             : num  -0.897 -0.959 -0.983 -0.921 -0.946 ...
##  $ tGravityAccstdY             : num  -0.908 -0.988 -0.981 -0.97 -0.986 ...
##  $ tGravityAccstdZ             : num  -0.852 -0.984 -0.965 -0.976 -0.977 ...
##  $ tBodyAccJerkstdX            : num  -0.958 -0.986 -0.981 -0.978 -0.983 ...
##  $ tBodyAccJerkstdY            : num  -0.924 -0.983 -0.969 -0.942 -0.965 ...
##  $ tBodyAccJerkstdZ            : num  -0.955 -0.988 -0.982 -0.979 -0.985 ...
##  $ tBodyGyrostdX               : num  -0.874 -0.988 -0.975 -0.973 -0.979 ...
##  $ tBodyGyrostdY               : num  -0.951 -0.982 -0.977 -0.961 -0.977 ...
##  $ tBodyGyrostdZ               : num  -0.908 -0.96 -0.964 -0.962 -0.961 ...
##  $ tBodyGyroJerkstdX           : num  -0.919 -0.993 -0.98 -0.975 -0.983 ...
##  $ tBodyGyroJerkstdY           : num  -0.968 -0.99 -0.987 -0.987 -0.984 ...
##  $ tBodyGyroJerkstdZ           : num  -0.958 -0.988 -0.983 -0.984 -0.99 ...
##  $ tBodyAccMagstd              : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...
##  $ tGravityAccMagstd           : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...
##  $ tBodyAccJerkMagstd          : num  -0.928 -0.986 -0.976 -0.961 -0.977 ...
##  $ tBodyGyroMagstd             : num  -0.819 -0.961 -0.954 -0.947 -0.958 ...
##  $ tBodyGyroJerkMagstd         : num  -0.936 -0.99 -0.983 -0.983 -0.984 ...
##  $ fBodyAccstdX                : num  -0.924 -0.973 -0.984 -0.952 -0.965 ...
##  $ fBodyAccstdY                : num  -0.834 -0.981 -0.964 -0.946 -0.973 ...
##  $ fBodyAccstdZ                : num  -0.813 -0.985 -0.963 -0.962 -0.966 ...
##  $ fBodyAccJerkstdX            : num  -0.964 -0.987 -0.983 -0.98 -0.986 ...
##  $ fBodyAccJerkstdY            : num  -0.932 -0.985 -0.971 -0.944 -0.966 ...
##  $ fBodyAccJerkstdZ            : num  -0.961 -0.989 -0.984 -0.98 -0.986 ...
##  $ fBodyGyrostdX               : num  -0.882 -0.989 -0.976 -0.975 -0.981 ...
##  $ fBodyGyrostdY               : num  -0.951 -0.982 -0.977 -0.956 -0.977 ...
##  $ fBodyGyrostdZ               : num  -0.917 -0.963 -0.967 -0.966 -0.963 ...
##  $ fBodyAccMagstd              : num  -0.798 -0.975 -0.968 -0.937 -0.963 ...
##  $ fBodyBodyAccJerkMagstd      : num  -0.922 -0.985 -0.975 -0.958 -0.976 ...
##  $ fBodyBodyGyroMagstd         : num  -0.824 -0.961 -0.955 -0.947 -0.959 ...
##  $ fBodyBodyGyroJerkMagstd     : num  -0.933 -0.989 -0.983 -0.983 -0.983 ...
```

The summary of this data set are as follows:
```r
summary(tidydata)
```

```
##                activity     subject     tBodyAccmeanX   tBodyAccmeanY     
##  LAYING            :30   Min.   : 1.0   Min.   :0.222   Min.   :-0.04051  
##  SITTING           :30   1st Qu.: 8.0   1st Qu.:0.271   1st Qu.:-0.02002  
##  STANDING          :30   Median :15.5   Median :0.277   Median :-0.01726  
##  WALKING           :30   Mean   :15.5   Mean   :0.274   Mean   :-0.01788  
##  WALKING_DOWNSTAIRS:30   3rd Qu.:23.0   3rd Qu.:0.280   3rd Qu.:-0.01494  
##  WALKING_UPSTAIRS  :30   Max.   :30.0   Max.   :0.301   Max.   :-0.00131  
##  tBodyAccmeanZ     tGravityAccmeanX tGravityAccmeanY  tGravityAccmeanZ 
##  Min.   :-0.1525   Min.   :-0.680   Min.   :-0.4799   Min.   :-0.4951  
##  1st Qu.:-0.1121   1st Qu.: 0.838   1st Qu.:-0.2332   1st Qu.:-0.1173  
##  Median :-0.1082   Median : 0.921   Median :-0.1278   Median : 0.0238  
##  Mean   :-0.1092   Mean   : 0.698   Mean   :-0.0162   Mean   : 0.0741  
##  3rd Qu.:-0.1044   3rd Qu.: 0.943   3rd Qu.: 0.0877   3rd Qu.: 0.1495  
##  Max.   :-0.0754   Max.   : 0.975   Max.   : 0.9566   Max.   : 0.9579  
##  tBodyAccJerkmeanX tBodyAccJerkmeanY  tBodyAccJerkmeanZ  tBodyGyromeanX   
##  Min.   :0.0427    Min.   :-0.03869   Min.   :-0.06746   Min.   :-0.2058  
##  1st Qu.:0.0740    1st Qu.: 0.00047   1st Qu.:-0.01060   1st Qu.:-0.0471  
##  Median :0.0764    Median : 0.00947   Median :-0.00386   Median :-0.0287  
##  Mean   :0.0795    Mean   : 0.00757   Mean   :-0.00495   Mean   :-0.0324  
##  3rd Qu.:0.0833    3rd Qu.: 0.01340   3rd Qu.: 0.00196   3rd Qu.:-0.0168  
##  Max.   :0.1302    Max.   : 0.05682   Max.   : 0.03805   Max.   : 0.1927  
##  tBodyGyromeanY    tBodyGyromeanZ    tBodyGyroJerkmeanX tBodyGyroJerkmeanY
##  Min.   :-0.2042   Min.   :-0.0725   Min.   :-0.1572    Min.   :-0.0768   
##  1st Qu.:-0.0896   1st Qu.: 0.0747   1st Qu.:-0.1032    1st Qu.:-0.0455   
##  Median :-0.0732   Median : 0.0851   Median :-0.0987    Median :-0.0411   
##  Mean   :-0.0743   Mean   : 0.0874   Mean   :-0.0961    Mean   :-0.0427   
##  3rd Qu.:-0.0611   3rd Qu.: 0.1018   3rd Qu.:-0.0911    3rd Qu.:-0.0384   
##  Max.   : 0.0275   Max.   : 0.1791   Max.   :-0.0221    Max.   :-0.0132   
##  tBodyGyroJerkmeanZ tBodyAccMagmean   tGravityAccMagmean
##  Min.   :-0.09250   Min.   :-0.9865   Min.   :-0.9865   
##  1st Qu.:-0.06172   1st Qu.:-0.9573   1st Qu.:-0.9573   
##  Median :-0.05343   Median :-0.4829   Median :-0.4829   
##  Mean   :-0.05480   Mean   :-0.4973   Mean   :-0.4973   
##  3rd Qu.:-0.04898   3rd Qu.:-0.0919   3rd Qu.:-0.0919   
##  Max.   :-0.00694   Max.   : 0.6446   Max.   : 0.6446   
##  tBodyAccJerkMagmean tBodyGyroMagmean tBodyGyroJerkMagmean
##  Min.   :-0.993      Min.   :-0.981   Min.   :-0.9973     
##  1st Qu.:-0.981      1st Qu.:-0.946   1st Qu.:-0.9852     
##  Median :-0.817      Median :-0.655   Median :-0.8648     
##  Mean   :-0.608      Mean   :-0.565   Mean   :-0.7364     
##  3rd Qu.:-0.246      3rd Qu.:-0.216   3rd Qu.:-0.5119     
##  Max.   : 0.434      Max.   : 0.418   Max.   : 0.0876     
##  fBodyAccmeanX    fBodyAccmeanY     fBodyAccmeanZ    fBodyAccmeanFreqX
##  Min.   :-0.995   Min.   :-0.9890   Min.   :-0.990   Min.   :-0.636   
##  1st Qu.:-0.979   1st Qu.:-0.9536   1st Qu.:-0.962   1st Qu.:-0.392   
##  Median :-0.769   Median :-0.5950   Median :-0.724   Median :-0.257   
##  Mean   :-0.576   Mean   :-0.4887   Mean   :-0.630   Mean   :-0.232   
##  3rd Qu.:-0.217   3rd Qu.:-0.0634   3rd Qu.:-0.318   3rd Qu.:-0.061   
##  Max.   : 0.537   Max.   : 0.5242   Max.   : 0.281   Max.   : 0.159   
##  fBodyAccmeanFreqY fBodyAccmeanFreqZ fBodyAccJerkmeanX fBodyAccJerkmeanY
##  Min.   :-0.3795   Min.   :-0.5201   Min.   :-0.995    Min.   :-0.989   
##  1st Qu.:-0.0813   1st Qu.:-0.0363   1st Qu.:-0.983    1st Qu.:-0.973   
##  Median : 0.0079   Median : 0.0658   Median :-0.813    Median :-0.782   
##  Mean   : 0.0115   Mean   : 0.0437   Mean   :-0.614    Mean   :-0.588   
##  3rd Qu.: 0.0863   3rd Qu.: 0.1754   3rd Qu.:-0.282    3rd Qu.:-0.196   
##  Max.   : 0.4665   Max.   : 0.4025   Max.   : 0.474    Max.   : 0.277   
##  fBodyAccJerkmeanZ fBodyAccJerkmeanFreqX fBodyAccJerkmeanFreqY
##  Min.   :-0.992    Min.   :-0.5760       Min.   :-0.6020      
##  1st Qu.:-0.980    1st Qu.:-0.2897       1st Qu.:-0.3975      
##  Median :-0.871    Median :-0.0609       Median :-0.2321      
##  Mean   :-0.714    Mean   :-0.0691       Mean   :-0.2281      
##  3rd Qu.:-0.470    3rd Qu.: 0.1766       3rd Qu.:-0.0472      
##  Max.   : 0.158    Max.   : 0.3314       Max.   : 0.1957      
##  fBodyAccJerkmeanFreqZ fBodyGyromeanX   fBodyGyromeanY   fBodyGyromeanZ  
##  Min.   :-0.6276       Min.   :-0.993   Min.   :-0.994   Min.   :-0.986  
##  1st Qu.:-0.3087       1st Qu.:-0.970   1st Qu.:-0.970   1st Qu.:-0.962  
##  Median :-0.0919       Median :-0.730   Median :-0.814   Median :-0.791  
##  Mean   :-0.1376       Mean   :-0.637   Mean   :-0.677   Mean   :-0.604  
##  3rd Qu.: 0.0386       3rd Qu.:-0.339   3rd Qu.:-0.446   3rd Qu.:-0.264  
##  Max.   : 0.2301       Max.   : 0.475   Max.   : 0.329   Max.   : 0.492  
##  fBodyGyromeanFreqX fBodyGyromeanFreqY fBodyGyromeanFreqZ fBodyAccMagmean 
##  Min.   :-0.3958    Min.   :-0.6668    Min.   :-0.5075    Min.   :-0.987  
##  1st Qu.:-0.2134    1st Qu.:-0.2943    1st Qu.:-0.1548    1st Qu.:-0.956  
##  Median :-0.1155    Median :-0.1579    Median :-0.0508    Median :-0.670  
##  Mean   :-0.1046    Mean   :-0.1674    Mean   :-0.0572    Mean   :-0.536  
##  3rd Qu.: 0.0027    3rd Qu.:-0.0427    3rd Qu.: 0.0415    3rd Qu.:-0.162  
##  Max.   : 0.2492    Max.   : 0.2731    Max.   : 0.3771    Max.   : 0.587  
##  fBodyAccMagmeanFreq fBodyBodyAccJerkMagmean fBodyBodyAccJerkMagmeanFreq
##  Min.   :-0.3123     Min.   :-0.994          Min.   :-0.1252            
##  1st Qu.:-0.0147     1st Qu.:-0.977          1st Qu.: 0.0453            
##  Median : 0.0813     Median :-0.794          Median : 0.1720            
##  Mean   : 0.0761     Mean   :-0.576          Mean   : 0.1625            
##  3rd Qu.: 0.1744     3rd Qu.:-0.187          3rd Qu.: 0.2759            
##  Max.   : 0.4358     Max.   : 0.538          Max.   : 0.4881            
##  fBodyBodyGyroMagmean fBodyBodyGyroMagmeanFreq fBodyBodyGyroJerkMagmean
##  Min.   :-0.987       Min.   :-0.4566          Min.   :-0.998          
##  1st Qu.:-0.962       1st Qu.:-0.1695          1st Qu.:-0.981          
##  Median :-0.766       Median :-0.0535          Median :-0.878          
##  Mean   :-0.667       Mean   :-0.0360          Mean   :-0.756          
##  3rd Qu.:-0.409       3rd Qu.: 0.0823          3rd Qu.:-0.583          
##  Max.   : 0.204       Max.   : 0.4095          Max.   : 0.147          
##  fBodyBodyGyroJerkMagmeanFreq  tBodyAccstdX     tBodyAccstdY    
##  Min.   :-0.1829              Min.   :-0.996   Min.   :-0.9902  
##  1st Qu.: 0.0542              1st Qu.:-0.980   1st Qu.:-0.9421  
##  Median : 0.1116              Median :-0.753   Median :-0.5090  
##  Mean   : 0.1259              Mean   :-0.558   Mean   :-0.4605  
##  3rd Qu.: 0.2081              3rd Qu.:-0.198   3rd Qu.:-0.0308  
##  Max.   : 0.4263              Max.   : 0.627   Max.   : 0.6169  
##   tBodyAccstdZ    tGravityAccstdX  tGravityAccstdY  tGravityAccstdZ 
##  Min.   :-0.988   Min.   :-0.997   Min.   :-0.994   Min.   :-0.991  
##  1st Qu.:-0.950   1st Qu.:-0.983   1st Qu.:-0.971   1st Qu.:-0.961  
##  Median :-0.652   Median :-0.970   Median :-0.959   Median :-0.945  
##  Mean   :-0.576   Mean   :-0.964   Mean   :-0.952   Mean   :-0.936  
##  3rd Qu.:-0.231   3rd Qu.:-0.951   3rd Qu.:-0.937   3rd Qu.:-0.918  
##  Max.   : 0.609   Max.   :-0.830   Max.   :-0.644   Max.   :-0.610  
##  tBodyAccJerkstdX tBodyAccJerkstdY tBodyAccJerkstdZ tBodyGyrostdX   
##  Min.   :-0.995   Min.   :-0.990   Min.   :-0.993   Min.   :-0.994  
##  1st Qu.:-0.983   1st Qu.:-0.972   1st Qu.:-0.983   1st Qu.:-0.974  
##  Median :-0.810   Median :-0.776   Median :-0.884   Median :-0.789  
##  Mean   :-0.595   Mean   :-0.565   Mean   :-0.736   Mean   :-0.692  
##  3rd Qu.:-0.223   3rd Qu.:-0.148   3rd Qu.:-0.512   3rd Qu.:-0.441  
##  Max.   : 0.544   Max.   : 0.355   Max.   : 0.031   Max.   : 0.268  
##  tBodyGyrostdY    tBodyGyrostdZ    tBodyGyroJerkstdX tBodyGyroJerkstdY
##  Min.   :-0.994   Min.   :-0.986   Min.   :-0.997    Min.   :-0.997   
##  1st Qu.:-0.963   1st Qu.:-0.961   1st Qu.:-0.980    1st Qu.:-0.983   
##  Median :-0.802   Median :-0.801   Median :-0.840    Median :-0.894   
##  Mean   :-0.653   Mean   :-0.616   Mean   :-0.704    Mean   :-0.764   
##  3rd Qu.:-0.420   3rd Qu.:-0.311   3rd Qu.:-0.463    3rd Qu.:-0.586   
##  Max.   : 0.476   Max.   : 0.565   Max.   : 0.179    Max.   : 0.296   
##  tBodyGyroJerkstdZ tBodyAccMagstd   tGravityAccMagstd tBodyAccJerkMagstd
##  Min.   :-0.995    Min.   :-0.987   Min.   :-0.987    Min.   :-0.995    
##  1st Qu.:-0.985    1st Qu.:-0.943   1st Qu.:-0.943    1st Qu.:-0.977    
##  Median :-0.861    Median :-0.607   Median :-0.607    Median :-0.801    
##  Mean   :-0.710    Mean   :-0.544   Mean   :-0.544    Mean   :-0.584    
##  3rd Qu.:-0.474    3rd Qu.:-0.209   3rd Qu.:-0.209    3rd Qu.:-0.217    
##  Max.   : 0.193    Max.   : 0.428   Max.   : 0.428    Max.   : 0.451    
##  tBodyGyroMagstd  tBodyGyroJerkMagstd  fBodyAccstdX     fBodyAccstdY    
##  Min.   :-0.981   Min.   :-0.998      Min.   :-0.997   Min.   :-0.9907  
##  1st Qu.:-0.948   1st Qu.:-0.981      1st Qu.:-0.982   1st Qu.:-0.9404  
##  Median :-0.742   Median :-0.881      Median :-0.747   Median :-0.5134  
##  Mean   :-0.630   Mean   :-0.755      Mean   :-0.552   Mean   :-0.4815  
##  3rd Qu.:-0.360   3rd Qu.:-0.577      3rd Qu.:-0.197   3rd Qu.:-0.0791  
##  Max.   : 0.300   Max.   : 0.250      Max.   : 0.658   Max.   : 0.5602  
##   fBodyAccstdZ    fBodyAccJerkstdX fBodyAccJerkstdY fBodyAccJerkstdZ 
##  Min.   :-0.987   Min.   :-0.995   Min.   :-0.991   Min.   :-0.9931  
##  1st Qu.:-0.946   1st Qu.:-0.985   1st Qu.:-0.974   1st Qu.:-0.9837  
##  Median :-0.644   Median :-0.825   Median :-0.785   Median :-0.8951  
##  Mean   :-0.582   Mean   :-0.612   Mean   :-0.571   Mean   :-0.7565  
##  3rd Qu.:-0.266   3rd Qu.:-0.247   3rd Qu.:-0.169   3rd Qu.:-0.5438  
##  Max.   : 0.687   Max.   : 0.477   Max.   : 0.350   Max.   :-0.0062  
##  fBodyGyrostdX    fBodyGyrostdY    fBodyGyrostdZ    fBodyAccMagstd  
##  Min.   :-0.995   Min.   :-0.994   Min.   :-0.987   Min.   :-0.988  
##  1st Qu.:-0.975   1st Qu.:-0.960   1st Qu.:-0.964   1st Qu.:-0.945  
##  Median :-0.809   Median :-0.796   Median :-0.822   Median :-0.651  
##  Mean   :-0.711   Mean   :-0.645   Mean   :-0.658   Mean   :-0.621  
##  3rd Qu.:-0.481   3rd Qu.:-0.415   3rd Qu.:-0.392   3rd Qu.:-0.365  
##  Max.   : 0.197   Max.   : 0.646   Max.   : 0.522   Max.   : 0.179  
##  fBodyBodyAccJerkMagstd fBodyBodyGyroMagstd fBodyBodyGyroJerkMagstd
##  Min.   :-0.994         Min.   :-0.982      Min.   :-0.998         
##  1st Qu.:-0.975         1st Qu.:-0.949      1st Qu.:-0.980         
##  Median :-0.813         Median :-0.773      Median :-0.894         
##  Mean   :-0.599         Mean   :-0.672      Mean   :-0.771         
##  3rd Qu.:-0.267         3rd Qu.:-0.428      3rd Qu.:-0.608         
##  Max.   : 0.316         Max.   : 0.237      Max.   : 0.288
```


