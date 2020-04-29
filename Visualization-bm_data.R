# Understand data
bm_data <- read.csv('BM_data.csv', header = TRUE, sep = ',', stringsAsFactors = FALSE)
typeof(bm_data)
class(bm_data)

View(bm_data)
head(bm_data,5) | tail(bm_data, 5)
names(bm_data)
str(bm_data)
summary(bm_data)

#install.packages('dplyr')
library(dplyr)
#install.packages('ggplot2')
library(ggplot2)

#View(unique(bm_data$Item_Identifier))


# Data Transformation
# Convert Categorical features to Factors

bm_data$Item_Identifier = as.factor(bm_data$Item_Identifier)
bm_data$Item_Fat_Content = as.factor(bm_data$Item_Fat_Content)
bm_data$Item_Type = as.factor(bm_data$Item_Type)
bm_data$Outlet_Identifier = as.factor(bm_data$Outlet_Identifier)
bm_data$Outlet_Establishment_Year = as.factor(bm_data$Outlet_Establishment_Year)
bm_data$Outlet_Size = as.factor(bm_data$Outlet_Size)
bm_data$Outlet_Type = as.factor(bm_data$Outlet_Type)
bm_data$Outlet_Location_Type = as.factor(bm_data$Outlet_Location_Type)

View(bm_data)
str(bm_data)


# Data Visualization
# 1. plot histogram graph for diffrent items sold with respect to their sales.
ggplot(bm_data, aes(x = Item_Type)) +
  theme_bw() + 
  geom_bar() +
  labs(y = 'Total sales',
       title = "Total sales per item")
  
  
prop.table(table(bm_data$Item_Type))


# 2. compare the sales in different tier cities.
ggplot(bm_data, aes(x = Outlet_Location_Type)) +
  theme_classic() +
  geom_bar() + 
  labs(y = "Total sales",
       title = "Total sales per tier")

prop.table(table(bm_data$Outlet_Location_Type))


# 3. which item types amounts for higher sales.
plot(bm_data$Item_Type, bm_data$Item_Outlet_Sales, xlab = "IT", ylab = "Sales")


#4.compare fat contents for different products.
ggplot(bm_data, aes(x = Item_Type, fill = Item_Fat_Content)) +
  theme_bw() + 
  geom_bar() +
  labs(y = 'Fat Content',
       title = "Fat content per item")
