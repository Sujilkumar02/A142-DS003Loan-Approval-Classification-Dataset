
# Load the dataset. Note: The file name has spaces, so it must be quoted.
data <- read.csv("loan_data (1).csv")

# A. Comparative Boxplot (Excellent for comparing means/distributions)
boxplot <- ggplot(data_clean, aes(x = previous_loan_defaults_on_file, y = loan_int_rate, fill = previous_loan_defaults_on_file)) +
  geom_boxplot() +
  labs(
    title = "Comparison of Loan Interest Rates by Previous Default Status",
    x = "Record of Previous Loan Defaults",
    y = "Loan Interest Rate (%)"
  ) +
  theme_minimal() +
  scale_fill_manual(values = c("No" = "skyblue", "Yes" = "salmon")) +
  theme(legend.position = "none")

# Save the plot (must be done to include in report)
ggsave("boxplot_interest_rate.png", plot = boxplot, width = 6, height = 5)

# B. Supplementary Graph: Histogram for the overall distribution (often required)
histogram <- ggplot(data_clean, aes(x = loan_int_rate)) +
  geom_histogram(binwidth = 1, fill = "darkblue", color = "white") +
  labs(
    title = "Distribution of Loan Interest Rates",
    x = "Loan Interest Rate (%)",
    y = "Frequency"
  ) +
  theme_minimal()

# Save the plot
ggsave("histogram_interest_rate.png", plot = histogram, width = 6, height = 5)

