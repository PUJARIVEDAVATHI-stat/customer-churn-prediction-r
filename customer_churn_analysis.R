# ============================================================
# CUSTOMER CHURN PREDICTION IN TELECOM USING R
# ============================================================

# View the complete dataset to understand the available variables
View(WA_Fn_UseC_Telco_Customer_Churn)

# Check the number of rows (customers) and columns (features)
dim(WA_Fn_UseC_Telco_Customer_Churn)

# Display all column names in the dataset
names(WA_Fn_UseC_Telco_Customer_Churn)

# Check missing values in each column
# This helps identify data quality issues before analysis
colSums(is.na(WA_Fn_UseC_Telco_Customer_Churn))


# ============================================================
# CHURN DISTRIBUTION ANALYSIS
# ============================================================

# Count the number of customers who churned and did not churn
table(WA_Fn_UseC_Telco_Customer_Churn$Churn)

# Calculate percentage distribution of churn status
# This shows the proportion of retained and lost customers
prop.table(
  table(WA_Fn_UseC_Telco_Customer_Churn$Churn)
) * 100

# Remove records containing missing values
# Required for accurate statistical analysis and modeling
churn_data <- na.omit(WA_Fn_UseC_Telco_Customer_Churn)


# ============================================================
# PIE CHART OF CUSTOMER CHURN DISTRIBUTION
# ============================================================

library(ggplot2)

# Create a frequency table of churn categories
churn_df <- as.data.frame(table(churn_data$Churn))

# Rename columns for better readability
colnames(churn_df) <- c("Churn", "Count")

# Calculate percentage of customers in each churn category
churn_df$Percentage <- round(
  churn_df$Count / sum(churn_df$Count) * 100,
  2
)

# Create a pie chart showing churn percentage distribution
ggplot(churn_df,
       aes(x = "",
           y = Count,
           fill = Churn)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  geom_text(
    aes(label = paste0(Percentage, "%")),
    position = position_stack(vjust = 0.5),
    size = 5
  ) +
  labs(title = "Customer Churn Distribution") +
  theme_void()


# ============================================================
# DONUT CHART OF CUSTOMER CHURN DISTRIBUTION
# ============================================================

# Re-create frequency table for donut chart visualization
churn_df <- as.data.frame(table(churn_data$Churn))

# Rename columns
colnames(churn_df) <- c("Churn", "Count")

# Calculate percentages
churn_df$Percentage <- round(
  churn_df$Count / sum(churn_df$Count) * 100,
  2
)

# Create a donut chart to visualize churn percentages
ggplot(churn_df,
       aes(x = 2,
           y = Count,
           fill = Churn)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  xlim(0.5, 2.5) +
  geom_text(
    aes(label = paste0(Percentage, "%")),
    position = position_stack(vjust = 0.5),
    size = 5
  ) +
  theme_void() +
  labs(title = "Customer Churn Distribution")


# ============================================================
# CONTRACT TYPE VS CUSTOMER CHURN
# ============================================================

# Count customers in each contract category
table(churn_data$Contract)

# Create a contingency table between Contract Type and Churn Status
# Used to examine whether contract type influences churn
table(churn_data$Contract,
      churn_data$Churn)

# Perform Chi-Square Test of Independence
# Variables:
#   Contract (Categorical)
#   Churn (Categorical)
# Objective:
#   Determine whether customer churn depends on contract type
chisq.test(
  table(churn_data$Contract,
        churn_data$Churn)
)


# ============================================================
# MONTHLY CHARGES VS CUSTOMER CHURN
# ============================================================

# Calculate average monthly charges for churned and retained customers
aggregate(
  MonthlyCharges ~ Churn,
  data = churn_data,
  FUN = mean
)

# Create boxplot to compare Monthly Charges across churn groups
# Variables:
#   MonthlyCharges (Numerical)
#   Churn (Categorical)
ggplot(churn_data,
       aes(x = Churn,
           y = MonthlyCharges,
           fill = Churn)) +
  geom_boxplot() +
  labs(
    title = "Monthly Charges by Churn Status",
    x = "Churn",
    y = "Monthly Charges"
  ) +
  theme_minimal()

# Perform Independent Samples t-Test
# Variable:
#   MonthlyCharges
# Groups:
#   Churn = Yes and Churn = No
# Objective:
#   Determine whether average monthly charges differ
#   significantly between churned and retained customers
t.test(
  MonthlyCharges ~ Churn,
  data = churn_data
)


# ============================================================
# TENURE VS CUSTOMER CHURN
# ============================================================

# Calculate average customer tenure for churned and retained customers
aggregate(
  tenure ~ Churn,
  data = churn_data,
  FUN = mean
)

# Create boxplot to compare customer tenure across churn groups
# Variables:
#   tenure (Numerical)
#   Churn (Categorical)
ggplot(churn_data,
       aes(x = Churn,
           y = tenure,
           fill = Churn)) +
  geom_boxplot() +
  labs(
    title = "Tenure by Churn Status",
    x = "Churn",
    y = "Tenure (Months)"
  ) +
  theme_minimal()

# Perform Independent Samples t-Test
# Variable:
#   tenure
# Groups:
#   Churn = Yes and Churn = No
# Objective:
#   Determine whether average customer tenure differs
#   significantly between churned and retained customers
t.test(
  tenure ~ Churn,
  data = churn_data
)