# Data Mining Projects

A collection of data mining projects implemented in R, covering regression, PCA, clustering, and association analysis.

## Projects

| File | Description |
|------|-------------|
| `Project_1.R` | Linear regression for salary prediction, PCA on rainfall data, k-means clustering, and association rule mining |
| `Project_2.R` | Data transformation, aggregation, and algorithm implementation |
| `TextMining.R` | Text preprocessing, tokenization, sentiment analysis, and pattern recognition |

## Datasets

| Dataset | Used In | Description |
|---------|---------|-------------|
| `employee.csv` | Project 1 | Employee salary, tax, spending, and work hours |
| `rainfall.csv` | Project 1 | Rainfall variables (r1, r2, r3) for PCA analysis |
| `market.csv` | Project 1 | Market basket transactions for association rule mining |

## Tech Stack

- R
- corrplot · dplyr · factoextra · arules · arulesViz · ggplot2 · caret · tm · stringr

## Topics Covered

- Exploratory data analysis (EDA)
- Correlation analysis
- Linear regression and model comparison (SSE)
- Principal Component Analysis (PCA)
- K-means clustering
- Association rule mining (Apriori algorithm)
- Text mining and NLP

## Getting Started

```bash
git clone https://github.com/saalssall/Data_Mining_Projects.git
cd Data_Mining_Projects
```

Then in R or RStudio:

```r
install.packages(c("corrplot", "dplyr", "factoextra", "arules", "arulesViz",
                   "tidyverse", "ggplot2", "caret", "tm", "stringr"))
setwd("path/to/Data_Mining_Projects")
source("Project_1.R")
```

Make sure the required datasets are in the working directory before running.

---

© 2026 saalssall
