
for (i in 1:4) {}
  matrix(sample(0:9, 8, replace = TRUE), ncol = 1)

train <- data.frame()

if(!file.exists(dest)){
  download.file(src, dest)
  dldate <- date()
}

subject <-
activity <-
data <-

## Building the subject data frame slice
assign(paste0(datatype, ".subject"),
         read.table(paste0(d, "/subject_", datatype , ".txt"),
                    header = FALSE,
                    col.names = "subject"))

## Building the activity data frame slice
assign(paste0(datatype, ".activity"),
       read.table(paste0(d, "/y_train"),
                  header = FALSE,
                  col.names = "activity"))

## Building the features data frame slice
assign(paste0(datatype, ".feature"),
       read.table(paste0(d, "/X_train"),
                  header = FALSE,
                  col.names = features.col.names))


assign(datatype, cbind(get(paste0(datatype, ".subject")),
)


for (i in 1:length(build.data)) {

}

cbind(get(paste0(data.type, ".", build.data[["data.slice"]][i])),


      }

build.data <- list(data.slice = list("subject",
                                     "activity",
                                     "features"),
                   file = list(paste0("subject_", data.type, ".txt"),
                               paste0("y_", data.type, ".txt"),
                               paste0("X_", data.type, ".txt")),
                   col.name = list("subject",
                                   "activity",
                                   features.col.names))

bd <- list(subject = list(data.slice = "subject",
                                file = paste0("subject_", datatype, ".txt"),
                                col.names = "subject"),
                 activity = list(data.slice = "activity",
                                 file = paste0("y_", datatype, ".txt"),
                                 col.names = "activity"),
                 feature = list(data.slice = "feature",
                                file = paste0("X_", datatype, ".txt"),
                                col.names = features.col.names))

GetDataFrames <- function(build.data, dt) {
  assign(paste0(dt, ".", build.data$data.slice[[i]]),
         read.table(paste0(d, "/" , build.data$file[[i]]),
                    header = FALSE,
                    col.names = build.data$col.name[[i]]))

  return(get(paste0(dt, ".", build.data$data.slice[[i]])))
}

GetDataFrames <- function(bd = build.data, dt = datatype) {
  assign(paste0(dt, ".", bd$data.slice[[i]]),
         read.table(paste0(d, "/" , bd$file[[i]]),
                    header = FALSE,
                    col.names = bd$col.name[[i]]))

  return(get(paste0(dt, ".", bd$data.slice[[i]])))
}

