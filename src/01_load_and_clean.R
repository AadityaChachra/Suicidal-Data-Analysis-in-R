library(dplyr)
library(readr)
library(stringr)


raw_data <- read_csv("Data/master.csv")


head(raw_data)
str(raw_data)
colnames(raw_data)


clean_data <- raw_data %>%
  filter(
    !is.na(suicides_no),
    !is.na(population)
  )


clean_data <- clean_data %>%
  distinct()


clean_data <- clean_data %>%
  mutate(
    year          = as.integer(year),
    suicides_no   = as.numeric(suicides_no),
    population    = as.numeric(population),
    gdp_for_year  = as.numeric(str_remove_all(`gdp_for_year ($)`, "[^0-9]")),
    gdp_per_capita = as.numeric(`gdp_per_capita ($)`)
  )

write_csv(clean_data, "Data/clean_suicide_data.csv")
message("Data loaded and cleaned successfully.")