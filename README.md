# Amazon Prime Content Analysis 📺

**What drives the length of streaming content?** A statistical study of 9,156 Amazon Prime titles, testing how release year, content type, and audience rating relate to runtime — built in R with hypothesis testing and regression.

---

## 🎯 Business Question
Do movies and TV shows differ meaningfully in length, has content gotten shorter over time, and does rating category relate to runtime? — questions relevant to content strategy and audience segmentation on a streaming platform.

## 📊 Data
- **Source:** Amazon Prime Titles (public dataset)
- **Size:** 9,156 titles (~70% movies, ~30% TV shows), 1920–2020
- **Key fields:** content type, release year, duration (minutes), audience rating

## 🔬 Approach
- Exploratory data analysis and cleaning in R
- **Linear regression** — duration vs. release year
- **Welch two-sample t-test** — movies vs. TV shows
- **One-way ANOVA** — duration across rating categories
- Visualization with ggplot2

## 📈 Key Findings
| Test | Result | Takeaway |
|---|---|---|
| Regression (year → duration) | slope −0.28, p < 0.001, R² = 0.012 | Slight decline in length over time, but year explains very little variance |
| t-test (movie vs. TV) | t = 197.9, p < 0.001, ~91 min gap | Movies run dramatically longer than per-episode TV |
| ANOVA (rating → duration) | F = 88.7, p < 0.001 | Runtime differs significantly across rating categories |

**Business reading:** content type is by far the strongest structural driver of runtime; release year is statistically significant but practically negligible — a reminder that significance ≠ importance.

## 🛠️ Tech Stack
R · ggplot2 · Linear Regression · Welch t-test · ANOVA · EDA

## ▶️ How to Run
```r
# Requires R with: ggplot2, dplyr
source("src/amazon_prime_analysis.R")
```

## 📂 Repository Structure
- `data/` — dataset
- `src/` — R analysis script

## ⚠️ Limitations
TV-show duration reflects per-episode length, which limits cross-type runtime comparisons; analysis is univariate in scope. A natural extension is multivariate modeling with genre included.
