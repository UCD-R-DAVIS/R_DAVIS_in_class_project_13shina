library(tidyverse)
library(lubridate)

surveys <- read.csv("data/portal_data_joined.csv")

mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

taxa <- unique(surveys$taxon)  
for (t in taxa) {
  species_names <- surveys$species[which(surveys$taxon == t)]  
  longest_name <- species_names[which.max(nchar(species_names))]  
  cat("Taxon:", t, "- Longest species name:", longest_name, "\n")
}

mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

columns_to_check <- c("windDir", "windSpeed_m_s", "baro_hPa", "temp_C_2m", 
                      "temp_C_10m", "temp_C_towertop", "rel_humid", "precip_intens_mm_hr")

max_values <- map_dbl(columns_to_check, ~ max(mloa[[.x]], na.rm = TRUE))
names(max_values) <- columns_to_check
print(max_values)

C_to_F <- function(celsius) {
  return(celsius * 1.8 + 32)
}

mloa <- mloa %>%
  mutate(temp_F_2m = C_to_F(temp_C_2m),
         temp_F_10m = C_to_F(temp_C_10m),
         temp_F_towertop = C_to_F(temp_C_towertop))

