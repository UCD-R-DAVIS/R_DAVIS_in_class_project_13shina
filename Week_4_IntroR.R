install.packages("tidyverse")

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

str(sruveys) #Overview of dataset

#Select Columns
month_day_year <- select(surveys, month, day, year)

#Filtering by equal
filter(surveys, year == 1981)

#Filter by range / %in% is bucketsearch
filter(surveys, year %in% c(1981:1983))

#review: why should you NEVER do:
filter(surveys, year == c(1981, 19821, 1983))
#This recycles the vector 


#filtering by multiple conditions
bigfoot_with_weight <- filter(surveys, hindfoot_length > 40 & !is.na(weight))


#multi-step process
small_animals <- filter(surveys, weight <5)
#this is slighlty dangerous because you have to remember to 
#select from small_animals, not surveys in the next step

small_animals_ids <- select(small_animals, record_id, plot_id, species_id)

                            
#Same process, using nested functions
small_animals_ids <- select(filter(surveys, weight < 5), record_id, plot_id, species_id)
                            
                            
#same process, using a pipe
#cmd shift M
#or |>
#note our select function no longer explicitly calls the tibble

small_animals_ids <- filter(surveys, weight < 5) %>% select(record_id, plot_id, species_id)


#same as 
small_animals_ids <- surveys %>% filter(weight < 5) %>% select(record_id, plot_id, species_id)


#how to do line breaks with pipes
surveys %>% filter(month==1)

#good
surveys %>% 
  filter(month == 1)

#notgood
#surveys
#%>% filter(month == 1)
#what happens here? -> r must know before breaking   

#line break rules: After open parenthesis, pipe, 
#commas, 
#or anything that shows the lines is not complete yet






#Video 2

#Mutate
survyes <- surveys %>% 
  mutate(weight_kg = weight/1000)
str(surveys)

#add multiple columns
surveys <- surveys %>% 
  mutate(weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)
str(surveys)


#filter out na's
surveys <- surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)

head(surveys)


#Group_by and summarize

surveys2 <- surveys %>% 
  group_by(sex) %>% 
  mutate(mean_weight = mean(weight))


surveys3 <- surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight))

surveys3 <- surveys %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight))
surveys3


#arrange
surveys %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight)) %>% 
  arrange(-mean_weight)
#descend with -


#summarize multiple values
surveys %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight),
            min_weight = min(weight)) %>% 
  arrange(-mean_weight)

