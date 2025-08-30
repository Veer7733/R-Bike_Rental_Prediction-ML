# R-Bike_Rental_Prediction-ML
It's a machine learning project using the random forest algorithm.

# Bike Rental Prediction

## Project Description
```Problem Statement:```
In bike-sharing systems, the entire process from membership to rental and return has been automated. Using these systems, users can easily rent a bike from one location and return it to another. Hence, a bike rental company wants to understand and **predict the number of bikes rented daily based on the environment and seasons**.

```Objective:```
The objective of this case is to **predict bike rental counts** based on environmental and seasonal settings with the help of **Exploratory Data Analysis (EDA)** and **machine learning algorithm (Random Forest)** to identify key patterns and build an accurate prediction system.

## Dataset

- Key Columns:  
   - `instant`: Record index  
   - `dteday`: Date  
   - `season`: Season (1 = spring, 2 = summer, 3 = fall, 4 = winter)  
   - `yr`: Year (0 = 2011, 1 = 2012)  
   - `mnth`: Month (1–12)  
   - `holiday`: Whether the day is a holiday  
   - `weekday`: Day of the week  
   - `workingday`: Working day (1 = working day, 0 = weekend/holiday)  
   - `weathersit`: Weather situation (1 = Clear, 2 = Mist, 3 = Light snow/rain, 4 = Heavy rain)  
   - `temp`: Normalized temperature in Celsius; The values are divided into 41 (max) 
   - `atemp`: Normalized feeling temperature in Celsius; The values are divided into 50 (max) 
   - `hum`: Normalized humidity; The values are divided into 100 (max)  
   - `windspeed`: Normalized wind speed; The values are divided into 67 (max)  
   - `casual`: Count of casual users  
   - `registered`: Count of registered users  
   - `cnt`: Total rental count (casual + registered)  

- Number of rows/columns : ~800 rows and 16 columns

## Features and Target Variable  

- **Target Variable (Y):**  
  - `cnt` → Total count of bikes rented (casual + registered)  

- **Features (X):**  
  - `season`, `yr`, `mnth`, `holiday`, `weekday`, `workingday`  
  - `weathersit`, `temp`, `atemp`, `hum`, `windspeed`

## Tools & Libraries
- **Programming Language:** R  
- **Environment:** RStudio
- **Libraries:**
  - `readxl` 
  - `dplyr` 
  - `ggplot2`
  - `plotly` 
  - `randomForest` 
  - `caret` 
  - `Metrics`  

## Steps Performed

1. Exploratory Data Analysis (EDA)
   - Load dataset and required libraries
   - Perform data type conversion of the attributes
   - Check dataset structure and summary statistics
2. Attribute Distributions & Trends
   - Plot monthly bike rental distribution
   - Plot yearly bike rental distribution
   - Perform outlier detection using boxplots
3. Modeling
   - Split data into training and test sets (80/20 split)
   - Build Random Forest regression model
4. Evaluation
   - Predictions on test data
   - Performance metrics: Correlation (r), RMSE, and R²
   - Scatter plot of Actual vs Predicted values

## Observations / Insights
  - Seasonal and yearly rental patterns visualized
  - Outlier detection for weather and rental variables
  - Random Forest model achieved reliable predictions with good correlation and RMSE
  - The model explains ~95% of the variation in the target variable, showing a very strong fit.(Coefficient     of ditermination)
  - Scatter plot of Actual vs Predicted values validated accuracy


## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Veer7733/R-Bike_Rental_Prediction-ML
   ``` 
2. Navigate to the project folder:
   ```bash
   cd R-Bike_Rental_Prediction-ML
   ``` 
3. Install required R packages
   ```bash
   install.packages(readLines("requirements.txt"))
   ``` 
4. Run the scrip
   ```bash
   source("R/Bike_Rental_Prediction.R")
   ``` 




  
