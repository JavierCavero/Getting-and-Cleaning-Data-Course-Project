## Downloading file from url unzipping and filing in working directory
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./projectdataset.zip")
unzip("./projectdataset.zip")

## creating a vector with variables and attributes names
features<-read.table("./UCI HAR Dataset/features.txt")
names<-c("subject","activitylabel",as.character(features[,2]))

## creating train data frame with train data
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")

## creating a look up table for converting coded activities into descriptive attributes
activityLabelsLookUp<-read.table("./UCI HAR Dataset/activity_labels.txt")
labelNames<-c("id","activity")
colnames(activityLabelsLookUp)<-labelNames

## creating activities vector for train sample
trainLabelsVector<-read.table("./UCI HAR Dataset/train/y_train.txt")

## creating subject vector for train sample
trainSetVector<-read.table("./UCI HAR Dataset/train/subject_train.txt")

## creating train data frame merging activity vector, subject vector and train data and
## setting column names
trainDf<-cbind(trainSetVector,trainLabelsVector,trainData)
colnames(trainDf)<-names

## creating test data frame with test data
testData<-read.table("./UCI HAR Dataset/test/X_test.txt")

## creating ativities vector for test sample
testLabelsVector<-read.table("./UCI HAR Dataset/test/y_test.txt")

## creating subject vector for test sample
testSetVector<-read.table("./UCI HAR Dataset/test/subject_test.txt")

## creating test data frame merging activity vector, subject vector and test data and
## setting column names
testDf<-cbind(testSetVector,testLabelsVector,testData)
colnames(testDf)<-names

## merging train and data samples
mergedData<-rbind(trainDf,testDf)
 
## converting activitiy Codes into descriptive names merging the data set with the 
## look up table
descriptiveMergedData<-merge(mergedData,activityLabelsLookUp,by.x="activitylabel",by.y="id")

## selection of mean and standard deviation data
subsetDescriptiveData<-descriptiveMergedData[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,
                      229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,
                      544:545,564)]
subsetDescriptiveData$activitylabel<-subsetDescriptiveData$activity
tidyDataSet<-subsetDescriptiveData[,1:68]

## changing variable names for names following best practices: no spaces, 
## all lower cases and descriptive names
datasetNames<-c("activity","subject","timebodyaccelerometerXaxismean","timebodyaccelerometerYaxismean",
                "timebodyaccelerometerZaxismean","timebodyaccelerometerXaxissd",
                "timebodyaccelerometerYaxissd","timebodyaccelerometerZaxissd",
                "timegravityaccelerometerXaxismean","timegravityaccelerometerYaxismean",
                "timegravityaccelerometerZaxismean","timegravityaccelerometerXsd",
                "timegravityaccelerometerYsd","timegravityaccelerometerZsd",
                "timebodyaccelerometerjerkXaxismean","timebodyaccelerometerjerkYaxismean",
                "timebodyaccelerometerjerkZaxismean","timebodyaccelerometerjerkXaxissd",
                "timebodyaccelerometerjerkYaxissd",
                "timebodyaccelerometerjerkZaxissd",
                "timebodygyroscopeXmean",
                "timebodygyroscopeYmean","timebodygyroscopeZmean",
                "timebodygyroscopeXsd","timebodygyroscopeYsd","timebodygyroscopeZsd",
                "timebodygyroscopejerkXmean","timebodygyroscopejerkYmean",
                "timebodygyroscopejerkZmean","timebodygyroscopejerkXsd",
                "timebodygyroscopejerkYsd","timebodygyroscopejerkZsd",
                "timebodyaccelerometermagmean","timebodyaccelerometermagsd",
                "timegravityaccelerometermagmean","timegravityaccelerometermagsd",
                "timebodyaccelerometerjerkmagmean","timebodyaccelerometerjerkmagsd",
                "timebodygyroscopemagmean","timebodygyroscopemagsd",
                "timebodygyroscopejerkmagmean","timebodygyroscopejerkmagsd",
                "fourierbodyaccelerometerXaxismean","fourierbodyaccelerometerYaxismean",
                "fourierbodyaccelerometerZaxismean","fourierbodyaccelerometerXaxissd",
                "fourierbodyaccelerometerYaxissd","fourierbodyaccelerometerZaxissd",
                "fourierbodyaccelerometerjerkXaxismean","fourierbodyaccelerometerjerkYaxismean",
                "fourierbodyaccelerometerjerkZaxismean","fourierbodyaccelerometerjerkXaxissd",
                "fourierbodyaccelerometerjerkYaxissd","fourierbodyaccelerometerjerkZaxissd",
                "fourierbodygyroscopeXmean","fourierbodygyroscopeYmean","fourierbodygyroscopeZmean",
                "fourierbodygyroscopeXsd","fourierbodygyroscopeYsd","fourierbodygyroscopejerkZsd",
                "fourierbodybodyaccelerometerjerkmagmean","fourierbodbodyyaccelerometerjerkmagsd",
                "fourierbodybodygyroscopemagmean","fourierbodybodygyroscopemagsd",
                "fourierbodybodygyroscopejerkmagmean","fourierbodybodygyroscopejerkmagsd",
                "fourierbodyacceleratormagmean","fourierbodyacceleratormagsd")
colnames(tidyDataSet)<-datasetNames

## Creating an independent tidy data set with the average of each variable for each 
## activity and each subject
averageDataSet<-aggregate(tidyDataSet,by=list(tidyDataSet$subject,
                                              tidyDataSet$activity),FUN="mean")

tidyAverageDataSet<-averageDataSet[,c(2,4:70)]