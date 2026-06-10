# Load required libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("amazon_prime_titles.csv")

# Preprocess data: Extract numeric duration and handle missing values
data$duration_minutes <- as.numeric(gsub(" min|Season", "", data$duration))
data_cleaned <- data %>%
  filter(!is.na(duration_minutes), !is.na(release_year), !is.na(type), !is.na(rating))

# -------------------------
# Question 1: Does release year affect duration?
# -------------------------
# Scatterplot with linear regression line
ggplot(data_cleaned, aes(x = release_year, y = duration_minutes)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Scatterplot: Release Year vs. Duration", x = "Release Year", y = "Duration (Minutes)")

# Perform linear regression
model1 <- lm(duration_minutes ~ release_year, data = data_cleaned)
summary(model1)

# -------------------------
# Question 2: Is there a relationship between content type and duration?
# -------------------------
# Boxplot for type vs. duration
ggplot(data_cleaned, aes(x = type, y = duration_minutes)) +
  geom_boxplot() +
  labs(title = "Boxplot: Content Type vs. Duration", x = "Content Type", y = "Duration (Minutes)")

# Perform t-test
movies <- filter(data_cleaned, type == "Movie")$duration_minutes
tv_shows <- filter(data_cleaned, type == "TV Show")$duration_minutes
t_test <- t.test(movies, tv_shows, var.equal = FALSE)
t_test

# -------------------------
# Question 3: Does content rating impact duration?
# -------------------------
# Boxplot for rating vs. duration
ggplot(data_cleaned, aes(x = rating, y = duration_minutes)) +
  geom_boxplot() +
  labs(title = "Boxplot: Rating vs. Duration", x = "Rating", y = "Duration (Minutes)")

# Perform ANOVA
anova_model <- aov(duration_minutes ~ rating, data = data_cleaned)
summary(anova_model)
