# Impact of COVID-19 on JSE/ALSI Market Volatility

Statistical analysis of absolute daily returns across **Pre-COVID, COVID Shock, and Recovery** periods.

## Project Overview

This Computational Finance project examines whether the magnitude of daily movements in the Johannesburg Stock Exchange All Share Index (JSE/ALSI) changed materially during the COVID-19 shock and whether the market moved back toward pre-shock conditions during the recovery period.

The analysis uses **absolute daily return as a proxy for the magnitude of market movements**. It is not presented as a direct estimate of implied or realized volatility.

## Research Questions

1. Did the magnitude of daily market movements differ across the three periods?
2. Was the COVID Shock period associated with materially higher absolute returns?
3. Did the Recovery period become statistically comparable with Pre-COVID conditions?

## Dataset

- **Index:** JSE/ALSI (J203 / Yahoo Finance `^J203.JO`)
- **Period covered:** 02 January 2019 – 31 December 2020
- **Total observations:** 501
- **Valid daily returns:** 500
- **Analytical observations:** 252
- **Source:** Yahoo Finance data, as recorded in the cleaned dataset

### Analytical Periods

| Period | Observations | Mean Absolute Daily Return |
|---|---:|---:|
| Pre-COVID | 45 | 0.9104% |
| COVID Shock | 19 | 3.9949% |
| Recovery | 188 | 1.0200% |

A further 249 observations are outside the three analytical period labels and are therefore excluded from the inferential comparison.

## Methodology

The analysis follows this workflow:

1. Data validation
2. Daily return construction
3. Absolute daily return calculation
4. Descriptive statistics
5. Shapiro–Wilk normality testing
6. Robust variance testing and Bartlett's test
7. One-way ANOVA
8. Kruskal–Wallis test
9. Pairwise Wilcoxon rank-sum tests with Bonferroni adjustment

Daily return was calculated as:

`[(Close_t - Close_(t-1)) / Close_(t-1)] × 100`

The volatility proxy was:

`|Daily Return|`

## Key Findings

### 1. COVID Shock had substantially higher market-movement magnitude

Mean absolute daily return increased from **0.9104% in Pre-COVID** to **3.9949% during COVID Shock**, before falling to **1.0200% during Recovery**.

The COVID Shock period also had the highest dispersion, with a standard deviation of **2.9500%**.

### 2. Statistical evidence confirms differences across periods

- **One-way ANOVA:** F(2,249) = 57.96, p < 0.001
- **Kruskal–Wallis:** χ²(2) = 23.634, p = 0.0001

Both tests reject equality across the three periods.

### 3. COVID Shock drives the pairwise differences

Using the Bonferroni-adjusted significance level of **0.01667**:

- Pre-COVID vs COVID Shock: significant
- COVID Shock vs Recovery: significant
- Pre-COVID vs Recovery: not significant (p = 0.1463)

This pattern is consistent with a pronounced temporary shock followed by normalization toward pre-COVID conditions.

## Assumption Checks

Shapiro–Wilk testing rejected normality for Pre-COVID and Recovery, while the COVID Shock group did not show significant evidence against normality at the 5% level.

Variance testing also indicated significant differences in group variances. Therefore, the non-parametric Kruskal–Wallis and Wilcoxon results are reported alongside the classical ANOVA rather than relying on ANOVA alone.

## Limitations

- Absolute daily return is used as a proxy for market-movement magnitude rather than a direct realized/implied volatility measure.
- 249 of the 501 observations fall outside the defined analytical period labels.
- The COVID Shock group contains only 19 observations.
- The analysis demonstrates statistical association across periods; it does not establish every causal mechanism behind market movements.

## Tools

- **Stata** — statistical analysis and hypothesis testing
- **Excel / CSV** — data preparation and storage
- **Microsoft PowerPoint** — presentation of findings

## Repository Structure

```text
jse-alsi-covid19-analysis/
│
├── data/
│   ├── J203_ALSI_Cleaned_Price_Data_2019_2020.csv
│   └── JSE_ALSI_COVID_FINAL_ANALYSIS.dta
│
├── stata/
│   ├── JSE_ALSI_COVID_REPRODUCTION.do
│   ├── JSE_ALSI_COVID_FINAL_ANALYSIS.smcl
│   └── JSE_ALSI_COVID_FINAL_ANALYSIS.txt
│
├── presentation/
│   ├── JSE_ALSI_COVID_Final_Presentation.pptx
│   └── JSE_ALSI_COVID_Final_Presentation.pdf
│
└── README.md
```

## Academic Project

**Computational Finance Project**  
Indian Institute of Technology (Indian School of Mines), Dhanbad  
MBA (Business Analytics), 2026
