# Week 3 Quiz
## Question 1

```r
library(datasets)
data(iris)
?iris
```

```
## starting httpd help server ... done
```

```r
str(iris)
```

```
## 'data.frame':	150 obs. of  5 variables:
##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

```r
mean(iris$Sepal.Length[iris$Species == "virginica"])
```

```
## [1] 6.588
```

## Question 2

```r
apply(iris[, 1:4], 2, mean)
```

```
## Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
##     5.843333     3.057333     3.758000     1.199333
```

## Question 3

```r
library(datasets)
data(mtcars)
?mtcars
str(mtcars)
```

```
## 'data.frame':	32 obs. of  11 variables:
##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
##  $ disp: num  160 160 108 258 360 ...
##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
##  $ qsec: num  16.5 17 18.6 19.4 17 ...
##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```

```r
tapply(mtcars$mpg, mtcars$cyl, mean)
```

```
##        4        6        8 
## 26.66364 19.74286 15.10000
```

## Question 4
First we split gross horse power based on numbers of cylinders:

```r
s <- split(mtcars$hp,mtcars$cyl)
s
```

```
## $`4`
##  [1]  93  62  95  66  52  65  97  66  91 113 109
## 
## $`6`
## [1] 110 110 110 105 123 123 175
## 
## $`8`
##  [1] 175 245 180 180 180 205 215 230 150 150 245 175 264 335
```
The average horsepower of 4-cylinder cars:

```r
avg1 <- mean(s$'4')
```
The average horsepower of 8-cylinder cars:

```r
avg2 <- mean(s$'8')
```
The absolute difference between the average horsepower of 4-cylinder cars 
and the average horsepower of 8-cylinder cars is:

```r
abs(avg1-avg2)
```

```
## [1] 126.5779
```

## Question 5

```r
debug(ls)
```
Execution of 'ls' will suspend at the beginning of the function and 
you will be in the browser.
