library(dplyr)
library(ggplot2)

if (!dir.exists("output")) {
  dir.create("output")
}

clean_data <- read.csv("output/clean_suicide_data_with_rate.csv")

country_rates <- clean_data %>%
  group_by(country) %>%
  summarise(
    avg_rate = mean(suicides_per_100k_calc, na.rm = TRUE),
    .groups = "drop"
  )

top_5_countries <- country_rates %>%
  arrange(desc(avg_rate)) %>%
  slice_head(n = 5) %>%
  pull(country)

top5_data <- clean_data %>%
  filter(country %in% top_5_countries)

plot_data <- top5_data %>%
  group_by(country, year) %>%
  summarise(total_suicides = sum(suicides_no, na.rm = TRUE), .groups = "drop")

ggplot(plot_data, aes(x = year, y = total_suicides, color = country, group = country)) +
  geom_line(size = 1) +
  geom_point() +
  labs(
    title = "Total Suicides Over Time (Top 5 Countries by Suicide Rate)",
    x = "Year",
    y = "Total Suicides",
    color = "Country"
  ) +
  theme_minimal()

ggsave("output/top5_countries_suicides_over_time.png", width = 8, height = 6)