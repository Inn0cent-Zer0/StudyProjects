# Load necessary libraries
library(readxl)    # For reading Excel files
library(forecast)  # For time series forecasting
library(tseries)   # For time series analysis

# Read GDP data from Excel file
gdp <- read_excel("D:/Vaishnavi/004_R_Programming/GDP.xlsx")
View(gdp)  # View the dataset in Excel format

# Check the class of gdp to ensure it's correctly read
class(gdp)

# Convert GDP data to time series object (ts)
gdptime <- ts(gdp$GDP, start = min(gdp$DATE), end = max(gdp$DATE), frequency = 4)
class(gdptime)  # Check the class of gdptime, should be "ts"

# Plot the GDP time series
plot(gdptime)

# Plot ACF and PACF of the GDP time series
acf(gdptime)
pacf(gdptime)

# Perform Augmented Dickey-Fuller test for stationarity
adf.test(gdptime)

# Fit an ARIMA model to the GDP time series using AIC for model selection
gdpmodel <- auto.arima(gdptime, ic = "aic", trace = TRUE)

# Plot ACF and PACF of the model residuals
acf(ts(gdpmodel$residuals))
pacf(ts(gdpmodel$residuals))

# Forecast GDP using the fitted ARIMA model
mygdpforecast <- forecast(gdpmodel, level = c(95), h = 10*4)
mygdpforecast

# Plot the forecasted values
plot(mygdpforecast)

# Perform Ljung-Box test for model residuals at different lags
Box.test(mygdpforecast$residuals, lag = 5, type = "Ljung-Box")
Box.test(mygdpforecast$residuals, lag = 15, type = "Ljung-Box")
Box.test(mygdpforecast$residuals, lag = 25, type = "Ljung-Box")
