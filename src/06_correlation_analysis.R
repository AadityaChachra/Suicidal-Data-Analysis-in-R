library(dplyr)
library(ggplot2)

if (!dir.exists("output")) {
  dir.create("output")
}

clean_data <- read.csv("output/clean_suicide_data_with_rate.csv")

cor_test_result <- cor.test(
  clean_data$gdp_per_capita,
  clean_data$suicides_per_100k_calc,
  use = "complete.obs",
  method = "pearson"
)

cor_value <- cor_test_result$estimate
p_value <- cor_test_result$p.value

cat("Correlation between GDP per capita and suicide rate:\n")
cat("  Correlation coefficient:", cor_value, "\n")
cat("  p-value:", p_value, "\n")

ggplot(clean_data, aes(x = gdp_per_capita, y = suicides_per_100k_calc)) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(
    title = "Correlation Between GDP Per Capita and Suicide Rates",
    x = "GDP Per Capita",
    y = "Suicides per 100k Population"
  ) +
  theme_minimal()

ggsave("output/gdp_vs_suicide_rate.png", width = 8, height = 6)

message("Correlation analysis and plot complete. Plot saved to 'output/gdp_vs_suicide_rate.png'.")
