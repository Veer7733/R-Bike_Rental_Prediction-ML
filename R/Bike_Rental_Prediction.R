# setwd("C:/Simplilearn_Material/Data Analytics with R/Project_Bike_Rental_Prediction")

# import libraries

library(readxl)
library(dplyr)
library(plotly)
library(ggplot2)
library(randomForest)
library(caret)
library(Metrics)

dataset = read_excel("day.xlsx")
View(dataset)

# checking structure and statistical information of the data
str(dataset)
summary(dataset)

#checking null values

colnames(dataset)
sum(is.na(dataset))
colSums(is.na(dataset))

              
dataset$season = as.factor(dataset$season)
dataset$yr = as.factor(dataset$yr)
dataset$mnth = as.factor(dataset$mnth)
dataset$holiday = as.factor(dataset$holiday)
dataset$weekday = as.factor(dataset$weekday)
dataset$workingday = as.factor(dataset$workingday)
dataset$weathersit = as.factor(dataset$weathersit)

str(dataset)
# Plot monthly distribution of the total number of bikes rented

plot_ly(dataset,x = ~mnth,y = ~cnt,type = "bar") %>%
  layout(title = "Monthly Distribution of Total Bike Rented",
         xaxis = list(title = "Months"),
         yaxis = list(title = "Count of Bikes Rented"))


# Plot yearly distribution of the total number of bikes rented

yearly_data = dataset %>%
  group_by(yr) %>% summarize(Total_cnt = sum(cnt))

plot_ly(yearly_data,x = ~yr,y = ~Total_cnt,type = "bar") %>%
  layout(title = "Yearly Distribution of Total Bike Rented",
         xaxis = list(title = "Years"),
         yaxis = list(title = "Count of Bikes Rented"))


# Plot boxplot for outliers analysis

# Create a box plot for outlier analysis
boxplot(dataset[,c("temp","atemp","hum","windspeed","casual","registered","cnt")],
        main = "Box Plot For Outlier Analysis")

# Create a interactive box plot for outlier analysis
p = plot_ly() %>%
  add_trace(y = ~dataset$temp,type = "box",name = "Temperature") %>%
  add_trace(y = ~dataset$atemp,type = "box",name = "Feeling Temperature") %>%
  add_trace(y = ~dataset$hum,type = "box",name = "Humidity") %>%
  add_trace(y = ~dataset$windspeed,type = "box",name = "Wind Speed") %>%
  add_trace(y = ~dataset$casual,type = "box",name = "Casual User") %>%
  add_trace(y = ~dataset$registered,type = "box",name = "Registered User") %>%
  add_trace(y = ~dataset$cnt,type = "box",name = "Total Count")

# Adding a layout for the plot
p = p %>% layout(title = "Box Plot For Outlier Analysis",
                 yaxis = list(title = "Values") )

# Display box plot                 
p

  
# spliting the data
set.seed(15)
split_data = createDataPartition(dataset$cnt,p = 0.8,list = FALSE)
train_data = dataset[split_data,]  
test_data = dataset[-split_data,]

# train data
View(train_data)
# test data
View(test_data)

# applying random forest algorithm
rf_model = randomForest(cnt~.,data = train_data,ntree = 500,mtry=3, importance=TRUE)
y_pred = predict(rf_model,test_data)    # applying the model on test data

show_data = test_data
show_data["predicted_val"] = y_pred

View(show_data)                        # predicted values

#correlation - r
cor(show_data$cnt,show_data$predicted_val)

#root mean square error
rmsq_val = rmse(show_data$cnt,show_data$predicted_val)
rmsq_val

#r-square -> coefficient of determination
cor(show_data$cnt,show_data$predicted_val)^2

#predicted scatter plot
plot(show_data$cnt,show_data$predicted_val,pch = 19,
     xlab = "Actual Values",ylab = "Predicted Values",
     main = "Actual Values V/S Predicted Values")
abline(0, 1, col = "red", lwd = 2)









            





















