library(readr)
data <- read_csv("loan_data.csv")

# Filter data that include Age only less than 60 and Credit History less than 20
mani_data <- subset(data,person_age<60 & cb_person_cred_hist_length<20)

# Histogram of both independent variable and dependent variable
hist(mani_data$person_age, xlab = "Age (Years)", main = "Histogram of Age")
hist(mani_data$cb_person_cred_hist_length, xlab = "Credit History Length (Years)", main = "Histogram of Credit History Length")

# Make test on both variables
cor.test(mani_data$person_age, mani_data$cb_person_cred_hist_length, method="pearson")
##  Result :==
# Pearson's product-moment correlation

# data:  mani_data$person_age and mani_data$cb_person_cred_hist_length
# t = 360.95, df = 44695, p-value < 2.2e-16
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  0.8604993 0.8652356
# sample estimates:
#       cor 
# 0.8628864 

# Make graph and line
plot(mani_data$person_age, mani_data$cb_person_cred_hist_length, xlab = "Age (Years)", ylab = "Credit History Legnth (Years)", main = "Scatterplot of Age vs Credit History Length")
abline(lm(mani_data$person_age ~ mani_data$cb_person_cred_hist_length), col = "red")

