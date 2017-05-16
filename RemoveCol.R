
# Read the dirty data from last step
mydata<-read.csv("dirty_data2.csv",header = TRUE)
# Remove the "Strange.HTML" Column
dirty_data3 = subset(mydata,select = -c(Strange.HTML))
# Write the updated data into csv file
write.csv(dirty_data3,file = "dirty_data3.csv")

