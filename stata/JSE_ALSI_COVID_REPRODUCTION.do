* ================================================================
* JSE/ALSI COVID-19 Market Volatility Analysis
* Reproduction script for the final statistical analysis
*
* Note: This script reproduces the statistical tests documented in
* the final SMCL log from the final .dta dataset. It does not claim
* to recreate the original raw-data construction/period-labeling
* process, which is not contained in the submitted files.
* ================================================================

clear all
set more off

* Load final analytical dataset
use "../data/JSE_ALSI_COVID_FINAL_ANALYSIS.dta", clear

* -----------------------------
* 1. Data structure and checks
* -----------------------------
describe
tabulate period, missing
misstable summarize date_stata close daily_return abs_daily_return

* -----------------------------
* 2. Descriptive statistics
* -----------------------------
tabstat abs_daily_return, by(period) statistics(n mean sd min max)

* -----------------------------
* 3. Normality assessment
* -----------------------------
bysort period: swilk abs_daily_return if period < .

* -----------------------------
* 4. Equality of variances
* -----------------------------
robvar abs_daily_return, by(period)

* Classical one-way ANOVA
oneway abs_daily_return period, tabulate

* -----------------------------
* 5. Non-parametric inference
* -----------------------------
kwallis abs_daily_return, by(period)

* Pairwise Wilcoxon rank-sum tests
ranksum abs_daily_return if period == 1 | period == 2, by(period)
ranksum abs_daily_return if period == 2 | period == 3, by(period)
ranksum abs_daily_return if period == 1 | period == 3, by(period)

* -----------------------------
* 6. Date coverage
* -----------------------------
summarize date_stata

* End of reproduction script
