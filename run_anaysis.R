load_data <- function() {
  # create empty df
  df <- data.frame()
  
  # read activity labels from activity_labels.txt
  activities <- read.table("activity_labels.txt", col.names = c("code","name"), colClasses = c("numeric","character"));

  # read feature labels from features.txt (this is the measurement column names)
  features <- read.table("features.txt", col.names = c("col","name"), colClasses = c("numeric","character"));
  keep <- features$col[grep("-(mean|std)\\(", features$name)]
  features$name <- sub("[(]", "", sub("[)]", "", features$name))

  # foreach dirname "test" and "train"
  for (dirname in c("test","train")) {
    cat("Loading", dirname, "\n")
    
    # read subject_dirname.txt into temp
    fname <- paste0(dirname, "/subject_", dirname, ".txt")
    subj <- read.table(fname, col.names = c("subject"), colClasses = c("numeric"))

    # read y_dirname.txt into temp
    fname <- paste0(dirname, "/y_", dirname, ".txt")
    activity <- read.table(fname, col.names = c("activity"), colClasses = c("numeric"))
    activity$activity <- factor(activity$activity, levels=activities$code, labels=activities$name)
    
    # read.table dirname/X_dirname.txt into temp df
    fname <- paste0(dirname, "/X_", dirname, ".txt")
    measurements <- read.table(fname, col.names = features$name, colClasses = c("numeric"))

    # keep only measurements for mean() and std()
    measurements <- subset(measurements, select = keep)

    # attach subject column to temp df
    measurements$subject <- subj$subject
    
    # attach activity (y_dirname) column to temp df
    measurements$activity <- activity$activity
    
    # append these measurements to our data frame
    df <- rbind(df, measurements)
  }
  
  return(df)
}

create_dataset <- function() {
  library(reshape2)
  
  # Load the data
  df <- load_data()
  
  # Melt the dataset so we can average each measurement by activity and subject
  measures <- grep("activity|subject", colnames(df), value=TRUE, invert=TRUE)
  df <- melt(df, id=c("activity","subject"), measure.vars=measures)
  
  # Compute averages by activity and subject for each measurement
  df <- dcast(df, activity + subject ~ variable, mean)

  # Re-melt the dataset so we have one measurement per row
  measures <- grep("activity|subject", colnames(df), value=TRUE, invert=TRUE)
  df <- melt(df, id=c("activity","subject"), mesaure.vars=measures)

  # Change the variable names to reflect the fact that they are now averages
  df$variable <- sapply(df$variable, paste0, "-average")
  
  return(df)
}


create_and_write_dataset <- function() {
  df <- create_dataset()
  write.table(df, "samsung.dat", col.names=TRUE)
  return(df)
}
