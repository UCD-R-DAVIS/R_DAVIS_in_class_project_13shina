library(tidyverse)
url <- 'https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv'
lap_dt <- read_csv(url)

head(lap_dt)

running <- lap_dt %>%
  filter(sport == 'running') %>%  
  filter(total_elapsed_time_s >= 60) %>%
  filter(minutes_per_mile < 10 & minutes_per_mile > 5) %>%
  
  mutate(pace_category = case_when( minutes_per_mile < 6 ~ "fast", minutes_per_mile < 8 ~"medium", TRUE ~ "slow"),
    form = case_when(year == 2024 ~ 'new', TRUE ~ 'old'))

summary_table <- running %>% 
  group_by(form,pace_category) %>% 
  summarise(avg_steps_per_minute = mean(steps_per_minute, na.rm = TRUE)) %>%
  pivot_wider(names_from = pace_category, values_from = avg_steps_per_minute) %>%
  select(form, slow, medium, fast)


