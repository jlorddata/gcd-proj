gcd-proj
========

I chose to use the dplyr package for the bulk of the data reshaping in this project. I chose this approach over data.table for two reasons. One, I find dplyr a lot more intutitive and am more comfortable using it than data.table. And, two, I think that the syntactic clarity of dplyr is a huge advantage over data.table when you are trying to walk someone else through your work. I have avoided using dplyr chaining so that the process is easier to follow for those unfamiliar with the package. 

###Getting the data

For transparency, this is how I got and extracted the data. The file is simply downloaded and then extracted using the utils library. There is some abiguity in the project instructions about whether the 'data' refers to the extracted or archived files so I have commented these lines out but left them in the submitted script so that the process is clear. 
```
#download the dataset
#dataURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(dataURL, "Dataset.zip", mode="wb")

#unzip the downloaded file and change into new directory
#library(utils)
#unzip("Dataset.zip")
```

###Reading in the data

The first thing we need to do is read in the data. This involves traversing the directory structure created during the unzipping process, which I chose to do by simply changing the working directory. We need to specify `sep = ""` and `header = FALSE` or we will end up with the incorrect number of elements in the resulting dataframes.
```
setwd(paste(getwd(),"\\UCI HAR Dataset", sep=""))
#read in activity labels and features
activity_labels<-read.table("activity_labels.txt", sep = "", header = FALSE, stringsAsFactors=FALSE)
features<-read.table("features.txt", sep="", header=FALSE, stringsAsFactors=FALSE)

#change into test directory and read in the data
setwd(paste(getwd(),"\\test",sep=""))
y_test<-read.table("y_test.txt", sep="", header=FALSE)
x_test<-read.table("X_test.txt", sep= "", header=FALSE)
subject_test<-read.table("subject_test.txt", sep="", header=FALSE)

#change into train directory and read in the data
setwd("..")
setwd(paste(getwd(),"\\train",sep=""))
y_train<-read.table("y_train.txt", sep="", header=FALSE)
x_train<-read.table("X_train.txt", sep="", header= FALSE)
subject_train<-read.table("subject_train.txt", sep="", header=FALSE)
```

###Meaningful column names
We can now give meaningful column names to the data in our `x_test` and `x_train` dataframe as preparation for filtering the dataset with dplyr. These correspond to the measurements taken, or derived, in the original experiment. The names of these measurements were read into `features` and so we can simply attach these as the column names of of `x_test` and `x_train`. However, before doing so we need to remove some duplicate names read in from the original measurement names file. These will cause errors in the dplyr analysis if they are not removed, which is why we call `make.unique()` here. These duplicate columns are eventually discarded as they do not measure mean or standard deviation.     
```
#meaningful column names
colnames(x_test)<-make.unique(features[,2])
colnames(x_train)<-make.unique(features[,2])
```

###Creation of unified dataset with dplyr
Creation of the unified dataset is a two-stage process and, with dplyr, the syntax is simple. First we create new columns for both the training and test dataframes, `x_train` and `x_test`, that link the test subject and the activity code to the test data. These new columns are called subject and activity_label. We then use dplyr's `select(..., contains())` function to subset each dataframe so that we only get the columns that measure the mean and standard deviation of measurements. We use the pattern `contains("mean()")` to avoid also gathering up columns that contain the substring "mean" but are measuring something else. (I chose to exclude the meanFreq columns from the dataset because, based on the description in the original codebook, this is not a mean but a derived measure that happens to involve a mean.) The second stage of the process is to use dplyr's `rbind_list()` function to bind the test and training dataframes together.  
```
library(dplyr)

#add the subject and test labels to the data sets and select only the mean and sd columns
x_test$subject<-subject_test[,1]
x_test$activity_label<-y_test[,1]
x_test<-select(x_test, subject, activity_label, contains("mean()"), contains("std()"))

x_train$subject<-subject_train[,1]
x_train$activity_label<-y_train[,1]
x_train<-select(x_train, subject, activity_label, contains("mean()"), contains("std()"))

merged<-rbind_list(x_test, x_train)
```

###Add meaningful activity names
To add meaningful activity names, we convert the `merged$activty_label` column to a factor and then set its levels equal to the activity labels we read in from the original data set.  

```
#add meaningful activity names
merged$activity_label <- factor(merged$activity_label)
levels(merged$activity_label)<-activity_labels[,2]
```

###Making a summary data set
We can now make the summary data set using two dplyr commands: `group_by()` and `summarise_each()`. The `group_by()` command creates groups of data by subject and activity_label, and the `summarise_each` then applies the mean function to each group.  
```
#make our tidy data set of means
subject_group<-group_by(merged, subject, activity_label)
tidy_df<-summarise_each(subject_group, funs(mean))
```

###Tidying up column names
We now have the right data but can tidy up the column names by removing dashes and repeated strings using `gsub`.
```
col_n<-colnames(tidy_df)
new_cols<-gsub("\\(","",col_n)
new_cols<-gsub("\\)","",new_cols)
new_cols<-gsub("-", "_", new_cols)
#replace BodyBody with Body in columns names
new_cols<-gsub("BodyBody", "Body", new_cols)
library(data.table)
setnames(tidy_df, old = col_n, new = new_cols)
```

###Saving data
Finally we save the data.

```
#go back to original working directory and save output
setwd("..")
setwd("..")
write.table(tidy_df, file="project_out.txt", row.name=FALSE)
```

This saved file can be reloaded with `test<-read.table("project_out.txt", header=TRUE)`



