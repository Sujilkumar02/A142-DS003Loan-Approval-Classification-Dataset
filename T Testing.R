# T-TEST ASSUMPTION CHECKS

# Homogeneity of Variances (Levene's Test)
    levene_test_result <- leveneTest(loan_int_rate ~ previous_loan_defaults_on_file, data = data_clean)

    print("--- Levene's Test for Homogeneity of Variances ---")
    print(levene_test_result)
  
    # Output
      #  Levene's Test for Homogeneity of Variance (center = median)
      #  Df F value    Pr(>F)    
      #  group     1  375.49 < 2.2e-16 ***
      #  44998                      
      #  ---
      #  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# HYPOTHESIS TESTING: TWO-SAMPLE T-TEST

# Run the T-Test using Welch's T-test (var.equal = FALSE) for robustness against unequal variances.
    t_test_result <- t.test(loan_int_rate ~ previous_loan_defaults_on_file,
    data = data_clean, var.equal = FALSE)

    print("--- Two-Sample T-Test Result ---")
    print(t_test_result)
    
    # Output
      # Welch Two Sample t-test
    
      # data:  loan_int_rate by previous_loan_defaults_on_file
      # t = 39.133, df = 43749, p-value < 2.2e-16
      # alternative hypothesis: true difference in means between group No and group Yes is not equal to 0
      # 95 percent confidence interval:
      # 1.028966 1.137475
      # sample estimates:
      # in group No mean in group Yes 
      # 11.55683          10.47361