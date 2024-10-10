set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace (hw2, c(4,12,22,27), NA)
hw2

## Each line of code is displaying a series of values in the environment section

prob1 <- hw2[!is.na(hw2)]

prob1 <-prob1 [prob1 >14 & prob1 <38] ## only displaying numbers between 14 to 38

times3 <- prob1*3 ## Multiply values by 3
  
plus10 <- times3 + 10 ## Adding 10 to values

plus10[c(TRUE,FALSE)]

## first row displays exactly as the answer key, second row displays different set of values, not sure why
