#Week 2 Programming Assignment 1: Air Pollution
#Part 3
corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        # set normal working directory
        setwd("~/Documents/R_Programming/week2")
        # file.path() specifies file paths
        full_directory <- file.path(getwd(),directory)
        setwd(full_directory)
        # find all files in the directory, the class of all_files 
        # is character
        all_files <- list.files(full_directory)
        # get all complete cases
        all_cases <-complete(directory, id = 1:length(all_files))
        # get all valid ids
        ids <- all_cases$id[all_cases$nobs > threshold]
        # create a vector only contains 0; the length is same as ids vector
        corr_vector <- rep(0, length(ids))
        # j is the index of corr_vector
        j <- 1
        for (i in ids) {
                current_file <- read.csv(all_files[i], header=TRUE)
                corr_vector[j] <- cor(current_file$sulfate,current_file$nitrate,
                                      use ="complete.obs")
                j <- j + 1
        }
        
        result <- corr_vector
        return(result)
        
}

#test
cr <- corr("specdata", 150)
head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
cr <- corr("specdata", 400)
head(cr)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
cr <- corr("specdata", 5000)
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
length(cr)
## [1] 0
cr <- corr("specdata")
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
length(cr)
## [1] 323