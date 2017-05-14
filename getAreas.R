

# File name
fname <-"dirty_data.csv"

# Read data file
dirty_data<-read.csv(fname)

# Setup for task: Poulate the missing values in the Area variable with an
# appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall
# or Wolverhampton)
# This requires hot deck imutation method called Last Observed Carried Forward (LOCF) 
library(imputeTS)
# This library provides Sequential Hot Deck Imputation function, which can be
# configured to function as LOCF algorithm.
# Input to na.locf() must be a numerix vector. Since the data is in string format
# a vector is created using factor().
dirty_data$AreaFactors <- as.integer(factor(dirty_data$Area))
# All "" levels are replaced with 1, so next step is to replace 1 with 'NA'
dirty_data$AreaFactors[dirty_data$AreaFactors ==1] <- NA
# Impute operation
dirty_data$AreaFactors<-na.locf(dirty_data$AreaFactors,option = "locf",
                                                  na.remaining = "keep")
# Convert factors back to levels
dirty_data$Area<- levels(dirty_data$Area)[dirty_data$AreaFactors]

# Clear temp variables
dirty_data$AreaFactors <- {}

# Write data to csv file
fname <- "dirty_data2.csv"
write.csv(dirty_data, file = fname, eol = "\n", na = "NA",
            row.names = FALSE, fileEncoding = "")

dirty_data<-read.csv(fname)



