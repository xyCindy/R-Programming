# R Programming
# Week 4 Programming Assignment 3
#2.Finding the best hospital in a state

# helper function: getHospName()
# To get hospital name in that state with lowest 30-day death rate
getHospName <- function(data, col_num, state){
        # Subset data by state
        data_state<- data[data$State == state, ]
        # Get outcome column by column number
        outcome_col <- data_state[, col_num]
        min <- min(outcome_col, na.rm = TRUE)
        min_idx <- which(outcome_col == min)
        hospital_names <- data_state[min_idx,"Hospital.Name"]
        # Sort Hopital names in alphabetical order, and select the first one
        hospital_name <-hospital_names[order(hospital_names)][1]
        return(hospital_name)
}
        
# function best
best <- function(state, outcome) {
        ## Read outcome data
        setwd("~/Documents/R_Programming/week4/rprog-data-ProgAssignment3-data")
        # Turn "Not Available" to NA
        data <- read.csv("outcome-of-care-measures.csv", colClasses="character",
                         na.strings = "Not Available")
        # Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
        data[, 11]<- as.numeric(data[, 11])
        # Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
        data[, 17] <- as.numeric(data[, 17])
        # Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
        data[, 23] <- as.numeric(data[, 23])
        
        ## Check that state and outcome are valid
        valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
        if (!outcome %in% valid_outcomes){
                stop("invalid outcome")
        }
        
        # column 7 name: State
        valid_states <- unique(data[,7])
        if (!state %in% valid_states){
                stop("invalid state")
        }
       
        # If outcome and state are all valid
        ## Return hospital name in that state with lowest 30-day death rate
        if (outcome == "heart attack") {
                hospital_name <- getHospName(data, 11, state)
        } else if(outcome == "heart failure") {
                hospital_name <- getHospName(data, 17, state)
        } else {
                hospital_name <- getHospName(data, 23, state)
        }
        result <- hospital_name
        return(result)
}

# tests
# best("TX", "heart attack" )=="CYPRESS FAIRBANKS MEDICAL CENTER"
# best("TX", "heart failure")=="FORT DUNCAN MEDICAL CENTER"
# best("MD", "heart attack")=="JOHNS HOPKINS HOSPITAL, THE"
# best("MD", "pneumonia")=="GREATER BALTIMORE MEDICAL CENTER"
# best("BB", "heart attack")
# Error in best("BB", "heart attack") : invalid state
# best("NY", "hert attack")
# Error in best("NY", "hert attack") : invalid outcome