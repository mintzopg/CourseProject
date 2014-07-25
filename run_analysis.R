# Read the X_test and X_train datasets and assign them in Xtest and Xtrain variables respectively
# columns have no headers and ares separated by white spaces
X_test<-read.csv("./test/X_test.txt",header=FALSE,sep="")
X_train<-read.csv("./train/X_train.txt",header=FALSE,sep="")


# read the features file
features<-(read.csv("./features.txt",header=FALSE,sep="",stringsAsFactors=FALSE))[,2]

# REQUIREMENT (1): Merge the training and the test sets to create one data set
# ...the 2 datasets have the same dimensions as are a split of the original data, so we can use rbind to put them back together
if (ncol(X_test)==ncol(X_train)) { X_data<-rbind(X_test,X_train)}
# for convenice, we label here the dataset with the descriptive variable names
names(X_data)<-features
            
# REQUIREMENT (2): Extract only the measurements on the mean and standard deviation for each measurement
# get  the indices where "mean" is found in variable name, from features
indices_mean<-grep("mean",features,fixed=T)
# get the indices where "std" is found in variable name, from features
indices_std<-grep("std",features,fixed=T)
# equals to 79 columns;        length(indices_mean)+length(indices_std)
# subset the X_data dataframe to extract only the measurements on the mean and standard deviation for each measurement
X_data_mean_std<-X_data[c(indices_mean,indices_std)]

# REQUIREMENT (3): Use descriptive activity names to name the activities in the data set
# step a:  read the files "y_test.txt", "y_train.txt"  & "activity_labels" 
y_test<-readLines("./test/y_test.txt")
y_train<-readLines("./train/y_train.txt")
activity_labels<-read.csv("./activity_labels.txt",header=FALSE,sep="",stringsAsFactors=FALSE)
# step b: combine them into one as in X_data dataset in Q(1) e.g. (test+train)
activity<-as.numeric(c(y_test,y_train))  # column 1 contains int [1:6], and column 2 the corresponding activity description

# replace the 6 arithmetic values with the descriptions
for (i in 1:nrow(activity_labels))
{
    activity<-gsub(activity_labels[i,1],activity_labels[i,2],activity)
}
rm(i)
# put the activities vector as the 1st column in the X_data data.frame
X_data_mean_std<-cbind(activity,X_data_mean_std)

# REQUIREMENT (4): Appropriately label the data set with descriptive variable names
# already done under REQUIREMENT (1)

# REQUIREMENT (5): Create a second, independent tidy data set with the average of each variable for each activity and each subject
# step a: read the sujects data as found in files "subject_test.txt" & "subject_train,txt"
subject_test<-readLines("./test/subject_test.txt")
subject_train<-readLines("./train/subject_train.txt")
# step b: combine them into 1 in the order used so fat (test+train)
subject<-as.numeric(c(subject_test,subject_train))
# add it to X_data dataset
X_data_mean_std<-cbind(subject,X_data_mean_std)

# Group by  activity and subject
t<-aggregate(X_data_mean_std,by=list(Group.Activity=X_data_mean_std$activity,Group.Subject=X_data_mean_std$subject),FUN=mean)
# remove not needed columns to produce a tidy Dataset
tidyData<-t[,c(-3,-4)]; rm(t)

# write the new tidy data to file
write.table(tidyData, "../tidyData.txt",row.names=FALSE)

