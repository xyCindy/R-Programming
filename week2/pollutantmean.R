#Week 2 Programming Assignment 1: Air Pollution
#Part 1
pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
        
        # set normal working directory
        setwd("~/Documents/R_Programming/week2")
        # file.path() specifies file paths
        full_directory <- file.path(getwd(),directory)
        setwd(full_directory)
        
        # initialize a vector to hold all the pollutant data
        # across different monitors
        pollutant_vector <- c()
        
        # find all files in the directory's files, the class of all_files 
        # is character
        all_files <- list.files(full_directory)
        
        # make sure all_files are a vector of character
        if (class(all_files) != "character") {
                all_files <- as.character(all_files)
        }
        
        # looping through the directory's files specified in the 'id' argument
        for (i in id) {
             current_file <- read.csv(all_files[i], header=TRUE)
             
             # add all observations without NA in pollutant column
             pollutant_vector <- c(pollutant_vector,na.omit(current_file[pollutant]))
        }
        
        # return mean value
        result <- mean(unlist(pollutant_vector))
        return(result)
}


#test
pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064
pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706
pollutantmean("specdata", "nitrate", 23)
## [1] 1.281

