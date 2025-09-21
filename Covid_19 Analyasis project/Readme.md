# 🦠 COVID-19 Data Analysis Project

This project analyzes the **COVID-19 dataset** using **Python (Pandas, NumPy, Matplotlib, Seaborn)** for data analysis and visualization, and **SQL (SQLite)** for querying insights.  

The goal is to perform **data cleaning, exploratory data analysis (EDA), visualization, and SQL-based insights**.

---

## 📂 Project Structure
COVID-19-Data-Analysis/
│-- covid_19.csv # Dataset
│-- covid_analysis.ipynb # Jupyter Notebook with full analysis
│-- README.md # Project documentation

yaml
Copy code

---

## 🛠️ Technologies Used
- **Python** 🐍  
- **Libraries**:  
  - `pandas` → data manipulation  
  - `numpy` → numerical computations  
  - `matplotlib` → base plotting  
  - `seaborn` → advanced visualization  
  - `sqlite3` → SQL queries on dataset  

---

## 📊 Steps in Analysis

### 1. Data Cleaning
- Handling missing values (`Province/State`)  
- Converting `Date` to datetime format  

### 2. Exploratory Data Analysis (EDA)
- Global COVID-19 cases trend over time  
- Top 10 countries by confirmed cases  
- Mortality rate analysis by country  
- Case distribution by WHO region  

### 3. Visualizations (Matplotlib + Seaborn)
- Line plots for trends  
- Bar plots for top countries & regions  
- Comparative analysis of mortality rates  

### 4. SQL Queries
- **Top 5 countries with highest confirmed cases**  
- **Total cases & deaths by WHO Region**  

---

## 📈 Sample Visualizations

### Global COVID-19 Cases Over Time
(Line plot using Seaborn + Matplotlib)  

### Top 10 Countries by Confirmed Cases
(Bar chart with red gradient)  

### Mortality Rate Comparison
(Bar chart with coolwarm palette)  

---

## ▶️ How to Run the Project
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/COVID-19-Data-Analysis.git
   cd COVID-19-Data-Analysis
Install dependencies:

bash
Copy code
pip install pandas numpy matplotlib seaborn
Open Jupyter Notebook:

bash
Copy code
jupyter notebook covid_analysis.ipynb
📝 SQL Example
sql
Copy code
-- Top 5 countries with maximum confirmed cases
SELECT "Country/Region", MAX(Confirmed) as MaxConfirmed
FROM covid
GROUP BY "Country/Region"
ORDER BY MaxConfirmed DESC
LIMIT 5;
📌 Future Improvements
Add predictive analysis using Machine Learning

Build a dashboard with Streamlit/Power BI

Integrate real-time COVID-19 API

👨‍💻 Author
Dharmesh Panpatil