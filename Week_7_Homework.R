
library(tidyverse)

gapminder <- read_csv("data/gapminder.csv")


gapminder_filtered <- gapminder %>%
  filter(year %in% c(2002, 2007)) %>%        
  select(country, continent, year, pop) %>%  
  spread(key = year, value = pop) %>%         
  rename(pop_2002 = `2002`, pop_2007 = `2007`) %>% 
  mutate(pop_diff = pop_2007 - pop_2002)     

gapminder_filtered %>% 
  filter(continent != "Oceania") %>% 
  ggplot(aes(x = reorder(country, pop_diff), y = pop_diff)) +  
  geom_col(aes(fill = continent)) +
  facet_wrap(~ continent, scales = "free") +
  theme_bw() +
  scale_fill_viridis_d() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        legend.position = "none") +
  xlab("Country") +
  ylab("Change in Population Between 2002 and 2007")

