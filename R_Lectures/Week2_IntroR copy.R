## Introduction to R: Arithmetic
## Incomplete Compound
## Order of Operations
# Scientific Notation
## Mathematical Notation
## Nested Functions
## Objects and assignment
## rm (list == ls())
##Challenge-------

elephant1_kg <- 3492
elephant2_lb <- 7757

elephant1_lb <- elephant1_kg * 2.2

elephant2_lb <- elephant1_lb

myelephant <- c(elephant1_lb, elephant2_lb)

which(myelephant) == max(myelephant)


##Project Management--

getwd()
 "/Users/zoecortez/Desktop/R-Projects/R_DAVIS_in_class_project_13shina"
 
setwd()
d<- read.csv("./data/tail_length.csv")

dir.create("./lectures") 

weight_g <- c(50,60,65,82)
weight_one_value <- c(50)

animals <- c("mouse", "rat", "dog")

length(weight_g)
str(weight_g)
weight_g <- c(weight_g, 90)



num_char <- c(1,2,3,"a")
num_logical <- c(1,2,3,TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1,2,3,"4")

num_logical <- c(1,2,3,TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)



## Symbols
### %in% is within a bucket
### == pairwise matching -- ORDER MATTERS 

