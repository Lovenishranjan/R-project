library(tidyverse)
library(lubridate)
library(ggplot2)
covid_data <- read.csv("C:/Users/loven/Desktop/covid/sample_covid_data.csv")
head(covid_data)
str(covid_data)
covid_data$date <- as.Date(covid_data$date)
total_cases <- sum(covid_data$new_cases, na.rm = TRUE)
total_deaths <- sum(covid_data$new_deaths, na.rm = TRUE)

cat("Total Cases:", total_cases, "\n")
cat("Total Deaths:", total_deaths, "\n")
avg_daily_cases <- mean(covid_data$new_cases, na.rm = TRUE)
avg_daily_deaths <- mean(covid_data$new_deaths, na.rm = TRUE)

cat("Average Daily Cases:", avg_daily_cases, "\n")
cat("Average Daily Deaths:", avg_daily_deaths, "\n")
ggplot(data = covid_data, aes(x = date, y = new_cases)) +
  geom_line(color = "blue") +
  labs(title = "Daily New COVID-19 Cases Over Time",
       x = "Date", y = "New Cases") +
  theme_minimal()
ggplot(data = covid_data, aes(x = date, y = new_deaths)) +
  geom_line(color = "red") +
  labs(title = "Daily New COVID-19 Deaths Over Time",
       x = "Date", y = "New Deaths") +
  theme_minimal()
ggplot(data = covid_data, aes(x = date)) +
  geom_line(aes(y = new_cases, color = "New Cases")) +
  geom_line(aes(y = new_deaths, color = "New Deaths")) +
  labs(title = "Daily New COVID-19 Cases and Deaths Over Time",
       x = "Date", y = "Count") +
  scale_color_manual(values = c("New Cases" = "blue", "New Deaths" = "red")) +
  theme_minimal()
