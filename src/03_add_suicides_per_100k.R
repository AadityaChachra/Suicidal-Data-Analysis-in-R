library(dplyr)

if (!dir.exists("output")) {
  dir.create("output")
}

clean_data <- read.csv("Data/clean_suicide_data.csv")

clean_data <- clean_data %>%
  mutate(
    suicides_per_100k_calc = (suicides_no / population) * 100000
  )

write.csv(clean_data, "output/clean_suicide_data_with_rate.csv", row.names = FALSE)
