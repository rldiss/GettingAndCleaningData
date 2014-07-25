Hello there.  This Github repo contains the code I created for the Peer Assessment
project of the "Getting and Cleaning Data" Coursera course.  It contains the data
from Samsung, the code I created to transform that data, and the resulting tidy
data set.  Here's what you'll find here:

run_anaysis.R
-------------

Ths is the R script file which contains all of the processing logic.  It defines
three functions: load_data(), create_dataset(), and create_and_write_dataset().
These functions do the following:

load_data()
-----------

Loads the sensor measurements data for the "train" and "test" datasets, found in
directories of that same name under your current working directory.  Also loads
the activity names from activity_labels.txt in the current working directory,
and loads the measurement feature names from features.txt also in your current
working directory.  Using this data, it creates and returns a dataframe which
contains 10,299 rows and 68 columns.  The dataframe column "activity" is a factor
variable for the type of activity performed.  The dataframe column "subject"
is a factor variable which identifies the test subject.  The remaining columns
in the dataframe are measurement observation values.

Note that the measurements returned from this function are only the mean and
standard deviation measurements.  There are at lot more measurements in the
Samsung data, but the assignment is to only extract those types of measurements.

create_dataset()
----------------

Using load_data(), this function loads the Samsung data, and then transforms it
so that there is one value, the average, for each combination of "activity",
"subject" and "measurement".  This new dataframe is returned.

create_and_write_dataset()

This function uses create_dataset() to get the data, and then writes it as a
table to the file "samsung.dat".
