CodeBook.md
===========

This file documents the data that can be loaded from the file "samsung.dat".


Synopsis
--------

 # Read the data into R
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
