GACD.Project
============

Course Project for Coursera's Getting and Cleaning Data course

In this project we were given a data set from the UC Irvine's Machine Learning Repository's experiment on human activity recognition from a Samasung Galaxy II's smartphone's accelerometer. This project includes a script (run_analysis.R) which will create a usable data set from the means and standard devations as well as create a tidy data set from the means of these values.

1. If you do not have the extracted folder from the data set zip file whose link is below, the script will download and extract it into the path included in the zip file from the working directory.
2. The data is divided into two directories representing two data types for the two phases of the experiment: 'test' and 'train'
3. Factor levels and labels are extracted from the activity_labels.txt file.
4. Metadata is hardcoded for a for loop to traverse explained in the next step.
5. Now will walk over both of these directories and create data frames from each file within the directories using the metadata we provided. It will append each data frame to a list.
6. The lists for both test and train data are complete and converted into data frames. Then we "stack" them onto one another and factor the factorable variables. The variables other than those for mean and std are also dropped. It is named 'har'.
7. A tidy data set is created by aggregating the mean of the variables by activity and subject. It is then exported to file.

Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data Source: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

