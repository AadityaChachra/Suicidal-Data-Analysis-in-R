library(dplyr)
library(ggplot2)

if (!dir.exists("output")) {
  dir.create("output")
}

clean_data <- read.csv("output/clean_suicide_data_with_rate.csv")

t_test_result <- t.test(
  suicides_per_100k_calc ~ sex,
  data = clean_data,
  var.equal = FALSE,
  alternative = "two.sided"
)

cat("T-test for difference in suicide rates by gender:\n")
cat("  t-value:", t_test_result$statistic, "\n")
cat("  p-value:", t_test_result$p.value, "\n")
cat("  Mean rate (M):", t_test_result$estimate[1], "\n")
cat("  Mean rate (F):", t_test_result$estimate[2], "\n")

ggplot(clean_data, aes(x = sex, y = suicides_per_100k_calc, fill = sex)) +
  geom_boxplot(alpha = 0.7, outlier.color = "red", outlier.shape = 8) +
  stat_summary(fun = mean, geom = "point", shape = 4, size = 4, color = "black") +
  labs(
    title = "Comparison of Suicide Rates by Gender",
    x = "Gender",
    y = "Suicides per 100k Population",
    fill = "Gender"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("output/t_test_gender_boxplot.png", width = 8, height = 6)

message("T-test analysis and visualization complete. Boxplot saved to 'output/t_test_gender_boxplot.png'.")
