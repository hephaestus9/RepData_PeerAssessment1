temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip",temp)
act_data <- read.csv(unz(temp, "activity.csv"), header=TRUE, sep=",")
unlink(temp)
rm(temp)

library(ggplot2)