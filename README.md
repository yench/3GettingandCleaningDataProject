Introduction
=============
This repo is all about the processing of an original dataset into the dataset desired.


#### Where does the original dataset come from?
The original dataset "Human Activity Recognition Using Smartphones Datasets"[^1] comes from an experiment performed on 30 volunteers. Each volunteer perfomed 6 activies (walking, walking_upstairs, walking_downstairs, sitting, standing, laying) with smartphone on the waist to record his/her 3-axial linear acceleration and 3-axial angular velocity. The obtained data set was randomly partitioned into 2 sets: the training data and test data.

[^1]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

For each measurement, a list of 561 features are estimated from the signals captured by smartphone, such as tBodyAcc-mean(), which is the mean value of body acceleration signals.

For more information on the original dataset, please check [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).


#### What was performed on the original dataset?
From the original dataset, a new, tidy dataset called "second" is generated in the following order:
 1. Training data and test data are labeled with descriptive variable names, which are the names of the features.
 2. The training data and test data of the original dataset were merged to create one data set.
 3. Only the measurements on the mean and standard deviation for each measurement were extracted.
 4. Descriptive activity names (walking, walking_upstairs, walking_downstairs, sitting, standing, laying) were used to replace the integer numbers used in the original dataset.
 5. A second, tidy dataset with the average of each variable for each activity and each subject is generated.  

#### What is this repo about?
This repo contains 3 fiels: README.md, run_analysis.R, and codebook.md. 
  * README.md: the file you are reading right now. It is an introduction on the whole process of how the "second" dataset is obtained from the original dataset.  
  * run_analysis.R: the R script for excecuting the process to create "second". When the original dataset is in the R working directory and unzipped, running this R script would create the "second".
  * Codecook.md: the codebook explaining the meaning of codes in the "second" dataset.




