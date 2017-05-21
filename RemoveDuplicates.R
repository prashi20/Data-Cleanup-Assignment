# Read the csv file
mydata<-read.csv("dirty_data4.csv", header = TRUE)
# Form a new vector with the Street column
mydata1<-mydata[,c(5)]
# Form a new vector with the Street2 column
mydata2<-mydata[,c(6)]
# Compare the 2 vectors
all.equal(mydata2,mydata1)
# The 2 columns are found to be identical, so remove Street 2 column
dirty_data5 = subset(dirty_data4, select = -c(6))
# Create a new csv file
write.csv(dirty_data5, file = "dirty_data5.csv")