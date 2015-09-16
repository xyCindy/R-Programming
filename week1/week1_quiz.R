#Week 1 Quiz
#Question 1
#The R language is a dialect of which of the following programming languages?
#---R is a dialect of the S language which was developed at Bell Labs.

#Question 2
#The definition of free software consists of four freedoms (freedoms 0 through 3). 
#Which of the following is NOT one of the freedoms that are part of the definition?
#---The freedom to restrict access to the source code for the software.

#Question 3
#In R the following are all atomic data types EXCEPT
#---data frame

#Question 4
#If I execute the expression x <- 4 in R, 
#what is the class of the object `x' as determined by the `class()' function?
x <- 4
class(x)
#---numeric

#Question 5
#What is the class of the object defined by the expression x <- c(4, "a", TRUE)?
x <- c(4, "a", TRUE)
class(x)
#---character;The character class is the "lowest common denominator" here 
#             and so all elements will be coerced into that class.

#Question 6
#If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), 
#what is produced by the expression rbind(x, y)?
#---a matrix with two rows and three columns

#Question 7
#A key property of vectors in R is that
#---elements of a vector all must be of the same class

#Question 8
#Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me?
x <- list(2, "a", "b", TRUE)
x[[2]]
#---[1] "a"
class(x[[2]])
#---[1] "character"
#---a character vector of length 1

#Question 9
#Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y?
x <- 1:4
y <- 2:3
x + y
#---[1] 3 5 5 7
#---an integer vector with the values 3, 5, 5, 7.

#Question 10
#Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements 
#of this vector that are greater than 10 to be equal to 4. What R code achieves this?
#---x[x > 10] <- 4

#Question 11
#In the dataset provided for this Quiz, what are the column names of the dataset?
hw1 <- read.csv("hw1_data.csv")
colnames(hw1)
#---"Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"

#Question 12
hw1[1:2,]
#---Ozone Solar.R Wind Temp Month Day
#1    41     190  7.4   67     5   1
#2    36     118  8.0   72     5   2

#Question 13
#How many observations (i.e. rows) are in this data frame?
nrow(hw1)
#---153

#Question 14
#Extract the last 2 rows of the data frame and print them to the console. 
#What does the output look like?
hw1[152:153,]
#---Ozone Solar.R Wind Temp Month Day
#152    18     131  8.0   76     9  29
#153    20     223 11.5   68     9  30

#Question 15
#What is the value of Ozone in the 47th row?
hw1$Ozone[47]
#---21

#Question 16
#How many missing values are in the Ozone column of this data frame?
length(hw1$Ozone[is.na(hw1$Ozone)])
#---37

#Question 17
#What is the mean of the Ozone column in this dataset? 
#Exclude missing values (coded as NA) from this calculation.
mean(hw1$Ozone[!is.na(hw1$Ozone)])
#--- 42.12931

#Question 18
#Extract the subset of rows of the data frame where Ozone values are above 31 and 
#Temp values are above 90. What is the mean of Solar.R in this subset?
data_no_na <- hw1[complete.cases(hw1), ]
str(data_no_na)
data_select1 <- data_no_na[data_no_na$Ozone > 31, ]
data_select2 <- data_select1[data_select1$Temp > 90, ]
mean(data_select2$Solar.R)
#---212.8

#Question 19
#What is the mean of "Temp" when "Month" is equal to 6?
data1 <- hw1[hw1$Month == 6, ]
mean(data1$Temp)
#---79.1

#Question 20
#What was the maximum ozone value in the month of May (i.e. Month = 5)?
data2 <- hw1[hw1$Month == 5, ]
max(data2$Ozone,na.rm  = TRUE)
#---115