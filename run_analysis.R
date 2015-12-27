# This script merges the training and test data sets to create one with all
# measurements, then it extracts the mean and standard deviation variables of 
# each measurement to create an intermediate output data set. Ultimately it 
# creates an independent tidy data set with the average of each measurement for 
# each activity and each subject.

library(tidyr)
library(dplyr)

variableNames <- read.table("features.txt",
                            col.names = c("index", "feature"))
rawDataTest <- read.table("x_test.txt", 
                          sep = "", 
                          col.names = variableNames[,2])
rawDataTest$Subject <- read.table("subject_test.txt")$V1
rawDataTest$Set <- "Test"
rawDataTest$Activity <- read.table("y_test.txt")$V1
dfTest <- rawDataTest %>%
    gather(measurement, value, -Subject, -Activity, -Set) %>%
    separate(measurement,
             c("signal", "variable", "Param1", "Param2"),
             extra = "merge",
             fill = "right")

rawDataTraining <- read.table("x_train.txt",
                              sep = "",
                              col.names = variableNames[,2])
rawDataTraining$Subject <- read.table("subject_train.txt")$V1
rawDataTraining$Set <- "Train"
rawDataTraining$Activity <- read.table("y_train.txt")$V1
dfTrain <- rawDataTraining %>%
    gather(measurement, value, -Subject, -Activity, -Set) %>%
    separate(measurement,
             c("signal", "variable", "Param1", "Param2"),
             extra = "merge",
             fill = "right")

dfAll <- rbind(dfTest, dfTrain)

dfAll$Activity[dfAll$Activity == 1] <- "WALKING"
dfAll$Activity[dfAll$Activity == 2] <- "WALKING_UPSTAIRS"
dfAll$Activity[dfAll$Activity == 3] <- "WALKING_DOWNSTAIRS"
dfAll$Activity[dfAll$Activity == 4] <- "SITTING"
dfAll$Activity[dfAll$Activity == 5] <- "STANDING"
dfAll$Activity[dfAll$Activity == 6] <- "LAYING"

dfAll$Set <- as.factor(dfAll$Set)
dfAll$Activity <- as.factor(dfAll$Activity)
dfAll$signal <- as.factor(dfAll$signal)
dfAll$variable <- as.factor(dfAll$variable)
dfAll$Param1 <- as.factor(dfAll$Param1)
dfAll$Param2 <- as.factor(dfAll$Param2)

dfIntermediate <- dfAll[dfAll$variable == "mean" | dfAll$variable == "std", ]
dfSummarized <- dfIntermediate[dfIntermediate$variable == "mean",] %>% 
    group_by(Subject, Activity, signal) %>% 
    summarize(average = mean(value, na.rm = TRUE))

write.table(dfSummarized,
            file = "tidy.txt",
            row.name = FALSE)