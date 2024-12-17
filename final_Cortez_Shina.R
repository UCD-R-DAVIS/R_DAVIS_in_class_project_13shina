library(tidyverse)

url <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv")

data <- read_csv(url)

data <- data %>% 
  filter(!is.na(activity_type))

data <- data %>% 
  mutate(minutes_per_mile = elapsed_time / distance) %>% 
  filter(minutes_per_mile <= 10 & minutes_per_mile >= 5 & elapsed_time > 1)

data <- data %>% 
  mutate(time_period = case_when(
    timestamp < as.Date("2024-01-01") ~ "pre_2024",
    timestamp >= as.Date("2024-01-01") & timestamp <= as.Date("2024-06-30") ~ "jan_june_2024",
    timestamp > as.Date("2024-06-30") ~ "post_july_2024"
  ))

plot1 <- data %>% 
  ggplot(aes(x = speed, y = strides_per_minute, color = time_period)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Relationship Between Speed and SPM",
       x = "Speed (miles per hour)",
       y = "Strides per Minute (SPM)",
       color = "Time Period") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    legend.position = "top",
    panel.grid.major = element_line(color = "grey80")
  )

print(plot1)
