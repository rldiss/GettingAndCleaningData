CodeBook.md
===========

This file documents the data that can be loaded from the file "samsung.dat".
The data in this file is derived from the UCI Machine Learning Repository
here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original data, it's format, contents, etc., are documented at this site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data available here is a transformation of this original dataset, meeting the
requirements for the course project specified for the "Getting and Cleaning Data"
course offered on Coursera through Johns Hopkins Bloomberg School of Public Heath.

Synopsis
--------

 df <- read.table("samsung.dat", header=TRUE)


Overview
--------

The "samsung.dat" file contains data for various types of gyroscopic and accelerometer
measurements created by a group of 30 volunteers, who performed six different activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  The dataframe
created by reading this file contains four columns:

**activity**

This is a factor variable identifying the type of activity.  Possible types include
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

**subject**

This is a factor variable identifying the test subject.  Possible values are
integers between 1 and 30.

**variable**

This is the name of the averaged gyroscopic or accelerometer variable measurement.  The
source data contains many measurements for each subject and activity.  This transformed
dataset contains a single, averged measurement for each subject, activity, and measured
data point.

**value**

This is the value of the averaged gyroscopic or accelerometer variable measurement.
