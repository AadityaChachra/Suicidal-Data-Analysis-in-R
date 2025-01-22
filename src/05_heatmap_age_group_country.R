library(dplyr)
library(ggplot2)
library(viridis)

if (!dir.exists("output")) {
  dir.create("output")
}

clean_data <- read.csv("output/clean_suicide_data_with_rate.csv")

heatmap_data <- clean_data %>%
  group_by(country, age) %>%
  summarise(
    avg_suicide_rate = mean(suicides_per_100k_calc, na.rm = TRUE),
    .groups = "drop"
  )

country_groups <- split(heatmap_data$country, ceiling(seq_along(heatmap_data$country) / 20))

for (i in seq_along(country_groups)) {
  group_data <- heatmap_data %>%
    filter(country %in% country_groups[[i]])
  
  p <- ggplot(group_data, aes(x = age, y = country, fill = avg_suicide_rate)) +
    geom_tile(color = "white") +
    scale_fill_viridis(name = "Avg Rate\n(per 100k)", option = "C") +
    labs(
      title = paste("Heatmap of Suicide Rates by Age Group (Group", i, ")"),
      x = "Age Group",
      y = "Country"
    ) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
      axis.text.y = element_text(size = 8),
      plot.title = element_text(hjust = 0.5, size = 14)
    )
  
  ggsave(
    filename = paste0("output/heatmap_group_", i, ".png"),
    plot = p,
    width = 10,
    height = 8
  )
}

message("Heatmaps created and saved to 'output/' directory.")
