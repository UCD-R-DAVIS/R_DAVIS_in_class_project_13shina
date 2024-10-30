library(tidyverse)

tail <- read_csv('data/tail_length.csv')
syrveys <- read_csv('data/portal_data_joined.csv')

dim(tail) #I have more coloumns??
dim(surveys)
head(tail)


surveys_inner <- inner_join(x = surveys, y = tail)
dim(surveys_inner)
head(surveys_inner)

surveys_left <- left_join(x = surveys, y = tail)
dim(surveys_inner)
table(is.na(surveys_left$tail_length))


 all(surveys$record_id %>%in%>% tail$record_id)
all(tail$record_id %>%in%>% surveys$record_id)








#join_function (data frame a, data frame b, how to join)
# inner_join(data frame a , data frame b, common id)
surveys <- read_csv('data/portal_data_joined.csv')
#inner join only keeps records that are in both data frames
dim(inner_join(x = surveys, y = tail, by = 'record_id'))
dim(surveys)
dim(tail)

#left_join
#Left_join takes data frame x and y and it keeps everything in x and only
#right join takes data fram x and datafram y and it keeps everything in y and only

surveys_left_joined <- left_join(x = surveys, y = tail, by = 'record_id')
surveys_right_joined <- left_join(y = surveys, x = tail, by = 'record_id')

dim(surveys_left_joined)
dim(surveys_right_joined)


#full_joined(x,y)
# full_joined keeps everything

surveys_full_joined <- full_join(x = surveys, y = tail)
dim(surveys_full_joined)


#pivtor_wider makes data with more columns
pivot_wider()


#pivot_longer makes datat with more rows
pivot_longer()

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))

surveys_mz
unique(surveys_mz$genus)

wide_survey<-surveys_mz %>% 
  pivot_wider(names_from = 'plot_id', values_from =  )

head(wide_survey)

surveys_long <- wide_survey %>% pivot_longer(-genus, names_to = 'plot_id', values_to = 'mean_weight')

head(surveys_long)

wide_survey %>% pivot_longer(-genus, names_to = 'plot_id', values_to = 'mean_weight')





