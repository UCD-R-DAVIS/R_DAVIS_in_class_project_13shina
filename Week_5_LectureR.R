library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
str(surveys)

summary(surveys$hindfoot_length)
# psuedocode
# ifelse(test or condition, what to do if the test is yes/true, what to do if its false/no)

#boolean test
surveys$hindfoot_length < 29.29

surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < 29.29, yes = "small", no = "big")
head(surveys$hindfoot_cat)
head(surveys$hindfoot_length)
surveys$hindfoot_length <- ifelse(surveys$hindfoot_length < mean(surveys$hindfoot_length, na.rm = TRUE), yes = "small", no = "big")
head(surveys$hindfoot_cat)
head(surveys$hindfoot_length)
summary(surveys$hindfoot_lnegth)
surveys$record_id
unique(surveys$hindfoot_cat)

#case_when()
surveys %>% 
  mutate (hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big",#hindfoot length over the mean (29.29) I want to be reclassified as big is what this line is what is doing
    
    #also other types : NA_integer
    TRUE ~ "small" # weird syntx...but essentially the "else" part
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head()    
  
# more categories
surveys %>% 
  mutate (hindfoot_cat = case_when(
    hindfoot_length > 31.5 ~ "big",
    hindfoot_length > 29 ~"medium",
    is.na(hindfoot_length) ~ NA_character_,#also other types : NA_integer
    TRUE ~ "small", # weird syntx...but essentially the "else" part
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  group_by(hindfoot_cat) %>% 
  tally()



table(surveys$hindfoot_cat)

surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 31.5 ~"big",
    hindfoot_length > 29 ~"medium",
    is.na(hindfoot_length) ~NA_character_,
    TRUE~"small"
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head(10)
  




















