library(tidyverse)
install.packages("ggplot2")
library(ggplot2)

surveys_complete <- read_csv("data/portal_data_joined.csv") %>%
  filter(complete.cases(.))  

#syntax for ggppplot
## ggplot(data = < DATA>, mapping = aes(<MAPPING>)) + <GEOM_FUNCTION>()

# Example
ggplot(data = surveys_complete)

#Add aes argument
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))

# Add geom_function
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + geom_point()
  
#Add more pot elements
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + geom_point(alpha = 0.1)

#Add color to the plots
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + geom_point(color = blue)

#color by group
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + geom_point(aes(color = genus)) + geom_smooth(aes(color = genus))

#universal plot setting
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length, color = genus)) + geom_point() + geom_smooth()

#Boxplot : categorical x continuous data
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight))
geom_boxplot(color = "orange")

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight))
geom_boxplot(fill = "orange") + 
  geom_jitter(color = "black", alpha = 0.1)

#Change the order of plot construction
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) + 
  geom_jitter(color = "black", alpha = 0.1) +
  geom_boxplot(fill = "orange", alpha = 0.5)









