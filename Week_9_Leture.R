#Date Upload
head(iris)
head(mtcars)

#subsetting Refresher
#Square brackets for indexing 
iris[1]
iris[[1]]
iris$Sepal.Length

iris[,1]
iris[1,1]
iris$Sepal.Length[1]

#For Loops
#When you want to do something fown rows of data
#takes an index value and runs it through your function
#Layout: use i to specifiy index value

for(i in 1:10){
  print(i)
}

for(i in 1:10){
  print(iris$Sepal.Length[i])
}

#store output
results <- rep(NA, nrow(mtcars))

for(i in 1:nrow(mtacrs)){
  results[i] <- mtcars$wt[i]*100
}

#map Family Functions
library(tidyverse)
#two arguments: the data & the function

map(iris, mean)
map_df(iris, mean)

head(mtcars)

print_mpg <- function(x,y){
  paste(x, "gets", y, "miles per gallon")
}


#map2_chr(inout1, input2, function)
map2_chr(rownames(mtcars), mtcars$mpg, print_mpg)

#embed "anonymous" function
map2_chr(rownames(mtcars), mtcars$mpg,  function(x,y){
  paste(x, "gets", y, "miles per gallon")
}
)













