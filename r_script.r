temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip",temp)
act_data <- read.csv(unz(temp, "activity.csv"), header=TRUE, sep=",")
unlink(temp)
rm(temp)

steps_sum = aggregate(x=act_data["steps"], FUN=sum, by=list(date=act_data$date))

hist(steps_sum$steps, main="Total # of Steps Taken Each Day", xlab="Number of Steps")

abline(v=median(steps_sum$steps, na.rm=TRUE),
       col = "red",
       lwd = 2)

abline(v=mean(steps.sum$steps, na.rm=TRUE),
       col = "royalblue",
       lwd = 2)

legend(x = "topright", 
       c("Median", "Mean"),
       col = c("red", "royalblue"),
       lwd = c(2, 2))


step_mean = mean(steps.sum$steps, na.rm=TRUE)
step_median = median(steps_sum$steps, na.rm=TRUE)

points = data.frame()
dates = unique(act_data$date)
count = 0
inter = 0
for (i in dates){
  rows = which(act_data$date==i)
  if (count == 0){
    for (j in rows){
      points = rbind(points, c(act_data[j,]$steps, as.integer(act_data[j,]$interval)))
      inter = as.integer(act_data[j,]$interval)
    }
    count = count + 1
    inter = inter + 5
  }
  else{
    for (j in rows){
      points = rbind(points, c(act_data[j,]$steps, (as.integer(act_data[j,]$interval) + inter)))
    }
    inter = inter + as.integer(act_data[j,]$interval) + 5
  }
}

max_steps = act_data[which.max(act_data$steps),]
max_step_interval = as.numeric(max_steps$interval)
