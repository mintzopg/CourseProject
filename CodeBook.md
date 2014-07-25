---
title: "CodeBook"
author: "Georgios Mintzopoulos"
date: "Friday, July 25, 2014"
output: html_document
---

File:    			CodeBook.md
Description:		Code book for course project assignment of Coursera course “Getting and cleaning Data”, 
							offered online by John Hopkins Bloomberg School of Public Health
                            
Acknowledgments:	Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 
							using a Multiclass Hardware-Friendly Support Vector Machine. 
							International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
                          
Coded in R ver. 3.1.1                          


The Data set provided includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector

- 'features.txt': List of all features

- 'activity_labels.txt': Links the class labels with their activity name

- 'train/X_train.txt': Training set

- 'train/y_train.txt': Training labels

- 'test/X_test.txt': Test set

- 'test/y_test.txt': Test labels

The data provided are:
	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment

Variables Used:
	* T_test and X_train datasets and assign them in X_test and X_train variables respectively
	* X_data data frame holds the merged train and test datasets.
	* Variables, used to,
		- hold the subject information -> subject
		- features in train and test datasets->features
	* variables, indices_mean & indices_std  are used to hold the indices of all features with mean and standard deviation values respectively, in the features vector.
	* X_data_mean_std  extracts only the measurements on the mean and standard deviation for each measurement.
	* t, is a data set produced from grouping the X_data_mean_std, by activity and subject
Work done:
	1. Read the {X_test , X_train} datasets and assign them in {X_test and X_train} variables respectively.
	2. Merge them to a data frame called {X_data} in the order (X_test+Xtrain).
	3. Read the features list file and assign it to features.
	4. Use features list as names for {X_data}.
	5. Subset the {X_data} data frame to extract only the measurements on the mean and standard deviation for each measurement. This new data frame is called {X_data_mean_std}.
	6. Use descriptive activity names to name the activities in the data set. Add these to {X_data_mean_std}.
	7. Read the subjects data as found in files {subject_test.txt & subject_train,txt}, combine them and add them as a 1st column to the {X_data_mean_std} data frame.
	8. Group {X_data_mean_std} by activity and subject, and assign it to a temporary data frame called {t}.
	9. Remove leftovers from {t} to produce the new tidy data set, {tidyData}.
	10. Export {tidyData} to a txt file, called {tidyData.txt}.

