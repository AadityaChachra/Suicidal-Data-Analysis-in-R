library(dplyr)
library(ggplot2)
library(gridExtra)

if (!dir.exists("output")) {
  dir.create("output")
}

clean_data <- read.csv("output/clean_suicide_data_with_rate.csv")

cat("===== BASIC SUMMARY =====\n")
cat("Data dimensions:", dim(clean_data), "\n")
cat("Countries in dataset:", paste(unique(clean_data$country), collapse = ", "), "\n")
cat("Years in dataset:", paste(unique(clean_data$year), collapse = ", "), "\n")

cat("\n--- Summary of suicides_per_100k_calc ---\n")
print(summary(clean_data$suicides_per_100k_calc))

cat("\n--- Summary of GDP per capita ---\n")
print(summary(clean_data$gdp_per_capita))

cat("\n===== KEY FINDINGS =====\n")
cat("1) From the correlation analysis between GDP per capita and suicide rates:\n")
cat("   - If correlation coefficient is significantly > 0 or < 0, we interpret that relationship accordingly.\n")
cat("   - If p-value < 0.05, correlation is statistically significant.\n\n")

cat("2) From the t-test analysis between male and female suicide rates:\n")
cat("   - Check if p-value < 0.05; if yes, the difference in mean suicide rate between genders is significant.\n")

p1 <- ggplot(clean_data, aes(x = suicides_per_100k_calc)) +
  geom_histogram(binwidth = 2, fill = "steelblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Distribution of Suicide Rates (per 100k)",
    x = "Suicides per 100k",
    y = "Count"
  )

p2 <- ggplot(clean_data, aes(x = sex, y = suicides_per_100k_calc, fill = sex)) +
  geom_boxplot(outlier.color = "red", alpha = 0.6) +
  theme_minimal() +
  labs(
    title = "Suicide Rates by Gender",
    x = "Gender",
    y = "Suicides per 100k"
  ) +
  theme(legend.position = "none")

ggsave("output/suicide_rate_distribution.png", plot = p1, width = 8, height = 6)
ggsave("output/suicide_rate_by_gender.png", plot = p2, width = 8, height = 6)

message("Summary report complete. See console output and saved plots in 'output/' directory.")
