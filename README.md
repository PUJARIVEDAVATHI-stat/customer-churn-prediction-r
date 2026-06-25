# Customer Churn Prediction in Telecom Using R
📄 Project Report:
[Customer Churn Prediction in the Telecom Industry.pdf](./Customer%20Churn%20Prediction%20in%20the%20Telecom%20Industry.pdf)

## Project Overview

Customer churn is one of the most critical business challenges in the telecom industry. Retaining existing customers is often more cost-effective than acquiring new customers.

This project analyzes customer churn behavior using the IBM Telco Customer Churn Dataset and applies statistical techniques to identify the key factors associated with customer attrition.

---

## Project Objective

The objective of this project is to:

- Identify factors influencing customer churn.
- Analyze customer behavior using statistical methods.
- Generate actionable business recommendations.
- Support customer retention strategies through data-driven insights.

---

## Dataset Information

Dataset: IBM Telco Customer Churn Dataset

Records: 7,043 customers

Variables: 21 customer attributes

Target Variable: Churn (Yes / No)

Features include:

- Customer demographics
- Service subscriptions
- Contract information
- Monthly charges
- Total charges
- Customer tenure

---

## Tools & Technologies

- R Programming
- ggplot2
- Statistical Analysis
- Hypothesis Testing
- Logistic Regression
- GitHub

---

## Statistical Techniques Used

### Descriptive Statistics

- Data dimensions
- Missing value analysis
- Churn distribution

### Inferential Statistics

#### Chi-Square Test

Used to determine the association between Contract Type and Customer Churn.

#### Welch Two-Sample t-Test

Used to compare:

- Monthly Charges by Churn Status
- Customer Tenure by Churn Status

### Logistic Regression

Used to predict customer churn probability based on:

- Tenure
- Monthly Charges
- Contract Type

---

## Key Findings

### Churn Distribution

- Total Customers: 7,043
- Churned Customers: 1,869 (26.54%)
- Retained Customers: 5,174 (73.46%)

### Contract Type Analysis

Customers with Month-to-Month contracts exhibited the highest churn rates.

Chi-Square Test Result:

- p-value < 0.001

Result:

Contract type and churn are significantly associated.

### Monthly Charges Analysis

Average Monthly Charges:

- Churned Customers: $74.44
- Retained Customers: $61.31

Result:

Customers paying higher monthly charges are more likely to churn.

### Tenure Analysis

Average Tenure:

- Churned Customers: 17.98 months
- Retained Customers: 37.65 months

Result:

Customers with shorter tenure are significantly more likely to leave.

---

## Business Recommendations

- Encourage long-term contracts through loyalty incentives.
- Monitor customers with high monthly charges.
- Improve onboarding programs for new customers.
- Identify at-risk customers early using predictive analytics.

---

## Project Outcome

The analysis successfully identified major churn drivers and demonstrated how statistical methods can support business decision-making and customer retention strategies.

---

## Author

Vedavathi Pujari

MSc Statistics | Data Analyst | R | Python | SQL
