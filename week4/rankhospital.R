# R Programming
# Week 4 Programming Assignment 3
#3.Ranking hospitals by outcome in a state

# helper function: getHospByRank()
# To get hospital rank in that state by descending order(from lowest 30-day 
# death rate)
getHospByRank <- function(data, col_num, state, num ="best"){
        # Subset data by state
        data_state<- data[data$State == state, ]
        # Get new dataset by column number
        # 2rd column is Hospital.Name
        data_select <- data_state[ , c(2,col_num)]
        # Get the row numbers of data_select (including NA value)
        len <-nrow(data_select[!is.na(data_select[2]), ])
        if (num == "best") {
                # In order function, first sort by Mortality Rates,
                # then by hospital name alphabetically
                hosp <- data_select[order(data_select[2],
                                             data_select["Hospital.Name"]),
                                      "Hospital.Name"][1]
        }
        else if (num == "worst") {
                hosp <- data_select[order(data_select[2],
                                          data_select["Hospital.Name"]),
                                   "Hospital.Name"][len]
        }
        else if (num > len) {
                hosp <- NA
        }
        else {
                hosp <- data_select[order(data_select[2],
                                          data_select["Hospital.Name"]),
                                   "Hospital.Name"][num]
        }
        return(hosp)
}

# function rankhospital
rankhospital <- function(state, outcome, num = "best") {
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
        ## Return hospital name in that state with the given rank 
        ## 30-day death rate
        if (outcome == "heart attack") {
                hospName <- getHospByRank(data, 11, state, num)
        } else if(outcome == "heart failure") {
                hospName <- getHospByRank(data, 17, state, num)
        } else {
                hospName <- getHospByRank(data, 23, state, num)
        }
        return(hospName)
}

# tests
# rankhospital("TX", "heart failure", 4) == "DETAR HOSPITAL NAVARRO"
# rankhospital("MD", "heart attack", "worst") == "HARFORD MEMORIAL HOSPITAL"
# rankhospital("MN", "heart attack", 5000) == NA