#Week 2 Programming Assignment 1: Air Pollution
#Part 2
complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        # set normal working directory
        setwd("~/Documents/R_Programming/week2")
        # file.path() specifies file paths
        full_directory <- file.path(getwd(),directory)
        setwd(full_directory)
        
        # find all files in the directory, the class of all_files 
        # is character
        all_files <- list.files(full_directory)
        
        # create a vector only contains 0; the length is same as id vector
        completed_data <- rep(0,length(id))
        
        # looping through the directory's files specified in the 'id' argument
        # j is the index of completed_date vector
        j <- 1 
        for (i in id) {
                current_file <- read.csv(all_files[i], header=TRUE)
                completed_data[j] <- sum(complete.cases(current_file))
                j <- j+1
        }
        
        result <- data.frame(id = id, nobs = completed_data)
        return(result)
}

#test
complete("specdata", 1)
##   id nobs
## 1  1  117
complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
complete("specdata", 3)
##   id nobs
## 1  3  243