# 📊 Suicidal Data Analysis in R

## 📌 Overview

This project analyzes global suicide data from 1985 to 2016 using the dataset available on [Kaggle](https://www.kaggle.com/datasets/russellyates88/suicide-rates-overview-1985-to-2016). The analysis includes data cleaning, statistical summaries, correlation analysis, hypothesis testing, and visualization using R.

## 📂 Dataset

- **Source**: [Suicide Rates Overview (1985-2016) - Kaggle](https://www.kaggle.com/datasets/russellyates88/suicide-rates-overview-1985-to-2016)
- **Attributes**:
  - Country, year, and age group
  - Number of suicides
  - Population
  - GDP per capita
  - Suicide rates per 100,000 population

## 🛠️ Steps Involved

1. **Data Cleaning & Preprocessing**

   - Handle missing values and remove duplicates
   - Convert necessary columns to appropriate data types
   - Create a new column for suicide rates per 100,000 population

2. **Exploratory Data Analysis (EDA)**

   - Summary statistics grouped by country, gender, year, and age group
   - Line plots of suicide rates over time for top 5 affected countries
   - Heatmaps to visualize suicide rates across different demographics

3. **Statistical Analysis**

   - Correlation analysis between GDP per capita and suicide rates
   - T-test to compare suicide rates between males and females

4. **Data Visualization**

   - Time-series plots for trends in suicide rates
   - Heatmaps to analyze suicide trends across age groups and countries
   - Scatter plots to show relationships between economic factors and suicides

## 📊 Key Findings

- Certain countries have significantly higher suicide rates over time.
- Males generally have a higher suicide rate compared to females.
- GDP per capita shows a moderate correlation with suicide rates.

## 🖥️ Technologies Used

- **Programming Language**: R
- **Libraries**: `ggplot2`, `dplyr`, `tidyverse`, `corrplot`, `ggpubr`

## 📁 Folder Structure

```
📦 Suicidal-Data-Analysis-in-R
├── 📂 data                     # Raw dataset
├── 📂 scripts                  # R scripts for analysis
├── 📂 visuals                  # Generated graphs and plots
├── README.md                   # Project documentation
└── report.pdf                  # Final analysis report
```

## 📝 How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/thisisaman408/Suicidal-Data-Analysis-in-R.git
   ```
2. Open `RStudio` and navigate to the project folder.
3. Run the scripts inside the `scripts/` folder sequentially.
4. Check the `visuals/` folder for generated graphs.

## 📢 Team Members

- **Aaditya Chachra - 2022UCM2303**
- **Radhacharan - 2022UCM2365**
- **Aniket Rathore - 2022UCM2366**
- **Aman Kumar - 2022UCM2386**
