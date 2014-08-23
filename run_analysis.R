
data.files.root <- "./UCI HAR Dataset"
root.dirs <- list.dirs(".", recursive = FALSE)


if (!data.files.root %in% root.dirs) {
  data.files.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  data.files.zip <- "uci.har.datafiles.zip"

  download.file(data.files.url, data.files.zip)

  unzip(data.files.zip)
}

features.cols.file <- paste0(data.files.root, "/", "features.txt")
## We go ahead and specify the second column from the data frame returned by
## read.table since it has the names of the columns.
features.col.names <- read.table(features.cols.file, stringsAsFactors = FALSE, )[[2]]
all.col.names <- c("datatype", "subject", "activity", features.col.names)

factors.file <- paste0(data.files.root, "/activity_labels.txt")
activity.labels <- read.table(factors.file, header = FALSE,
                               stringsAsFactors = FALSE,
                               colClasses = c("numeric", "character"))
activity.levels <- activity.labels[[1]]
activity.labels <- tolower(activity.labels[[2]])
activity.labels <- sub("_", "\\.", activity.labels)

## Build the foundations of both the test and train separate datasets
## test contains 2947 rows and train contains 7352
# test <- data.frame(rep("test", length.out = 2947), stringsAsFactors = TRUE)
# train <- data.frame(rep("train", length.out = 7352), stringsAsFactors = TRUE)

data.files.dirs <- list.dirs(data.files.root, recursive = FALSE, full.names = TRUE)
for(d in data.files.dirs) {
  data.type <- sub(".*/+([^ ]+)", "\\1", d)

  ## This is metadata so we can practice DRY and pass the pertinent info in a
  ## list so that it is accessible while building each data.slice.
  build.data <- list(data.slice = list("subject",
                                       "activity",
                                       "features"),
                     file = list(paste0("subject_", data.type, ".txt"),
                                 paste0("y_", data.type, ".txt"),
                                 paste0("X_", data.type, ".txt")),
                     col.name = list("subject",
                                     "activity",
                                     features.col.names))

  ## We'll build each data type's data frame by appending each data slice to a
  ## list so we initialize an empty list for that here.
  assign(data.type, list())

  for (i in 1:length(build.data)) {
    assign(paste0(data.type, ".", build.data$data.slice[[i]]),
           read.table(paste0(d, "/" , build.data$file[[i]]),
                      header = FALSE,
                      col.names = build.data$col.name[[i]]))

    assign(data.type, append(get(data.type),
                             get(paste0(data.type, ".", build.data$data.slice[[i]]))))
  }

  ## Build a data slice with only the data type name in a single column for
  ## when we rbind the data frames for the two types together
  dtcol <- data.frame(rep(data.type, length.out = length(get(data.type)[[1]])))
  colnames(dtcol) <- "data.type"

  assign(data.type, append(dtcol, get(data.type)))

  assign(data.type, data.frame(get(data.type)))



}

har <- rbind(test,train)

## We only want to keep features columns pertaining to their means and standard
## deviations in addition to our data.type, subject, and activity columns
col.keep <- c(1:3, grep("[Mm]ean|[Ss]td", colnames(har)))

har <- har[ , col.keep]

## One last thing we must do is factor the activity and subject column with the
## labels provided to us.
har$subject <- factor(har$subject, levels = 1:30)
har$activity <- factor(har$activity, levels = activity.levels, labels = activity.labels)

## The har data frame is now complete per the first part of the instructions.

## Create the tidy data set with the aggregate averages by activity and subject
## per the instructions of item 5.
har.tidy <- aggregate(har[-1:-3], by = list(activity = har$activity, subject = har$subject), FUN = mean, simplify = TRUE)
har.tidy <- har.tidy[order(har.tidy$subject, har.tidy$activity), ]

## Add "ave." to the beginning of the features columns to denote their new
## values
colnames(har.tidy)[-1:-2] <- paste0("ave.", colnames(har.tidy)[-1:-2])


write.table(har.tidy, file = "./har.tidy.csv", sep = ",", row.names = FALSE)

