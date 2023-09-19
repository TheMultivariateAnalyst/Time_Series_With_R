# 1. Data Loading and Inspection:
# Load the dataset from the specified path
data <- read.csv("C:\\Users\\ToxicV0lt\\Desktop\\rstuff\\arima_forecast_resume\\DEXUSEU.csv", stringsAsFactors = FALSE)

# Inspect the first few rows
head(data)

# Check summary statistics
summary(data)

# 2. Data Cleaning:
# Identify rows with non-numeric values in the DEXUSEU column
non_numeric_indices <- which(!grepl("^\\d+\\.\\d+$", data$DEXUSEU))

# Remove non-numeric rows
data <- data[-non_numeric_indices, ]

# Convert the date column to a Date type and DEXUSEU to numeric
data$DATE <- as.Date(data$DATE, format="%Y-%m-%d")
data$DEXUSEU <- as.numeric(data$DEXUSEU)

# Ensure data is sorted chronologically
data <- data[order(data$DATE), ]

# 3. Exploratory Data Analysis (EDA):
# Plot the exchange rate over time
library(ggplot2)
ggplot(data, aes(x=DATE, y=DEXUSEU)) + geom_line() + labs(title="USD/EUR Exchange Rate Over Time")

# Decompose the time series
ts_data <- ts(data$DEXUSEU, frequency=365)
decomposed_data <- stl(ts_data, s.window="periodic")
plot(decomposed_data)

# 4. Correlogram Analysis:
# ACF Plot
library(forecast)
ACF <- Acf(ts_data, lag.max=20, main="ACF Plot")
plot(ACF)

# PACF Plot
PACF <- Pacf(ts_data, lag.max=20, main="PACF Plot")
plot(PACF)

# 5. Data Preprocessing:
# Differencing the series if non-stationary
diff_data <- diff(ts_data)

# Splitting the data for training and testing
train_length <- length(ts_data) - 365 # Using the first 9 years for training and the last year for testing
training_set <- ts_data[1:train_length]
test_set <- ts_data[(train_length+1):length(ts_data)]

# 6. Model Building:
# ARIMA Model
model <- auto.arima(training_set)

# Exponential Smoothing
model_ets <- ets(training_set)

# 7. Model Validation:
# Forecasting on the test set
forecast_arima <- forecast(model, h=365)
forecast_ets <- forecast(model_ets, h=365)

mape_arima <- mape(test_set, forecast_arima$mean)
rmse_arima <- rmse(test_set, forecast_arima$mean)

mape_ets <- mape(test_set, forecast_ets$mean)
rmse_ets <- rmse(test_set, forecast_ets$mean)

# 8. Model Forecasting:
# Retrain the model on the entire dataset
final_model <- auto.arima(ts_data)
final_forecast <- forecast(final_model, h=90) # Forecasting for the next quarter (3 months)

# Visualize the forecasted values
autoplot(final_forecast)

