# R Programming
# Week 4 Programming Assignment 3
#1.Plot the 30-day mortality rates for heart attack
setwd("~/Documents/R_Programming/week4/rprog-data-ProgAssignment3-data")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)

#To make a simple histogram of the 30-day death rates from heart attack
names(outcome)[11]
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])