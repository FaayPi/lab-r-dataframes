superstore <- read.csv("C:\\Users\\fee10\\Ironhack\\Module2\\Labs\\lab-r-dataframes\\dataset\\Sample - Superstore.csv")


head(superstore, 10)
str(superstore)
summary(superstore)

extracted <-superstore$Sales

print(subset_superstore)
nrow(subset_superstore)
ncol(subset_superstore)
extracted <-superstore$Profit > 100
print(superstore)
filtered_subset <- subset(superstore, Category == "Furniture" & Sales > 500)
print(filtered_subset)
filtered_subset <- subset(superstore, Region == "West" & Quantity > 5)
print(filtered_subset)

superstore <- transform(superstore,Profit_Margin = (Profit/Sales)*100)
print(superstore)

superstore <- superstore %>%
  mutate(Sales = round(Sales, 2))
print(superstore)

superstore <- select(superstore, -Postal.Code)
print(superstore)

colSums(is.na(superstore))

grouped_superstore <- superstore %>%
  group_by(Region) %>%
  summarize(
    Total_Sales = sum(Sales, na.rm = TRUE),
    Total_Profit = sum(Profit, na.rm = TRUE)
  )
print(grouped_superstore)

superstore = mutate(superstore, Discount.Level = case_when(
  Discount >= 0 & Discount <= 0.2 ~ "Low",
  Discount > 0.2 & Discount <=0.5 ~ "Medium",
  Discount > 0.5 & Discount <= 1 ~ "High"))
print(superstore)

superstore <- superstore %>% arrange(desc(Sales))
print(superstore)
