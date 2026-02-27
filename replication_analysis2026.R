rm(list = ls())
setwd("~/R Practice/labourmarket-final")
# This tells R: "Look in 'data', then in 'clean', and find the file"
df_clean <- read.csv("data/ashe_table1_5a_all_clean.csv", check.names = FALSE)
summary(df_clean)

# 2. THE CLEANING: Filter out the footnote rows immediately
# We do this once so the "noise" is gone for the rest of the script
df_clean <- df_clean[!is.na(as.numeric(as.character(df_clean$median_hourly_pay))), ]

# 3. THE CALCULATIONS: Add your new columns
df_clean$log_wage <- log(df_clean$median_hourly_pay)
df_clean$ratio_90_10 <- df_clean$"90.0" / df_clean$"10.0"

# --- 4. SUMMARY STATISTICS TABLE ---
# install.packages("vtable")
library(vtable)
sumtable(df_clean, vars = c('median_hourly_pay', 'jobs_thousands', 'ratio_90_10'))

# --- 5. ECONOMETRIC ANALYSIS ---
# Level-Level OLS
model_level <- lm(median_hourly_pay ~ jobs_thousands, data = df_clean)
summary(model_level)

# Log-Level OLS (Checklist: Run log(wage) regression)
model_log <- lm(log_wage ~ jobs_thousands, data = df_clean) # Define it here!
summary(model_log) # Now you can summarize it

# --- 6. OUTPUTS (Fixed Figure 3) ---

# 1. Select the specific columns for the first row (All Employees)
# Note: "median_hourly_pay" is used instead of "50.0"
percentiles_data <- unlist(df_clean[1, c("10.0", "25.0", "median_hourly_pay", "75.0", "90.0")])

# 2. Plot the bar chart
barplot(as.numeric(percentiles_data), 
        names.arg = c("10th", "25th", "Median", "75th", "90th"), 
        main = "UK Hourly Pay Distribution (All Employees)", 
        col = "darkgreen", 
        ylab = "£ per hour",
        ylim = c(0, max(as.numeric(percentiles_data)) + 5))

# Add the actual values on top of the bars so it looks professional
text(x = seq(from = 0.7, to = 5.5, length.out = 5), 
     y = as.numeric(percentiles_data) + 2, 
     labels = round(as.numeric(percentiles_data), 2))