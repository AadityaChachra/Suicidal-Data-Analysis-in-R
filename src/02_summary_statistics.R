library(dplyr)

if (!dir.exists("output")) {
  dir.create("output")
}

clean_data <- read.csv("Data/clean_suicide_data.csv")

summary_stats <- clean_data %>%
  group_by(country, year, sex, age) %>%
  summarise(
    total_suicides       = sum(as.numeric(suicides_no), na.rm = TRUE),
    avg_suicide_rate     = mean(as.numeric(suicides.100k.pop), na.rm = TRUE),
    avg_population       = mean(as.numeric(population), na.rm = TRUE),
    .groups = "drop"
  )

write.csv(summary_stats, "output/summary_statistics.csv", row.names = FALSE)

message("Summary statistics created and saved to 'output/summary_statistics.csv'.")
