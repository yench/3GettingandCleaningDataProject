# This script aims to create a new dataset called second from the "Human Activity Recognition Using Smartphones Datasets".

# 1. Training data and test data are labeled with descriptive variable names, which are the names of the features.
# ---------------read and label training data---------------
## Read subject_train.txt into R and assign variable name "subject_id" to it 
subject_train=read.table("./train/subject_train.txt")
colnames(subject_train)="subject_id"

## Read y_train.txt into R and assign variable name "activity" to it 
y_train=read.csv("./train/y_train.txt",colClass="character",header=FALSE)
y_train[,1]=as.factor(y_train[,1])
colnames(y_train)="activity"

## Read X_train.txt data into R and add descriptive variable names from "features.txt"
X_train=read.table("./train/X_train.txt")
features=read.table("features.txt")
colnames(X_train)=features[,2]

## Combine subject_train,y_train, and X_train into one table called train
train=cbind(subject_train,y_train,X_train)

# ---------------read and label test data---------------
## Read subject_test.txt into R and assign variable name "subject_id" to it
subject_test=read.table("./test/subject_test.txt")
colnames(subject_test)="subject_id"

## Read y_test.txt into R and assign variable name "activity" to it 
y_test=read.csv("./test/y_test.txt",colClass="character",header=FALSE)
y_test[,1]=as.factor(y_test[,1])
colnames(y_test)="activity"

## Read X_test.txt data into R and add descriptive variable names from "features.txt"
X_test=read.table("./test/X_test.txt")
colnames(X_test)=features[,2]

## Combine subject_test,y_test, and X_test into one table called test
test=cbind(subject_test,y_test,X_test)

# 2. The training data and test data of the original dataset were merged to create one single data set
merged=rbind(train,test)

# 3. Only the measurements on the mean and standard deviation for each measurement were extracted.  
extracted=merged[,grep("subject|activity|mean|std",names(merged))]
## Here "subject" and "activity" is included as grep arguments like "mean" and "std", so that the subject_id and activity variables are kept.

## Load plyr and perform arrange() on extracted to order it according to subject_id and activity 
library(plyr)
arranged=arrange(extracted,subject_id,activity)

# 4. Descriptive activity names (`walking`, `walking_upstairs`, `walking_downstairs`, `sitting`, `standing`, `laying`) were used to replace the integer numbers used in the original dataset.
levels(arranged$activity)=c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")

# 5. A second, tidy dataset with the average of each variable for each activity and each subject is generated.
## Create a two-level factor from subject_id and activity
factor_subject=arranged[,1]
factor_activity=arranged[,2]
factor=interaction(factor_subject,factor_activity)

## Use for loop with tapply to create a second data set with the average of each variable for each activity and each subject.
col=3:81
second=vector()
for(i in col){ 
each_variable=tapply(arranged[,i],factor,mean)
second=cbind(second,each_variable)
}

## Create a dataframe called subject_id_and_activity, which will be merged to second to indicate the subject_id and activity of each row.
subject_id_and_activity=data.frame(subject_id=rep(1:30,6),activity=c(rep("walking",30),rep("walking_upstairs",30),rep("walking_downstairs",30),rep("sitting",30),rep("standing",30),rep("laying",30)))

## Merge subject_id_and_activity with second
second=cbind(subject_id_and_activity,second)

## Assign variable names and rownames (NULL) to second
colnames(second)=names(arranged)
rownames(second)=NULL

## Write second into a txt file
write.table(second,file="second_data_set.txt",row.names=FALSE)