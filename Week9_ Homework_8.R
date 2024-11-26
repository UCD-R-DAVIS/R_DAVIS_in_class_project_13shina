library(tidyverse)
library(lubridate)

mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")


mloa_cleaned <- mloa %>%
  mutate(across(c(rel_humid, temp_C_2m, windSpeed_m_s), ~ ifelse(. == -999.9, NA, .)))

mloa_filtered <- mloa_cleaned %>%
  filter(!is.na(rel_humid) & !is.na(temp_C_2m) & !is.na(windSpeed_m_s))

mloa_filtered <- mloa_filtered %>%
  mutate(datetime = make_datetime(year, month, day, hour24, min))

mloa_filtered <- mloa_filtered %>%
  mutate(datetimeLocal = with_tz(datetime, tzone = "Pacific/Honolulu"))

mean_temp <- mloa_filtered %>%
  mutate(month = month(datetimeLocal, label = TRUE),  
         hour = hour(datetimeLocal)) %>%             
  group_by(month, hour) %>%
  summarize(mean_temp = mean(temp_C_2m, na.rm = TRUE), .groups = "drop") 

ggplot(mean_temp, aes(x = month, y = mean_temp, color = as.factor(hour))) +
  geom_point() +
  scale_color_viridis_d(name = "Local Hour") +  
  labs(title = "Mean Monthly Temperature by Hour (2001)",
       x = "Month",
       y = "Mean Temperature (°C)") +
  theme_minimal()
