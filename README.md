# USD/EUR Exchange Rate Forecasting

## Overview
This project aims to predict the exchange rate between the US Dollar (USD) and the Euro (EUR) for the upcoming quarter. Using 10 years of historical data, we employ a time series analysis approach, specifically the ARIMA model, to forecast future exchange rates.

## Data
The dataset comprises two primary columns:
- `DATE`: The date of the observation.
- `DEXUSEU`: The exchange rate between USD and EUR on that date.

## Requirements
Ensure you have R installed and the necessary R packages. You can install the required packages using the provided `requirements.txt` file. 


## Methodology

1. **Data Loading and Cleaning**: Imported the data and handled missing values.
2. **Exploratory Data Analysis**: Visualized the USD/EUR exchange rate over time.
3. **Time Series Decomposition**: Decomposed the time series into its trend, seasonal, and residual components.
4. **Model Building**: Used the ARIMA model to capture patterns in the historical data and make forecasts.
5. **Model Validation**: Validated the model's performance on a test set.
6. **Forecasting**: Forecasted the exchange rate for the next quarter.

## Results
The ARIMA model was able to predict the USD/EUR exchange rate with reasonable accuracy. Detailed results and visualizations can be found in the R scripts and Jupyter notebooks.

## License
This project is open-source and available to anyone. Please reference this repository if you use any part of the analysis or data.


