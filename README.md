# Data-Engineering-Week-2-Assignment
## 1. Total Debt Owed by All Countries
- **Logic**: Summed the `debt` column across all rows.
- **Purpose**: Provides an overview of the global debt burden.
- **Finding**: The aggregate external debt is **$2,823,894,600,000**.

## 2. Number of Distinct Countries
- **Logic**: Counted unique `country_name` values, excluding nulls to ensure accuracy.
- **Purpose**: Determines the geographic scope of the dataset.
- **Insight**: **125 countries** are represented, indicating global coverage.

## 3. Types of Debt Indicators
- **Logic**: Extracted unique `indicator_name` values to list all debt indicators.
- **Purpose**: Identifies the types of debt metrics tracked.
- **Finding**: A wide variety of debt metrics are present, including:
  - Principal repayments
  - Interest payments
  - Disbursements
  - Specificity by creditor type (e.g., PPG vs. PNG, official vs. private creditors).

## 4. Country with the Highest Total Debt
- **Logic**: Grouped rows by `country_name`, summed the `debt` for each country, filtered out empty country names, and sorted in descending order.
- **Purpose**: Identifies the country with the largest debt burden.
- **Finding**: **China** has the highest total debt at **$266,455,760,000**, reflecting its status as a large economy with significant borrowing.

## 5. Average Debt Across Debt Indicators
- **Logic**: Grouped rows by `indicator_name`, calculating the average debt for each indicator across all countries.
- **Purpose**: Shows which debt indicators have higher or lower average values, indicating their relative scale.
- **Findings**:
  - Higher averages:
    - Principal repayments on external debt, long-term: **$6.385B**
    - Principal repayments on external debt, private nonguaranteed: **$5.617B**
    - Disbursements on external debt, long-term: **$1.952B**
  - Lower averages:
    - Interest payments, PPG, commercial banks (INT): **$177M**
    - Interest payments, PPG, bilateral (INT): **$134M**
    - Interest payments, PPG, multilateral (INT): **$131M**
  - **Insight**: Larger transaction sizes are reflected in disbursements and principal repayments compared to interest payments.

## 6. Country with the Highest Principal Repayments
- **Logic**: Filtered for the indicator representing principal repayments, excluded null debt and empty country names, grouped by country, and sorted to find the highest repayment.
- **Purpose**: Identifies the country with the largest principal repayment.
- **Finding**: **China** has the highest principal repayments at **$96.218B**, indicating active debt management.

## 7. Most Common Debt Indicator
- **Logic**: Grouped by `indicator_name`, counted unique countries per indicator, and identified the indicator reported by the most countries.
- **Purpose**: Determines which debt indicator is most widely applicable across countries.
- **Finding**: The top indicator (PPG, official creditors (AMT, current US$) which are principal repayments on debt owed to official creditors ) is reported by many countries, reflecting its widespread applicability.

## 8. Additional Trends
### a. Countries with the Highest New Disbursements
- **Logic**: Filtered for the indicator representing new funds received from long-term external debt, summed debt by country, excluded nulls and empty country names, and listed the top five countries.
- **Purpose**: Identifies countries receiving the most new debt, indicating high borrowing activity.
- **Findings**:
  - Top countries: **IDA, South Asia, Cameroon, China, and India**.
  - These are emerging economies or countries with significant infrastructure/development projects, reflecting reliance on external financing.
  - **Note**: IDA-only countries (78 eligible nations, mostly in Africa, East Asia, Latin America, and the Caribbean) have low average incomes and limited access to private finance, relying on grants and low-interest loans.

### b. Creditor Type Receiving the Highest Principal Repayments
- **Logic**: Categorized debt indicators into official or private creditors using a CASE statement, summed debt for principal repayments, and compared totals. A WHERE clause ensured only relevant indicators were included.
- **Purpose**: Determines whether official or private creditors receive more principal repayments, reflecting creditor prioritization.
- **Findings**:
  - **Private creditors**: **$148.73B**
  - **Official creditors**: **$132.51B**
  - **Insight**: Countries are repaying private creditors (e.g., commercial banks, bondholders) at a slightly higher rate, possibly due to higher interest rates or shorter loan terms.
