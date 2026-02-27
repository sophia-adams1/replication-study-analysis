**Econometric Replication: Minimum Wages & Low-Wage Jobs**
This repository features a high-fidelity replication of the seminal study by Cengiz et al. (2019), "The Effect of Minimum Wages on Low-Wage Jobs". This project demonstrates an end-to-end analytical workflow—from raw data cleaning in R to the implementation of advanced causal inference frameworks.

**Technical Skills & Application:**
* Causal Inference: Implemented a stacked Difference-in-Differences (DiD) approach to mitigate biases associated with staggered treatment timing in panel data.
* Statistical Rigor: Applied clustered standard errors to ensure statistical validity across geographic and temporal units.
* Data Hygiene: Developed an R script to clean "noisy" ASHE labor market data, specifically filtering footnote rows and handling missing values to prepare for modelling.
* Econometric Modelling: Conducted Level-Level and Log-Level OLS regressions to analyse the relationship between job density and median hourly pay.
* Visualisation: Created publication-quality visuals, including a distribution analysis of UK hourly pay and a coefficient plot mapping employment effects across 31 index-ordered wage bins.

Econometric Methodology & Significance:

1. Addressing Bias with Stacked Difference-in-Differences (DiD):
A core challenge in policy evaluation is staggered treatment timing—where different regions implement minimum wage changes at different times. Standard DiD estimators can become biased in these settings. Following the methodology in my report, I utilised a stacked DiD framework. This involved creating clean sub-experiments for each policy event to avoid comparing "newly treated" units to "already treated" units, which can lead to negative weights and invalid estimates.
Significance: This demonstrates an understanding of the "Credibility Revolution" in econometrics and the ability to apply modern solutions to complex panel data.

2. Functional Form & Elasticity:
In the R script (replication_analysis2026.R), I implemented both Level-Level and Log-Level OLS models. By regressing log(median_hourly_pay) against employment levels, I moved beyond simple correlations to calculate semi-elasticities.
Significance: In labor economics, wages are rarely linear. Using log-transformations is the industry standard for handling skewed wage distributions and providing results that are easier for policy-makers to interpret (e.g., "A 1% increase in X leads to a Y% change in employment").

3. Precision via Clustered Standard Errors:
To account for the fact that employment shocks are likely correlated within specific regions or years, I applied clustered standard errors.
Significance: This ensures that the p-values and confidence intervals reported are robust. This also shows priotity of statistical integrity over simply chasing "significant" results.

4. The "Bunching" Approach & Distributional Analysis:
Instead of calculating a single "average" effect of the minimum wage, this project replicates the bunching method used by Cengiz et al. (2019). The analysis tracks employment changes across 31 distinct wage bins (indexed 1-31).
Significance: This provides a granular view of the labour market. It allows us to see if jobs are being "destroyed" or simply "shifted" up the wage ladder (spillover effects). This type of distributional analysis is vital for nuanced policy recommendations.

5. Data Engineering for Reproducible Research:
The provided R script automates the cleaning of the ASHE (Annual Survey of Hours and Earnings) dataset. It programmatically removes non-numeric footnote noise and handles missing values to ensure the pipeline is 100% reproducible.
Significance: It proves that I can take raw, "messy" government data and transform it into a publication-quality analytical dataset without manual, error-prone interventions in Excel.

**Project Components:**
replication_analysis2026.R: The primary data pipeline used for cleaning, summary statistics (vtable), and initial regression analysis.
Sophia_Adams_Econometrics_Replication_2026.pdf: A comprehensive technical report detailing the stacked DiD methodology, robustness checks, and key findings.

You can access the full technical analysis and findings here: [Sophia_Adams_Econometrics_Replication_2026.pdf](https://github.com/user-attachments/files/25605833/Sophia_Adams_Econometrics_Replication_2026.pdf)
