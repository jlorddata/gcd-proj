#download the dataset
#dataURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(dataURL, "Dataset.zip", mode="wb")

#unzip the downloaded file and change into new directory
library(utils)
unzip("Dataset.zip")
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


#meaningful column names
colnames(x_test)<-make.unique(features[,2])
colnames(x_train)<-make.unique(features[,2])

library(dplyr)

#add the subject and test labels to the data sets and select only the mean and sd columns
x_test$subject<-subject_test[,1]
x_test$activity_label<-y_test[,1]
x_test<-select(x_test, subject, activity_label, contains("mean()"), contains("std()"))

x_train$subject<-subject_train[,1]
x_train$activity_label<-y_train[,1]
x_train<-select(x_train, subject, activity_label, contains("mean()"), contains("std()"))

#merge into one dataset
merged<-rbind_list(x_test, x_train)

#add meaningful activity names
merged$activity_label <- factor(merged$activity_label)
levels(merged$activity_label)<-activity_labels[,2]

#make our tidy data set of means
subject_group<-group_by(merged, subject, activity_label)
tidy_df<-summarise_each(subject_group, funs(mean))

#remove illegal characters from column names
col_n<-colnames(tidy_df)
new_cols<-gsub("\\(","",col_n)
new_cols<-gsub("\\)","",new_cols)
new_cols<-gsub("-", "_", new_cols)
#replace BodyBody with Body in columns names
new_cols<-gsub("BodyBody", "Body", new_cols)

library(data.table)
setnames(tidy_df, old = col_n, new = new_cols)

#go back to original working directory and save output
setwd("..")
setwd("..")
write.table(tidy_df, file="project_out.txt", row.name=FALSE)
