# Getting-and-Cleaning-Data-Course-Project
The assignment consists in unloading a zip file from a url and building a tidy data set from the data spread along several files and directories contained in that zip file.
	
The data represent observations of an experiment carried out in a sample of 30 individuals who performed up to 6 different activities. Those observations are records of the accelerometer and gyroscope devices contained in a smartphone, taken in regular intervals and submitted to several transformations in order to figure out some cinematic calculations and their 3-axis breakdown. The results of those transformations are the more than 500 variables that together with the individual id and the reference activity to wich the observation is related, form the data set.

The original data as presented in the zip file are organized as follows:

a)	The data files are separated in a train directory, containing the data on a subset of the population representing 70 % of the volunteers randomly selected and a test directory with data related to the remaining 30 %.

b)	Each directory has the same structure:

	. The result of each of the 561 variables observed and figured out for each record, contained in a file (X_train or X_test, data belonging to the train or the test sample). 
	. A txt file consisting of just a column, which identifies the individual to whom each record is related.
	. A txt file consisting of just a column, identifying the activity carried out by the individual when each observation is recorded.
	. A subdirectory (inertial signals) with the raw data from the accelerometer and gyroscope.

c)	The zip’s root directory contains a readme file with the experiment description and data structure, a features selection file, dwelling on the variables construction and their description and a features file comprising the 561 variables name.

We have been asked to create one R script called run_analysis.R that does the following:

a)	Merges the training and the test sets to create one data set.

b)	Extracts the measurements on the mean and standard deviation for each measurement (our understanding of the assignment is that there are more than 60 mean or sd-type variables, and our code extracts the whole bunch of them)

c)	Uses descriptive activity names to name the activities in data set.

d)	Labels the data set with descriptive variable names.
e)	From this initial tidy data set, creates a second independent tidy data set with the average of each variable for each activity and subject.
