#  R code used for analysis and visualisation 
    install.packages("tidyverse")
    install.packages("car")

    library(tidyverse)
    library(car)
    
# Load data
    data <- read.csv("loan_data.csv")
    
# Clean the data: drop rows with missing values in key variables and ensure the grouping variable is a factor.
    data_clean <- data %>%
      drop_na(loan_int_rate, previous_loan_defaults_on_file) %>%
      mutate(previous_loan_defaults_on_file = factor(previous_loan_defaults_on_file))

# DESCRIPTIVE STATISTICS
    summary_stats <- data_clean %>%
      group_by(previous_loan_defaults_on_file) %>%
      summarise(
        N = n(),
        Mean_Interest_Rate = mean(loan_int_rate),
        SD_Interest_Rate = sd(loan_int_rate)
      )
    
    print("--- Summary Statistics ---")
    print(summary_stats)
    
    # Output :=
    
    # previous_loan_defaults_on_file     N Mean_Interest_Rate SD_Interest_Rate
    # <fct>                          <int>              <dbl>            <dbl>
    # 1 No                             22142               11.6             3.13
    # 2 Yes                            22858               10.5             2.72


