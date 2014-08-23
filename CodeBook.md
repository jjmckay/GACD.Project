#UCI HAR Dataset Codebook
University of California Irvine
Human Activity Recognition

##Variables

1. **data.type** - *factor, character labels* - ("test", "train") - This variable denotes where either 30% of subjects participated in the test phase of the experimental data gathering and 70% of the subjects participated in training.
2. **subject** - *factor, numeric labels* - (1:30) - The id number for subject which took part in the experiment.
3. **activity** - *factor, character labels* - ("walking", "walking.upstairs", "walking.downstairs", "sitting", "standing", "laying") - The activity which subjects performed with the accelerometer.
4. **Et cetera** - *numeric* - The rest of the variable denoted by columns 4 and up are measurements for signals from the acceleromter. They come in two major types:


- Variables beginning with 't' are 3 dimensional signals
- Variables beginning with 'f' indicate a frequency domain signal


**Source:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Data Source:** http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip
