library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv") 

gapminder %>%
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  ggplot()+
  geom_point(aes(x = year, y = mean_lifeExp, color = continent))+ 
  geom_line(aes(x = year, y = mean_lifeExp, color = continent)
            